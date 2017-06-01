#!/bin/bash
systemctl stop node
systemctl stop tomcat

cd /tmp
rm -rf acm
git clone https://lila@git.hostco.ru/platform/acm.git -b dev
cd acm
mvn package
rm -rf /opt/tomcat/log/acm.log
rm -rf /opt/tomcat/webapps/*.war
cp /rest/target/*.war /opt/tomcat/webapps/

su postgres
dropdb acm
createdb -O acm acm
psql -h localhost -U acm -f /tmp/acm/etc/acm.sql acm
exit

cd /opt/
mv /opt/acm-client/src/config.js /opt/
rm -rf acm-client
git clone https://lila@git.hostco.ru/platform/acm-client.git -b dev
rm -rf /opt/acm-client/src/config.js
mv /opt/config.js /opt/acm-client/src/
cd acm-client
npm install

systemctl start tomcat
systemctl start node

echo "Все готово, можно запускать"
