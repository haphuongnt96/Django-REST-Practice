import getpass
import os
import sys

from django.contrib.auth.management import get_default_username
from django.contrib.auth.password_validation import validate_password
from django.core import exceptions
from django.core.management.base import CommandError
from django.utils.text import capfirst
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.management.commands.createsuperuser import (
    Command as CreateSuperUserCommand,
    PASSWORD_FIELD,
    NotRunningInTTYException,
)


class Command(CreateSuperUserCommand):
    help = _('Create a superuser with a password non-interactively')

    def handle(self, *args, **options):
        database = options['database']
        user_data = {}
        try:
            self.UserModel._meta.get_field(PASSWORD_FIELD)
        except exceptions.FieldDoesNotExist:
            pass
        else:
            # If not provided, create the user with an unusable password.
            user_data[PASSWORD_FIELD] = None
        try:
            if options['interactive']:
                # Same as user_data but without many to many fields and with
                # foreign keys as fake model instances instead of raw IDs.
                fake_user_data = {}
                if hasattr(self.stdin, 'isatty') and not self.stdin.isatty():
                    raise NotRunningInTTYException
                for field_name in self.UserModel.REQUIRED_FIELDS:
                    field = self.UserModel._meta.get_field(field_name)
                    user_data[field_name] = options[field_name]
                    while user_data[field_name] is None:
                        message = self._get_input_message(field)
                        input_value = self.get_input_data(field, message)
                        user_data[field_name] = input_value
                        if field.many_to_many and input_value:
                            if not input_value.strip():
                                user_data[field_name] = None
                                self.stderr.write('Error: This field cannot be blank.')
                                continue
                            user_data[field_name] = [pk.strip() for pk in input_value.split(',')]
                        if not field.many_to_many:
                            fake_user_data[field_name] = input_value

                        # Wrap any foreign keys in fake model instances
                        if field.many_to_one:
                            fake_user_data[field_name] = field.remote_field.model(input_value)

                # Prompt for a password if the model has one.
                while PASSWORD_FIELD in user_data and user_data[PASSWORD_FIELD] is None:
                    password = getpass.getpass()
                    password2 = getpass.getpass('Password (again): ')
                    if password != password2:
                        self.stderr.write("Error: Your passwords didn't match.")
                        # Don't validate passwords that don't match.
                        continue
                    if password.strip() == '':
                        self.stderr.write("Error: Blank passwords aren't allowed.")
                        # Don't validate blank passwords.
                        continue
                    try:
                        validate_password(password2, self.UserModel(**fake_user_data))
                    except exceptions.ValidationError as err:
                        self.stderr.write('\n'.join(err.messages))
                        response = input('Bypass password validation and create user anyway? [y/N]: ')
                        if response.lower() != 'y':
                            continue
                    user_data[PASSWORD_FIELD] = password
            else:
                # Non-interactive mode.
                # Use password from environment variable, if provided.
                if PASSWORD_FIELD in user_data and 'DJANGO_SUPERUSER_PASSWORD' in os.environ:
                    user_data[PASSWORD_FIELD] = os.environ['DJANGO_SUPERUSER_PASSWORD']

                for field_name in self.UserModel.REQUIRED_FIELDS:
                    env_var = 'DJANGO_SUPERUSER_' + field_name.upper()
                    value = options[field_name] or os.environ.get(env_var)
                    if not value:
                        raise CommandError('You must use --%s with --noinput.' % field_name)
                    field = self.UserModel._meta.get_field(field_name)
                    user_data[field_name] = field.clean(value, None)

            user = self.UserModel._default_manager.db_manager(database).create_superuser(**user_data)
            if options['verbosity'] >= 1:
                self.stdout.write(
                    'Superuser created successfully. Employee code (used for login): {}'.format(user.emp_cd)
                )
        except KeyboardInterrupt:
            self.stderr.write('\nOperation cancelled.')
            sys.exit(1)
        except exceptions.ValidationError as e:
            raise CommandError('; '.join(e.messages))
        except NotRunningInTTYException:
            self.stdout.write(
                'Superuser creation skipped due to not running in a TTY. '
                'You can run `manage.py createsuperuser` in your project '
                'to create one manually.'
            )
