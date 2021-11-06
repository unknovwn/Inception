#!/bin/sh

set -e

if [ ! -f "$WORDPRESS_VOLUME_DIR/index.php" ]; then # check whether the wordpress is installed
	tar xf wordpress-5.8.1.tar.gz -C /var/www/ --strip-components=1
	envsubst '${DB_NAME} ${DB_USER} ${DB_PASSWORD} ${AUTH_KEY} ${SECURE_AUTH_KEY} ${LOGGED_IN_KEY} ${NONCE_KEY} ${AUTH_SALT} ${SECURE_AUTH_SALT} ${LOGGED_IN_KEY}} ${NONCE_SALT}' < wp-config.php > ${WORDPRESS_VOLUME_DIR}/wp-config.php
fi

exec "$@"
