# parent image from which we build
FROM php:8.2-apache

# version corresponding to FOSSBilling
LABEL version="0.2.4"

# copy FOSSBilling from host to /var/www/html of image
COPY path-to-fossbilling/ /var/www/html
COPY path-to-fossbilling/config-sample.php /var/www/html/config.php
COPY path-to-fossbilling/htaccess.txt /var/www/html/.htaccess

# setup image for FOSSBilling
RUN apt update\
    && apt install -y --no-install-recommends libicu-dev cron\
    && docker-php-ext-install pdo_mysql\
    && sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf\
    && a2enmod rewrite\
    && chown -R www-data:www-data /var/www/html\
    && (crontab -l; echo "*/5 * * * * php /var/www/FOSSBilling/cron.php") | crontab\
    && php -dmemory_limit=1G
