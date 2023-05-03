FROM debian:buster

WORKDIR /tmp

RUN	apt update &&\
	apt upgrade -y &&\
	apt install -y\
	php\
	php-mysql\
	php-fpm\
	dumb-init\
	wget &&\
	rm -rf /var/lib/apt/lists/* &&\
	service php7.3-fpm start

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp &&\
	rm -rf /var/lib/apt/lists/*

COPY ./conf/wp-config.php /tmp/wp-config.php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/script.sh /home/script.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]	

CMD [ "/bin/bash", "/home/script.sh" ]
