#!/usr/bin/env bash

if [ $# -ne 4 ]; then
    echo "Usage: $0 <AWS_ACCESS_KEY_ID> <AWS_SECRET_ACCESS_KEY> <AWS_DEFAULT_REGION> <PEM_FILE_NAME>"
    exit 1
fi

echo "Running large cluster!"
docker run -v `pwd`/mnt:/mnt --env AWS_ACCESS_KEY_ID=$1 --env AWS_SECRET_ACCESS_KEY=$2 --env AWS_DEFAULT_REGION=$3 --env PEM_FILE_NAME=$4 -it newman/anisble /bin/bash -c "cd /lc-ansible && git pull && cp -f /mnt/all /lc-ansible/group_vars && /lc-ansible/docker/docker-deploy-lc.sh"