#!/bin/bash
mysql_install_db

mysqld --user=mysql &
sleep 10

echo "Creating database: ${MYSQL_DATABASE}"
echo "Creating user: ${MYSQL_USER}"

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "Database initialization complete!"

mysqladmin -u root shutdown
exec mysqld --user=mysql
