
FROM debian

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

# change default configuration file
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

# create a db for wordpress
COPY init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

CMD ["mysqld"]
