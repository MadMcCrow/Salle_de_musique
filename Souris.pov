#include "Souris.inc"

//POINT DE VUE
camera {
        location <20,10,-20>
        look_at <0,5,0>
        }
           
           
           
           
//LUMIERES                                                                                                               

light_source {
              <100,1000,-100>
              color White
              }

              
              


object { Souris } 

// Sol
plane {y, -1 pigment {Gray50}}