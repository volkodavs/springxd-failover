#!/bin/bash
set -e

cp -rf /tmp/kfConfig/node$KAFKA_ID/server.properties /opt/kafka/config/server.properties

#while true; do echo hello; sleep 1; done

exec "$@"
