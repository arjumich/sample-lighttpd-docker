FROM sebp/lighttpd:1.4.57-r0

RUN apk update && apk upgrade && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl
RUN adduser --disabled-password --gecos '' --home "/home/lighttpduser" lighttpduser

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

#RUN mkdir /run/tmp
#RUN chown lighttpduser:lighttpduser /run
#RUN ls -l /run
#RUN cp -rp /run/lighttpd.pid /run/tmp/lighttpd.pid
#RUN php-fpm7 && ps
RUN mkdir -p /var/log/tmp/php7
RUN cp -rp /var/log/php7/. /var/log/tmp/php7/.
RUN ls -l /var/log/tmp/php7/
#RUN chown -R lighttpduser:lighttpduser /var/log/tmp/php7/ && chmod -R 777 /var/log/tmp/php7/
RUN chown -R lighttpduser:lighttpduser /var/log/php7/ && chmod -R 777 /var/log/php7/
RUN ls -l /var/log/tmp/php7/
RUN ls -l /var/log

#RUN chown lighttpd:lighttpd /etc/php7 &&  chmod 777 /etc/php7
#USER lighttpduser
#RUN php-fpm7 && ps
USER lighttpduser
#RUN ls -l /run/
CMD ["start.sh"]