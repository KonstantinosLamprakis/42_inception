
# TODO: create conf file

FROM debian

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

# copy configuration file from host to container
COPY ./mdb-conf.sh /mdb-conf.sh

RUN chmod +x /mdb-conf.sh

# entrypoint command to run as a starting point
ENTRYPOINT ["./mdb-conf.sh"]
