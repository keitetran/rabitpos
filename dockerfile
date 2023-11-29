## Docker image parameter
ARG TZ
ARG PHP_VERSION


## Get php docker image
FROM php:${PHP_VERSION}


## Update packages
RUN apt-get update


## パッケージを追加
RUN apt-get install -y --no-install-recommends \
    wget \
    libmcrypt-dev \
    vim 


## Set timezone
RUN echo ${TZ} > /etc/timezone


## Install FuelPHP's depending extensions PHP拡張
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && sync 
RUN install-php-extensions fileinfo
RUN install-php-extensions mysqli
RUN install-php-extensions mbstring
RUN install-php-extensions mcrypt
RUN install-php-extensions pdo
RUN install-php-extensions pdo_mysql
RUN install-php-extensions memcached


## Cleanup 不要なファイルを削除
RUN rm -rf /var/lib/apt/lists/*


# ## Install composer
# ADD ./composer/composer.phar /usr/local/bin/composer
# RUN chmod +x /usr/local/bin/composer

# ADD ./rabitpos/composer.json /usr/local/bin/composer
# RUN composer install --prefer-dist


## Enable mod_rewrite FuelPHPはmod_rewriteが必要
RUN a2enmod rewrite 



## Restart Apache, auto start with boot
RUN service apache2 restart


## Create init file on boot
RUN echo "#!/bin/bash"  >> /etc/init.d/app-init.sh
RUN chmod +x /etc/init.d/app-init.sh
