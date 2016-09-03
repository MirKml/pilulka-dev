FROM pilulka:php5.6-apache

MAINTAINER miroslav kubelik <koubel@seznam.cz>

ADD site.apache.conf /etc/apache2/sites-available/www.ipilulka.loc.conf
RUN a2ensite www.ipilulka.loc

RUN mkdir /var/www/ipilulka_cz
WORKDIR /var/www/ipilulka_cz

# for vim modeline: (do not edit)
# vim: set ts=4 sw=4 et
