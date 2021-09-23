#!/bin/sh

tablas=$(mysql -u data_admin -padmin5302 -e "USE base; SHOW TABLES;" | grep -v '|' | grep -v database -i | grep -v 'tables_in_base' )

fecha=$(date +%F__%R)

mkdir bdd_backup_$fecha
cd bdd_backup_$fecha

for tabla in $tablas
do
	mysql -u data_admin -padmin5302 base $tabla > $tabla.sql
done

