#!/bin/bash

/usr/sbin/service php7.2-fpm start
/usr/sbin/service nginx start
chown -R www-data:www-data /app
/bin/bash