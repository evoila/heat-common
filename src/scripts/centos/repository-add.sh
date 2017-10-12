#!/bin/bash -x

export REPOSITORY_ENTRY=${REPOSITORY_ENTRY}
export REPOSITORY_PUBLICKEY=${REPOSITORY_PUBLICKEY}
export REPOSITORY_NAME=${REPOSITORY_NAME}

echo "${REPOSITORY_PUBLICKEY}" > /etc/pki/rpm-gpg/RPM-GPG-KEY-${REPOSITORY_NAME}
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-${REPOSITORY_NAME}
echo "${REPOSITORY_ENTRY}" > /etc/yum.repos.d/${REPOSITORY_NAME}.repo
yum makecache
exit
