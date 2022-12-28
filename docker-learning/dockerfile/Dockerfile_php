FROM php:8.0-apache
MAINTAINER anhbn3@gmail.com

WORKDIR /var/www/html/
COPY /php/src/* /var/www/html/
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get install -y apt-utils && apt-get upgrade -y && apt-get install vim -y && apt-get install net-tools -y && apt-get install telnet -y

EXPOSE 80
