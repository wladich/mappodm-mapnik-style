#!/bin/bash

BASE=`dirname $0`
db_conf=$1
if [ -z "$db_conf" ]; then db_conf=$BASE/db.conf; fi
. "$db_conf"


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
    - labels.mss
    - bridges.mss
    - borders.mss
  
Layer:
############### Vegetation ######################
-
    name: vegetation
    Datasource: $ds
        table: 
             (SELECT landcover, ST_Buffer(ST_Buffer(ST_Buffer(ST_Collect(way), 0.35/1000*!scale_denominator!), -0.7/1000*!scale_denominator!), 0.5/1000*!scale_denominator!) as way 
             FROM planet_osm_polygon WHERE landcover in ('forest', 'sparse', 'felling', 'felling_overgrown') AND way && !bbox! GROUP BY landcover) AS t1

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
    class: builtup
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='urban') AS t"
-
    name: rural
    class: builtup
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='rural') AS t"
-
    name: cottage
    class: builtup
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='cottage') AS t"
-
    name: restricted
    class: builtup
    Datasource: $ds
        table: "(SELECT * FROM planet_osm_polygon WHERE landcover='restricted') AS t"
-
    name: cemetry
    class: builtup
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

################# Water bodies ###########################
-
    name: water
    class: landcover
    Datasource: $ds
        table: 
             (SELECT ST_Buffer(ST_Buffer(ST_Buffer(ST_Collect(way), 0.25/1000*!scale_denominator!), -0.5/1000*!scale_denominator!), 0.25/1000*!scale_denominator!) as way 
             FROM planet_osm_polygon WHERE landcover = 'water' AND way && !bbox! AND sqrt(way_area) > 1.0*!scale_denominator!/1000.0) AS t1

############# Borders ###############
-
    name: fences
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE border='fence') AS t"
-
    name: forest_contour
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE border='forest') AS t"

################# Roads #######################
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
-   
    name: railway
    Datasource: $ds 
        table: "(SELECT * FROM planet_osm_line WHERE road='railway') AS t"

############# Bridges #######################
-
    name: bridges
    Datasource: $ds
        table:
            (SELECT way, bridge
                FROM planet_osm_line WHERE bridge IS NOT NULL AND ST_Length(way) / !scale_denominator! > 4./1000) AS t
-
    name: bridge-ends
    Datasource: $ds
        table:
            (SELECT ends.end as way, ST_Azimuth(ends.dir, ends.end) / pi() * 180  as angle, bridge
                FROM
                    (SELECT ST_StartPoint(way) as end, bridge, ST_PointN(way, 2) as dir
                        FROM planet_osm_line WHERE bridge IS NOT NULL AND ST_Length(way) / !scale_denominator! > 4./1000
                     UNION SELECT ST_EndPoint(way) as end, bridge, ST_PointN(way, ST_NPoints(way) - 1) as dir
                        FROM planet_osm_line WHERE bridge IS NOT NULL AND ST_Length(way) / !scale_denominator! > 4./1000
                    ) AS ends
            ) AS t
-
    name: short_bridges
    Datasource: $ds
        table:
            (SELECT ST_Line_Interpolate_Point(way, 0.5) as way, bridge, ST_Azimuth(ST_StartPoint(way), ST_EndPoint(way)) / pi() * 180  as angle
                FROM planet_osm_line WHERE bridge IS NOT NULL AND ST_Length(way) / !scale_denominator! <= 4./1000
            ) as t

############# Points #######################
-
    name: poi
    Datasource: $ds
        table: "planet_osm_point"

############Railway stations ###############
-
    name: railway_stations
    Datasource: $ds
        table: "
(SELECT p.way, p.name, 
ST_Azimuth(
	ST_Line_Interpolate_Point(l.way, GREATEST(ST_Line_Locate_Point(l.way, p.way) - 0.0001, 0)), 
	ST_Line_Interpolate_Point(l.way, LEAST(ST_Line_Locate_Point(l.way, p.way) + 0.0001, 1))) / pi() * 180 AS angle
from (SELECT * FROM planet_osm_point WHERE poi='railway_station') as p LEFT JOIN 
(SELECT * FROM planet_osm_line WHERE road='railway') AS l 
ON ST_Intersects(p.way, l.way)) as t"

############Pedestrain tunels ###############
-
    name: pedestrain_tunels
    Datasource: $ds
        table: "
(SELECT p.way, p.name, 
ST_Azimuth(
	ST_Line_Interpolate_Point(l.way, GREATEST(ST_Line_Locate_Point(l.way, p.way) - 0.0001, 0)), 
	ST_Line_Interpolate_Point(l.way, LEAST(ST_Line_Locate_Point(l.way, p.way) + 0.0001, 1))) / pi() * 180 AS angle
from (SELECT * FROM planet_osm_point WHERE poi='pedestrain_tunel') as p LEFT JOIN 
(SELECT * FROM planet_osm_line WHERE road in ('highway', 'major', 'asphalt')) AS l 
ON ST_Intersects(p.way, l.way)) as t"

################### Labels ########################
-
    name: cottage_labels
    Datasource: $ds
        table: "(SELECT ST_PointOnSurface(way) as way, name FROM planet_osm_polygon WHERE landcover='cottage') AS t"
-
    name: restricted_labels
    Datasource: $ds
        table: "(SELECT ST_PointOnSurface(way) as way, name FROM planet_osm_polygon WHERE landcover='restricted') AS t"


EOF

