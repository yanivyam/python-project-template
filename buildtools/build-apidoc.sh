#!/bin/sh

#SCRIPT=`readlink -f "$0"`
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
BASEDIR=${SCRIPT_DIR}/..

SRC=${BASEDIR}/myproject
DOCS_DIR=${BASEDIR}/docs/sphinx
sphinx-apidoc -f -o $DOCS_DIR $SRC


