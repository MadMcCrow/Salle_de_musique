#include "Piano.inc"

camera {
        location <-150,100,-150>
        look_at  <75,55,30>
        }
           
           
           
           
//LUMIERES                                                                                                               

light_source {
              <100,1000,-100>
              color White
              }
light_source {
              <75,50,-550>
              color White
              }


//MIS EN PLACE
object { Piano } 

// Sol
plane {y, -1 pigment {Gray50}}