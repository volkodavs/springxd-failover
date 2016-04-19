#!/bin/bash
set -e



echo ********************************
echo Destroy all streams
./shell/bin/xd-shell --cmdfile /tmp/scripts/spring-shell-destroy

echo ********************************
echo Uploading/creating modules/stream
./shell/bin/xd-shell --cmdfile /tmp/scripts/spring-shell-create
echo ********************************

echo ********************************
echo Deploying stream
./shell/bin/xd-shell --cmdfile /tmp/scripts/spring-shell-deploy
echo ********************************

echo "BYE ;-)"
#while true; do echo Waiting; sleep 600; done
