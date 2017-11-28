# Pull base image
FROM ubuntu:xenial

# Install MariaDB.
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0xcbcb082a1bb943db && \
  echo "deb http://mariadb.mirror.iweb.com/repo/10.0/ubuntu xenial main" > /etc/apt/sources.list.d/mariadb.list && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated mariadb-server && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf 


VOLUME ["/var/lib/mysql"]

COPY docker-entrypoint.sh /usr/local/bin

RUN \
	ln -s usr/local/bin/docker-entrypoint.sh && \
	chmod +x docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/mysqld"]
