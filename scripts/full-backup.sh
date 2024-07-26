#!/usr/bin/env bash

DATE=$(date +%F-%H%M%S)

SECURITY_PATH=files/security
ENV_PATH=files/env
DATABASE_FILE="files/backups/database.sql"

BACKUP_DIR="files/backups"
mkdir -p $BACKUP_DIR

tar -czf "$BACKUP_DIR/backup.tar.gz" \
         "$SECURITY_PATH" \
         "$ENV_PATH" \
         "$DATABASE_FILE"

cp "$BACKUP_DIR/backup.tar.gz" "$BACKUP_DIR/backup-$DATE.tar.gz"