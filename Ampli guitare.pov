#include "Ampli guitare.inc"

 

//POINT DE VUE
camera {
        location <50,60,-60>
        look_at <26,22,18.5>
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



                                   
                                    

                             

//MIS EN PLACE
object { Ampli } 

// Sol
plane {y, -1 pigment {Gray50}}
       





           