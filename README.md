# CirKit2025-training

Rails書籍管理アプリケーションのトレーニング用リポジトリです。

## 前提条件

- Ubuntu (WSL2)
- Git
- Docker
- Docker Compose

## セットアップ手順

### 1. リポジトリのクローン

```bash
# ホームディレクトリに移動
cd ~

# cirkitディレクトリを作成
mkdir -p cirkit/training

# trainingディレクトリに移動
cd cirkit/training

# リポジトリをクローン
git clone https://github.com/s-taku0502/CirKit2025-training.git

# プロジェクトディレクトリに移動
cd CirKit2025-training
```

### 2. アプリケーションの起動

```bash
# Dockerコンテナをビルド・起動
docker compose up --build

# 別のターミナルでデータベースのセットアップ
docker compose exec rails bin/rails db:create db:migrate db:seed
```

### 3. アプリケーションへのアクセス

ブラウザで以下のURLにアクセス：

- <http://localhost:3000>

### 4. 停止方法

```bash
# Ctrl+C でコンテナを停止
# または別のターミナルで
docker compose down
```

## 使用技術

- Ruby 3.2.0
- Rails 8.0.2
- MySQL 8.4
- Docker & Docker Compose

## 機能

- 書籍一覧表示
- 書籍登録

## ディレクトリ構造

```text
~/cirkit/training/CirKit2025-training/
├── app/
│   ├── controllers/
│   ├── models/
│   └── views/
├── config/
├── db/
├── docker-compose.yml
├── Dockerfile
└── README.md
```

## トラブルシューティング

### ポート3000が使用中の場合

```bash
# 使用中のプロセスを確認
sudo lsof -i :3000

# プロセスを終了
sudo kill -9 <PID>
```

### データベース接続エラーの場合

```bash
# データベースを再作成
docker compose exec rails bin/rails db:drop db:create db:migrate db:seed
```

### Dockerコンテナの完全リセット

```bash
# すべてのコンテナとボリュームを削除
docker compose down -v
docker system prune -a

# 再度ビルド・起動
docker compose up --build
```
