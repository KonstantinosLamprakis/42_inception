FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

COPY default /etc/nginx/sites-available/.

COPY script.sh .
RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]