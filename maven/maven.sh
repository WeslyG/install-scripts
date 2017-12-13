#!/bin/bash
# Скрипт для версии 3.5.2
version="3.5.2"
cd /tmp/
wget http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/${version}/binaries/apache-maven-${version}-bin.tar.gz
sudo tar xzf apache-maven-${version}-bin.tar.gz -C /usr/local
cd /usr/local
rm -rf maven
sudo ln -s apache-maven-${version} maven
# rm -rf /etc/profile.d/maven.sh
echo 'export M2_HOME=/usr/local/maven' >> ~/.bashrc
echo 'export PATH=$M2_HOME/bin:$PATH' >> ~/.bashrc
cd /tmp/
rm -rf apache-maven-${version}-bin.tar.*
source ~/.bashrc
echo "Все готово, выйдите и войдите в профиль снова, что бы все работало!"
#Выйти и зайти

