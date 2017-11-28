FROM ubuntu:xenial

RUN \
	apt-get update && \
	apt-get install -y wget nginx php7.0-fpm php7.0-mysql

ADD wordpress /etc/nginx/sites-available

RUN \
	rm /etc/nginx/sites-enabled/default && \
	ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/worpress && \
	sed -i.bak -e 's/;cgi\.fix_pathinfo=1/cgi.fix_pathinfo=0/;' /etc/php/7.0/fpm/php.ini && \
	mkdir -p /var/www && \
	wget -P /var/www/ https://wordpress.org/latest.tar.gz && \
	tar -zxf /var/www/latest.tar.gz -C /var/www/ && \
	cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php && \
	chown -R www-data /var/www && \
	chgrp -R www-data /var/www


COPY docker-entrypoint.sh /usr/local/bin

RUN \
	ln -s usr/local/bin/docker-entrypoint.sh && \
	chmod +x docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]