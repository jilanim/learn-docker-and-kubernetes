# Export UID and GID

`export UID && export GID`

# Generate Laravel project in src/

```
rm -rf src/ && mkdir src
docker-compose run --rm composer-service create-project --prefer-dist laravel/laravel .
```

# Run only specific services with docker-compose up

docker-compose up -d server-service php-service mysql-service
