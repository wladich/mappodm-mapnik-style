#poi{
    [poi="trig"][zoom >= 13] {
        point-file: url('images/trig.png');
        point-allow-overlap: true; 
    }    

    [poi="memorial"][zoom >= 13] {
        point-file: url('images/pam.png');
        point-allow-overlap: true; 
    }
    [poi="church"][zoom >= 13] {
        point-file: url('images/cerkov.png');
        point-allow-overlap: true; 
    }
    [poi="store"][zoom >= 12] {
        point-file: url('images/shop.png')
    }

    [poi="bus_stop"][zoom >= 11] {
        point-file: url('images/avt.png');
        point-allow-overlap: true; 
    }
    [poi="building"][zoom >= 13] {
        point-file: url('images/dom.png');
        point-allow-overlap: true; 
    }
    [poi="cemetry"][zoom >= 13] {
        point-file: url('images/kladb.png');
        point-allow-overlap: true; 
    }
    [poi="tower"][zoom >= 13] {
        point-file: url('images/bash.png');
        point-allow-overlap: true; 
    }
    [poi="spring"][zoom >= 12] {
        point-file: url('images/spring.svg');
        point-allow-overlap: true;
    }
    [poi="ruins"][zoom >= 13] {
        point-file: url('images/razv.png');
        point-allow-overlap: true;
    }
    [poi="hunting"][zoom >= 12]  {
        point-file: url('images/ohotn.png');
        point-allow-overlap: true;
    }
    [poi="mound"][zoom >= 12] {
        point-file: url('images/pupyr.png');
        point-allow-overlap: true;
    }
}
#railway_stations[zoom >= 10] {
    point-file: url('images/zd.png');
    point-allow-overlap: true; 
    point-transform: rotate([angle]+90, 0, 0);
}

#pedestrain_tunels[zoom >= 12] {
        point-file: url('images/pedestrain_tunel.svg');
        point-allow-overlap: true;
        point-transform: rotate([angle], 0, 0);
}

