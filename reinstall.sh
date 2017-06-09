#!/bin/bash
tag=$1

# Начали
systemctl stop node
systemctl stop tomcat

cd /tmp
rm -rf acm
git clone --branch $1 git@git.hostco.ru:platform/acm.git
cd acm
mvn package
rm -rf /opt/tomcat/log/acm.log
rm -rf /opt/tomcat/webapps/*.war
cp /tmp/acm/rest/target/*.war /opt/tomcat/webapps/

systemctl stop psql
systemctl start psql
dropdb -h localhost -U acm acm
createdb -h localhost -U acm -O acm acm
psql -h localhost -U acm -f /tmp/acm/etc/acm.sql acm

cd /opt/
mv /opt/acm-client/src/config.js /opt/
rm -rf acm-client
git clone --branch $1 git@git.hostco.ru:platform/acm-client.git
rm -rf /opt/acm-client/src/config.js
mv /opt/config.js /opt/acm-client/src/
cd acm-client
sudo npm install


echo "Запускаем томкат"
systemctl start tomcat
echo "Запускаем node"
systemctl start node

echo "Все готово, ждем, пока соберет все webpack и можем проверять"