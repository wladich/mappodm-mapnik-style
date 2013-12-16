#!/bin/bash

BASE=`dirname $0`

. $BASE/db.conf

cat << EOF | python -c "import yaml; import json; import sys; print json.dumps(yaml.load(sys.stdin.read()), indent=4)" > $BASE/map.mml

srs: "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over"
Stylesheet:
    - style.mss
    - relief.mss
    - roads.mss
    - land.mss
    - rivers.mss
    - pois.mss
    - swamps.mss
  
Layer:
############### Vegetation ######################
-
    name: forest
    class: landcover
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='forest') AS t"
-
    name: sparse
    class: landcover
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='sparse') AS t"
-
    name: felling
    class: landcover
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='felling') AS t"
-
    name: felling_overgrown
    class: landcover
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='felling_overgrown') AS t"
################# Relief #########################
-   
    name: contours
    Datasource: $ds 
        table: "(SELECT way, elevation, coalesce(\"deprecated:contour-width\", 'nul') as width FROM planet_osm_line WHERE relief='contour') AS t"
-   
    name: contours-general
    Datasource: $ds 
        table: "(SELECT st_simplify(way, 100) as way, elevation FROM planet_osm_line WHERE relief='contour' AND \"deprecated:contour-width\"='major') AS t"
-   
    name: contour-hatches
    Datasource: $ds 
        table: "(SELECT way, coalesce(\"deprecated:contour-width\", 'nul') as width FROM planet_osm_line WHERE relief='hatch') AS t"
-
    name: cliff
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_line WHERE relief='cliff') AS t"
-   
    name: ravine
    Datasource: $ds 
        table: "(SELECT way FROM planet_osm_line WHERE relief='ravine') AS t"
        

-
    name: passability
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_line WHERE passability IS NOT NULL) AS t"
    

################## Built up areas ######################
-
    name: urban
    class: builtup landcover
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='urban') AS t"
-
    name: rural
    class: builtup landcover
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='rural') AS t"
-
    name: cottage
    class: builtup landcover
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='cottage') AS t"
-
    name: restricted
    class: builtup landcover
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='restricted') AS t"
-
    name: cemetry
    class: builtup landcover
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='cemetry') AS t"




#################### Rivers #######################
-
    name: river
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_line WHERE river IS NOT NULL) AS t"
############## Swamps #######################
-   
    name: swamp
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_polygon WHERE swamp IS NOT NULL) AS t"
################# Roads #######################
-   
    name: railway
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='railway') AS t"
-   
    name: gasline
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='gasline') AS t"
-   
    name: powerline
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='powerline') AS t"
-   
    name: powerline_major
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='powerline_major') AS t"
-   
    name: abandoned-road
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='abandoned') AS t"
-   
    name: cutting-wide
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='cutting_wide') AS t"
-   
    name: trench
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='trench') AS t"
-   
    name: wall
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='wall') AS t"
-   
    name: cutting
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='cutting') AS t"
-   
    name: path
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='path') AS t"
-   
    name: dirt-roads-drive
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='dirt' AND drive IS NOT NULL) AS t"
-   
    name: dirt-roads
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='dirt' AND drive IS NULL) AS t"
-   
    name: advanced-roads-drive
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='advanced' AND drive IS NOT NULL) AS t"
-   
    name: advanced-roads
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='advanced' AND drive IS NULL) AS t"
-
    name: asphalt-roads
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_line WHERE road='asphalt') AS t"
-
    name: major-roads
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='major') AS t"
-
    name: highways
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='highway') AS t"
-
    name: asphalt-roads2
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_line WHERE road='asphalt') AS t"
-
    name: major-roads2
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='major') AS t"
-
    name: highways2
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='highway') AS t"
-   
    name: dirt-road-drive
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='dirt') AS t"


################# Water bodies ###########################
-
    name: water
    class: landcover
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='water') AS t"
-
    name: water-border
    class: landcover
    Datasource: $ds
        table: "(SELECT (ST_Dump(ST_Union(way))).geom as way FROM planet_osm_polygon WHERE landcover='water') AS t"
############# Points #######################
-
    name: poi
    Datasource: $ds
        table: "planet_osm_point"


EOF

