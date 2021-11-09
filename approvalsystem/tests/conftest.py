import pytest
from django.core.management import call_command
from django.db import connection
from django.conf import settings

from users.models import User

SUPER_USER = None
USER = None


@pytest.fixture(scope='session')
def django_db_setup(django_db_setup, django_db_blocker):
    with django_db_blocker.unblock():
        global SUPER_USER, USER
        # テスト用ログインユーザ作成
        print("\x1b[44m==========create login user==========\x1b[0m")
        SUPER_USER = User.objects.filter(emp_cd='0000001').first()
        USER = User.objects.filter(emp_cd='0000002').first()
        # SUPER_USER = User.objects.create_superuser(emp_nm='superuser', password='password', emp_cd='0000003')
        # USER = User.objects.create_user(emp_nm='user1', password='password', emp_cd='0000004')
        # 以降、単体テスト用データ
        print("\x1b[44m==========load unit test data==========\x1b[0m")
        """
        from django.core.management import call_command
        call_command('loaddata', 'my_fixture.json')
        """
    yield


@pytest.fixture
def db_access_without_rollback_and_truncate(request, django_db_setup, django_db_blocker):
    django_db_blocker.unblock()
    request.addfinalizer(django_db_blocker.restore)


@pytest.fixture(scope='function', autouse=True)
def login_user(rf, mocker):
    mocker.patch('django.middleware.csrf._compare_masked_tokens', return_value=True)
    
    """
    ログイン状態にする。
    """
    org_get = rf.get
    org_put = rf.put
    org_post = rf.post
    org_delete = rf.delete
    mocker.patch.object(rf, 'get', side_effect=(lambda *args, **kwargs: _auth_request(org_get(*args, **kwargs))))
    mocker.patch.object(rf, 'put', side_effect=(lambda *args, **kwargs: _auth_request(org_put(*args, **kwargs))))
    mocker.patch.object(rf, 'post', side_effect=(lambda *args, **kwargs: _auth_request(org_post(*args, **kwargs))))
    mocker.patch.object(rf, 'delete', side_effect=(lambda *args, **kwargs: _auth_request(org_delete(*args, **kwargs))))
    yield USER


def _auth_request(request):
    """
    リクエストを認証状態にする。
    """
    # ユーザ設定
    request.user = USER
    # CSRF検証用
    request.COOKIES[settings.CSRF_COOKIE_NAME] =''
    return request


@pytest.fixture(scope='session', autouse=True)
def scope_session():
    print("setup before session")
    yield
    print("teardown after session")


@pytest.fixture(scope='module', autouse=True)
def scope_module():
    print("    setup before module")
    yield
    print("    teardown after module")


@pytest.fixture(scope='class', autouse=True)
def scope_class():
    print("        setup before class")
    yield
    print("        teardown after class")


@pytest.fixture(scope='function', autouse=True)
def scope_function():
    print("            setup before function")
    yield
    print("            teardown after function")
