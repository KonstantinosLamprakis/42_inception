FROM debian

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php8.2-fpm curl php-mysqli

COPY www.conf /etc/php/8.2/fpm/pool.d/.

COPY script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]