#!/bin/bash

cd /tmp
wget https://git.hostco.ru/devops/acm-scripts/raw/develop/jdkInstall.sh
chmod +x jdkInstall.sh
./jdkInstall.sh

export JAVA_HOME=export JAVA_HOME=/usr/java/jdk1.8.0_131/jre

wget https://git.hostco.ru/devops/acm-scripts/raw/develop/tomcat.sh
chmod +x tomcat.sh
./tomcat.sh

wget https://git.hostco.ru/devops/acm-scripts/raw/develop/maven.sh
chmod +x maven.sh
./maven.sh

wget https://git.hostco.ru/devops/postgresql/raw/master/psql9.6_centOs.sh
chmod +x psql9.6_centOs.sh
./psql9.6_centOs.sh