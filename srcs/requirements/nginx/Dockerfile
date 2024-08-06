
# TODO:
# 	- create conf script
# 	- replace klamprak.42.fr with env variable

FROM debian

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

# create a self-signed certification
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
	/etc/nginx/ssl/inception.key -subj "/C=MO/ST=KH/L=KH/O=42/OU=42/CN=klamprak.42.fr"

# copy configuration file from host to container
COPY ./nginx.conf /etc/nginx/nginx.conf

# create the wordpress directory
RUN mkdir -p /var/www/wordpress

# change the owner of the wordpress directory to www-data
RUN chown -R www-data:www-data /var/www/wordpress

# daemon off: means run it in forground, not in background, otherwise docker will terminate the container
# because it will thought its finished its job
CMD ["nginx", "-g", "daemon off;"]
