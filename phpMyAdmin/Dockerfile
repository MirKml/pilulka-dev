FROM pilulka:php5.6-apache

MAINTAINER miroslav kubelik <koubel@seznam.cz>

ADD site.apache.conf /etc/apache2/sites-available/pma.ipilulka.loc.conf
RUN a2ensite pma.ipilulka.loc

# setup phpMyAdmin
RUN curl -sS https://files.phpmyadmin.net/phpMyAdmin/4.6.4/phpMyAdmin-4.6.4-english.tar.gz \
			| tar xvz -C /var/www \
	&& mv /var/www/phpMyAdmin-4.6.4-english /var/www/phpMyAdmin
ADD config.inc.php /var/www/phpMyAdmin/config.inc.php

# for vim modeline: (do not edit)
# vim: set ts=4 sw=4 et
