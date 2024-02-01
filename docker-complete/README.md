# Export UID and GID

`export UID && export GID`

# Generate Laravel project in src/

```
rm -rf src/ && mkdir src
docker-compose run --rm composer-service create-project --prefer-dist laravel/laravel .
```

# Run only specific services with docker-compose up

```
docker-compose up -d server-service php-service mysql-service

# loads other services via dependency declarations
docker-compose up -d server-service
```

# enforce rebuild with docker-compose up to ensure any changes are picked up in dockerfiles

```
docker-compose up -d --build server-service
```

# run artisan (for data migration task)

```
# will some data to the database and check if the database setup works
docker-compose run --rm artisan-service migrate
```
