# dumpファイル作成手順

dockerのpostgresからダンプデータを取り出し、dockerコンテナ再生成時の初期データとして利用する方法について記載する。

### dockerコンテナに入る

```bash
PS C:\work\approval-system> docker exec -it approval-system_postgres_1 /bin/bash
```

### postgresダンプ出力

```bash
# pg_dump -U approval_user --format=p --file=dump.sql approval_dev
# exit
```

### dockerコンテナからdump.sqlファイルを取り出す

```bash
PS C:\work\approval-system> docker cp approval-system_postgres_1:/dump.sql ./initdb/002_dump.sql
```