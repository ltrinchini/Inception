FROM debian:buster

RUN apt update &&\
	apt upgrade -y &&\
	apt install -y \
	nginx \
	openssl \
	dumb-init &&\
	mkdir -p /etc/nginx/ssl &&\
	mkdir -p /var/www/php &&\
	rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/ltrinchi.42.fr.key \
	-out /etc/nginx/ssl/ltrinchi.42.fr.crt \
	-subj "/C=FR/ST=Rhone/L=Lyon/O=42_School, Inc./OU=IT/CN=ltrinchi.42.fr,"

COPY ./conf/ltrinchi.42.fr.conf /etc/nginx/sites-available/default
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["/usr/bin/dumb-init", "--"]	

CMD [ "nginx", "-g", "daemon off;" ]
