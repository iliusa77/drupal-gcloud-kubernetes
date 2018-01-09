#!/bin/bash

for i in `docker ps | awk '{ print $1"|"$2 }' | grep -v CONTAINER `; do docker commit `echo $i | cut -d '|' -f1` `echo $i | cut -d '|' -f2`-`date +"%m%d%y_%H%M%S"`; done
docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASSWORD
docker push $SITE_DOCKER_IMAGE
docker push $DATABASE_DOCKER_IMAGE
