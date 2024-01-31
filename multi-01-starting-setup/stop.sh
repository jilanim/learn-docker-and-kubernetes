#!/bin/bash

#!/bin/bash

# Function to stop a container if it exists
stop_container() {
  local container_name=$1
  if docker ps -a --filter name="$container_name" -q | grep -q .; then
    docker stop "$container_name"
  fi
}

# Parse command line arguments
#while getopts "abfm" opt; do
# while [[ $# -gt 0 ]]; do
#   key="$1"
#   case $key in  
#     a) stop_all=true ;;
#     b) stop_backend=true ;;
#     f) stop_frontend=true ;;
#     m) stop_mongodb=true ;;
#     *) echo "Invalid option: -$OPTARG" >&2 ;;
#   esac
# done

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -m|--mongodb)
            stop_mongodb=true
            shift
            ;;
        -b|--backend)
            stop_backend=true
            shift
            ;;
        -f|--frontend)
            stop_frontend=true
            shift
            ;;
        -a|--all)
            stop_all=true            
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Stop MongoDB container if it exists
if [ "$stop_all" = true ] || [ "$stop_mongodb" = true ]; then
  stop_container "mongodb-container"
fi

# Stop backend container if it exists
if [ "$stop_all" = true ] || [ "$stop_backend" = true ]; then
  stop_container "backend-container"
fi

# Stop frontend container if it exists
if [ "$stop_all" = true ] || [ "$stop_frontend" = true ]; then
  stop_container "front-container"
fi
