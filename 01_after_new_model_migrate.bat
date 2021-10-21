@REM makemigrations migrateを実行
CD .\approvalsystem\
python manage.py makemigrations users core
&&
python manage.py migrate users
&&
python manage.py migrate core

pause