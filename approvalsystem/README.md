# About the project
Project 'Approval system' was created with the purpose of facilitating internal application process for company's internal stakeholders. The system allows users to manage and make a track record of applications as well as enable appropriate approval routing for each application based on company's internal policies.

# Getting started
## Prerequisites
Below is the list of tools required to run this project:
- Python 3.9.5
- Docker & Docker Compose (https://docs.docker.com/engine/installation/) (https://docs.docker.com/compose/install/)
- PostgresSQL 13
- pyenv and virtualenv
- Visual Studio Code
- Git

## Installation
### Database
PostgreSQL database has been defined in docker-compose.yml file. To start database service, run command: 
> ~...\approval-system\approvalsystem> docker-compose up -d

### Backend application
#### Windows
##### A. Install pyenv
###### 1. In Powershell, install pyenv-win with pip:

> pip install pyenv-win --target $ HOME \\ .pyenv 

###### 2. Set the environment variables PYENV and PYENV_HOME that point to the installation folder. Add the bin folder to the PATH variable.
> [System.Environment]::SetEnvironmentVariable('PYENV',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
> [System.Environment]::SetEnvironmentVariable('PYENV_HOME',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
> [System.Environment]::SetEnvironmentVariable('path', $env:USERPROFILE + "\.pyenv\pyenv-win\bin;" + $env:USERPROFILE + "\.pyenv\pyenv-win\shims;" +  [System.Environment]::GetEnvironmentVariable('path', "User"),"User")

###### 3. Close current Powershell and restart with administrator rights (Run as administrator)

###### 4. Enable the execution of scripts:
> Set-ExecutionPolicy unrestricted

###### 5. Switch to new Powershell window without administrator rights to start using pyenv.

##### B. Create local virtual environment 
###### 1. Install python 3.9.5 on pyenv
> ~...\approval-system\approvalsystem> pyenv install 3.9.5
###### 2. Set python 3.9.5 version in local directory
> ~...\approval-system\approvalsystem> pyenv local 3.9.5
> ~...\approval-system\approvalsystem> python --version     >>> Python 3.9.5

###### 3. Setup and activate virtual environment
> ~...\approval-system\approvalsystem> python -m venv venv
> .\venv\Scripts\activate

##### C. Install python packages
> python -m pip install --upgrade pip
> ~...\approval-system\approvalsystem> pip install -r requirements/requirements.txt
> ~...\approval-system\approvalsystem> pip list

Package                       Version
asgiref                         3.4.1
certifi                       2021.10.8
charset-normalizer            2.0.7
coreapi                       2.3.3
coreschema                    0.0.4
Django                        3.2.7
django-concurrency            2.3
django-cors-headers           3.8.0
django-environ                0.6.0
django-extensions             3.1.3
django-ipware                 4.0.0
django-structlog              2.1.3
djangorestframework           3.12.4
djangorestframework-simplejwt 4.8.0
drf-yasg                      1.20.0
idna                          3.3
inflection                    0.5.1
itypes                        1.2.0
Jinja2                        3.0.2
MarkupSafe                    2.0.1
packaging                     21.0
pip                           21.3.1
psycopg2-binary               2.9.1
PyJWT                         2.1.0
pyparsing                     3.0.1
pytz                          2021.1
requests                      2.26.0
ruamel.yaml                   0.17.16
ruamel.yaml.clib              0.2.6
setuptools                    56.0.0
sqlparse                      0.4.1
structlog                     21.2.0
uritemplate                   4.1.1
urllib3                       1.26.7

> ~...\approval-system\approvalsystem> pip install -r requirements/requirements-dev.txt

##### D. Create .env file
> ~...\approval-system\approvalsystem> cp .\config\.env.example .\config\.env

Change 192.168.1.4 to your PC/laptop IP address.
CORS_ALLOWED_ORIGINS=http://localhost:8080;http://127.0.0.1:8080;http://192.168.1.4:8080

##### E. Run Django application
> ~...\approval-system\approvalsystem> python manage.py runserver

#### Linux/MacOS
##### A. Install pyenv packages and pyenv
> sudo apt install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \ git
>> git clone https://github.com/pyenv/pyenv.git ~/.pyenv

Add pyenv to your path:
> echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
> echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
> echo 'eval "$(pyenv init --path)"' >> ~/.bashrc

##### B. Install python 3.9.5 on pyenv locally and activate virtual environment
> ~.../pyenv install 3.9.5
> ~.../approval-system/approvalsystem> pyenv local 3.9.5
> ~.../approval-system/approvalsystem> python -m venv venv
> ~.../approval-system/approvalsystem> source venv/bin/activate
> ~.../approval-system/approvalsystem> pip install -r requirements/requirements.txt
> ~.../approval-system/approvalsystem> pip install -r requirements/requirements-dev.txt

##### C. Create .env file (similar to Windows)

##### E. Run Django application (similar to Windows)

## Migration
#### Windows
Run:
> (venv) ~...\approval-system\approvalsystem> .\01_migrate.bat
#### Linux
Run:
> python manage.py makemigrations users
> python manage.py makemigrations core
> python manage.py migrate users
> python manage.py migrate core

# Usage
## User login
#### 1. Create superuser to login to admin site
> ~.../approval-system/approvalsystem> python manage.py createsuperuser
Set username, email and password for superuser account. Once done, system will display message 'Superuser created successfully.'

#### 2. Login to admin site using superuser account. 
We can create multiple users as test data, then login into system by sending 
username (employee code) and password through url localhost:8000/api/auth/login/ with method POST.
{
    emp_cd: 
    password:
}


## Application
#### 1. Create mastersetup data
Through admin site, we can create mastersetup data for application request and approval. 
## Approval routing


## Inventory management
Make migrations for inventory module before moving on.
Tables:
p_inventory
p_location
p_stock_on_hand
p_purchase_order_hdr
p_purchase_order_det

### Inventory:
1. Post a new inventory
curl --location --request POST 'http://127.0.0.1:8000/api/inventories' \
--header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjM4MDY5MTUyLCJqdGkiOiIzNDA2MjU1YjcxZDQ0NWE3OTQ1NjRiNWFhNjkwMzVjZiIsInVzZXJfaWQiOjF9.s4mszePbdN0-wLOCoQQr8WSD8FsMwP2hllyM12_xzqg' \
--header 'Content-Type: application/json' \
--header 'Cookie: csrftoken=vR0wr4PGnWerT7Rff9o080ezsjIEhH16ZLoG2BAeLxpVTVhh4Xa6oyHeuJeb7MHt' \
--data-raw '{
    "inventory_code": "SHOES",
    "inventory_name": "Nike"
}'

2. Update an inventory
curl --location --request PUT 'http://127.0.0.1:8000/api/inventories/1' \
--header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjM4MTUyNzA1LCJqdGkiOiIyYjRkNTIwYjllMDY0ZWQ3YjgxODg1ZDM0MTJkMDU5OSIsInVzZXJfaWQiOjN9.aRP0NHmeEQtsqRSoFeCm259zyt-tQ1Q2hAIV49IyEq8' \
--header 'Content-Type: application/json' \
--header 'Cookie: csrftoken=vR0wr4PGnWerT7Rff9o080ezsjIEhH16ZLoG2BAeLxpVTVhh4Xa6oyHeuJeb7MHt' \
--data-raw '{
    "inventory_code": "CAR",
    "inventory_name": "Outlander"
}'

3. Get an inventory
curl --location --request GET 'http://127.0.0.1:8000/api/inventories/1' \
--header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjM4MTUyNzA1LCJqdGkiOiIyYjRkNTIwYjllMDY0ZWQ3YjgxODg1ZDM0MTJkMDU5OSIsInVzZXJfaWQiOjN9.aRP0NHmeEQtsqRSoFeCm259zyt-tQ1Q2hAIV49IyEq8' \
--header 'Cookie: csrftoken=vR0wr4PGnWerT7Rff9o080ezsjIEhH16ZLoG2BAeLxpVTVhh4Xa6oyHeuJeb7MHt'

4. Delete an inventory
curl --location --request DELETE 'http://127.0.0.1:8000/api/inventories/2' \
--header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjM4MTUyNzA1LCJqdGkiOiIyYjRkNTIwYjllMDY0ZWQ3YjgxODg1ZDM0MTJkMDU5OSIsInVzZXJfaWQiOjN9.aRP0NHmeEQtsqRSoFeCm259zyt-tQ1Q2hAIV49IyEq8' \
--header 'Content-Type: application/json' \
--header 'Cookie: csrftoken=vR0wr4PGnWerT7Rff9o080ezsjIEhH16ZLoG2BAeLxpVTVhh4Xa6oyHeuJeb7MHt' \
--data-raw '{
    "inventory_code": "CAR",
    "inventory_name": "Outlander"
}'

5. Post a new location
curl --location --request POST 'http://127.0.0.1:8000/api/locations' \
--header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjM4MTU5OTYwLCJqdGkiOiIxMDljYWI5MDhhNGU0M2IxOTc3YjUzMmNkZjMyMzQ3YiIsInVzZXJfaWQiOjN9.ykAvvB2Mc6hhkY3ggA0yxqrOI4TB-_0zlya8-uc7U8o' \
--header 'Content-Type: application/json' \
--header 'Cookie: csrftoken=vR0wr4PGnWerT7Rff9o080ezsjIEhH16ZLoG2BAeLxpVTVhh4Xa6oyHeuJeb7MHt' \
--data-raw '{
    "location_name": "Da Nang",
    "location_address": "Da Nang address "
}'

### Purchase Order:
1. Post a purchase order (create draft)

curl --location --request POST 'http://127.0.0.1:8000/api/purchase-orders' \
--header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjM4MTUyNzA1LCJqdGkiOiIyYjRkNTIwYjllMDY0ZWQ3YjgxODg1ZDM0MTJkMDU5OSIsInVzZXJfaWQiOjN9.aRP0NHmeEQtsqRSoFeCm259zyt-tQ1Q2hAIV49IyEq8' \
--header 'Content-Type: application/json' \
--header 'Cookie: csrftoken=vR0wr4PGnWerT7Rff9o080ezsjIEhH16ZLoG2BAeLxpVTVhh4Xa6oyHeuJeb7MHt' \
--data-raw '{
    "ship_to_location": 2,
    "purchase_order_detail": [
        {
            "purchase_order_line_item_no": 1, 
            "inventory": 1,
            "order_qty": 6
        },
        {
            "purchase_order_line_item_no": 2, 
            "inventory": 1,
            "order_qty": 11
        }
        ]
}'

2. List purchase orders
curl --location --request GET 'http://127.0.0.1:8000/api/purchase-orders/listing' \
--header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjM4MTUyNzA1LCJqdGkiOiIyYjRkNTIwYjllMDY0ZWQ3YjgxODg1ZDM0MTJkMDU5OSIsInVzZXJfaWQiOjN9.aRP0NHmeEQtsqRSoFeCm259zyt-tQ1Q2hAIV49IyEq8' \
--header 'Cookie: csrftoken=vR0wr4PGnWerT7Rff9o080ezsjIEhH16ZLoG2BAeLxpVTVhh4Xa6oyHeuJeb7MHt'

3. Submit Purchase Order
Upon submitting a purchase order, it will create a new Purchase Order and update (add) inventory qty_on_order in p_stock_on_hand table.

curl --location --request PUT 'http://127.0.0.1:8000/api/purchase-orders/submit' \
--header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjM4MTUzMDE5LCJqdGkiOiI2YTEzODQ1Yzk0MzU0NmViYWVhMDhmOWNkZDQ3ODI5OSIsInVzZXJfaWQiOjN9.jOglPmjXeHWqajYTY4N9-sp-plC3H9T74LNerTTojO4' \
--header 'Content-Type: application/json' \
--header 'Cookie: csrftoken=vR0wr4PGnWerT7Rff9o080ezsjIEhH16ZLoG2BAeLxpVTVhh4Xa6oyHeuJeb7MHt' \
--data-raw '{
    "ship_to_location": 1,
    "purchase_order_detail": [{
        "purchase_order_line_item_no": 1,
        "inventory": 1,
        "order_qty": 4
    }
    ]
}'
