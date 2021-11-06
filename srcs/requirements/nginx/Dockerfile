FROM alpine:3.13.6

RUN apk update && \
	mkdir -p /run/nginx/ && \
	apk add nginx openssl gettext

COPY tools/entrypoint.sh .
COPY conf/nginx.conf .

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443
