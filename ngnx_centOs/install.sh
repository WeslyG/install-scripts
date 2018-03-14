#!/bin/bash
cp nginx.repo /etc/yum.repos.d/
yum update
yum install nginx -y
systemctl start nginx
systemctl enable nginx
