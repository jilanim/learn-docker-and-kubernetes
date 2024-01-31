FROM php:7.4-fpm-alpine

# for serving website from here
WORKDIR /var/www/html

# install php extensions
RUN docker-php-ext-install pdo pdo_mysql

# NO COMMAND HERE AND IT WILL USE THE DEFAULT COMMAND FROM THE BASE IMAGE WHICH INVOKES THE PHP INTERPRETER