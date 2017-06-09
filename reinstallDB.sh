#!/bin/bash
tag=$1


systemctl stop node
systemctl stop tomcat

cd /tmp
rm -rf acm
git clone --branch $1 git@git.hostco.ru:platform/acm.git

systemctl stop psql
systemctl start psql
dropdb -h localhost -U acm acm
createdb -h localhost -U acm -O acm acm
psql -h localhost -U acm -f /tmp/acm/etc/acm.sql acm

echo "Запускаем томкат"
systemctl start tomcat
echo "Запускаем node"
systemctl start node
echo "Ожидайте старта сервиса)"


