FROM php:7.2-apache
MAINTAINER John Lennon de Melo Fernandes <jlfernandes91@hotmail.com>
RUN apt-get update && \
    apt-get install vim libcurl4-openssl-dev pkg-config libssl-dev libgmp-dev -y && \
    pecl install mongodb && \
    docker-php-ext-install gmp && \
    docker-php-ext-enable mongodb gmp


EXPOSE 80

COPY vhost.conf /etc/apache2/sites-enabled/000-default.conf
COPY apache.conf /etc/apache2/apache.conf

RUN mkdir -p /var/www/html/app && \
    chown -R  www-data:www-data /var/www/html/app && \
    a2enmod rewrite
