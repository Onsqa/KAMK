#!/bin/sh
echo "Alotetaan äsquuällän backuppia"
DATE=$(date +"%d-%b-%Y")
dbname=sqlname
name=$dbname-${DATE}.sql
sudo mysqldump -usqlacc --no-tablespaces sqlname >/home/sqlb/${name}

echo "Äsquuällä backupattu"
