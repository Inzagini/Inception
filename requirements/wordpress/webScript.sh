#!/bin/bash
cd /var/www/html

echo "Waiting for MariaDB to be ready..."
for i in {1..30}; do
	if mysql -h mariadb -u wpuser -p password -e "SELECT 1" >/dev/null 2>&1; then
		echo "MariaDB is ready!"
		break
	fi
	echo "Attempt $i: MariaDB not ready, waiting 5 seconds..."
	sleep 5
done

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpressDB --dbuser=wpuser --dbpass=secret --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root


php-fpm8.2 -F
