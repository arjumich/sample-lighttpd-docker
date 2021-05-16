FROM sebp/lighttpd:1.4.57-r0

RUN apk update && apk upgrade && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl
RUN adduser --disabled-password --gecos '' --home "/home/lighttpduser" lighttpduser

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

RUN chown -R lighttpduser:lighttpduser /var/log/php7/ && chmod -R 777 /var/log/php7/
EXPOSE 8080

USER lighttpduser

CMD ["start.sh"]