#include "Tapis de souris.inc"


//POINT DE VUE
camera {
        location <20,10,-30>
        look_at <10,5,0>
        }
           
           
           
           
//LUMIERES                                                                                                               

light_source {
              <100,1000,-100>
              color White
              } 

              


//MIS EN PLACE
object { Tapie_souris scale <0,0.4,0> } 
              
// Sol
plane {y, -1 pigment {Gray50}}