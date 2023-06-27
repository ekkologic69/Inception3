FROM debian:buster

# Install packages
RUN     apt-get update && apt-get install -y 
RUN     apt install nginx -y 
RUN     apt install openssl -y 

COPY ./tools/script.sh /
RUN chmod +x /script.sh

CMD ["/script.sh"]