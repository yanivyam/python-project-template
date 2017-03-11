#!/bin/sh

# Backups up the MongoDB contents as JSNO files

MY_DIR=`dirname $0`
cd $MY_DIR

source ../settings.sh


COLLECTIONS=`mongo --quiet $MONGO_DB_NAME --eval 'db.getCollectionNames()' | sed 's/,/ /g'`

for c in ${COLLECTIONS}; do
    mongoexport -d ${MONGO_DB_NAME} -c $c > ${MONGO_DATA}/$c.json
done
