#!/bin/bash
set -e
BASE=`dirname $0`
$BASE/map.mml.sh
carto $BASE/map.mml.sh > $BASE/mappodm.xml
