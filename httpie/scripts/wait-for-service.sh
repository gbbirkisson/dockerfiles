#!/bin/ash

set -e

if [ "${WAIT_SERVICE}" != '' -a "${WAIT_PORT}" != '' ]; then
    while ! nc -z ${WAIT_SERVICE} ${WAIT_PORT}; do
        echo -e "\e[33mWaiting for ${WAIT_SERVICE}:${WAIT_PORT} to start ...\e[39m";
        sleep 5;
    done
    echo -e "\e[32mService ${WAIT_SERVICE}:${WAIT_PORT} up!\e[39m"
fi

if [ "${WAIT_ENDPOINT}" != '' ]; then
    until http --ignore-stdin --check-status ${WAIT_ENDPOINT} > /dev/null 2>&1; do
        echo -e "\e[33mWaiting for ${WAIT_ENDPOINT} to return 200 ...\e[39m"
        sleep 5;
    done
    echo -e "\e[32mEndpoint ${WAIT_ENDPOINT} up!\e[39m"
fi