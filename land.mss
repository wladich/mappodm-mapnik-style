.landcover{
    [zoom>=13], [zoom=12][way_area>100000],[zoom=11][way_area>400000],[zoom=10][way_area>1600000],[zoom=9][way_area>6400000]{
        #water {
            ::casing {
                line-color: #5066ff;
                line-width: 1mm;
            }
            polygon-fill: #0ff;
        }

        #forest{
            polygon-fill: #99eebb;
            line-color:#99eebb;
            line-width: 0.5;
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
        }

        #restricted{
            polygon-fill: #b1b1b1;
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
