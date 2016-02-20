#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 

#include "wooden floor.inc"
#include "Souris.inc"
#include "Pied de micro.inc"
#include "Fauteuil.inc"
#include "Casque.inc"
#include "clavier-piano.inc"
#include "Piano.inc"
#include "Enceinte.inc"
#include "Enceinte table.inc"
#include "Table.inc"
#include "imac.inc"
#include "Tapis de souris.inc"
#include "Ampli guitare.inc"
#include "Guitare.inc"
#include "Basket.inc"
#include "Tambourin.inc"
#include "Bongo.inc"
#include "T_materiaux.inc"
#include "MacMkeyboard.inc"
#include "Whiteboard.inc"



//----------------------------------------------------------------------------------------------------------------------------
//-----------------------------------   ROOM         -------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------

#local R_height    =  400.00;
#local R_depth_1   = 1200.00;
#local R_depth_2   =  900.00;
#local R_width_1   = 1200.00;
#local R_width_2   = 1000.00;
#local R_depth_s   = R_depth_1-R_depth_2;
#local R_width_s   = R_width_1-R_width_2;
#local R_edge      = sqrt( pow(R_width_s,2) +pow(R_depth_s,2));
#local R_angle     = (atan (R_width_s/R_depth_s))*180/pi;
#local W_ratio     = 0.80;
#local W_height    =  300;
#local W_zero      =   40;
#local W_width     = W_ratio*R_edge ;
#local W_depth     = 0.5*R_depth_1 ;
#local W_spacing   = (R_width_2-(2*W_width))/3 ;

// Murs ----------------------------------------------------------------------------------------------------------------------------------------------


#declare Room_basebox_box  = object { prism { -1 ,R_height+1 , 6  <0, 0>,  < R_width_1, 0>, < R_width_1,R_depth_2>, <R_width_2, R_depth_1>, <0, R_depth_1> , <0, 0>texture {T_Mur}}}
#declare Room_ground_box   = object { box { <0,-2,0>          , < R_width_1, 0,           R_depth_1>          }    texture {T_Sol    } }
#declare Room_ceiling_box  = object { box { <0,R_height,0>    , < R_width_1, R_height+2,  R_depth_1>          }    texture {T_Plafond} }
#declare V_fenetre         = object { box { <0,W_zero,0>      , < W_width  , W_height+W_zero, W_depth>        }    texture {T_Mur    } }
#declare Room_interior_box = object { difference  {                                                      
                                                 object {Room_basebox_box }
                                                 object {Room_ground_box  }
                                                 object {Room_ceiling_box }
                                                  }
                                    }
#declare Room_exterior_box = object {Room_basebox_box scale 1.2 translate< -R_width_1*0.1,-R_height*0.1, -R_depth_1*0.1>}                                
#declare Room_walls        = object { difference  {
                                                 object {Room_exterior_box}
                                                 object {Room_interior_box}
                                                 object {V_fenetre          translate <W_spacing ,  0, R_depth_1-1 >           }
                                                 object {V_fenetre          translate <(W_spacing*2)+W_width ,  0, R_depth_1-1>}
                                                 object {V_fenetre          translate <+((1-W_ratio)*R_width_s),0,-((1-W_ratio)*R_depth_s)> rotate <0,90-R_angle,0> translate <R_width_2 ,  0, R_depth_1>}

                                                  }
                                   } 


 


// Fenetre ----------------------------------------------------------------------------------------------------------------------------------------------
// ici anciennes fenetres qui ne servait pas à grand chose. dsl du dérangement.

