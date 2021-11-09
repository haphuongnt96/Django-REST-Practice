migrateをスムーズに行うために、以下の手順で作業をお願いします。

# 初期テーブルなし

### 1. `initdb\002_dump.sql`を削除


### 2. postgresのコンテナ再作成

```
PS C:\work\approval-system> .\docker-compose-down.bat
PS C:\work\approval-system> .\docker-compose-up.bat
```

### 3. migrate

```
(venv) PS C:\work\approval-system\approvalsystem> .\00_delete_migrations_dir.bat
(venv) PS C:\work\approval-system\approvalsystem> .\01_migrate.bat
```

# 初期テーブルあり

`initdb\002_dump.sql`は削除しない

### 1. postgresのコンテナ再作成

```
PS C:\work\approval-system> .\docker-compose-down.bat
PS C:\work\approval-system> .\docker-compose-up.bat
```

### 2. migrationsファイル再作成

実際のデータベースにmigrationファイルを合わせる。

```
(venv) PS C:\work\approval-system\approvalsystem> .\00_delete_migrations_dir.bat
(venv) PS C:\work\approval-system\approvalsystem> .\01_migrate.bat
```

### 3. modelを編集する

**modelの作成もしくは編集を行う。**

### 4. migrate

```
(venv) PS C:\work\approval-system\approvalsystem> .\01_migrate.bat
```