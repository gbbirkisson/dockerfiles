#!/bin/sh

set -e

CONFIG_PATH=/data/options.json

HOST="$(jq --raw-output '.mqtt_host' $CONFIG_PATH)"
PORT="$(jq --raw-output '.mqtt_port' $CONFIG_PATH)"
USER="$(jq --raw-output '.mqtt_user' $CONFIG_PATH)"
PASS="$(jq --raw-output '.mqtt_pass' $CONFIG_PATH)"
VERBOSE="$(jq --raw-output '.verbose' $CONFIG_PATH)"

set -- xcomfortd -h ${HOST} -p ${PORT} -u ${USER} -P ${PASS}

if [ ${VERBOSE} = "true" ]; then
    set -- "$@" -v
fi

echo "Starting xcomfortd gateway"

exec "$@"