#!/bin/sh

echo "Starting PHP-fpm service..."
php-fpm7

chmod a+w /dev/pts/0
echo "Starting lighttpd service..."
exec lighttpd -D -f /etc/lighttpd/lighttpd.conf