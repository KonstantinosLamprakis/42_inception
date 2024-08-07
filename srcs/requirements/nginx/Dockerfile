FROM debian

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
/etc/nginx/ssl/inception.key -subj "/C=MO/ST=KH/L=KH/O=42/OU=42/CN=klamprak.42.fr"

COPY default /etc/nginx/sites-available/.

# daemon off: means run it in forground, not in background, otherwise docker will terminate the container
# because it will thought its finished its job
CMD ["nginx", "-g", "daemon off;"]
