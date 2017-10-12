#!/bin/bash -xe

echo "${REPOSITORY_PUBLICKEY}" | apt-key add -
echo ${REPOSITORY_ENTRY} > /etc/apt/sources.list.d/${REPOSITORY_NAME}.list
apt-get update
exit
