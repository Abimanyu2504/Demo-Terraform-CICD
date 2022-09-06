#!/bin/bash

yum update -y
yum install -y http
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World - This is Terraform Project Session from $(hostname -f)" > /var/www/html/index.html
