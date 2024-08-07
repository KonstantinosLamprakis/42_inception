#!/bin/sh

openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
/etc/nginx/ssl/inception.key -subj "/C=DE/ST=BW/L=Heilbronn/O=42/OU='${DB_USER}'/CN='${WP_DOMAIN}'"

sed -i 's|WP_DOMAIN|'${WP_DOMAIN}'|g' /etc/nginx/sites-available/default

nginx -g "daemon off;"
