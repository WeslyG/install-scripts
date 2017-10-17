#!/usr/bin/env bash
cd /tmp
name='jdk-8u144-linux-x64.tar.gz'
versin=144
curl -o ${name} https://cloud.hostco.ru/s/QdMtPxCQxYtwJjs/download
tar zxvf ${name}
mv jdk1.8.0_144 /usr/java/
echo "export JAVA_HOME=/usr/java/jdk1.8.0_${versin}/jre" >> ~/.bashrc
echo "export PATH=/usr/java/jdk1.8.0_${versin}/jre/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
rm -rf ${name}