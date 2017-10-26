FROM alpine:latest
MAINTAINER John Diegor <john.diegor@gmail.com>

ENV PHP_VERSION="7.1.9-r0" \
    APACHE_VERSION="2.4.27-r1" \
    OPENSSL_VERSION="1.0.2k-r0" 
    # COMPOSER_VERSION="1.4.2" \
    # COMPOSER_CHECKSUM="38bb2a696df65a47f6dfa22907e76c3210731530f51dc70f8e104d8b64e9ff2a40b18ea01f3948664fb7595d0e0c92c18dce1efaed6d1d57f05c28fa76f9966f composer.phar"

# Install modules and updates
RUN apk update \
    && apk --no-cache add \
        openssl=="${OPENSSL_VERSION}" \
        apache2=="${APACHE_VERSION}" \
        apache2-ssl \
        apache2-http2
        
# Install PHP from community
RUN apk --no-cache --repository http://dl-4.alpinelinux.org/alpine/3.6/community add \
    php7=="${PHP_VERSION}" \
    php7-apache2 \
    php7-bcmath \
    php7-bz2 \
    php7-calendar \
    php7-common \
    php7-ctype \
    php7-curl \
    php7-dev \
    php7-dom \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-memcached \
    php7-mysqlnd \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-pdo_sqlite \
    php7-phar \
    php7-session \
    php7-sockets \
    php7-xml \
    php7-simplexml \
    php7-xmlreader

RUN apk add --update bash
RUN apk add --update vim
RUN apk add openrc --no-cache
RUN rm /var/cache/apk/*

# Run required config / setup for apache
# Ensure apache can create pid file
RUN mkdir /run/apache2

# Fix group
RUN sed -i -e 's/Group apache/Group www-data/g' /etc/apache2/httpd.conf
    
# Fix ssl module
RUN sed -i -e 's/LoadModule ssl_module lib\/apache2\/mod_ssl.so/LoadModule ssl_module modules\/mod_ssl.so/g' /etc/apache2/conf.d/ssl.conf
RUN sed -i -e 's/LoadModule socache_shmcb_module lib\/apache2\/mod_socache_shmcb.so/LoadModule socache_shmcb_module modules\/mod_socache_shmcb.so/g' /etc/apache2/conf.d/ssl.conf
    
# Enable modules
RUN sed -i -e 's/#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/g' /etc/apache2/httpd.conf
RUN sed -i -e 's/#LoadModule expires_module modules\/mod_expires.so/LoadModule expires_module modules\/mod_expires.so/g' /etc/apache2/httpd.conf

RUN sed -i -e 's/AllowOverride None/AllowOverride All/g' /etc/apache2/httpd.conf
    
# Change document root
RUN sed -i -e 's/\/var\/www\/localhost\/htdocs/\/var\/www/g' /etc/apache2/httpd.conf
RUN sed -i -e 's/\/var\/www\/localhost\/htdocs/\/var\/www/g' /etc/apache2/conf.d/ssl.conf

# Allow for custom apache configs
RUN mkdir /etc/apache2/conf.d/custom \
    && echo '' >> /etc/apache2/httpd.conf \
    && echo 'IncludeOptional /etc/apache2/conf.d/custom/*.conf' >> /etc/apache2/httpd.conf
    
# Fix modules
RUN sed -i -e 's/ServerRoot \/var\/www/ServerRoot \/etc\/apache2/g' /etc/apache2/httpd.conf \
    && mv /var/www/modules /etc/apache2/modules \
    && mv /var/www/run /etc/apache2/run \
    && mv /var/www/logs /etc/apache2/logs
    
# Install composer
# RUN wget https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar \
#     && echo "${COMPOSER_CHECKSUM}" > composerchecksum.txt \
#     && sha512sum -c composerchecksum.txt \
#     && rm composerchecksum.txt \
#     && mv composer.phar /usr/bin/composer \
#     && chmod +x /usr/bin/composer


WORKDIR /var/www

# Export http and https
EXPOSE 80 443

# Run apache in foreground
CMD /usr/sbin/httpd -D FOREGROUND