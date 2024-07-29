#!/usr/bin/env bash

source files/env/default

BACKUP_DIR="files/database"
MYSQL_IMAGE="mysql:8.0"

BACKUP_FILENAME="$BACKUP_DIR/$DB_DATABASE.sql"

sudo docker exec -i $DB_HOST mysql -h $DB_HOST -u $DB_USER -p$DB_PASS --force  $DB_DATABASE < $BACKUP_FILENAME