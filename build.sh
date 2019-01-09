#!/bin/bash

mkdir -p backups/esdm/ 2>/dev/null

exec > >(awk '{print strftime("%Y-%m-%d %H:%M:%S [1] "),$0; fflush();}')
exec 2> >(awk '{print strftime("%Y-%m-%d %H:%M:%S [2] "),$0; fflush();}' >&2)

starttime=$(date +%s)
startdate=$(date "+%Y-%m-%d_%H%M%S")

echo "Backing up existing files..."
for i in *.mml; do 
    cp -v ${i} backups/${i%.*}_${startdate}.mml
done
for i in *.xml; do 
    cp -v ${i} backups/${i%.*}_${startdate}.xml
done
for i in esdm/*.mss; do 
    cp -v ${i} backups/${i%.*}_${startdate}.mss
done

echo "Merging in upstream master..."
[ -z "$(git remote -v |grep upstream)" ] && git remote add upstream https://github.com/gravitystorm/openstreetmap-carto.git
git fetch upstream
#git checkout master
git merge upstream/master

echo "Patching source files..."
./esdm/patch/apply_patches.sh
[ $? != 0 ] && exit 1

echo "Building ESDM contoured Carto style..."
carto esdm-contoured.mml >esdm-contoured.xml
[ $? != 0 ] && exit 1

echo "Building ESDM uncontoured Carto style..."
carto esdm-uncontoured.mml >esdm-uncontoured.xml
[ $? != 0 ] && exit 1

echo "Building ESDM 27700 contoured Carto style..."
carto esdm-27700-contoured.mml >esdm-27700-contoured.xml
[ $? != 0 ] && exit 1

echo "Building ESDM 27700 uncontoured Carto style..."
carto esdm-27700-uncontoured.mml >esdm-27700-uncontoured.xml
[ $? != 0 ] && exit 1

echo "Building OSM default Carto style..."
carto project.mml >project.xml
[ $? != 0 ] && exit 1

endtime=$(date +%s)
echo "Done in $[${endtime}-${starttime}] seconds! All your Maps Belong to Us!"