FROM debian:buster

RUN	apt update && apt \
	upgrade -y && \
	apt install -y \
	dumb-init \
	mariadb-client \
	mariadb-server &&\
	rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /home/script.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]	

CMD ["bash", "/home/script.sh"]
