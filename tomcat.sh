#!/bin/bash
name="apache-tomcat-8.5.15.tar.gz"

cd /opt
curl -o $name https://cloud.hostco.ru/s/DboyjGV46WgcB9T/download
tar xvf $name

#Создаем быстрый доступ линками
ln -s tomcat /opt/$name
ln -s /tomcat /opt/$name

#Скачиваем конфиг
wget https://git.hostco.ru/devops/acm-scripts/raw/develop/tomcat.service
# sed -r 's/Environment=JAVA_HOME=\/usr\/lib\/jvm\/jre/Environment=$JAVA_HOME/g' tomcat.service > tomcat.service2


mv tomcat.service /etc/systemd/system/tomcat.service

systemctl daemon-reload
systemctl start tomcat