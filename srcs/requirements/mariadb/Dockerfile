FROM alpine:3.13.6

RUN apk update && \
	apk add mysql mysql-client gettext

RUN mkdir -p /run/mysqld

COPY tools/entrypoint.sh .
COPY tools/init_database.sql .
COPY tools/create_users.sql .
COPY conf/my.cnf .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD ["mysqld"]

EXPOSE 3306
