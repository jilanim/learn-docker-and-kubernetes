#!/bin/bash

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -m|--mongodb)
            start_mongodb=true
            shift
            ;;
        -b|--backend)
            start_backend=true
            shift
            ;;
        -f|--frontend)
            start_frontend=true
            shift
            ;;
        -a|--all)
            start_mongodb=true
            start_backend=true
            start_frontend=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Start MongoDB container if specified
if [ "$start_mongodb" = true ]; then
    docker run --name mongodb-container --rm -d --network goals-net \
    -v mongodata:/data/db \
    -e MONGO_INITDB_ROOT_USERNAME=adminuser \
    -e MONGO_INITDB_ROOT_PASSWORD=secret \
    mongo
fi

# Start backend container if specified
# environment variables will override the ones in the Dockerfile
if [ "$start_backend" = true ]; then
    docker run --name backend-container --rm -d -p 80:80 --network goals-net \
    -v logs:/app/logs \
    -v $(pwd)/backend:/app \
    -v /app/node_modules \
    -e MONGODB_USERNAME=adminuser \
    -e MONGODB_PASSWORD=secret \
    goals-backend
fi

# Start frontend container if specified
# use the volume flag to bind mount the local source code into the container
if [ "$start_frontend" = true ]; then
    docker run --name front-container --rm -p 3000:3000 \
    -v $(pwd)/frontend/src:/app/src \
    -it goals-frontend
fi
