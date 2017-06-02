#!/bin/bash
# Юзера ACM Надо создавать супером командой -Ps
# export PGPASSWORD='ACMacm'

# Пароль для бд
PGPASSFILE=/tmp/pgpasswd$$
echo "localhost:5432:acm:acm:ACMacm" > $PGPASSFILE
chmod 600 $PGPASSFILE
export PGPASSFILE
psql acm acm
rm $PGPASSFILE

# Начали
systemctl stop node
systemctl stop tomcat

cd /tmp
rm -rf acm
git clone https://lila@git.hostco.ru/platform/acm.git -b dev
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
git clone https://lila@git.hostco.ru/platform/acm-client.git -b dev
rm -rf /opt/acm-client/src/config.js
mv /opt/config.js /opt/acm-client/src/
cd acm-client
sudo npm install

systemctl start tomcat
systemctl start node

echo "Все готово, ждем, пока соберет все webpack и можем проверять"
