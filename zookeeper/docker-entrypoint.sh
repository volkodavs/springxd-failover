#!/bin/bash
set -e

echo $ZOOKEEPER_ID > /var/lib/zookeeper/myid
cp /tmp/zkconfig/node$ZOOKEEPER_ID/zoo.cfg /opt/zookeeper-${ZOOKEEPER_VERSION}/conf

exec "$@"
