#!/bin/bash
tar -xf /root/lnmp_soft.tar.gz -C /root
tar -xf /root/lnmp_soft/nginx-1.12.2.tar.gz -C /root
yum -y install gcc pcre-devel openssl-devel
useradd -s /sbin/nologin nginx
cd /root/nginx-1.12.2/
./configure --user=nginx --group=nginx --with-http_ssl_module --with-http_stub_status_module --with-stream
make && make install
nginx
ln -s /usr/local/nginx/sbin/nginx /sbin/
yum -y install mariadb mariadb-server mariadb-devel
yum -y install php php-mysql 
yum -y install /root/lnmp_soft/php-fpm-5.4.16-42.el7.x86_64.rpm
systemctl restart mariadb php-fpm

