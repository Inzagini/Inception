#!/bin/sh
set -e

MYSQL_DATA_DIR="/var/lib/mysql"

# Make sure permissions are correct
chown -R mysql:mysql "$MYSQL_DATA_DIR"

# Initialize database if empty
if [ ! -d "$MYSQL_DATA_DIR/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadbd --initialize-insecure --user=mysql --datadir="$MYSQL_DATA_DIR"

    echo "Setting up initial database and users..."
    mysqld --user=mysql --bootstrap <<-EOSQL
        FLUSH PRIVILEGES;
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
        CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
        CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
        GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
        FLUSH PRIVILEGES;
EOSQL
fi

echo "Starting MariaDB server..."
exec mariadbd --user=mysql --console
