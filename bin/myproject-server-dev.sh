#!/bin/bash

PRJ_HOME=/home/vagrant
VENVDIR=$PRJ_HOME/.virtualenvs/venv
BINDIR=$PRJ_HOME/bin

cd $BINDIR
source $VENVDIR/bin/activate
$BINDIR/myproject-server
