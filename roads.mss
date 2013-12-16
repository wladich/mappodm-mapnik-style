@asphalt: #f88;
@relief: #bf6100;

#highways {
      line-width: 2.3mm;
      line-color: black;
}

#major-roads {
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

#highways2 {
    ::fill {
        line-width: 1.8mm;
        line-color: @asphalt;
    }
    ::inner {
        line-width: 0.2mm;
        line-color: black;
    }    
}

#major-roads2 {
    line-width: 1.6mm;
    line-color: @asphalt;
}


[zoom>=12]{

#passability {
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
        line-color: #fe7;//#ffd700;
//        line-dasharray: 1.5mm, 1mm
    }
    [passability="5"] {
        line-color: #fb7;
    }
}


#dirt-roads {
    line-color: black;
    line-width: 0.4mm;
    line-dasharray: 2mm, 1mm;
}

#dirt-roads-drive {
    line-color: black;
    line-width: 0.4mm;
}

#advanced-roads-drive {
    ::casing {
        line-color: black;
        line-width: 1.2mm;
    }
    line-color: white;
    line-width: 0.8mm;
}

#advanced-roads {
    ::casing {
        line-color: @relief;
        line-width: 1.8mm;
        line-dasharray: 0.5mm, 0.5mm;
    }
    line-color: white;
    line-width: 0.8mm;
}

#cutting {
    line-color: black;
    line-width: 0.2mm;
    line-dasharray: 3mm, 1.5mm;
}

#abandoned-road {
    line-color: black;
    line-width: 0.2mm;
    line-dasharray: 2mm, 3mm;
}
#cutting-wide {
    line-width: 2mm;
    line-color: #888888;
}
#path {
    line-color: black;
    line-width: 0.4mm;
    line-dasharray: 1mm, 1mm;
}
#trench {
    line-color: @relief;
    line-width: 0.7mm;
    line-dasharray: 0.7mm, 0.7mm;
}
#wall{
    line-color: @relief;
    line-width: 0.7mm;
    ::casing {
        line-color: @relief;
        line-width: 2mm;
        line-dasharray: 0.5mm, 2mm;
    }
}
#gasline, #powerline, #powerline_major{
    line-width: 1.5mm;
    line-color: #888888;
}

}
#railway{
    line-color: black;
    line-width: 1mm;
}




