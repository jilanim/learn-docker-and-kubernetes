FROM composer:latest

WORKDIR /var/www/html

# ignore switch is used to ignore warnings/errors if some dependencies are missing
ENTRYPOINT [ "composer" , "--ignore-platform-reqs" ]