#!/bin/bash
cd /var/www/html

# if [ ! -f wp-cli.phar ]; then
# 	echo "wp-cli.phar not found, downloading..."
# 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# 	chmod +x wp-cli.phar
# else
# 	echo "wp-cli.phar is already downloaded"
# fi

# if [ -f wp-config.php ] && ./wp-cli.phar core is-installed --allow-root; then
# 	echo "WordPress is already set up."
# else
# 	echo "Setting up WordPress..."
# 	./wp-cli.phar core download --allow-root
# 	./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
# 	./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root
# fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root


php-fpm8.2 -F
