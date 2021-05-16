# Lighttpd App
#####
### For local Testing

**Build**
```sh
docker build -t klovercloud/lighttpd:latest .
```
**Run**
```sh
docker run --rm -t --read-only --name test-lighttpd --tmpfs=/tmp -v /home/arjun/Docker-vol/lighttpd-vol/php-log:/var/log/php7 -v /home/arjun/random_stuff/lighttpd-docker:/var/www/localhost/htdocs -p 8080:8080 klovercloud/lighttpd:latest
```
### Notes
- changed default /run/lighttpd.pid file location to /tmp/lighttpd.pid
- php error log file is mounted and saved locally.
- using php through php_fastcgi (php 7.4)
- main server configuration file here is the lighttpd.conf file.
- The default config file simply serves files from /var/www/localhost/htdocs. Sample index file is there for testing. 
- default listening port is 8080