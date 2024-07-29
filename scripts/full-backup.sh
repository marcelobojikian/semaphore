#!/usr/bin/env bash

DATE=$(date +%F-%H%M%S)

BACKUP_DIR="files/backups"
mkdir -p $BACKUP_DIR

BACKUP_FILE=$BACKUP_DIR/$1.tar.gz
BACKUP_FILE_DATE=$BACKUP_DIR/$1-$DATE.tar.gz

shift

tar -czf "$BACKUP_FILE" $@
cp "$BACKUP_FILE" "$BACKUP_FILE_DATE"