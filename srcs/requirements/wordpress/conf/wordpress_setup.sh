#!/bin/bash

# Step 1: Download WP CLI and move it to the respective folder
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

#2 Step 2: Create WP install dir and edit its permissions
mkdir -p /var/www/wordpress

cd /var/www/wordpress

chmod -R 755 /var/www/wordpress/

chown -R www-data:www-data /var/www/wordpress

#3 Step 3: Ping Maria DB to check it's up and running
ping_mariadb_container() {
    nc -zv mariadb 3306 > /dev/null 2>&1
}

end_time=$(($(date +%s) + 20))
while [ $(date +%s) -lt $end_time ]; do
    if ping_mariadb_container; then
        echo "** MariaDB is UP **"
        break
    else
        echo "** Waiting for MariaDB ... **"
        sleep 1
    fi
done

if [ $(date +%s) -ge $end_time ]; then
    echo "** MariaDB is NOT RESPONDING **"
fi

#4 Step 4: Install WP
if [ ! -f "/var/www/wordpress/index.php" ]; then
	wp core download --allow-root
	wp core config --dbhost=mariadb:3306 --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PWD" --allow-root
	wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --allow-root
	wp user create "$WP_USERNAME" "$WP_USER_EMAIL" --user_pass="$WP_USER_PWD" --role="$WP_USER_ROLE" --allow-root
	wp option update comment_whitelist 0 --allow-root
fi

#5 Step 5: Config PHP
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F
