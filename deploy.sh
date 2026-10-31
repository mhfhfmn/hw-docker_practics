#!/bin/bash
set -e

apt-get update && apt-get install -y git

REPO_URL="https://github.com/mhfhfmn/hw-docker_practics.git"
DEST_DIR="/opt/hw-docker_practics"

if [ -d "$DEST_DIR" ]; then
    echo "Каталог $DEST_DIR уже существует. Обновляем..."
    cd $DEST_DIR
    git pull
else
    echo "Клонируем репозиторий в $DEST_DIR..."
    git clone $REPO_URL $DEST_DIR
    cd $DEST_DIR
fi

# 3. Создание .env файла с нужными переменными
echo "Создаем файл конфигурации .env..."
cat <<EOF > .env
MYSQL_ROOT_PASSWORD="YtReWq4321"
MYSQL_DATABASE="virtd"
MYSQL_USER="app"
MYSQL_PASSWORD="QwErTy1234"
DB_TABLE="requests"
EOF

# 4. Запуск проекта
echo "Запускаем Docker Compose..."
docker compose up -d

echo "Деплой завершен!"