FROM php:7.2
RUN apt-get update && \
    apt-get install -y apache2  && \
    pecl install mongodb && \
    docker-php-ext-enable mongodb