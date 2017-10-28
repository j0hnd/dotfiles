FROM alpine:latest
MAINTAINER John Diegor <john.diegor@gmail.com>

ENV PHP_VERSION="7.1.9-r0"

# Install modules and updates
RUN apk update

# Install PHP from community
RUN apk --no-cache --repository http://dl-4.alpinelinux.org/alpine/3.6/community add \
    php7=="${PHP_VERSION}" \
    php7-apache2 \
    php7-common \
    php7-curl \
    php7-dev \
    php7-dom \
    php7-json \
    php7-gd \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqlnd \
    php7-pdo \
    php7-pdo_mysql \
    php7-session \
    php7-sockets \
    php7-xml \
    php7-simplexml
    
RUN apk add --update bash

RUN rm /var/cache/apk/*

RUN mkdir -p /var/www

WORKDIR /var/www

COPY . /var/www

VOLUME /var/www

CMD ["bash"]

# ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/bin/sh", "-c", "bash"]