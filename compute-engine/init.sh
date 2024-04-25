#!/bin/bash

sudo su
apt update 
apt install -y apache2
ls /var/www/html
echo "Hello World!"
echo "Hello World!" > /var/www/html/index.html
