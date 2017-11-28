#!/bin/bash
set -eo pipefail

sed -i.bak -e "s/('DB_NAME', 'database_name_here')/('DB_NAME', '$DB_NAME')/g" /var/www/wordpress/wp-config.php
sed -i.bak -e "s/('DB_USER', 'username_here')/('DB_USER', '$DB_USER')/g" /var/www/wordpress/wp-config.php
sed -i.bak -e "s/('DB_PASSWORD', 'password_here')/('DB_PASSWORD', '$DB_PASSWORD')/g" /var/www/wordpress/wp-config.php
sed -i.bak -e "s/('DB_HOST', 'localhost')/('DB_HOST', '$DB_HOST')/g" /var/www/wordpress/wp-config.php

service php7.0-fpm start &

exec "$@"