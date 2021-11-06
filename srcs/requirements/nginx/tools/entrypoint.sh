#!/bin/sh

set -e

envsubst '${WORDPRESS_VOLUME_DIR} ${SSL_CERTIFICATE} ${SSL_CERTIFICATE_KEY}' < nginx.conf > /etc/nginx/conf.d/default.conf

if [ ! -f $SSL_CERTIFICATE ]; then # if certificate is not yet created
	openssl req -newkey rsa:4096 -x509 -days 9999 -nodes -out $SSL_CERTIFICATE -keyout $SSL_CERTIFICATE_KEY -subj "/C=RU/ST=Moscow/L=Moscow/O=42/CN=Inception"
fi

exec "$@"
