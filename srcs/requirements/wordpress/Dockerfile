FROM alpine:3.13.6

RUN apk update && \
	apk add \
		php7 php7-mysqli php7-zlib \
		php7-curl php7-mbstring php7-json \
		php7-session php7-fpm gettext

RUN wget https://wordpress.org/wordpress-5.8.1.tar.gz

COPY tools/entrypoint.sh .
COPY conf/www.conf etc/php7/php-fpm.d/
COPY conf/wp-config.php .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD ["php-fpm7", "--nodaemonize", "--allow-to-run-as-root"]

EXPOSE 9000
