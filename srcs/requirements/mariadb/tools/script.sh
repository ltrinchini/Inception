#!/bin/bash

PATH_TO_CHECK_FILE="./var/lib/mysql/.db_create"

config_mysql()
{
	service mysql start;
	mariadb -e "CREATE DATABASE ${MYSQL_DB_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"  2>/dev/null;
	mariadb -e "GRANT ALL ON ${MYSQL_DB_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';";
	mariadb -e "FLUSH PRIVILEGES;";
	mariadb -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}');";
	sleep 1;
	touch ${PATH_TO_CHECK_FILE};
	service mysql stop;
}

main()
{
	if [[ ! -f ${PATH_TO_CHECK_FILE} ]]; then
		config_mysql;
	fi
	mysqld_safe;
}

main
