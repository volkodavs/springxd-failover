#!/bin/bash
set -e


# while true; do echo hello; sleep 1; done

exec "$@" --httpPort $HTTP_PORT
