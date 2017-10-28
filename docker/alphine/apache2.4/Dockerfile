FROM alpine:latest
MAINTAINER John Diegor <john.diegor@gmail.com>

ENV APACHE_VERSION="2.4.27-r1"

# Install modules and updates
RUN apk update
RUN apk --no-cache add \
  apache2=="${APACHE_VERSION}" \
  apache2-http2

RUN apk add --update bash
RUN apk add --update vim
RUN apk add openrc --no-cache
RUN rm /var/cache/apk/*

# Run required config / setup for apache
# Ensure apache can create pid file
RUN mkdir /run/apache2

# Fix group
RUN sed -i -e 's/Group apache/Group www-data/g' /etc/apache2/httpd.conf

# Enable modules
RUN sed -i -e 's/#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/g' /etc/apache2/httpd.conf
RUN sed -i -e 's/#LoadModule expires_module modules\/mod_expires.so/LoadModule expires_module modules\/mod_expires.so/g' /etc/apache2/httpd.conf

RUN sed -i -e 's/AllowOverride None/AllowOverride All/g' /etc/apache2/httpd.conf

# Change document root
RUN sed -i -e 's/\/var\/www\/localhost\/htdocs/\/var\/www/g' /etc/apache2/httpd.conf

# Allow for custom apache configs
RUN mkdir /etc/apache2/conf.d/custom \
    && echo '' >> /etc/apache2/httpd.conf \
    && echo 'ServerName "localhost"' >> /etc/apache2/httpd.conf \
    && echo 'IncludeOptional /etc/apache2/conf.d/custom/*.conf' >> /etc/apache2/httpd.conf

# Fix modules
RUN sed -i -e 's/ServerRoot \/var\/www/ServerRoot \/etc\/apache2/g' /etc/apache2/httpd.conf \
    && mv /var/www/modules /etc/apache2/modules \
    && mv /var/www/run /etc/apache2/run \
    && mv /var/www/logs /etc/apache2/logs

WORKDIR /var/www

# Export http
EXPOSE 80

# Run apache in foreground
CMD /usr/sbin/httpd -D FOREGROUND
