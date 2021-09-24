#!/bin/sh

tablas=$(mysql -u data_admin -padmin5302 -e "USE base; SHOW TABLES;" | grep -v '|' | grep -v database -i | grep -v 'Tables_in_base' )

fecha=$(date +%F__%R)

mkdir bdd_backup_$fecha
cd bdd_backup_$fecha

for tabla in $tablas
do
	mysqldump -u root -p1234 base $tabla > $tabla.sql
done

cd ..

fecha_tar=$(date +%d_%m_%Y_%H-%M)

tar cvfz bdd_backup_$fecha_tar.tar.gz bdd_backup_$fecha
rm -r bdd_backup_$fecha

