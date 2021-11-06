#!/bin/sh

set -e

envsubst < my.cnf > /etc/my.cnf
if [ ! -d "$MYSQL_VOLUME_DIR/mysql" ]; then # check whether the DB is initialized
	mysql_install_db --datadir=$MYSQL_VOLUME_DIR

	mysqld &
	mysqld_pid=$!

	until mysqladmin ping >/dev/null 2>&1; do
	  echo -n "."; sleep 0.2
	done

	envsubst < init_database.sql | mysql
	envsubst '${DB_NAME}' < create_users.sql | mysql

	mysqladmin shutdown
	wait $mysqld_pid
fi

exec "$@"
