FROM php:7-apache

LABEL version="0.1.0" \
      description="Docker Image for a contao installation" \
      maintainer="Martin Hauke <hauke@september-werbeagentur.de"


# install the libraries we need
RUN apt-get update
RUN apt-get install -y libicu-dev
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libgmp-dev
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y mysql-common
RUN apt-get install -y libbz2-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y vim
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/

# install the PHP extensions we need
RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install pdo pdo_mysql gd mysqli gmp bcmath zip xmlwriter xmlreader iconv bz2 mbstring soap intl
RUN pecl install mcrypt-1.0.1 \
    && docker-php-ext-enable mcrypt

RUN a2enmod rewrite expires

ENV VERSION 3.5.30

RUN curl -o contao.tar.gz -fSL "https://download.contao.org/${VERSION}/tar"

RUN tar -xzf contao.tar.gz -C /var/www/html
RUN rm contao.tar.gz
RUN chown -R www-data:www-data /var/www/html
RUN mv /var/www/html/contao-${VERSION}/* /var/www/html/
RUN mv /var/www/html/contao-${VERSION}/.e* /var/www/html/
RUN mv /var/www/html/contao-${VERSION}/.g* /var/www/html/
RUN mv /var/www/html/contao-${VERSION}/.h* /var/www/html/
RUN rmdir /var/www/html/contao-${VERSION}/
RUN cp -p /var/www/html/.htaccess.default .htacce

VOLUME /var/www/html


CMD ["apache2-foreground"]
