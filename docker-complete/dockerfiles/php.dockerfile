FROM php:8.3-fpm-alpine

# for serving website from here
WORKDIR /var/www/html

COPY src .

# install php extensions
RUN docker-php-ext-install pdo pdo_mysql

# give user www-data permission to write to the directory
RUN chown -R www-data:www-data /var/www/html

# NO COMMAND HERE AND IT WILL USE THE DEFAULT COMMAND FROM THE BASE IMAGE WHICH INVOKES THE PHP INTERPRETER