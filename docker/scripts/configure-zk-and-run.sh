#!/bin/bash -e
# Slight rework of https://github.com/bobrik/docker-zookeeper/blob/master/run.sh

if [ -f "/etc/zookeeper/conf/zoo.cfg" ]; then
    echo "zookeeper config found"
else
    if [ -z "${ZK_CONFIG}" ]; then
        echo "zookeeper config not found and ZK_CONFIG not provided:"
        echo "  - mount config file at /etc/zookeeper/conf/zoo.cfg"
        echo "  - specify ZK_CONFIG env variable"
        exit 1
    fi

    echo "dataDir=/var/lib/zookeeper" > "/etc/zookeeper/conf/zoo.cfg"

    for line in $(echo "${ZK_CONFIG}" | tr "," "\n"); do
        echo "$line" >> "/etc/zookeeper/conf/zoo.cfg"
    done
fi


if [ -e "/var/lib/zookeeper/myid" ]; then
    echo "zookeeper node id found"
else
    if [ -z "${ZK_ID}" ]; then
        echo "zookeeper node id not found and ZK_ID not provided:"
        echo "  - mount id file at /var/lib/zookeeper/myid"
        echo "  - specify ZK_ID env variable"
        exit 1
    fi

    echo "${ZK_ID}" > "/var/lib/zookeeper/myid"
fi

exec "$@"
