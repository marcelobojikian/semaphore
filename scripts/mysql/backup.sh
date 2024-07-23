#!/usr/bin/env bash

source files/env/default

DATE=$(date +%F-%H%M%S)

BACKUP_DIR="files/backups"

MYSQL_IMAGE="mysql:8.0"
NETWORK="docker_backend" #name of the network where mysql container is running. You can check the list of the docker neworks using dooker network ls

# Backup filename
BACKUP_FILENAME="$BACKUP_DIR/$DB_DATABASE-$DATE.sql"

# Run mysqldump within a new Docker container
sudo docker run --rm --network $NETWORK $MYSQL_IMAGE /usr/bin/mysqldump --no-tablespaces -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_DATABASE > $BACKUP_FILENAME

cp $BACKUP_FILENAME "$BACKUP_DIR/backup.sql"

# Compress the backup file
gzip $BACKUP_FILENAME