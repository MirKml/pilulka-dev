FROM pilulka:php5.6-apache

MAINTAINER miroslav kubelik <koubel@seznam.cz>

ADD site.apache.conf /etc/apache2/sites-available/www.ipilulkask.loc.conf
RUN a2ensite www.ipilulkask.loc
RUN a2enmod rewrite

COPY php.ini /usr/local/etc/php
WORKDIR /var/www/ipilulka_sk

# for vim modeline: (do not edit)
# vim: set ts=4 sw=4 et:
