#!/bin/sh

echo "Alotetaan tietokannan varmuuskopiointi"

DATE=$(date +"%d-%b-%Y")

dbname=sqlname
name=${dbname}-${DATE}.sql

sudo mysqldump -usqlacc --no-tablespaces sqlname >/home/sqlb/${name}

echo "Tietokannan varmuuskopio suoritettu onnistuneesti"
