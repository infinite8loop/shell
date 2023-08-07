#!/bin/bash
DIR=`date +%d-%m-%y`
DEST=~/database-backup/$DIR

# Replace these variables with your PostgreSQL credentials
PG_USER="<username>"
PG_PASSWORD="<db-password>"
PG_HOST="<hostname>"
PG_PORT="5432"
PG_DATABASE="<db-name>"

mkdir $DEST; cd $DEST

PGPASSWORD="$PG_PASSWORD" pg_dump --inserts --column-inserts --username="$PG_USER" --host=3.111.154.107 --port="$PG_PORT" $PG_DATABASE > dbbackup.sql
cd ..
zip -r $DIR.zip $DIR

aws s3 cp ~/database-backup/$DIR.zip s3://<s3-bucket-name>

#Clean up to save space in the instance
rm -rf $DIR