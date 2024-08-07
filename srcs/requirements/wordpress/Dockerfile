
# TODO: create conf file

FROM debian

RUN apt-get update && apt-get upgrade -y

# php-fpm =  FastCGI Process Manager, takes request from nginx, execute php and return the respose
RUN apt-get install -y php-fpm curl php-mysqli
# RUN apt-get install -y curl php php7.4-fpm php-mysql mariadb-client netcat

# copy configuration script from host to container
# COPY ./wp_conf.sh /

# RUN  chmod +x wp_conf.sh

# ENTRYPOINT ["./wp_conf.sh"]

COPY www.conf /etc/php/8.2/fpm/pool.d/.

COPY script.sh .

RUN chmod +x script.sh

# -F in order to run in Foreground and docker not terminate the container
# CMD ["php-fpm8.2", "-F"]
CMD ["./script.sh"]