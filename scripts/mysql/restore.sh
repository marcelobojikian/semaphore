#!/usr/bin/env bash

source files/env/default

BACKUP_DIR="files/backups"
MYSQL_IMAGE="mysql:8.0"

BACKUP_FILENAME="$BACKUP_DIR/database.sql"

sudo docker exec -i $DB_HOST mysql -h $DB_HOST -u $DB_USER -p$DB_PASS --force  $DB_DATABASE < $BACKUP_FILENAME