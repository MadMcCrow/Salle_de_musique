#include "Table.inc"


//POINT DE VUE
camera {
        location <200,100,200>
        look_at <50,35,50>
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
              <25,1000,-52>
              color White
              }

             
                                             

object { Table }

// Sol 
plane {y, -1 pigment {Gray50}}
       





           