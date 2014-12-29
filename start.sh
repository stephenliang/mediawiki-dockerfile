#!/bin/bash

# Chown volumes so that nginx can read/write
chown www-data:www-data /usr/share/nginx/html/images
chown www-data:www-data /usr/share/nginx/html/LocalSettings.php

service php5-fpm start;
nginx -g "daemon off;"
