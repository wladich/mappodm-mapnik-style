#!/bin/bash
set -e
BASE=`dirname $0`
$BASE/map.mml.sh $1
carto $BASE/map.mml > $BASE/mappodm.xml
