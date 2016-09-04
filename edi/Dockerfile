FROM php:5.6-cli

MAINTAINER miroslav kubelik <koubel@seznam.cz>

# necessary packages for php extensions and Composer
RUN apt-get update \
    && apt-get install -y zlib1g-dev

# php extension necessary for Composer
RUN docker-php-ext-install -j$(nproc) zip

# setup Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN mkdir /usr/src/edi
WORKDIR /usr/src/edi

# for vim modeline: (do not edit)
# vim: set ts=4 sw=4 et:
