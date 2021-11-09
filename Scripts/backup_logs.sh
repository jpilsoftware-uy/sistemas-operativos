#!/bin/bash

cd /
mkdir -p archivo_de_logs
cd /archivo_de_logs
mkdir -p logs_secure
mkdir -p logs_message

cd /var/log/
logs_secure=$(cp secure* /archivo_de_logs/logs_secure)
fecha_tar=$(date +%d_%m_%Y_%H-%M)
logs_message=$(cp message* /archivo_de_logs/logs_message)
cd /
tar cvfz archivo_de_logs_$fecha_tar.tar.gz /archivo_de_logs

sshpass -p "admin5302." scp -P 53002 /archivo_de_logs_$fecha_tar.tar.gz administrador@192.168.1.105:/home/administrador/backup_logs 

rm -rf archivo_de_logs
rm -rf archivo_de_logs_$fecha_tar.tar.gz


