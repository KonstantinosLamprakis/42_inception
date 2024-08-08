FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

COPY script.sh ./script.sh
RUN chmod +x script.sh

RUN mkdir /run/mysqld

CMD [ "./script.sh" ]
