#!/bin/bash -xe

echo "${REPOSITORY_PUBLICKEY}" > /etc/pki/rpm-gpg/RPM-GPG-KEY-${REPOSITORY_NAME}
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-${REPOSITORY_NAME}
echo "${REPOSITORY_ENTRY}" > /etc/yum.repos.d/${REPOSITORY_NAME}.repo
yum makecache
exit
