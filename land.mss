#vegetation{
    [zoom>=12] {
        [landcover="forest"]{
            polygon-fill: #99eebb;
            line-width: 0.5;
            line-color: #99eebb;
        }

        [landcover="sparse"]{
            polygon-fill: #ccffaa;
        }

        [landcover="felling"]{
            polygon-fill: #ffffbb;
        }

        [landcover="felling_overgrown"]{
            polygon-fill: #aaccaa;
        }

    }
    [zoom=10],[zoom=11] {
        polygon-fill: #99eebb;
        line-width: 0.5;
        line-color: #99eebb;
    }

}    
#water{
    ::casing {
        line-color: #5066ff;
        line-width: 1mm;
        line-join: round;
    }
    polygon-fill: #0ff;
}


.builtup[zoom>=11] {
        #urban{
            polygon-fill: #a75858;
        }

        #rural{
            polygon-fill: #ff7f7f;
        }

        #cottage{
            polygon-fill: #557f55;
        }

        #restricted{
            polygon-fill: #b1b1b1;
        }

        #cemetry{
            polygon-fill: #557f55;
        }
    line-color: black;
    line-width: 0.3mm;
    line-gamma-method: linear;

}


