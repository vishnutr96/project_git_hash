#!/bin/bash


echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
systemctl restart sshd.service

yum install httpd  php -y

cp -r /tmp/website/*  /var/www/html/
chown -R apache:apache /var/www/html/*

systemctl restart php-fpm httpd.service
systemctl enable php-fpm  httpd.service
