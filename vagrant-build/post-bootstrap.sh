#!/bin/sh
#
# This shell script is being run after Salt configured the VM

MY_DIR=`dirname $0`
cd $MY_DIR

source ./settings.sh

# Restore data into MongoDB:
#./mongo/mongo_restore.sh

# Install requirements
pip install -r /home/vagrant/myproject/requirements.txt

