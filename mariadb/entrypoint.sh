#!/bin/sh
set -e

MYSQL_DATA_DIR="/var/lib/mysql"

# Make sure permissions are correct
mkdir -p /run/mysqld /var/log/mysql /var/lib/mysql
chown -R mysql:mysql /run/mysqld /var/log/mysql /var/lib/mysql

sed -i "s/port = 3306/port = 3306/g" /etc/my.cnf.d/mariadb-server.cnf

echo "bind-address = 0.0.0.0" >> /etc/my.cnf.d/mariadb-server.cnf
echo "skip-networking" >> /etc/my.cnf.d/mariadb-server.cnf
#debug
echo "MYSQL_USER: $MYSQL_USER"
echo "MYSQL_PASSWORD: $MYSQL_PASSWORD"
echo "MYSQL_DATABASE: $MYSQL_DATABASE"
echo "MYSQL_ROOT_PASSWORD: $MYSQL_ROOT_PASSWORD"

# Initialize database if it's empty
if [ ! -d "$MYSQL_DATA_DIR/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadbd --initialize-insecure --user=mysql --datadir="$MYSQL_DATA_DIR"
fi


echo "Starting MariaDB server..."

exec mariadbd --user=mysql --console
