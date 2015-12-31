#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

camera {
        location <-50,50,-50>
        look_at <26,22,18.5>
        }
        
light_source {
              <0,1000,-100>
              color White
              }

#declare Dist=80.0;
light_source {< -50, 25, -50> color White
     fade_distance Dist fade_power 2
//   area_light <-40, 0, -40>, <40, 0, 40>, 3, 3
//   adaptive 1
//   jitter
}
light_source {< 50, 10,  -4> color White
     fade_distance Dist fade_power 2
//   area_light <-20, 0, -20>, <20, 0, 20>, 3, 3
//   adaptive 1
//   jitter
}
light_source {< 0, 100,  0> color White
     fade_distance Dist fade_power 2
//   area_light <-30, 0, -30>, <30, 0, 30>, 3, 3
//   adaptive 1
//   jitter
}
              
 box {<0,0,0> <52,44,27>
       texture {
                 pigment { Green }
                 finish  {        
                         specular 0.5
                         ambient 0.1
                         diffuse 0.9
  
                         } 
                 }
      
      }
           