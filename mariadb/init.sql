-- Create database if not exists
CREATE DATABASE IF NOT EXISTS `docker-php`;

-- Create user with privileges
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'secret';

-- Grant privileges
GRANT ALL PRIVILEGES ON `docker-php`.* TO 'user'@'%';

-- Set root password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'secret';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;
