#!/bin/bash

OUTPUT_FILE="/tmp/jdk-linux-x64.rpm"

curl -L -k\
 -o $OUTPUT_FILE\ 
 -H "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie"\
 "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"


yum localinstall -y $OUTPUT_FILE
