#include "Pied de micro.inc"


//POINT DE VUE
camera {
        location <-250,140,00>
        look_at <0,95,0>
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
              
                                       

//MIS EN PLACE
object { Pied_micro } 

// Sol
plane {y, -1 pigment {Gray50}}