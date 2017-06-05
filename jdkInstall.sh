#!/usr/bin/env bash
cd /tmp
curl -o jdk-8u131-linux-x64.rpm https://cloud.hostco.ru/s/0qYpOfwjP5U24fK/download
sudo yum localinstall jdk-8u131-linux-x64.rpm -y
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_131/jre' >> ~/.bashrc
echo 'export PATH=/usr/java/jdk1.8.0_131/jre/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
rm -rf jdk-8u131-linux-x64.rpm