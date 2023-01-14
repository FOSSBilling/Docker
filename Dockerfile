FROM php:8.1-apache
LABEL version="0.2.8"

RUN apt update; \
apt install -y --no-install-recommends wget unzip;
    
# Configure Apache
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

# Download from Github
RUN set -eux; \
	version="0.2.8"; \
	wget https://github.com/FOSSBilling/FOSSBilling/releases/download/$version/FOSSBilling.zip; \
	unzip FOSSBilling.zip -d /var/www/html
# Copy FOSSBilling to the container and change the owner of the file

RUN chown -R www-data:www-data /var/www/html
RUM rm /var/www/html/FOSSBilling.zip

# Install the PDO extension
RUN docker-php-ext-configure pdo_mysql \
		&& docker-php-ext-install -j$(nproc) pdo_mysql

CMD ["start-apache"]

