#!/bin/bash
FoulderName="apache-tomcat-8.5.15"
FileName="apache-tomcat-8.5.15.tar.gz"

systemctl stop tomcat
userdel tomcat -f

cd /opt
rm -rf $FoulderName
rm -rf tomcat
rm -rf /tomcat

curl -o $FileName https://cloud.hostco.ru/s/DboyjGV46WgcB9T/download
tar xvf $FileName

#Создаем быстрый доступ линками
ln -s /opt/$FoulderName /tomcat
ln -s /opt/$FoulderName tomcat

groupadd tomcat
useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
chgrp -R tomcat /opt/tomcat
cd /opt/tomcat/
chmod -R g+r conf
chmod g+x conf
chown -R tomcat webapps/ work/ temp/ logs/

cd /opt && sudo chown -R tomcat tomcat/

#Скачиваем конфиг
wget https://git.hostco.ru/devops/acm-scripts/raw/develop/tomcat.service

#Ставим на внешку
# wget http://wesly.hopto.org/tomcat.service

mv tomcat.service /etc/systemd/system/tomcat.service
rm -rf $FileName

systemctl daemon-reload
systemctl start tomcat
