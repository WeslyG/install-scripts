#!/bin/sh
# PGPASSFILE=/tmp/pgpasswd$$
# echo "localhost:5432:acm:acm:ACMacm" > $PGPASSFILE
# chmod 600 $PGPASSFILE
# export PGPASSFILE
# psql acm acm
# rm $PGPASSFILE

echo "localhost:*:*:acm:ACMacm" > $HOME/.pgpass
echo "chmod 0600 $HOME/.pgpass"
echo "psql -h localhost -p 5432  -U acm  acm"


curl -o apache-tomcat-8.5.15.tar.gz https://cloud.hostco.ru/s/DboyjGV46WgcB9T/download