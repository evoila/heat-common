#!/bin/bash -x

export REPOSITORY_ENTRY=${REPOSITORY_ENTRY}
export REPOSITORY_PUBLICKEY=${REPOSITORY_PUBLICKEY}}
export REPOSITORY_NAME=${REPOSITORY_NAME}

echo "${REPOSITORY_PUBLICKEY}" | apt-key add -
echo ${REPOSITORY_ENTRY} > /etc/apt/sources.list.d/${REPOSITORY_NAME}.list
apt-get update
exit
