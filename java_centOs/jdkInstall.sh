#!/usr/bin/env bash
cd /tmp
name='jdk-8u144-linux-x64.rpm'
versin=152
curl -o ${name} https://cloud.hostco.ru/s/X4QO3MAWDCBED3Q/download
sudo yum localinstall ${name} -y
echo "export JAVA_HOME=/usr/java/jdk1.8.0_${versin}/jre" >> ~/.bashrc
echo "export PATH=/usr/java/jdk1.8.0_${versin}/jre/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
rm -rf ${name}