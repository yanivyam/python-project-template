#!/bin/sh

# Restores the MongoDB contents

MY_DIR=`dirname $0`
cd $MY_DIR

source ../settings.sh


COLLECTIONS=`ls ${MONGO_DATA}`

for f in ${COLLECTIONS}; do
    c=`basename $f .json`
    
    # import only collections with data, and avoid importing system indexes
    if [ $c != 'system.indexes' ]; then
        mongoimport --drop --db ${MONGO_DB_NAME} --collection $c --file ${MONGO_DATA}/${f}
    fi
done



