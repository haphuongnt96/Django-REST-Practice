# Install tools for local PC

You should install the following tools before initialize the project:

- [docker](https://docs.docker.com/engine/installation/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [pyenv](https://github.com/pyenv/pyenv)
- [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)


## Backend

### Services

The project use external services like Postgres for DB, Redis for caching.
It is defined in `docker-compose.yml` file.


# Prepare python env using virtualenv

1. Create virtual environment for running local:

```bash

pyenv install 3.9.5
pyenv virtualenv 3.9.5 approval-system-backend
pyenv local approval-system-backend
pyenv activate approval-system-backend
```

2. Install python packages:

```bash
pip install -r approvalsystem/requirements/requirement.txt
```

3. Start Docker Database and Caching in detach mode:

```bash
docker-compose up -d
```

4. Run Django app and check `localhost:8000` page in browser:

```bash
python manage.py runserver
```

That's all required steps to run the project successfully.

# Prepare VueJS application

1. Install packages:

```bash
npm install
```

2. Run VueJS app and check `localhost:8080` page in browser:

```bash
npm run serve
```

