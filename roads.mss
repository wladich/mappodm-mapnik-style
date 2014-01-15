@asphalt: #f88;
@relief: #bf6100;

#highways[zoom>=6] {
      line-width: 2.3mm;
      line-color: black;
}

#major-roads[zoom>=8] {
      line-width: 2mm;
      line-color: black;
}

[zoom>=10] {
    #asphalt-roads {
          line-width: 1.2mm;
          line-color: black;
    }        
    #asphalt-roads2[zoom>=10]{
        line-width: 0.8mm;
        line-color: @asphalt;
    }
}

#highways2[zoom>=6] {
    ::fill {
        line-width: 1.8mm;
        line-color: @asphalt;
    }
    ::inner {
        line-width: 0.2mm;
        line-color: black;
    }    
}

#major-roads2[zoom>=8] {
    line-width: 1.6mm;
    line-color: @asphalt;
}

#passability[zoom>=12] {
    line-width: 1.5mm;
    line-join: round;
    [passability="2"] {
        line-color: #00b000;
    }
    [passability="3"] {
        line-color: #00b000;
        line-dasharray: 0.7mm, 1.5mm
    }
    [passability="4"] {
        line-color: #fe7;
    }
    [passability="5"] {
        line-color: #fb7;
    }
}


#dirt-roads[zoom>=12] {
    line-color: black;
    line-width: 0.4mm;
    line-dasharray: 2mm, 1mm;
}

#dirt-roads-drive[zoom>=12] {
    line-color: black;
    line-width: 0.4mm;
}

#advanced-roads-drive[zoom>=11] {
    ::casing {
        line-color: black;
        line-width: 1.2mm;
    }
    line-color: white;
    line-width: 0.8mm;
}

#advanced-roads[zoom>=12] {
    ::casing {
        line-color: @relief;
        line-width: 1.8mm;
        line-dasharray: 0.5mm, 0.5mm;
    }
    line-color: white;
    line-width: 0.8mm;
}

#cutting[zoom>=12] {
    line-color: black;
    line-width: 0.2mm;
    line-dasharray: 3mm, 1.5mm;
}

#abandoned-road[zoom>=12] {
    line-color: black;
    line-width: 0.2mm;
    line-dasharray: 2mm, 3mm;
}
#path[zoom>=12] {
    line-color: black;
    line-width: 0.4mm;
    line-dasharray: 1mm, 1mm;
}
#trench[zoom>=12] {
    line-color: @relief;
    line-width: 0.7mm;
    line-dasharray: 0.7mm, 0.7mm;
}
#wall[zoom>=12]{
    line-color: @relief;
    line-width: 0.7mm;
    ::casing {
        line-color: @relief;
        line-width: 2mm;
        line-dasharray: 0.5mm, 2mm;
    }
}
#cutting-wide [zoom>=12]{
    line-width: 1.5mm;
    line-color: #888888;
    line-opacity: 0.7;    
}

#powerline[zoom>=12]{
    line-width: 0.7mm;
    line-color: #888888;
}

#gasline[zoom>=12]{
    line-width: 1.5mm;
    line-color: #888888;
    line-opacity: 0.7;
}

#powerline_major[zoom>=12]{
    line-width: 1.5mm;
    line-color: #888888;
    line-opacity: 0.7;
}


#railway[zoom>=6]{
    line-color: black;
    line-width: 1mm;
}




