
 // The standard collection of textures

#include "textures.inc"
#include "woods.inc"

#declare light_wood = pigment { P_WoodGrain7A color_map { M_Wood7A } }
#declare  dark_wood = pigment { P_WoodGrain14A color_map { M_Wood14A } }





//POINT DE VUE
camera {
        location <5,6,-6>
        look_at <1,1,1>
        } 
        
plane { <0,1,0>, 0
        texture{ T_woodenfloor
               } 
      }
      
           
//LUMIERES      
light_source {
              <0,1000,-100>
              color rgb<1,1,1>
              }
 
        
