// POV-Ray 3.7 Scene File "Scattering_box_4.pov"
// author: Friedrich A. Lohmueller, Oct. 2008/Aug-2009 / Jan-2011
// email: Friedrich.Lohmueller_at_t-online.de
// homepage: http://www.f-lohmueller.de
//--------------------------------------------------------------------------
#version 3.7;
global_settings{assumed_gamma 1.0} 
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
// camera ------------------------------------------------------------------
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 50 //   
                            location  < 2.20, 0.75, 0.05>
                            right     x*image_width/image_height
                            look_at   < 2.85, 0.75, 2.00> }
camera{Camera_1}
// sun ---------------------------------------------------------------------
light_source{< 1200, 750, 400>  color White*1.2}   // keep sun below the clouds! 
// sky ---------------------------------------------------------------------
 // the dark blue
plane{ <0,1,0>,1 hollow  
       texture{ pigment { color rgb <0.20, 0.20, 1.0> }
                finish  { ambient 0.25 diffuse 0 } 
              }      
       scale 10000}
 // the clouds 
plane{<0,1,0>,1 hollow  
       texture{pigment{ bozo turbulence 0.76
                        color_map { [0.5 rgbf<1.0,1.0,1.0,1.0> ]
                                    [0.6 rgb <1.0,1.0,1.0>     ]
                                    [1.0 rgb <0.5,0.5,0.5>     ]}
                       }
               finish { ambient 0.25 diffuse 0} 
              }      
       scale 800}
// fog in the far -----------------------------------------------------------
fog{ fog_type   2 // ground fog 
     distance   50
     color      White
     fog_offset 0.1
     fog_alt    2.0
     turbulence 0.8
   }
// ground ------------------------------------------------------------------
plane { <0,1,0>, 0 
        texture { pigment{ color rgb<0.35,0.65,0.0>*0.72}
                  normal { bumps 0.75 scale 0.015  }
                  finish { phong 0.1 }
                }
      }
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
 
//--------------------------------------------------------------------- textures
#declare Window_Glass = 
       texture{ pigment{ rgbf <0.98, 0.98, 0.98, 0.95> *0.85}
                finish { ambient 0.1 diffuse 0.1 reflection 0.2  
                         specular 0.8 roughness 0.0003 phong 1 phong_size 400}
               } // end of texture ---------------------------------------------

#declare Frame_Texture =
      texture { pigment{color White*0.85}
                //normal {bumps 0.5 scale 0.005} 
                finish {ambient 0.15 diffuse 0.85 phong 1}
              } // end of texture

#declare Door_Hole_Texture =
      texture { pigment{color White*0.85}
                //normal {bumps 0.5 scale 0.005} 
                finish {ambient 0.15 diffuse 0.85 phong 1}
              } // end of texture

#declare Wall_Texture =
      texture { pigment{color White*0.75}
                //normal {bumps 0.5 scale 0.005} 
                finish {ambient 0.15 diffuse 0.85 phong 1}
              } // end of texture

//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------



#local D = 0.0001; 
// room dimensions 
#local R_x = 5.00;  
#local R_y = 2.50;
#local R_z = 7.00;

#local Wall_D = 0.25; 

// door dimensions 
#local D_x = 1.00; 
#local D_y = 2.00;


#local DF_d = 0.08; // outer door frame 
#local DF_z = 0.05; // outer door frame 

#local Door_Transform = transform{ rotate<0, 90,0> translate<R_x+Wall_D,0.001,R_z/2+1> } ;
//----------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------
#declare Door = 
union{ 
union{ // Frames
 //outer frames
 box{<0,0,-DF_z/2>,<DF_d,D_y,DF_z/2> }
 box{<0,0,-DF_z/2>,<DF_d,D_y,DF_z/2> scale<-1,1,1> translate<D_x,0,0>}

 box{<0,0,-DF_z/2>,<D_x,DF_d,DF_z/2> }
 box{<0,0,-DF_z/2>,<D_x,DF_d,DF_z/2> scale<1,-1,1> translate<0,D_y,0>}
 // tween frames 
 
 // middle
 box{<-DF_d/3,0,DF_z/3>,<DF_d/3,D_y,DF_z/3> translate<D_x/2,0,0>}
 // horizontal
 box{<0,-DF_d/3,-DF_z/3>,<D_x,DF_d/3,DF_z/3> translate<0,1*D_y/5,0>}
 box{<0,-DF_d/3,-DF_z/3>,<D_x,DF_d/3,DF_z/3> translate<0,2*D_y/5,0>}
 box{<0,-DF_d/3,-DF_z/3>,<D_x,DF_d/3,DF_z/3> translate<0,3*D_y/5,0>}
 box{<0,-DF_d/3,-DF_z/3>,<D_x,DF_d/3,DF_z/3> translate<0,4*D_y/5,0>}


 texture {Frame_Texture}   //
 } // end frames#
 
 
// Glas
 box{ <D,D,-0.002>,<D_x-D,D_y-D,0.002> 
      texture {Window_Glass}  //
 }
scale < 1,1,1>
rotate<0,0,0>  translate<0,0,0>         
}  // end union Door 
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
#declare Door_Hole = 
 box{<0,0,-0.50>,<D_x,D_y,0.50>
 texture{ Door_Hole_Texture }   
 } // end 
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------






// room with window 
union{ 
 // the walls with door hole
 difference{ 
  box{<-Wall_D,-Wall_D,-Wall_D>,<R_x+Wall_D,R_y+Wall_D,R_z+Wall_D> }  
  box{<0,0,0>,<R_x,R_y,R_z> }  
  // window hole: 
  object{ Door_Hole transform Door_Transform} 

  hollow
  texture{ Wall_Texture } 
  } // end difference 

 // the Door 
 object{ Door rotate <0, 20,0>  transform Door_Transform } 


 //--------------------------------------------------------------
 // A low light_source inside the room 
 // without interaction with media 
 // to see what's in the room:
 light_source { <R_x/2, R_y-0.5,0.5>, 0.15 media_interaction off }

 //--------------------------------------------------------------
 // Scattering media box:
 box{ <0,0,0>, <R_x, R_y, R_z>
      pigment { rgbt 1 } 
      hollow
      interior{
        media{
          scattering { 1, 0.17 extinction 0.01 }
          samples 100, 500
        } // end media 
      } // end interior
 } // end box

 
translate<0,0.01,0>
} // end union Room

//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

