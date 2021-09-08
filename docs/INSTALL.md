# ローカルPC用のツールをインストールします 

プロジェクトを開始する前に、次のツールをインストールする必要があります。 

- [docker](https://docs.docker.com/engine/installation/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [pyenv](https://github.com/pyenv/pyenv)
- [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)


## バックエンド 

### サービス 

プロジェクトは、Postgres for DB、Redisなどの外部サービスをキャッシングに使用します。 
in `docker-compose.yml` file で定義されています。 


# virtualenvを使用してpythonenvを準備します 

1. ローカルで実行するための仮想環境を作成します: 

```bash

pyenv install 3.9.5
pyenv virtualenv 3.9.5 approval-system-backend
pyenv local approval-system-backend
pyenv activate approval-system-backend
```

2. Pythonパッケージをインストールします:

```bash
pip install -r approvalsystem/requirements/requirement.txt
```

3. Dockerデータベースとキャッシングをデタッチモードで起動します: 

```bash
docker-compose up -d
```

4. Djangoアプリを実行し、ブラウザーで `localhost：8000 ` pageをチェックします: 

```bash
python manage.py runserver
```

プロジェクトを成功に実行するために必要な手順はこれだけです。 

# VueJSアプリケーションを準備します 

1. パッケージをインストールします：

```bash
npm install
```

2. VueJSアプリを実行し、ブラウザーで `localhost：8080` pageをチェックします:

```bash
npm run serve
```

