#poi{
    [poi="trig"][zoom >= 13] {
        point-file: url('images/trig.png');
        point-allow-overlap: true; 
    }    

    [poi="memorial"][zoom >= 13] {
        point-file: url('images/pam.png')
    }
    [poi="church"][zoom >= 13] {
        point-file: url('images/cerkov.png')
    }
//    [poi="store"] {
//        point-file: url('images/')
//    }

    [poi="bus_stop"][zoom >= 10] {
        point-file: url('images/avt.png')
    }
    [poi="railway_station"][zoom >= 10] {
        point-file: url('images/zd.png')
    }
    [poi="building"][zoom >= 13] {
        point-file: url('images/dom.png')
    }
    [poi="cemetry"][zoom >= 13] {
        point-file: url('images/kladb.png')
    }
    [poi="tower"][zoom >= 13] {
        point-file: url('images/bash.png')
    }
    [poi="spring"][zoom >= 12] {
        point-file: url('images/')
    }
    [poi="ruins"][zoom >= 13] {
        point-file: url('images/razv.png')
    }
    [poi="hunting"][zoom >= 12]  {
        point-file: url('images/ohotn.png')
    }
    [poi="mound"][zoom >= 12] {
        point-file: url('images/pupyr.png')
    }
    [poi="bridge"][zoom >= 13] {
        point-file: url('images/bridge_pedestrain.svg')
    }
    [poi="bridge"][drive="yes"][zoom >= 12] {
        point-file: url('images/bridge_drive.svg')
    }
    [poi="pedestrain_tunel"][zoom >= 13] {
        point-file: url('images/pedestrain_tunel.svg')
    }
}

/*#poi {

    {

//poi=town
//poi=village
//poi=label
   
    

//poi=pedestrain_tunel
//poi=bridge
//poi=bridge; drive=yes

}
}*/
