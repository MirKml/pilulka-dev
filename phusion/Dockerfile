FROM phusion/baseimage

MAINTAINER miroslav kubelik <koubel@seznam.cz>

# Use baseimage-docker's init system
# for executing final container
CMD ["/sbin/my_init"]

RUN apt-get -y update

# apache, git
# git is necessary for ipilulka php Composer based projects
RUN apt-get -y install apache2 git

# PHP5
# necessary to add repository with special locale
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get -y update \
	&& apt-get install -y php5.6-cli php5.6-mbstring php5.6-dom \
		php5.6-zip php5.6-curl php5.6-gd php5.6-zmq php5.6-curl \
		php5.6-soap php5.6-mysql \
		libapache2-mod-php5.6
# for pecl extensions
RUN apt-get install -y php5.6-dev php5.6-xml
#RUN pecl install rar

# setup apache
RUN a2enmod php5.6 rewrite

ADD ipilulka.cz.apache /etc/apache2/sites-available/ipilulka.loc.conf
ADD pma.apache /etc/apache2/sites-available/pma.ipilulka.loc.conf

RUN a2ensite ipilulka.loc pma.ipilulka.loc

# setup phpMyAdmin
RUN curl -sS https://files.phpmyadmin.net/phpMyAdmin/4.6.4/phpMyAdmin-4.6.4-english.tar.gz \
			| tar xvz -C /var/www \
	&& mv /var/www/phpMyAdmin-4.6.4-english /var/www/phpMyAdmin
ADD pma.config.inc.php /var/www/phpMyAdmin/config.inc.php

# php Composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer

# Manually set the apache environment variables in order to get apache to work immediately.
RUN echo www-data > /etc/container_environment/APACHE_RUN_USER
RUN echo www-data > /etc/container_environment/APACHE_RUN_GROUP
RUN echo /var/log/apache2 > /etc/container_environment/APACHE_LOG_DIR
RUN echo /var/lock/apache2 > /etc/container_environment/APACHE_LOCK_DIR
RUN echo /var/run/apache2.pid > /etc/container_environment/APACHE_PID_FILE

# Runit service files
RUN mkdir /etc/service/apache2
ADD apache2-start.sh /etc/service/apache2/run
RUN chmod +x /etc/service/apache2/run

EXPOSE 80

# Clean up
#RUN apt-get clean \
#	&& rm -rf /tmp/* /var/tmp/* \
#	&& rm -rf /var/lib/apt/lists/*
