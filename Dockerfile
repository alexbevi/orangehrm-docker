FROM php:5.6-apache

RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip

WORKDIR /var/www/html

ENV ORANGEHRM_VERSION 3.3.2

#Download source
RUN mkdir /var/www/html/site
RUN wget -c http://downloads.sourceforge.net/project/orangehrm/stable/3.3.2/orangehrm-3.3.2.zip -O ~/orangehrm-3.3.2.zip &&\
    unzip -o ~/orangehrm-3.3.2.zip -d /var/www/html/site && \
    rm ~/orangehrm-3.3.2.zip

RUN cd /var/www/html/site; bash fix_permissions.sh