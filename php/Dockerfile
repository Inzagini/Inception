FROM php:8.2.28-fpm

RUN docker-php-ext-install pdo pdo_mysql mysqli

# FROM debian:trixie

# RUN apt-get update && apt-get install -y \
# 	wget \
# 	curl \
# 	bash \
# 	php8.4 \
# 	php8.4-cgi \
# 	php8.4-mysql \
# 	php8.4-fpm \
# 	php8.4-pdo \
# 	php8.4-gd php-cli \
# 	php8.4-mbstring \
# 	redis \
# 	php-redis \
# 	&& rm -rf /var/lib/apt/lists/*\

# COPY ./php/www.conf /etc/php/8.4/fpm/pool.d

# RUN mkdir -p /run/php /var/www/html

# RUN mkdir -p /var/log/php && chown www-data:www-data /var/log/php

# RUN useradd -m -s /bin/bash -g www-data www && \
#     chown -R www:www-data /var/www/html && \
#     chmod -R 755 /var/www/html

# WORKDIR /var/www/html

# EXPOSE 9000

# CMD ["/usr/sbin/php-fpm8.4", "-F"]
