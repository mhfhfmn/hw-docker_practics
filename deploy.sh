#!/bin/bash
set -e

apt-get update && apt-get install -y git

REPO_URL="https://github.com/mhfhfmn/hw-docker_practics.git"
DEST_DIR="/opt/hw-docker_practics"

if [ -d "$DEST_DIR" ]; then
    echo "dir $DEST_DIR exist. updating"
    cd $DEST_DIR
    git pull
else
    echo "clone repo to $DEST_DIR..."
    git clone $REPO_URL $DEST_DIR
    cd $DEST_DIR
fi


# echo "create env"
# cat <<EOF > .env
# MYSQL_ROOT_PASSWORD="YtReWq4321"
# MYSQL_DATABASE="virtd"
# MYSQL_USER="app"
# MYSQL_PASSWORD="QwErTy1234"
# DB_TABLE="requests"
# EOF

echo "compose run"
docker compose up -d

echo "drploy complit"