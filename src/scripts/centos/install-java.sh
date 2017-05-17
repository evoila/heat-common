#!/bin/bash

curl -L -k \
  -o /tmp/jdk-8u121-linux-x64.rpm \
  -H "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie"\
  http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm

yum localinstall -y /tmp/jdk-8u121-linux-x64.rpm
