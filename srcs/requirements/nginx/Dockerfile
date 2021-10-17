FROM alpine:3.13.6

RUN apk update && \
	mkdir -p /run/nginx/ && \
	apk add nginx libc6-compat openssl

RUN openssl req -newkey rsa:4096 -x509 -days 9999 -nodes -out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/private/nginx.key -subj "/C=RU/ST=Moscow/L=Moscow/O=42/CN=dima"

COPY tools/entrypoint.sh .
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443
