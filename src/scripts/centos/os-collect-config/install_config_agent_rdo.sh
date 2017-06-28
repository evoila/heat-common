#!/bin/bash
set -eux

yum -y install python-zaqarclient python-oslo-log python-psutil os-collect-config os-apply-config os-refresh-config dib-utils
