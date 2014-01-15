#river{
    line-color: #5066ff;
    line-join: round;
    line-smooth: 0.4;
/*    
    text-name: [name];
    text-placement: line;
    text-fill: #5066ff;
    text-size: 5mm;
    text-spacing: 100mm;
    text-dy: 3mm;
    text-face-name: "Arial Regular";
*/    
    line-width: 0;

    [river="stream"]{
        [zoom>=13] {
            line-width: 0.5mm;
        }
        [zoom=12] {
            line-width: 0.3mm;    
        }
    }

    [river="kneedeep"]{
        [zoom>=13] {
            line-width: 1mm;   
        }
        [zoom=12] {
            line-width: 0.5mm;
        }
        [zoom=11] {
            line-width: 0.3mm;
        }

    }

    [river="wide"] {
        [zoom>=13] {
            ::casing {
                line-color: #5066ff;
                line-join: round;
                line-smooth: 0.4;
                line-width: 2mm;
                line-cap: round;
            }
            ::inner {
                line-color: #0ff;
                line-width: 1mm;
                line-join: round;
                line-smooth: 0.4;
                line-cap: round;                
            }
        }
        [zoom=12] {
            line-width: 1mm;
        }
        [zoom>=8][zoom<=11] {
            line-width: 0.5mm;
        }
        [zoom>=5][zoom<=7] {
            line-width: 0.3mm;
        }

    }

    [river="drying"][zoom>=13]{
        line-width: 0.5mm;
        line-dasharray: 1mm, 0.5mm;
    }    
}
