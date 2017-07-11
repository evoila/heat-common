#!/bin/bash -x

STORE_PASS=${STORE_PASS:-changeit}
CERTIFICATE="${CERTIFICATE}"

JRE_ROOT="/usr/java/jdk1.8.0_131/jre"
KEYTOOL_CMD="$JRE_ROOT/bin/keytool"
KEYSTORE="$JRE_ROOT/lib/security/cacerts"
TMP_FILE="/tmp/certificate"

echo "$CERTIFICATE" > $TMP_FILE
OUTPUT=$($KEYTOOL_CMD -importcert -keystore $KEYSTORE -storepass "$STORE_PASS" -file $TMP_FILE -noprompt)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
  exit 0
fi

if echo "$OUTPUT" | grep "already exists"; then
  exit 0
else
  exit $EXIT_CODE
fi  
