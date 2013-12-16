.landcover{
[zoom>=13], [zoom=12][way_area>100000],[zoom=11][way_area>400000],[zoom=10][way_area>1600000],[zoom<=9][way_area>6400000]{
#water {
     
        polygon-fill: #0ff;
        ::casing {
            line-color: #5066ff;
            line-width: 0.7mm;
        }
    
}

#forest{
    polygon-fill: #99eebb;
}

#sparse{
    polygon-fill: #ccffaa;
    
}
#felling {
    polygon-fill: #ffffbb;
}

#felling_overgrown {
    polygon-fill: #aaccaa;
}

#urban{
    polygon-fill: #a75858;
}

#rural{
    polygon-fill: #ff7f7f;
    
}

#cottage{
    polygon-fill: #557f55;
/*    
    text-name: [name];
    text-face-name: "Arial Regular";
    text-size: 5mm;
    text-placement-type: simple;
    text-placements: "N,E,S,W,NE,SE,NW,SW";
*/    
}

#restricted{
    polygon-fill: #b1b1b1;
/*
    text-name: [name];
    text-face-name: "Arial Regular";
    text-size: 5mm;
*/
}

#cemetry{
    polygon-fill: #557f55;
}


.builtup {
    line-color: black;
    line-width: 0.3mm;
    line-gamma-method: linear;

}
}
}
