FROM phusion/baseimage:latest

MAINTAINER Cliff Richard Anfone <anfone.cliff@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive
RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

RUN apt-get update && apt-get install -y  wget

# Install WP

WORKDIR /var/www

RUN wget http://wordpress.org/latest.tar.gz
RUN tar xfz latest.tar.gz

# Clean 

RUN rm -f latest.tar.gz

RUN chown -R 1000:1000 /var/www/wordpress

WORKDIR /var/www/wordpress
