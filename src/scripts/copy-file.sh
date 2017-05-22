#!/bin/bash

BASE_DIR=${BASE_DIR}
FILENAME=${FILENAME}

OWNER=${OWNER:-root}
GROUP=${GROUP:-root}
PERMS=${PERMS:-664}

CONTENT=${CONTENT}

# Create base directory if not exists and set ownership and permissions
if [ ! -d $BASE_DIR ]; then
  mkdir -p $BASE_DIR
fi
chown $OWNER:$GROUP $BASE_DIR
chmod $PERMS $BASE_DIR

# Write file and set owner and permissions
cat <<EOF > $BASE_DIR/$FILENAME
$CONTENT
EOF
chown $OWNER:$GROUP ${BASE_DIR}/${FILENAME}
chmod $PERMS $BASE_DIR/$FILENAME
