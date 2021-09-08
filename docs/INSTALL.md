# ローカルPC用のツールをインストールします 

プロジェクトを初期する前に、次のツールをインストールする必要があります。 

- [docker](https://docs.docker.com/engine/installation/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [pyenv](https://github.com/pyenv/pyenv)
- [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)


## バックエンド 

### サービス 

本プロジェクトには外部サービスを利用します。データベースの対してはPostgres、キャッシングに対してはRedisなどのを使用します。 
 `docker-compose.yml` ファイル で定義されています。 


# virtualenvを使用してpythonenvを準備します 

1. ローカルで実行するための仮想環境を作成する: 

```bash

pyenv install 3.9.5
pyenv virtualenv 3.9.5 approval-system-backend
pyenv local approval-system-backend
pyenv activate approval-system-backend
```

2. Pythonパッケージをインストールする:

```bash
pip install -r approvalsystem/requirements/requirement.txt
```

3. Dockerデータベースとキャッシングをデタッチモードで起動する: 

```bash
docker-compose up -d
```

4. Djangoアプリを実行し、ブラウザーで `localhost：8000 ` pageをチェックする: 

```bash
python manage.py runserver
```

プロジェクトを成功に実行するために必要な手順は上記通りです。 

# VueJSアプリケーション構築 

1. パッケージをインストールする：

```bash
npm install
```

2. VueJSアプリを実行し、ブラウザーで `localhost：8080` pをチェックします:

```bash
npm run serve
```

