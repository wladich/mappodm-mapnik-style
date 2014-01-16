@relief: rgb(191, 97, 0);
#contours, #contour-hatches {
    [width="nul"][zoom >= 13 ] {
        line-color: @relief;
        line-smooth: 0.5;
        line-width: 0.3mm;
        }
    [width="major"][zoom >= 13 ] {
        line-color: @relief;
        line-smooth: 0.5;
        line-width: 0.5mm;
    }
    [width="minor"][zoom >= 13 ] {
        line-color: @relief;
        line-smooth: 0.5;
        line-dasharray: 2.5mm, 1.5mm;
        line-width: 0.3mm;        
    }
}
#contours-general[zoom<=12][zoom>=11] {
    line-color: @relief;
    line-smooth: 0.5;
    line-width: 0.3mm;
}

#cliff[zoom>=12] {
    line-color: @relief;
    line-width: 0.5mm;
    ::hatches {
        line-color: @relief;
        line-width: 1mm;
        line-dasharray: 0.5mm, 1.5mm;
        line-offset: -0.7mm;
    }
    
}

#ravine[zoom>=13] {
    line-color: @relief;
    line-width: 0.8mm;
    line-smooth: 0.5;    
}