/*
#local R = 2 ;//Rayon des articulations   
#declare Articulation_fenetre    = object { cylinder  { <0,0,0> <0,200,10-W_depth> R              } rotate <0,0,90> } 
#declare Contour_fenetre_L       = object { Round_Box ( <0,0,0> <W_depth,R_height-60, W_depth> 0.125,1 ) } 
#declare Contour_fenetre_l       = object { Round_Box ( <0,0,0> <210,    W_depth,     W_depth> 0.125,1 ) } 
#declare Verre_fenetre           = object { box       { <0,0,0> <200,    R_height-60, W_depth>       } material { T_Glass }} 
#declare Loquet_fenetre          = object { cylinder  { <0,0,0> <0,      R_height-60,  0> R         } } 
#declare Verrou_fenetre1         = object { cylinder  { <0,0,0> <0,15,0>          R+1       } } 
#declare Verrou_fenetre2         = object { cylinder  { <0,0,0> <0,5 ,0>          R         } rotate <90,0,0> } 
#declare Verrou_fenetre3         = object { sphere    { <0,0,0>, 1                          } scale <3,4.5,1> }  
#declare fenetre = union {
                           object { Verre_fenetre }
                                   merge { 
                                         union{
                                         #local Nr = 1;     
                                         #local EndNr = 4; 
                                         #while (Nr<= EndNr) 
                                         object { Articulation_fenetre translate <950,((((R_height-60)/4)*Nr)+(40-(R/2)))+5,40> texture { T_Mur} }  
                                         #local Nr = Nr + 1;  
                                         #end }
                                        object { Contour_fenetre_l texture { T_Plastic_BLANC } translate <0,         39,          40-R> }
                                        object { Contour_fenetre_l texture { T_Plastic_BLANC } translate <0,         R_height-31, 40-R> }
                                        object { Contour_fenetre_L texture { T_Plastic_BLANC } translate <0,         40,          40-R> }
                                        object { Contour_fenetre_L texture { T_Plastic_BLANC } translate <0-W_depth, 40,          40-R> }
                                        object { Contour_fenetre_L texture { T_Plastic_BLANC } translate <850-W_depth, 40,          40-R> }
                                        object { Contour_fenetre_L texture { T_Plastic_BLANC } translate <850,         40,          40-R> }
                                        object { Loquet_fenetre    texture { T_Plastic_BLANC } translate <851,         40,          40-R> }
                                        object { Verrou_fenetre1   texture { T_Plastic_BLANC } translate <851,         150,         40-R> }
                                        object { Verrou_fenetre2   texture { T_Plastic_BLANC } translate <851,         157.5,       34>   }
                                        object { Verrou_fenetre3   texture { T_Plastic_BLANC } translate <851,         157.5,       32>   }
                                 }    
                        }
*/
#local W_thickness        = 15;
#local W_Glass_thickness  =  3;
#local W_border_depth     =  8;
#local W_border_thickness = 10;
#declare Window_border       = object {
                                            union{
                                                    difference { 
                                                                    object{box {<0,0,0> <W_width,W_height,W_thickness>} }
                                                                    object{box {<W_border_thickness,W_border_thickness,-1> <W_width-W_border_thickness,W_height-W_border_thickness,W_thickness+1>} }
                                                               }
                                                    merge{                                                 
                                                             object{  Round_Box(<-W_border_thickness,0,-1>,<W_border_thickness,   W_height, W_thickness+1>, 0.25   , 1) translate <W_width/2,          0,     0> }  //middleframe
                                                             object{  Round_Box(<0,0,0>,<W_width,    W_border_thickness/2, W_thickness>,    0.25   , 1) translate <0,         W_height/4,     0> }  //bottom Splitter
                                                             object{  Round_Box(<0,0,0>,<W_width,    W_border_thickness/2, W_thickness>,    0.25   , 1) translate <0,         W_height/2,     0> }  //middle Splitter
                                                             object{  Round_Box(<0,0,0>,<W_width,    W_border_thickness/2, W_thickness>,    0.25   , 1) translate <0,         W_height*(3/4), 0> }  //top    Splitter
                                                         }
                                             }
                                      }     
         
#declare Window_glass = object { box { <0,1,0> <W_width,W_height-1, W_Glass_thickness>}translate <0,0,+W_thickness/2>  }
#declare Window = object { union { 
                                    object{ Window_border texture  {T_Plastic_BLANC} }
                                    object{ Window_glass  texture { T_Glass }       }
                                 }
                         }
// Salle complete ----------------------------------------------------------------------------------------------------------------------------------------------                
#declare Room = union { 
                        object { Room_walls }
                        object { Window translate <W_spacing,W_zero,R_depth_1+W_border_depth> }
                        object { Window translate <(W_spacing*2)+W_width ,W_zero,R_depth_1+W_border_depth> }
                        object  {Window  rotate <0,90-R_angle,0> translate <R_width_2+((1-W_ratio)*R_width_s) , W_zero, R_depth_1-((1-W_ratio)*R_depth_s)>} 
                        hollow
                       }
//----------------------------------------------------------------------------------------------------------------------------
//-----------------------------------   CAMERA LUMIERES  SCENE     -----------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------  
camera { perspective location <200,160,10>
right     x*image_width/image_height
look_at <600,0,500> 
angle 70 
 aperture 0.8                // [0...N] larger is narrower depth of field (blurrier)
 blur_samples 6              // number of rays per pixel for sampling
 focal_point <900,10,900>         // point that is in focus <X,Y,Z>
 confidence 1              // [0...1] when to move on while sampling (smaller is less accurate)
 variance 1/128              // [0...1] how precise to calculate (smaller is more accurate)
}

