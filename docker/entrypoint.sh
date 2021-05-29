#!/bin/bash
set -e

printf "\n\033[37;44m---> Starting the SSH server.<---\033[0m\n"

service ssh start
service ssh status

exec "$@"
