#!/bin/bash

# this script makes the patches required to change stock openstreetmap-carto
# into ESDM style 

# the new styles must already exist for us to be able to update the patches against the base style files

diff -c ~/openstreetmap-carto/project.mml ~/openstreetmap-carto/esdm-uncontoured.mml >~/openstreetmap-carto/esdm/patch/esdm-uncontoured.patch

diff -c ~/openstreetmap-carto/esdm-uncontoured.mml ~/openstreetmap-carto/esdm-contoured.mml >~/openstreetmap-carto/esdm/patch/esdm-contoured.patch

diff -c ~/openstreetmap-carto/roads.mss ~/openstreetmap-carto/esdm/roads-OS.mss >~/openstreetmap-carto/esdm/patch/roads-OS.patch
diff -c ~/openstreetmap-carto/water.mss ~/openstreetmap-carto/esdm/water-OS.mss >~/openstreetmap-carto/esdm/patch/water-OS.patch
diff -c ~/openstreetmap-carto/fonts.mss ~/openstreetmap-carto/esdm/fonts.mss >~/openstreetmap-carto/esdm/patch/fonts.patch
diff -c ~/openstreetmap-carto/style.mss ~/openstreetmap-carto/esdm/style-OS.mss >~/openstreetmap-carto/esdm/patch/style-OS.patch
