# base image for pilulka.cz web based projects
FROM php:5.6-apache

MAINTAINER miroslav kubelik <koubel@seznam.cz>

RUN apt-get -y update

# git is necessary for pilulka php Composer based projects
RUN apt-get -y install git

RUN apt-get install -y \
    libmcrypt-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libedit-dev \
    libicu-dev \
    libssl-dev

RUN docker-php-ext-install -j$(nproc) mcrypt \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include --with-freetype-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) soap \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) pcntl \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-install -j$(nproc) calendar \
    && docker-php-ext-install -j$(nproc) xmlrpc \
    && docker-php-ext-install -j$(nproc) sysvsem

RUN apt-get -y install libzmq-dev \
    && pecl install zmq-1.1.3 \
    && docker-php-ext-enable zmq \
    && pecl install memcache \
    && docker-php-ext-enable memcache \
    && pecl install redis-2.2.8 \
    && docker-php-ext-enable redis \
    && pecl install mongo \
    && docker-php-ext-enable mongo \
    && pecl install rar \
    && docker-php-ext-enable rar

# setup Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# clean for keep up small image
RUN docker-php-source delete \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /tmp/* /var/tmp/*

# for vim modeline: (do not edit)
# vim: set ts=4 sw=4 et:

