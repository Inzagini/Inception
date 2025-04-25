FROM alpine:3.21

RUN apk update && apk add --no-cache \
	php84 \
	php84-fpm \
	php84-mysqli \
	php84-pdo \
	php84-pdo_mysql \
	php84-json \
	php84-mbstring \
	php84-xml \
	php84-session \
	php84-curl \
	php84-gd \
	php84-zip \
	php84-openssl \
	php84-tokenizer \
	php84-common \
	php84-cli \
	tzdata \
	curl \
	shadow && \
	ln -s /usr/bin/php84 /usr/bin/php && \
	ln -s /usr/sbin/php-fpm84 /usr/sbin/php-fpm \
	&& rm -rf /var/cache/apk/*

COPY ./php/www.conf /etc/php84/php-fpm.d/www.conf

WORKDIR /var/www/html

RUN adduser -D -g 'www' www && \
    chown -R www:www /var/www/html && \
    chmod -R 755 /var/www/html


EXPOSE 9000

CMD ["php-fpm84", "-F"]
