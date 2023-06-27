FROM debian:buster

RUN apt-get update -y 

RUN apt-get install php7.3 php7.3-fpm php7.3-mysql mariadb-client -y

RUN apt-get install curl -y

COPY ./conf/wp-config.php /
COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD [ "/script.sh" ]
