#swamp{
    [zoom>=13], [zoom=12][way_area>100000],[zoom=11][way_area>400000],[zoom=10][way_area>1600000],[zoom=9][way_area>6400000]{
        [swamp="swamp"] {
            polygon-pattern-file: url('images/bol_l.png');
            polygon-pattern-alignment: global;
        }
        [swamp="deep"] {
            polygon-pattern-file: url('images/bol_h.png');
            polygon-pattern-alignment: global;
        }
    }
}
