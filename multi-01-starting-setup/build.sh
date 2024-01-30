#!/bin/bash

# check if docker network "goals-net" exists and if not then create it
if [ -z $(docker network ls --filter name=goals-net -q) ]; then
  docker network create goals-net
fi

docker build -t goals-backend ./backend/
docker build -t goals-frontend ./frontend/
