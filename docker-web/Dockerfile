# Pull hệ đề hành centos7 từ docker hub.
FROM centos:centos7
#làm màu ˆˆ.
MAINTAINER Nguyen Truong An <mr.nguyentruongan@gmail.com>

# Cài đặt các thư viện cần thiết để chạy project.
RUN yum install -y epel-release \
        http://rpms.remirepo.net/enterprise/remi-release-7.rpm  \
        yum-utils && \
    yum-config-manager --enable remi-php72 && \
    yum install -y \
        php-bcmath \
        php-fpm \
        php-cli \
        php-mysqlnd \
        php-mssql \
        php-xml \
        php-pgsql \
        php-gd \
        php-mcrypt \
        php-ldap \
        php-imap \
        php-soap \
        php-tidy \
        php-mbstring \
        php-opcache \
        php-pdo \
        php-pecl-apcu \
        php-pecl-apcu-bc \
        php-pecl-geoip \
        php-pecl-igbinary \
        php-pecl-imagick \
        php-pecl-redis \
        unzip \
        mysql \
        nginx \
        curl \
        git \
        vim \ && \
    yum --enablerepo=epel install -y fcgi && \
    yum clean all
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
COPY web_demo.conf /etc/nginx/conf.d/web_demo.conf
ADD startup.sh /usr/bin/startup.sh
RUN chmod +x /usr/bin/startup.sh

#Vì container centos gặp lỗi ko thể run systemctl nên cần phải có quyền.
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

#Câu lệnh hệ thống centos để bật nginx và php-fpm.
RUN systemctl enable nginx.service
RUN systemctl enable php-fpm.service
RUN chkconfig --levels 235 php-fpm on

#Nhằm khi log vô môi trường docker thì vô cd đến thư mục làm việc.
WORKDIR "/var/www/html/web"
EXPOSE 80
