#!/usr/bin/env bash

source files/env/default

DATE=$(date +%F-%H%M%S)

BACKUP_DIR="files/backups"
MYSQL_IMAGE="mysql:8.0"
NETWORK="docker_backend"

mkdir -p $BACKUP_DIR

BACKUP_FILENAME="$BACKUP_DIR/$DB_DATABASE-$DATE.sql"

sudo docker run --rm --network $NETWORK $MYSQL_IMAGE /usr/bin/mysqldump --no-tablespaces -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_DATABASE > $BACKUP_FILENAME

cp $BACKUP_FILENAME "$BACKUP_DIR/database.sql"

gzip $BACKUP_FILENAME