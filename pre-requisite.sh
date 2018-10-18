#!/bin/bash

# For Centos/RHEL

sudo yum install gcc openssl-devel bzip2-devel make sqlite-devel -y
cd /tmp/
curl -o /tmp/Python-3.5.6.tgz  https://www.python.org/ftp/python/3.5.6/Python-3.5.6.tgz
sudo tar xvf /tmp/Python-3.5.6.tgz
cd /tmp/Python-3.5.6/
./configure;make;make install
pip3 install django
