#include "Imac.inc"


//POINT DE VUE
camera {
        location <0,60,-100>
        look_at <30,30,0>
        }
           
           
      
      
           
//LUMIERES                                                                                                               

light_source {
              <100,1000,-100>
              color White
              }
light_source {
              <0,10,-100>
              color White
              }
              
              

object { Imac } 

// Sol
plane {y, -1 pigment {Gray50}}
       





           