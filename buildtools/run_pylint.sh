#!/bin/sh

#SCRIPT=`readlink -f "$0"`
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
BASEDIR=${SCRIPT_DIR}/..

pylint --rcfile=${BASEDIR}/buildtools/pylintrc ${BASEDIR}/myproject
