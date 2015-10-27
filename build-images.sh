#!/bin/bash -e

IMAGES=( debian-base zookeeper mesos mesos-master mesos-slave-host-docker marathon )

for image in "${IMAGES[@]}"; do
    docker build -t praekelt/$image -f docker/$image.dockerfile docker
done
