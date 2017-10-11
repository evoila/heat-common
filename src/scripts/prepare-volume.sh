#!/bin/bash

DEVICE=${DEVICE:-"/dev/vdb"}
MOUNTPOINT=${MOUNTPOINT:-/mnt}
FILESYSTEM_TYPE=${FILESYSTEM:-ext4}
FILESYSTEM_LABEL=${FILESYSTEM_LABEL:-volume}
FILESYSTEM_OPTIONS=${FILESYSTEM_OPTIONS:-""}

# Prepare file system 
mkfs.$FILESYSTEM_TYPE -L $FILESYSTEM_LABEL $FILESYSTEM_OPTIONS $DEVICE
FS_UUID=$(blkid | grep "$DEVICE" | awk '{ print $3 }' | cut -d "=" -f 2 | sed 's/"//g')

mkdir -p $MOUNTPOINT
mount $DEVICE $MOUNTPOINT

# Make mount persistent
cat <<EOF >> /etc/fstab
UUID=${FS_UUID} $MOUNTPOINT $FILESYSTEM_TYPE defaults,errors=remount-ro 0 1
EOF
