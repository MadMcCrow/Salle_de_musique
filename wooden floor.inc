
 // The standard collection of textures

#include "textures.inc"
#include "woods.inc"

#declare light_wood = pigment { P_WoodGrain7A color_map { M_Wood7A } }
#declare  dark_wood = pigment { P_WoodGrain14A color_map { M_Wood14A } }
#declare board_length = 1.5*2;
#declare board_width = 0.25*2; 
#declare board_offset = 0.8*2;

#declare T_woodenfloor1 = texture{ Tan_Wood     
               normal { wood 0.5 scale 0.3 turbulence 0.1}
                finish { phong 1 } 
                rotate<60,0,45> scale 0.1
                  
              normal { pigment_pattern{
                            average pigment_map{[1, gradient z sine_wave]
                                                [1, gradient y scallop_wave]
                                                [3, bumps  ]}
                                         translate 0.02 scale 0.5}
                                         2 
                         rotate< 0,0,0> scale 0.15 }
               
              }  


#declare T_woodenfloor2= texture{ pigment { gradient y
                pigment_map { [ 0.0 light_wood ]
                              [ 1.0 dark_wood ] }
                warp { repeat board_length *z offset 0.28*y }
                warp { repeat board_width*x offset board_offset } }
      normal {	quilted 0.25 
                control0 0.0
                control1 0.66
                bump_size 0.25
                scale <board_width,1,board_length>
                warp { repeat board_length *z  }
                warp { repeat board_width*x offset board_length*1.5*z } }
      finish { phong 1 }  }
      
      
#declare T_woodenfloor= texture{ T_Wood3  scale 0.1
      normal {	quilted 0.25 
                control0 0.0
                control1 0.66
                bump_size 0.6
                scale <board_width,1,board_length>
                warp { repeat board_length *z  }
                warp { repeat board_width*x offset board_length*1.5*z } }
      finish { phong 1 }  }                        


#declare T_woodenfloor3= texture{ T_Wood3     
                finish { diffuse 1.2 phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 


/*//POINT DE VUE
camera {
        location <5,6,-6>
        look_at <1,1,1>
        }  */
        
plane { <0,1,0>, 0
        texture{ T_woodenfloor
               } 
      }
      
           
/*//LUMIERES      
light_source {
              <0,1000,-100>
              color rgb<1,1,1>
              }  */
 
        
