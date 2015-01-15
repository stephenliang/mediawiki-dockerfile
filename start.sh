#!/bin/bash

# Chown volumes so that nginx can read/write
chown www-data:www-data /usr/share/nginx/html/images
chown www-data:www-data /usr/share/nginx/html/LocalSettings.php
chown -R www-data:www-data /tmp/extensions/
cp -r /tmp/extensions/* /usr/share/nginx/html/extensions/

service php5-fpm start;
nginx -g "daemon off;"
