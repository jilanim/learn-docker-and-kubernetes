#!/bin/bash

# run mongodb container
#docker run --name mongodb-container --rm -d --network goals-net mongo

# use volume to persist data, and set environment variables for root user
docker run --name mongodb-container --rm -d --network goals-net \
-v mongodata:/data/db \
-e MONGO_INITDB_ROOT_USERNAME=adminuser \
-e MONGO_INITDB_ROOT_PASSWORD=secret \
mongo


# run backend container
docker run --name backend-container --rm -d -p 80:80 --network goals-net goals-backend

# run frontend container
docker run --name front-container --rm -p 3000:3000 -it goals-frontend
