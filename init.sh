#!/bin/bash

export $(cat ./srcs/.env)

LOGIN="ltrinchi"
PATH_TO_FOLDER_VOLUME="/Users/${LOGIN}/data"
PATH_TO_HOSTS_FILE=/etc/hosts
IP_ADDRESS_TO_WEBSITE="127.0.0.1	${DOMAIN_NAME}"
WP_CONFIG_FILE="./srcs/requirements/wordpress/conf/wp-config.php"
WP_CONFIG_FILE_ENV="./srcs/requirements/wordpress/conf/wp-config-env.php"
ENV_FILE="./srcs/.env"

add_host_to_file()
{
	if [[ -f "${PATH_TO_HOSTS_FILE}" ]]; then
		grep "${IP_ADDRESS_TO_WEBSITE}" "${PATH_TO_HOSTS_FILE}" > /dev/null
		if [[ $? != 0 ]]; then
			echo "${IP_ADDRESS_TO_WEBSITE}" >> ${PATH_TO_HOSTS_FILE};
		fi
	else
		echo "${PATH_TO_HOSTS_FILE} doesn't exist"
	fi
}

create_wp_config_file()
{
	if [[ (! -f ${WP_CONFIG_FILE}) || (${WP_CONFIG_FILE} -ot ${ENV_FILE}) ]]; then
		envsubst < ${WP_CONFIG_FILE_ENV} > ${WP_CONFIG_FILE};
	fi
}

main()
{
	create_wp_config_file;
	add_host_to_file;
}

main
