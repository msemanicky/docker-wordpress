#!/bin/bash
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db
fi	

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

	/usr/bin/mysqld_safe &
	sleep 3

	mysql -e"UPDATE mysql.user SET Password=PASSWORD('${DB_ROOT_PASSWORD}') WHERE User='root';"
	mysql -e"CREATE DATABASE $DB_NAME;" 
	mysql -e"CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';" 
	mysql -e"GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'localhost' WITH GRANT OPTION;" 
	mysql -e"CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" 
	mysql -e"GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' WITH GRANT OPTION;" 
	mysql -e"FLUSH PRIVILEGES;" 

	mysqladmin -uroot -p${DB_ROOT_PASSWORD} shutdown
fi

exec "$@"