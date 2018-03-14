#!/bin/bash
cp mongodb-org.repo /etc/yum.repos.d/
yum update
yum install mongodb-org -y
systemctl start mongod
systemctl enable mongod

#logs
#tail -f /var/log/mongodb/mongod.log