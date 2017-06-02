#!/bin/bash
# Скрипт для версии 3.5.0
version="3.5.0"
cd /tmp/
wget http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/${version}/binaries/apache-maven-${version}-bin.tar.gz
sudo tar xzf apache-maven-${version}-bin.tar.gz -C /usr/local
cd /usr/local
sudo ln -s apache-maven-${version} maven
# sudo nano /etc/profile.d/maven.sh
rm -rf /etc/profile.d/maven.sh
echo "#!/bin/bash" >> /etc/profile.d/maven.sh
echo "export M2_HOME=/usr/local/maven" >> /etc/profile.d/maven.sh
echo "export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
cd /tmp/
rm -rf apache-maven-${version}-bin.tar.*


rm -rf /etc/profile.d/javad.sh
echo "#!/bin/bash" >> /etc/profile.d/javad.sh
echo "export JAVA_HOME=/usr/java/jdk1.8.0_131" >> /etc/profile.d/javad.sh
source /etc/profile.d/javad.sh
echo "export PATH=${JAVA_HOME}/bin:${PATH}" >> /etc/profile.d/javad.sh
chmod +x /etc/profile.d/javad.sh

source /etc/profile.d/javad.sh
source /etc/profile


sudo sh -c "echo export JAVA_HOME=/usr/java/jdk1.8.0_131/jre >> /etc/environment"

# source /etc/profile.d/java.sh

# echo "#!/bin/bash" >> /etc/profile.d/java.sh