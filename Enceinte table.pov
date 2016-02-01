#include "Enceinte table.inc"

//POINT DE VUE
camera {
        location <30,30,30>
        look_at <0,10,0>
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
              <25,10,-52>
              color White
              }

             
                                             

object { Enceinte_table }

// Sol 
plane {y, -1 pigment {Gray50}}
       





           