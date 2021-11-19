# 注意！！

テストデータに個人情報を含まないように注意すること！

### test用ユーザ

|社員番号(ログインID)|パスワード|メールアドレス|備考|
|--|--|--|--|
|0000001|test1234|admin@example.com|管理者権限|
|0000002|aitest0987|ai@example.com||

# docker用dumpファイル作成手順

dockerのpostgresからダンプデータを取り出し、dockerコンテナ再生成時の初期データとして利用する方法について記載する。

### dockerコンテナに入る

```bash
PS C:\work\approval-system\approvalsystem> docker exec -it approval-system-postgres-1 /bin/bash
```

### postgresダンプ出力

```bash
# pg_dump -U approval_user --format=p --file=dump.sql approval_dev
# exit
```

### dockerコンテナからdump.sqlファイルを取り出す

```bash
PS C:\work\approval-system\approvalsystem> docker cp approval-system-postgres-1:/dump.sql ../initdb/002_dump.sql
```

# django用dumpファイル作成

### データ取り出す

```consolev
python manage.py dumpdata [アプリ名.モデル名] > [出力先]
python manage.py dumpdata core.RequestStatus > core/fixtures/m_request_status.json
```

※utf16で出力されるのでutf8に変換する。
※VSCodeで`Shift + Alt + F`で整形すると尚よい。

### データ入れる

```console
python manage.py loaddata [jsonファイル名]
python manage.py loaddata m_request_status.json
```