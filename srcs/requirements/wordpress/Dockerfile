FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php php7.4-fpm curl php-mysqli

RUN apt-get install -y php-gd wget
RUN mkdir -p /var/www/html /run/php
RUN chown -R www-data:www-data /var/www/html
RUN chown -R www-data:www-data /run/php

COPY www.conf /etc/php/7.4/fpm/pool.d/.

COPY script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]
