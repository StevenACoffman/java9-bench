#!/bin/bash

REPOSITORY=stevenacoffman/java9-bench
docker_tags=( latest no-compress )

for tag in "${docker_tags[@]}"
do
    if [ "$tag" == "latest" ]
    then
        docker build -f "Dockerfile" -t "stevenacoffman/java9-bench:${tag}" .
    else
        docker build -f "Dockerfile.${tag}" -t "stevenacoffman/java9-bench:${tag}" .
    fi
done
