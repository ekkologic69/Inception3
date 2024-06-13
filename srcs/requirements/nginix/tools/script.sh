#!/bin/bash


openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=BG/O=1337/OU=student/CN=[maboulho.1337.ma]"

echo "

    server {
     listen 443 ssl;
     listen [::]:443 ssl;
    
      server_name www.maboulho.42.fr maboulho.42.fr;
    
     ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
     ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/conf.d/test.conf


    echo '

        ssl_protocols TLSv1.3;

        index index.html index.htm index.nginx-debian.html index.php;
        root /var/www/html/;

        location ~ [^/]\.php(/|$) {
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
} ' >> /etc/nginx/conf.d/test.conf

nginx -g "daemon off;"