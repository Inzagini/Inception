#!/bin/sh
set -e

MYSQL_DATA_DIR="/var/lib/mysql"

# Initialize database if empty
if [ ! -d "$MYSQL_DATA_DIR/mysql" ]; then
    echo "Initializing database..."
    mysql_install_db --user=mysql --ldata=$MYSQL_DATA_DIR

    # Start MariaDB temporarily
    mysqld --user=mysql --bootstrap <<EOF
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF
fi

echo "Starting MariaDB server..."
exec mariadbd "$@"
