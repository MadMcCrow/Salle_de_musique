#include "Guitare.inc"

//POINT DE VUE
camera {
        location <50,50,-140>
        look_at <12.5,30,5>
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

             
                                             


object { object {Guitare} }  

// Sol
plane {y, -1 pigment {Gray50}}
       





           