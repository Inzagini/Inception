FROM php:8.1-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql mysqli

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html
