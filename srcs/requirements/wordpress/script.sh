#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root
./wp-cli.phar user create ${WP_USER_NAME} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PASS} --allow-root
php-fpm8.2 -F
