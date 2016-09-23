FROM php:5.6-cli

MAINTAINER miroslav kubelik <koubel@seznam.cz>

RUN apt-get -y update

# git is necessary for pilulka php Composer based projects
RUN apt-get -y install zlib1g-dev \
    libicu-dev

RUN docker-php-ext-install zip \
    && docker-php-ext-install intl \
    && docker-php-ext-install calendar \
    && docker-php-ext-install sysvsem 

RUN apt-get -y install unrar-free \
    && pecl install rar \
    && docker-php-ext-enable rar

# setup Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

WORKDIR /usr/src/pharmdata

# for vim modeline: (do not edit)
# vim: set ts=4 sw=4 et:

