@REM makemigrations migrateを実行
python manage.py makemigrations users
python manage.py makemigrations core
python manage.py migrate users
python manage.py migrate core