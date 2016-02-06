// this is the bongo file   

// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {perspective angle 75               // front view
                            location  <0.0 , 1.0 ,-13.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90  //right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_0 }
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


#declare Tome_wood =  object{//Round_Cone( point A, radius A, point B, radius B, rounding radius, merge on) 
         Round_Cone( <0,0,0>, 0.40    , <0,1.20,0>, 0.70 , 0.15, 0)  
         
         texture{ pigment{ color rgb<0.75,0.35,1> }
                  finish { phong 1 }
                }
       } // ----------------------------------------------------------- end Round_Cone 

#declare Middle_bar = object{
        Round_Box(<0,0.5,-0.25>,<1.5,1,0.25>, 0.05   , 0)  
         
        texture{ pigment{ color rgb<0.7,0.25,0.5>}
                 finish { phong 1 }
                }
        
      } 

#declare Skin = object{ object { 
         Round_Cylinder                         (<0,1 , 0>, <0,1.5,0>, 0.60 ,       0.20,   1)  
         
         texture{ pigment{ color rgb<1,0.2,0.35> }
              
                  finish { phong 1 }
                }
         
       }
       } 
#declare Metal_ring_top = object { Round_Cylinder   (<0,1.1,0>, <0,1.3,0>, 0.75,       0.05,   1)  
         
         texture{ pigment{ color rgb<0.2,0.2,0.2> }
              
                  finish { phong 1 }
                }
         
       
       }
#declare Metal_ring_bottom = object { cylinder   {<0,0,0>, <0,1,0>, 0.45}  
         
         texture{ pigment{ color rgb<0.2,0.2,0.2> }
              
                  finish { phong 1 }
                }
         
       }        

#declare Tome = object{ merge { 
        object{Tome_wood}
object{Skin}
object{Metal_ring_top}
object{Metal_ring_bottom}

        }
      }  
      
#declare Bongos = object{ merge {   object{Middle_bar} object {Tome } object {Tome translate x*1.6}}}
object {Bongos}
