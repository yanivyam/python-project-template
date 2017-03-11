#!/bin/sh

#SCRIPT=`readlink -f "$0"`
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
BASEDIR=${SCRIPT_DIR}/..

DOCS_SRC_DIR=${BASEDIR}/docs/sphinx
DOCS_BUILD_DIR=${BASEDIR}/docs/_build

# build API docs
$BASEDIR/buildtools/build-apidoc.sh
# build docs
sphinx-build -b html $DOCS_SRC_DIR $DOCS_BUILD_DIR


