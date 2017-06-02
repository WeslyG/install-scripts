#!/bin/bash
# Скрипт для версии 3.5.0
version="3.5.0"
cd /tmp/
wget http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/${version}/binaries/apache-maven-${version}-bin.tar.gz
sudo tar xzf apache-maven-${version}-bin.tar.gz -C /usr/local
cd /usr/local
rm -rf maven
sudo ln -s apache-maven-${version} maven
rm -rf /etc/profile.d/maven.sh
echo "#!/bin/bash" >> /etc/profile.d/maven.sh
echo "export M2_HOME=/usr/local/maven" >> /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
echo "export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/maven.sh
cd /tmp/
rm -rf apache-maven-${version}-bin.tar.*
source /etc/profile.d/maven.sh
echo "Все готово, выйдите и войдите в профиль снова, что бы все работало!"
#Выйти и зайти

