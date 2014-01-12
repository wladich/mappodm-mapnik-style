[bridge="pedestrain"][zoom>=13]{
    #bridges {
        ::casing {
            line-color: black;
            line-width: 1.4mm;
        }
        ::inner {
            line-color: white;
            line-width: 0.6mm;
        }
    }

    #bridge-ends {
        point-file: url('images/bridge_pedestrain_end.svg');
        point-transform: rotate([angle], 0, 0);
        point-allow-overlap: true;
    }

    #short_bridges {
        point-file: url('images/bridge_pedestrain.svg');
        point-transform: rotate([angle] + 90, 0, 0);
        point-allow-overlap: true;
    }

}


[bridge="automobile"][zoom>=13] {
    #bridges {
        ::casing {
            line-color: black;
            line-width: 2.4mm;
        }
        ::inner {
            line-color: white;
            line-width: 1.6mm;
        }
     }

    #bridge-ends {
        point-file: url('images/bridge_automobile_end.svg');
        point-transform: rotate([angle], 0, 0);
        point-allow-overlap: true;
    }

    #short_bridges {
        point-file: url('images/bridge_automobile.svg');
        point-transform: rotate([angle] + 90, 0, 0);
        point-allow-overlap: true;
    }
}

 


