# ローカルPC用のツールをインストールします

プロジェクトを初期する前に、次のツールをインストールする必要があります。

- python
- Visual Studio Code
- Docker Descktop
- PostgreSQL 13
- Git
- [docker](https://docs.docker.com/engine/installation/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [pyenv](https://github.com/pyenv/pyenv) (Linux, MacOS) ※Widowsの場合は不要
- [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) (for Linux and MacOS) ※Widowsの場合は不要
- [pyenv-win](https://github.com/pyenv-win/pyenv-win) (Windows)
- [npm](https://nodejs.org/ja/)

# Power Shell実行ポリシーの設定

Power Shellを開いて以下のコマンドを実行する。

```bash
> Set-ExecutionPolicy Bypass -Scope CurrentUser
```

以下のコマンドを実行し実行ポリシーを確認する。

```bash
> Get-ExecutionPolicy -List

        Scope ExecutionPolicy
        ----- ---------------
MachinePolicy       Undefined
   UserPolicy       Undefined
      Process       Undefined
  CurrentUser          Bypass
 LocalMachine       Undefined
```
# データベース

#### 1. Dockerデータベースとキャッシングをデタッチモードで起動する:

```bash
PS C:\work\approval-system\approvalsystem> docker-compose up -d
```

# バックエンド

### サービス

本プロジェクトには外部サービスを利用します。データベースの対してはPostgresを使用します。
 `docker-compose.yml` ファイル で定義されています。

## Windows

## pyenvインストール

#### 1. pipでpyenv-winをインストール

PowerShellからpipを使ってインストールする。

```bash

PS C:\work\approval-system\approvalsystem> pip install pyenv-win --target $HOME\\.pyenv
```

#### 2. アプリ実行エイリアスでpythonのアプリインストーラーをオフにする。

![](img/aliases.png)
![](img/aliases-for-Python.png)

#### 3. 環境変数を設定

PowerShellで以下のコマンドを実行して環境変数を設定する。

```bash

PS C:\work\approval-system\approvalsystem> [System.Environment]::SetEnvironmentVariable('PYENV',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
PS C:\work\approval-system\approvalsystem> [System.Environment]::SetEnvironmentVariable('PYENV_HOME',$env:USERPROFILE + "\.pyenv\pyenv-win\","User")
PS C:\work\approval-system\approvalsystem> [System.Environment]::SetEnvironmentVariable('path', $env:USERPROFILE + "\.pyenv\pyenv-win\bin;" + $env:USERPROFILE + "\.pyenv\pyenv-win\shims;" + [System.Environment]::GetEnvironmentVariable('path', "User"),"User")
```

#### 4. PowerShellを一度再起動する

環境変数が反映されていない可能性があるのでPowerShellのウィンドウを一度閉じて再度開く。

```bash
exit
```

#### 5. pyenvバージョン確認

```bash

PS C:\work\approval-system\approvalsystem> pyenv --version
pyenv 2.64.10
```

# 仮想環境を使用してpython環境を準備します

#### 1. ローカルで実行するための仮想環境を作成する:

pyenvにpython3.9.5をインストールする。

```bash

PS C:\work\approval-system\approvalsystem> pyenv install 3.9.2

Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.
:: [Info] ::  Mirror: https://www.python.org/ftp/python
:: [Downloading] ::  3.9.2 ...
:: [Downloading] ::  From https://www.python.org/ftp/python/3.9.2/python-3.9.2-amd64-webinstall.exe      
:: [Downloading] ::  To   C:\Users\parkh\.pyenv\pyenv-win\install_cache\python-3.9.2-amd64-webinstall.exe
:: [Installing] ::  3.9.2 ...
:: [Info] :: completed! 3.9.2
```

python3.9.5を使うように切り替える。

```bash
PS C:\work\approval-system\approvalsystem> pyenv local 3.9.2
PS C:\work\approval-system\approvalsystem> python --version
Python 3.9.2
```

venvで仮想環境を作成する。

```bash
PS C:\work\approval-system\approvalsystem> python -m venv venv
```

Note: このようなエラーが出たときは`pyenv global 3.9.2`と実行する。

```
No global python version has been set yet. Please set the global version by typing:
pyenv global 3.7.2
```

仮想環境をアクティブにする。

```
.\venv\Scripts\activate
```

```
python -m pip install --upgrade pip
```

#### 2. Pythonパッケージをインストールする:

```bash
PS C:\work\approval-system\approvalsystem> pip install -r requirements/requirements.txt
Collecting asgiref==3.4.1
  Using cached asgiref-3.4.1-py3-none-any.whl (25 kB)
(省略)
Successfully installed Django-3.2.7 MarkupSafe-2.0.1 asgiref-3.4.1 certifi-2021.5.30 charset-normalizer-2.0.6 coreapi-2.3.3 coreschema-0.0.4 django-concurrency-2.
(省略)
```

ライブラリがインストールできたか確認する。

```
PS C:\work\approval-system\approvalsystem> pip list
Package                       Version
----------------------------- ---------
asgiref                       3.4.1
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
```

#### 2-2. Pythonパッケージをインストールする(開発用):
```bash
PS C:\work\approval-system\approvalsystem> pip install -r requirements/requirements-dev.txt
Collecting pytest
  Downloading pytest-6.2.5-py3-none-any.whl (280 kB)
(省略)
Successfully installed atomicwrites-1.4.0 attrs-21.2.0 colorama-0.4.4 coverage-6.0.2 iniconfig-1.1.1 pluggy-1.0.0 py-1.10.0 pytest-6.2.5 pytest-cov-3.0.0 pytest-html-3.1.1 pytest-metadata-1.11.0 pytest-mock-3.6.1 pytest-pythonpath-0.7.3 toml-0.10.2 tomli-1.2.2
(省略)
```

#### 3. 「.env」ファイル作成

```bash
PS C:\work\approval-system\approvalsystem> cp .\config\.env.example .\config\.env
```

作成された「.env」ファイルを開いて「192.168.1.4」の部分を自分のPCのローカルIPアドレスに編集する。

```
CORS_ALLOWED_ORIGINS=http://localhost:8080;http://127.0.0.1:8080;http://192.168.1.4:8080
```

#### 4. Djangoアプリを実行し、ブラウザーで `localhost：8000 ` pageをチェックする:

```bash
PS C:\work\approval-system\approvalsystem> python manage.py runserver
```

## LinuxもしくはMacOSの場合はこちらを参照

```bash

pyenv install 3.9.2
pyenv virtualenv 3.9.2 venv
pyenv local venv
pyenv activate venv
```

#### 5. 単体テストを実行する (DB・認証などの初期化は`tests\conftest.py`で行っています)

```bash
PS C:\work\approval-system\approvalsystem> pytest
※VSCodeのフラスコアイコンからでも実行・デバック可能
```
#### 5-1. pytest.ini のaddoptsを切り替えることによって、カバレッジが切り替え可能
* デバック用
```bash
# debug unit test
addopts = -s --reuse-db --no-migrations
```
* カバレッジ VSCode用（別途`Coverage Gutters`などのアドオンが必要）
```bash
# output coverage vscode(addon Coverage Gutters)
addopts = --reuse-db --no-migrations --cov=. --cov-report=xml
```
* カバレッジ レポート出力用（HTML）
```bash
# output coverage html
addopts = --reuse-db --no-migrations --capture=no --cov=. --cov-report=html
```


# フロントエンド

## node.js & npmインストール

[こちら](https://nodejs.org/ja/download/)からダウンロードした「Windows Installer (.msi)」を使ってインストールする。

※デフォルト設定で「next」でウィザードを進めてOK

## VueJSアプリケーション構築

Vuejsを独立して実行させるための環境です。

#### 1. パッケージをインストールする:

```bash
PS C:\work\approval-system\approvalsystem-ui> npm install
```

#### 2. VueJSアプリを実行し、ブラウザーで `localhost：8080` pageを確認する:

```bash
PS C:\work\approval-system\approvalsystem-ui> npm run serve
```