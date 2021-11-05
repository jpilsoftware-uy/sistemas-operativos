#!/bin/sh

cd /home/administrador
tablas=$(mysql -u root -pAdmin5302. -e "USE pedro; SHOW TABLES;" | grep -v '|' | grep -v database -i | grep -v 'Tables_in_pedro' )

fecha=$(date +%F__%R)

mkdir bdd_backup_$fecha
cd bdd_backup_$fecha

for tabla in $tablas
do
	mysqldump -u root -pAdmin5302. pedro $tabla > $tabla.sql
done

cd ..

fecha_tar=$(date +%d_%m_%Y_%H-%M)

tar cvfz bdd_backup_$fecha_tar.tar.gz bdd_backup_$fecha

sshpass -p "admin5302." scp -P 53002 bdd_backup_$fecha_tar.tar.gz administrador@192.168.1.105:/home/administrador/bdd_backup

rm -rf bdd_backup_$fecha
rm -rf bdd_backup_$fecha_tar.tar.gz

