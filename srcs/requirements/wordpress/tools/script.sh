#!/bin/bash

PATH_TO_WORDPRESS=/var/www/wordpress/
FILE_CHECK=/var/www/wordpress/.check
WORDPRESS_TAR=/tmp/latest.tar.gz
URL_WORDPRESS=https://wordpress.org/latest.tar.gz

download_wordpress()
{
	echo "Download Wordpress";
	if [[ ! -f "${WORDPRESS_TAR}" ]]; then
		wget "${URL_WORDPRESS}" -q -P /tmp  || rm -f ${WORDPRESS_TAR};
	fi
	echo "Download is complete!";
}

init_wordpress()
{
	mkdir -p /var/www/php;
	if [[ ! -f "${PATH_TO_WORDPRESS}index.php" ]]; then
		echo "Init Wordpress";
	 	download_wordpress;
		tar -xf "${WORDPRESS_TAR}" -C /var/www/ || echo "Error with tar";
	fi
}

init_wp_init_file()
{
	if ! cmp -s /tmp/wp-config.php /var/www/wordpress/wp-config.php; then
		echo "Init Wordpress File";
		cp /tmp/wp-config.php /var/www/wordpress/wp-config.php;
	fi
}

configure_admin_wordpress()
{
	echo "Configure admin user";
	if wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --path=${PATH_TO_WORDPRESS} --allow-root 2>/dev/null; then
		touch "${FILE_CHECK}";
	fi

}

configure_user_wordpress()
{
	echo "Configure user";
	wp user create ${WP_USER} ${WP_USER_EMAIL} --role="${WP_USER_ROLE}" --user_pass=${WP_USER_PASSWORD} --path=${PATH_TO_WORDPRESS} --allow-root 2>/dev/null || echo "Already done!";
}

keep_alive_container()
{
	echo "Let's go!!"
	php-fpm7.3 --nodaemonize;
}

main()
{
	init_wordpress;
	init_wp_init_file;
	if [[ ! -f "${FILE_CHECK}" ]]; then
		configure_admin_wordpress;
		configure_user_wordpress;
	fi
	keep_alive_container;
}

main
