#!/bin/sh

#SCRIPT=`readlink -f "$0"`
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
BASEDIR=${SCRIPT_DIR}/..
ARCH=`uname`

error_msg()
{
  echo $1 1>&2
  exit 1
}


# Fail on platforms that can't calculate the script path using readlink -f
if [ -z ${BASEDIR} ]; then
  error_msg "Got empty BASEDIR - perhaps unsupported distribution?"
  exit 1
fi

cd ${BASEDIR}
# install required dependencies for building
if [ ! -d venv ]; then
  virtualenv venv || exit 1
fi
source ./venv/bin/activate || exit 1
pip install pybuilder || exit 1

# run build
exec pyb

