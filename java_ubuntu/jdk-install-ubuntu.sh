#!/usr/bin/env bash
cd /tmp
name='jdk-8u-linux-x64.tar.gz'
version=152
curl -o ${name} https://cloud.hostco.ru/s/DcTIpWmEauI6a6e/download
tar zxvf ${name}
mv jdk1.8.0_${version} /usr/java/
echo "export JAVA_HOME=/usr/java/jdk1.8.0_${version}/jre" >> ~/.bashrc
echo "export PATH=/usr/java/jdk1.8.0_${version}/jre/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
rm -rf ${name}