@REM 既存のmigrationsフォルダを削除
rmdir /s /q approvalsystem\core\migrations
rmdir /s /q approvalsystem\users\migrations

@REM makemigrations migrateを実行
CD .\approvalsystem\
python manage.py makemigrations users core
&&
python manage.py migrate users
&&
python manage.py migrate core

pause
