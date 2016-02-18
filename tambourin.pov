
// PoVRay 3.7 Scene File "tambourin.pov"
// author:  Noe PERARD-GAYOT & Baptiste DRAPEAUD
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }   

#include "tambourin.inc"


// camera ------------------------------------------------------------------
camera {perspective angle 75               
                            location  <0.0 , 10.0 ,-10.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 0 , 5.0>}

// sun ----------------------------------------------------------------------
light_source{< 3000,3000,-3000> color White}
// sky ----------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <0.6,0.7,1.0>]
                                   [0.35 rgb <0.1,0.0,0.8>]
                                   [0.65 rgb <0.1,0.0,0.8>]
                                   [1.00 rgb <0.6,0.7,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
// ground -------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ checker color rgb<1,1,1>*1.2 color rgb<0.25,0.15,0.1>*0}
              //normal { bumps 0.75 scale 0.025}
                finish { phong 0.1}
              } // end of texture
     } // end of plane
//---------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//---------------------------------------------------------------------------
object { tambourin         translate<0,0,10>}