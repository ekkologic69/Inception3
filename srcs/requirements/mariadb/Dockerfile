FROM debian:buster

# Install packages
RUN apt-get update && apt-get install  mariadb-server -y

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./tools/script.sh /


RUN chmod +x /script.sh


#  RUN ./script.sh
CMD [ "/script.sh"]




