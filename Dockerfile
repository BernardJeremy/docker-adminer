FROM php:5.6-apache
MAINTAINER Jeremy Bernard <jeremy@bernard.sh>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get clean

RUN apt-get install -y wget
RUN apt-get install -y --no-install-recommends libbz2-dev zlib1g-dev libpcre3-dev

# Install PHP Extensions

RUN docker-php-ext-install bz2 mbstring mysqli zip

RUN wget https://www.adminer.org/latest-en.php
RUN mv -T latest-en.php /var/www/html/index.php

COPY .htaccess /var/www/html/.htaccess

COPY docker-entrypoint.sh /home/entrypoint.sh

ENTRYPOINT ["/home/entrypoint.sh"]
