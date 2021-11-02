#!bin/bash

mkdir -p logs

find /var/log -name '*message' -exec rsync "{}" /logs \;
find /var/log -name '*secure' -exec rsync "{}" /logs \;