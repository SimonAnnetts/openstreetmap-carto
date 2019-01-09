#!/bin/bash

# this script makes the patches required to change stock openstreetmap-carto
# into ESDM style 

# the new styles must already exist for us to be able to update the patches against the base style files

cd ~/openstreetmap-carto/

diff -c project.mml esdm-uncontoured.mml >esdm/patch/esdm-uncontoured.patch

diff -c esdm-uncontoured.mml esdm-contoured.mml >esdm/patch/esdm-contoured.patch

diff -c roads.mss esdm/roads-OS.mss >esdm/patch/roads-OS.patch
diff -c water.mss esdm/water-OS.mss >esdm/patch/water-OS.patch
diff -c fonts.mss esdm/fonts.mss >esdm/patch/fonts.patch
diff -c style.mss esdm/style-OS.mss >esdm/patch/style-OS.patch
