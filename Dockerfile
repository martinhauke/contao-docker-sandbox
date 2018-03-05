FROM php:7-apache

LABEL version="0.1.0" \
	description="Docker Image for a contao installation" \
	maintainer="Martin Hauke <hauke@september-werbeagentur.de"


# install the PHP extensions we need
RUN set -ex; apt-get update; \
	apt-get install -y \
		libicu-dev \
		libjpeg-dev \
		libpng-dev \
		libgmp-dev \
		libmcrypt-dev \
		libxml2-dev \
		mysql-common \
		libbz2-dev \
		zlib1g-dev \
		vim; \
	apt-get clean; \
	rm -rf /var/lib/apt/lists/*; \
	ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/; \
	export CFLAGS="-I/usr/src/php" ;\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install pdo pdo_mysql gd mysqli gmp bcmath zip xmlwriter xmlreader iconv bz2 mbstring soap intl; \
    pecl install mcrypt-1.0.1 \
        && docker-php-ext-enable mcrypt

RUN a2enmod rewrite expires

ENV VERSION 3.5.30

RUN set -ex; curl -o contao.tar.gz -fSL "https://download.contao.org/${VERSION}/tar"

RUN set -ex; tar -xzf contao.tar.gz -C /var/www/html; \
	rm contao.tar.gz; \
	chown -R www-data:www-data /var/www/html; \
	mv /var/www/html/contao-${VERSION}/* /var/www/html/; \
	mv /var/www/html/contao-${VERSION}/.e* /var/www/html/; \
	mv /var/www/html/contao-${VERSION}/.g* /var/www/html/; \
	mv /var/www/html/contao-${VERSION}/.h* /var/www/html/; \
	rmdir /var/www/html/contao-${VERSION}/; \
	cp -p /var/www/html/.htaccess.default .htaccess;

VOLUME /var/www/html


CMD ["apache2-foreground"]
