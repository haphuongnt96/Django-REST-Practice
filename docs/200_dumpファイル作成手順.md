# 注意！！

テストデータに個人情報を含まないように注意すること！

### test用ユーザ

|社員番号(ログインID)|パスワード|メールアドレス|備考|
|--|--|--|--|
|0000001|test1234|admin@example.com|管理者権限|
|0000002|aitest0987|ai@example.com||

# dumpファイル作成手順

dockerのpostgresからダンプデータを取り出し、dockerコンテナ再生成時の初期データとして利用する方法について記載する。

### dockerコンテナに入る

```bash
PS C:\work\approval-system\approvalsystem> docker exec -it approval-system_postgres_1 /bin/bash
```

### postgresダンプ出力

```bash
# pg_dump -U approval_user --format=p --file=dump.sql approval_dev
# exit
```

### dockerコンテナからdump.sqlファイルを取り出す

```bash
PS C:\work\approval-system\approvalsystem> docker cp approval-system_postgres_1:/dump.sql ../initdb/002_dump.sql
```