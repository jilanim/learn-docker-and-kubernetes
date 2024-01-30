#!/bin/bash

# stop mongodb container if it exists
if docker ps -a --filter name=mongodb-container -q | grep -q .; then
  docker stop mongodb-container
fi

# stop backend container if it exists
if docker ps -a --filter name=backend-container -q | grep -q .; then
  docker stop backend-container
fi

# stop frontend container if it exists
if docker ps -a --filter name=front-container -q | grep -q .; then
  docker stop front-container
fi