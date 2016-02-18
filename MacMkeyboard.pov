
// PoVRay 3.7 Scene File "MacMkeyboard.pov"
// author:  Noe PERARD-GAYOT & Baptiste DRAPEAUD
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }   
#include "shapes.inc"
#include "shapes3.inc"
#include "T_materiaux.inc"
    
// perspective (default) camera
camera {
  location  <0.0, 20, -100>
  look_at   <0.0, 0.0,  0.0>
  right     x*image_width/image_height
  
}

// create a regular point light source
light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <-20, 500, -20>
}
  
// sky ---------------------------------------------------------------
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgb <0.25, 0.35, 1.0>*0.7]
                                     [0.50 rgb <0.25, 0.35, 1.0>*0.7]
                                     [0.70 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                        scale<1,1,1.5>*2.5  translate< 0,0,0>
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000}
// fog on the ground ------------------------- end of sky with clouds
fog { fog_type   2
      distance   100
      color      White*0.5  
      fog_offset 0.1
      fog_alt    2.0
      turbulence 1.8
    }
//------------------------------------------------- end of ground fog

object {
        difference {
                    object{ Round_Box(<0,0,0>,<10,1,1>, 0.25   , 1)  }
                    object{ box {<-1,0.25,-1>,<11,2,2> } }
                    }
         texture {           







