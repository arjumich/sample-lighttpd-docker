#!/bin/sh

#### KLOVERCLOUD CHANGES (START) ####
#### Persisting the lighttpd configuration files ####

if [ -d "/etc/lighttpd" ]
then
	echo '[INFO] Persistant volume mounted'
	fileCount=$(find /etc/lighttpd -type f | wc -l)
	if [ $fileCount -gt 3 ]
         then
         echo "[INFO] lighttpd config file exists"
	else
		echo "[INFO] Copying lighttpd config files to /etc/lighttpd/";
		cp -r /etc/lighttpd-tmp/. /etc/lighttpd/.
		echo "[INFO] All lighttpd config files copied to /etc/lighttpd/";
	fi
else
	echo '[ERROR] /etc/lighttpd/ doesnt exists'
fi

#### KLOVERCLOUD CHANGES (END) ####


echo "Starting PHP-fpm service..."
php-fpm7

chmod a+w /dev/pts/0
echo "Starting lighttpd service..."
exec lighttpd -D -f /etc/lighttpd/lighttpd.conf