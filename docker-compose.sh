#!/bin/sh

Green='\033[0;32m'
Yellow='\033[0;33m'
NC='\033[0m' # No Color

servicesName=(
    'service-discovery' 
    'gateway'
)

for name in "${servicesName[@]}"
do
    DOCKER_IMAGE_ID=$(docker images -aq docker-local-setup_${name})
    if [[ ! -z "${DOCKER_IMAGE_ID}" ]]; then

        LIVE_CONTAINER_ID=$(docker ps -a | grep `docker images | grep ${DOCKER_IMAGE_ID} | awk '{print $1":"$2}'` | awk '{print $1}')
        if [[ ! -z "${LIVE_CONTAINER_ID}" ]]; then
            printf "${Green}Removing existing container for ${Yellow}${name}${Green} with image id: ${Yellow}${DOCKER_IMAGE_ID}${NC}\n"
            docker rm -f "${LIVE_CONTAINER_ID}"
        fi
   
        printf "${Green}Removing existing docker image for ${Yellow}${name}${Green} with id: ${Yellow}${DOCKER_IMAGE_ID}${NC}\n"
        docker rmi "${DOCKER_IMAGE_ID}"
    fi

    echo "${Green}Building ${Yellow}${name}${NC}"
    cd "${name}"
    ./gradlew clean build
    cd ..
done 


echo "Starting Docker Compose"
docker-compose up --build service-discovery gateway