#include "fauteuil.inc"


//POINT DE VUE
camera {
        location <200,100,-40>
        look_at <25,32.5,45>
        }
           
           
      
      
           
//LUMIERES      
light_source {
              <0,1000,-100>
              color White
              }
light_source {
              <0,1000,1000>
              color White
              }
light_source {
              <200,10,-52>
              color White
              }



//MIS EN PLACE
object { Fauteuil  }



// Sol
plane {y, -1 pigment {Gray50}}
       





           