export UID && export GID
rm -rf src/ && mkdir src
docker-compose run --rm composer-service create-project --prefer-dist laravel/laravel .
