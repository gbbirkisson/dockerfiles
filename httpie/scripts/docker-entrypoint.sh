#!/bin/ash

set -e

/scripts/wait-for-service.sh

http --ignore-stdin "$@"