// sun ---------------------------------------------------------------------
light_source{< 400, 750, 2000>  color White*1.5}   // keep sun below the clouds! 
// sky ---------------------------------------------------------------------
 // the dark blue
plane{ <0,1,0>,1 hollow  
       texture{ pigment { color rgb <0.50, 0.50, 1.0> }
                finish  { ambient 0.65 diffuse 0 } 
              }      
       scale 10000}
 // the clouds 
plane{<0,1,0>,1 hollow  
       texture{pigment{ bozo turbulence 0.76
                        color_map { [0.5 rgbf<1.0,1.0,1.0,1.0> ]
                                    [0.6 rgb <1.0,1.0,1.0>     ]
                                    [1.0 rgb <0.5,0.5,0.5>     ]}
                       }
               finish { ambient 0.30 diffuse 0} 
              }      
       scale 800}
// fog in the far -----------------------------------------------------------
fog{ fog_type   2 // ground fog 
     distance   900
     color      White
     fog_offset 0.1
     fog_alt    2.0
     turbulence 0.8
   }
//interior light   
light_source {<500,390,500>  color White*0.5 media_interaction off fade_distance 800  fade_power 2 }
light_source {<50,300,50>    color White*0.1 media_interaction off fade_distance 1000 fade_power 3 }


//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------   MESHS     -----------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------  
#declare Random_1  = seed (27053);
#declare G_table_1 = union{
                            object { Table                  scale 1             rotate <0,10*rand(Random_1),0>     translate <0,0,0>      }
                            object { Imac                   scale 1             rotate <0,10*rand(Random_1),0>     translate <10,72,80>   }
                            object { Keyboard               scale 10            rotate <0,10*rand(Random_1),0>     translate <5,70,45>    }
                            object { midi_keyboard          scale 1             rotate <0,10*rand(Random_1),0>     translate <0,70,20>    }
                            object { Enceinte_table         scale 1.2           rotate <0,180+10*rand(Random_1),0> translate <90,70,40>   }
                            object { Tapis_souris           scale <1.5,1,1.5>   rotate <0,10*rand(Random_1),0>     translate <70,70.5,5>  }
                            object { Souris                 scale 2             rotate <0,180+30*rand(Random_1),0> translate <80,67.5,10> }
                        } 

#declare Random_2  = seed (22022);
#declare G_table_2 = union{
                            object { Table                  scale 1             rotate <0,10*rand(Random_2),0>     translate <0,0,0>      }
                            object { Imac                   scale 1             rotate <0,10*rand(Random_2),0>     translate <10,72,80>   }
                            object { Keyboard               scale 10            rotate <0,10*rand(Random_2),0>     translate <5,70,45>    }
                            object { midi_keyboard          scale 1             rotate <0,10*rand(Random_2),0>     translate <0,70,20>    }
                            object { Enceinte_table         scale 1.2           rotate <0,180+10*rand(Random_2),0> translate <90,70,40>   }
                            object { Tapis_souris           scale <1.5,1,1.5>   rotate <0,10*rand(Random_2),0>     translate <70,70.5,5>  }
                            object { Souris                 scale 2             rotate <0,180+30*rand(Random_2),0> translate <80,67.5,10> }
                        } 
                        
#declare Random_3  = seed (12345);
#declare G_table_3 = union{
                            object { Table                  scale 1             rotate <0,10*rand(Random_3),0>     translate <0,0,0>      }
                            object { Imac                   scale 1             rotate <0,10*rand(Random_3),0>     translate <10,72,80>   }
                            object { Keyboard               scale 10            rotate <0,10*rand(Random_3),0>     translate <5,70,45>    }
                            object { midi_keyboard          scale 1             rotate <0,10*rand(Random_3),0>     translate <0,70,20>    }
                            object { Enceinte_table         scale 1.2           rotate <0,180+10*rand(Random_3),0> translate <90,70,40>   }
                            object { Tapis_souris           scale <1.5,1,1.5>   rotate <0,10*rand(Random_3),0>     translate <70,70.5,5>  }
                            object { Souris                 scale 2             rotate <0,180+30*rand(Random_3),0> translate <80,67.5,10> }
                        }                         

