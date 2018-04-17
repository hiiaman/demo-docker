#!/bin/sh
# startup.sh

systemctl enable nginx.service &
systemctl enable php-fpm.service &
chkconfig --levels 235 php-fpm on
