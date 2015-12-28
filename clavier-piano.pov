//this is the file containing the piano keyboards ( midi input) that you can see on the photo

#version 3.7;
global_settings {assumed_gamma 1.0}
#include "colors.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"

#declare PCB_NOIR =     texture {
                                pigment{ color rgb<0.2, 0.2, 0.2>}  
                                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                                }

#declare PCB_BLANC =    texture {
                                pigment{ color rgb<1.00, 1.00, 1.00>*1.1}  
                                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                                }

//---------------------------------------------------------
//corps de clavier 66 x 8,3 x 18,4 cm
#declare base = box { <0,0,0>,< 1.00, 2.00, 1.00>}
#declare renflement


    
//---------------------------------------------------------  

// touches blanches 
#declare WhiteKEY =  box { <0,0,0>,< 1.00, 1.00, 4.00> 
    texture{PCB_BLANC} 
            
    }
#declare WhiteKeys = object {
 union{ 
 #local Nr = 0;     // start
 #local EndNr = 21; // end
 // il y a 22 touches blanches sur le clavier.
  #while (Nr< EndNr) 
   object{ WhiteKEY translate<Nr*1.1,0,0>} 
 #local Nr = Nr + 1;  // next Nr
 #end // end of loop 
}
}






//Scene for better visualisation
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 

// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <0.0 , 1.0 ,-10.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <10.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <10.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 10.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_3}
// sun ---------------------------------------------------------------------
light_source{<-1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <1.0,1.0,1.0>]
                                   [0.30 rgb <0.0,0.1,1.0>]
                                   [0.70 rgb <0.0,0.1,1.0>]
                                   [1.00 rgb <1.0,1.0,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
// fog ---------------------------------------------------------------------
fog{fog_type   2
    distance   50
    color      White
    fog_offset 0.1
    fog_alt    2.0
    turbulence 0.8}
// ground ------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ color rgb <1.00,0.95,0.8>}
                finish { phong 0.1 } 
              } // end of texture
     } // end of plane
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------











