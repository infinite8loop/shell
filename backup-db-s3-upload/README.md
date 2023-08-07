# Backup postgres db and upload zipped backups to a private s3.

This has all the instructions to upload zipped backups of a postgres db to a private s3.. 

---------------------------------------------

## Usage

Assuming Ubuntu is being used.
Make sure to give execute permission to backup.sh file.
pg_dump is installed.

Give execute permission to backup.sh :

``` bash
chmod +x backup.sh
```

## How to run?

The following command backs up the postgres db and uploads the dump file to S3 bucket:

``` bash
bash ./backup.sh
```

## Crontab to schedule the backup

To edit cronjobs

``` bash
crontab -e
```
Add this this to schedule the backup and upload to S3.
``` bash
30 17 * * 6 /home/ubuntu/scripts/db_backup.sh
```

To to view the contents of your crontab.

``` bash
crontab -l
```

To ease the cronjobs

``` bash
crontab -r
```