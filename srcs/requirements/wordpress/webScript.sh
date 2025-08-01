#!/bin/bash
cd /var/www/html


if [ -f wp-config.php ]; then
	echo "WordPress is already configured. Skipping setup..."
else
	echo "WordPress not configured. Starting setup..."
	echo "Waiting for MariaDB to be ready..."
	for i in {1..6}; do
		if mysql -h mariadb -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -e "SELECT 1" >/dev/null 2>&1; then
			echo "MariaDB is ready!"
			break
		fi
		echo "Attempt $i: MariaDB not ready, waiting 5 seconds..."
		sleep 5
	done

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	./wp-cli.phar core download --allow-root
	./wp-cli.phar config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root
	./wp-cli.phar core install --url=${URL_DOMAIN} --title=inception --admin_user=${MYSQL_ROOT_USER} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=admin@admin.com --allow-root
	echo "Wordpress setup complete"
fi

php-fpm8.2 -F
