#!/bin/bash
sleep 10
#---------------------------------------------------ping mariadb---------------------------------------------------#
# check if mariadb container is up and running
ping_mariadb_container() {
    nc -zv mariadb 3306 > /dev/null # ping the mariadb container
    return $? # return the exit status of the ping command
}
start_time=$(date +%s) # get the current time in seconds
end_time=$((start_time + 20)) # set the end time to 20 seconds after the start time
while [ $(date +%s) -lt $end_time ]; do # loop until the current time is greater than the end time
    ping_mariadb_container # Ping the MariaDB container
    if [ $? -eq 0 ]; then # Check if the ping was successful
        echo "[========MARIADB IS UP AND RUNNING========]"
        break # Exit the loop if MariaDB is up
    else
        echo "[========WAITING FOR MARIADB TO START...========]"
        sleep 1 # Wait for 1 second before trying again
    fi
done

if [ $(date +%s) -ge $end_time ]; then # check if the current time is greater than or equal to the end time
    echo "[========MARIADB IS NOT RESPONDING========]"
fi

cd /var/www/html

chown -R www-data:www-data /var/www/html/*

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root
./wp-cli.phar user create ${WP_USER_NAME} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PASS} --allow-root

exec php-fpm7.4 -F