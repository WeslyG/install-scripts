#!/bin/bash

# cd /tmp
# wget https://git.hostco.ru/devops/acm-scripts/raw/develop/jdkInstall.sh
# chmod +x jdkInstall.sh
# ./jdkInstall.sh

# export JAVA_HOME=export JAVA_HOME=/usr/java/jdk1.8.0_131/jre

# wget https://git.hostco.ru/devops/acm-scripts/raw/develop/tomcat.sh
# chmod +x tomcat.sh
# ./tomcat.sh

# wget https://git.hostco.ru/devops/acm-scripts/raw/develop/maven.sh
# chmod +x maven.sh
# ./maven.sh

# wget https://git.hostco.ru/devops/postgresql/raw/master/psql9.6_centOs.sh
# chmod +x psql9.6_centOs.sh
# ./psql9.6_centOs.sh

# Для ноды
# wget https://git.hostco.ru/devops/postgresql/raw/master/psql9.6_centOs.sh
# chmod +x psql9.6_centOs.sh
# ./psql9.6_centOs.sh

systemctl stop tomcat
systemctl stop psql
systemctl start psql

sudo -u postgres bash -c "psql -c \"CREATE USER acm WITH PASSWORD 'ACMacm';\""
sudo -u postgres bash -c "psql -c \"CREATE DATABASE acm WITH OWNER 'acm';\""


echo "localhost:*:*:acm:ACMacm" > $HOME/.pgpass
chmod 0600 $HOME/.pgpass

cd /tmp
rm -rf acm
git clone https://lila@git.hostco.ru/platform/acm.git -b dev

# sudo -u postgres -c "psql -h localhost -U acm -f /tmp/acm/etc/acm.sql acm"
psql -h localhost -U acm -f /tmp/acm/etc/acm.sql acm

cd /tmp/acm
mvn package
rm -rf /opt/tomcat/log/acm.log
rm -rf /opt/tomcat/webapps/*.war
cp /tmp/acm/rest/target/*.war /opt/tomcat/webapps/


cd /opt/
git clone https://lila@git.hostco.ru/platform/acm-client.git -b dev
rm -rf /opt/acm-client/src/config.js
mv /opt/config.js /opt/acm-client/src/
cd acm-client
sudo npm install

systemctl start tomcat
systemctl start node
