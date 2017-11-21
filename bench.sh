#!/bin/bash
# On mac you need milisecond precision so use gdate:
# brew install coreutils

if hash gdate 2>/dev/null
then
  DATE=gdate
else
  DATE=date
fi

if hash docker 2>/dev/null
then
  echo "Pulling docker tags"
else
  echo "You do not have docker installed. Aborting."
  exit 1
fi

docker_tags=( latest no-compress )

# Omit this pull if you built custom images
for tag in "${docker_tags[@]}"
do
    docker pull "stevenacoffman/java9-bench:${tag}"
done

for i in 0 1 2 3 4 5 6 7 8 9
do
    echo "*** Running Benchmark iteration ${i} ***"
    for tag in "${docker_tags[@]}"
    do
        ts=$($DATE +%s%N)
        docker run "stevenacoffman/java9-bench:${tag}" > /dev/null
        tt=$((($($DATE +%s%N) - $ts)/1000000))
        echo "    Run Docker Image tagged ${tag} - "${tt} "milliseconds"
    done
done