#declare Random_4  = seed (20202);
#declare G_table_4 = union{
                            object { Table                  scale 1             rotate <0,10*rand(Random_4),0>     translate <0,0,0>      }
                            object { Imac                   scale 1             rotate <0,10*rand(Random_4),0>     translate <10,72,80>   }
                            object { Keyboard               scale 10            rotate <0,10*rand(Random_2),0>     translate <5,71,45>    }
                            object { midi_keyboard          scale 1             rotate <0,10*rand(Random_4),0>     translate <0,71,20>    }
                            object { Enceinte_table         scale 1.2           rotate <0,180+10*rand(Random_4),0> translate <90,71,40>   }
                            object { Tapis_souris           scale <1.5,1,1.5>   rotate <0,10*rand(Random_4),0>     translate <70,70.5,5>  }
                            object { Souris                 scale 2             rotate <0,180+30*rand(Random_4),0> translate <80,67.5,10> }
                        } 
        
#declare G_instrument_basket = union {
                                        object { basket }
                                        object {tambourin  translate<-24,0,0> rotate <0,0,-70>  rotate y*90 translate <0,21.5,-18>}
                                        object {Bongos     rotate y*23     translate <-40,21.5,28>}
                                     }
            //RIDEAU
#declare Barre_rideau = object { cylinder { <0,0,0> <0,R_width_1,0> 2 } rotate <0,0,90> texture {pigment{Grey}}} 

#declare Rideau1 = isosurface { 
                            function{  
                            y - sin(x*1.2*pi)*0.1
                            }
                            threshold 0
                            contained_by {box {<0,-0.1,0>, < 10, 15, 10>}}
                            
                            scale <12,15,38>
                            rotate <-90, 0, 0>
                            translate < 0.1, 1.7, 0> 
                            texture { pigment { rgbf <1,1,1,0.5> } }
                            } 
#declare Rideau2 = isosurface { 
                            function{  
                            y - sin(x*1.2*pi)*0.1
                            }
                            threshold 0
                            contained_by {box {<0,-0.1,0>, < 10, 15, 10>}}
                            
                            scale <12,15,38>
                            rotate <-90, 0, 0>
                            translate < 0.1, 1.7, 0>
                            texture { pigment { rgbf <1,1,1,0.5> } }
                            }
#declare Rideau3 = isosurface { 
                            function{  
                            y - sin(x*1.2*pi)*0.1
                            }
                            threshold 0
                            contained_by {box {<0,-0.1,0>, < 10, 15, 10>}}
                            
                            scale <20,15,38>
                            rotate <-90, 45, 0>
                            translate < 0.1, 1.7, 0>
                            texture { pigment { rgbf <1,1,1,0.5> } }
                            }
     
                           
       
//----------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------  MISE EN SCENE     -------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------                  
//salle en elle même 
object { Room }
object { G_table_1           rotate <0,20*rand(Random_1),0>        translate <350,0,300>    }
object { G_table_2           rotate <0,20*rand(Random_2),0>        translate <500,0,300>    }
object { G_table_3           rotate <0,150+20*rand(Random_3),0>    translate <400,0,550>    }
object { G_table_4           rotate <0,180+20*rand(Random_4),0>    translate <600,0,550>    }
object { Piano                                                     translate <250,0,800>    }
object { Fauteuil            rotate <0,-90,0>                      translate <420,0,200>    }
object { Fauteuil            rotate <0,-90,0>                      translate <580,0,200>    }
object { Fauteuil            rotate <0,75,0>                       translate <300,0,650>    }
object { Fauteuil            rotate <0,90,0>                       translate <550,0,650>    }
object { Pied_micro                                                translate <750,0,500>    }
object { Guitare             rotate <0,90,0>                       translate <1150,0,665>   }
object { Ampli               rotate <0,90,0>                       translate <1150,0,800>   }
object { Enceinte                                                  translate <370,110,800>  }
object { G_instrument_basket rotate y*45                           translate <900,0,300>    }
object { Casque              rotate <0,0,0>                        translate <400,70,200>   }
object { Casque              rotate <0,0,0>                        translate <480,70,200>   }
object { Casque              rotate <0,0,0>                        translate <300,70,650>   }
object { Casque              rotate <0,0,0>                        translate <550,70,650>   }
object { Barre_rideau        rotate <0,0,0>                        translate <1200,380,1180>}
object { Barre_rideau        rotate <0,-125,0>                     translate <980,380,1200> }
object { Rideau1             rotate <0,0,0>                        translate <750,0,1180>   }
object { Rideau2             rotate <0,0,0>                        translate <350,0,1180>   }
object { Rideau3             rotate <0,10,0>                       translate <1010,0,1160>  }
object { Whiteboard          rotate <0,90,0>                       translate <1100,0,550>   }

 box{ <0,0,0>, <1200, 500, 1200>
      pigment { rgbft <0.1,0.1,0.1,0.2,1> } 
      hollow
      interior{
        media{
          scattering { 1, 0.005 extinction 0.15 }
          samples 100, 300
        } 
      } 
 } 
