#!/bin/bash

# this script applies patches to the stock openstreetmap-carto style to 
# produce the ESDM styles

cd ~/openstreetmap-carto/

cp -f roads.mss esdm/roads-OS.mss && \
patch -p0 -b -i esdm/patch/roads-OS.patch && \
cp -f water.mss esdm/water-OS.mss && \
patch -p0 -b -i esdm/patch/water-OS.patch && \
cp -f fonts.mss esdm/fonts.mss && \
patch -p0 -b -i esdm/patch/fonts.patch && \
cp -f style.mss esdm/style-OS.mss && \
patch -p0 -b -i esdm/patch/style-OS.patch && \
cp -f project.mml esdm-uncontoured.mml && \
patch -p0 -b -i esdm/patch/esdm-uncontoured.patch && \
cp -f esdm-uncontoured.mml esdm-contoured.mml && \
patch -p0 -b -i esdm/patch/esdm-contoured.patch && \
cp -f esdm-uncontoured.mml esdm-27700-uncontoured.mml && \
patch -p0 -b -i esdm/patch/esdm-27700-uncontoured.patch && \
cp -f esdm-contoured.mml esdm-27700-contoured.mml && \
patch -p0 -b -i esdm/patch/esdm-27700-contoured.patch && \
echo "Done!" && exit 0 || echo "Failed!!" && exit 1
