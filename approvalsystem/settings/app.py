INSTALLED_APPS = [
    'users',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.postgres',
    'drf_yasg',
    'corsheaders',
    'django_extensions',
    'rest_framework',
    'rest_framework_simplejwt',
    'rest_framework_simplejwt.token_blacklist',
    'core',
]

# drf_yasg https://drf-yasg.readthedocs.io/en/stable/openapi.html#openapi-specification-overview
# corsheaders https://pypi.org/project/django-cors-headers/ 他のオリジンからDjangoアプリケーションへのブラウザー内リクエストが可能にする
# django_extensions https://django-extensions.readthedocs.io/en/latest/index.html
# rest_framwork https://www.django-rest-framework.org/ APIを構築する
# rest_framework_simplejwt https://django-rest-framework-simplejwt.readthedocs.io/en/latest/ 認証用tokenライブラリ
# rest_framework_simplejwt.token_blacklist https://django-rest-framework-simplejwt.readthedocs.io/en/latest/blacklist_app.html　ログアウト管理用

