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
#include "T_materiaux.inc"

                



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

// bordel de merde, c'est quoi ce putain de bordel de pute ?  Commente un peu ce bordel à cul de pompe à merde... j'y comprends qu'dalle !
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

// bon alors je le fais à la mano, tu changeras si t'en a envis.
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
                                    //object{ Window_glass  texture { T_Glass }       }
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
// atmospheric media can be generated by adding a media statement
// to the scene not attached to any specific object
/*
 box{ <0,0,0>, <1200, 500, 1200>
      pigment { rgbt 1 } 
      hollow
      interior{
        media{
          scattering { 1, 0.17 extinction 0.01 }
          samples 100, 500
        } // end media 
      } // end interior
 }
*/



camera { perspective location <10,160,10>   right     x*image_width/image_height look_at <500,0,500> angle 60 }  


// sun ---------------------------------------------------------------------
light_source{< 400, 750, 2000>  color White*1.2}   // keep sun below the clouds! 
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
     distance   1100
     color      White
     fog_offset 0.1
     fog_alt    2.0
     turbulence 0.8
   }
light_source {<500,390,500>  0.80 media_interaction off }
       





//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------   MESHS     -----------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------  


        

            //RIDEAU
#declare Barre_rideau1 = object { cylinder { <0,0,0> <0,1200,0> 2 } rotate <0,0,90>} 
#declare Barre_rideau2 = object { cylinder { <0,0,0> <0,300,0> 2 } rotate <0,0,90>}

#declare Rideau1 = isosurface { 
                            function{  
                            y - sin(x*1.2*pi)*0.1
                            }
                            threshold 0
                            contained_by {box {<0,-0.1,0>, < 10, 15, 10>}}
                            
                            scale <8,15,38>
                            rotate <-90, 0, 0>
                            translate < 0.1, 1.7, 0>
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
                            }
#declare Rideau4 = isosurface { 
                            function{  
                            y - sin(x*1.2*pi)*0.1
                            }
                            threshold 0
                            contained_by {box {<0,-0.1,0>, < 10, 15, 10>}}
                            
                            scale <18,15,38>
                            rotate <-90, 90, 0>
                            translate < 0.1, 1.7, 0>
                            }
     

//ASSEMBLAGE


                
#declare Rideaux = union {
                           object { Barre_rideau1 texture { Polished_Chrome } translate <0,-15,-200>                            }
                           object { Barre_rideau1 texture { Polished_Chrome } rotate <0,90,0> translate <-160,-15,-1130>        }
                           object { Barre_rideau2 texture { Polished_Chrome } rotate <0,45,0> translate <-160,-15,-160>         }
                           object { Rideau1       texture { T_rideau }        translate <-650,-R_height+5,0>                    }
                           object { Rideau2       texture { T_rideau }        translate <-450,-R_height+5,0>                    }
                           object { Rideau3       texture { T_rideau }        translate <-300,-R_height+5,-0>                   }
                           object { Rideau2       texture { T_rideau }        rotate <0,90,0> translate <-160,-R_height+5,-150> }
                           object { Rideau4       texture { T_rideau }        translate <-160,-R_height+5,-300>                 }
                           object { Rideau4       texture { T_rideau }        rotate <0,-90,0> translate <-1050,-R_height+5,0>  }
                          
                           }
                           

                              
                 
//----------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------  MISE EN SCENE     -------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------                  
//salle en elle même 
object { Room }
    

/*    
union {    
    //Piano
object { Piano scale 1.1 rotate <0,-20,0> translate <200,0,320> }
  
  
  
union {
    //Table
    union { 
        union{

object { Table scale 1 rotate <0,-80,0> translate <300,0,-50> }
object { Imac scale 1 rotate <0,20,0> translate <230,72,50> }
object { midi_keyboard scale 1 rotate <0,20,0> translate <210,72,-10> }
object { Enceinte_table scale 1.2 rotate <0,140,0> translate <290,71,15> }
object { Tapis_souris scale <1.5,1,1.5> rotate <0,100,0> translate <285,70.5,-15> }
object { Souris scale 2 rotate <0,150,0> translate <295,67,-30> }
             }
             
        union{
object { Table scale 1 rotate <0,-85,0> translate <411,0,-30> }
object { Imac scale 1 rotate <0,-5,0> translate <320,72,40> }
object { midi_keyboard scale 1 rotate <0,0,0> translate <310,72,-12> }
object { Enceinte_table scale 1.2 rotate <0,120,0> translate <390,71,35> }
object { Tapis_souris scale <1.5,1,1.5> rotate <0,100,0> translate <385,70.5,15> }
object { Souris scale 2 rotate <0,170,0> translate <395,67,0> }
             } 
             
        union{
object { Table scale 1 rotate <0,-110,0> translate <320,0,120> }
object { Imac scale 1 rotate <0,-190,0> translate <300,72,120> }
object { midi_keyboard scale 1 rotate <0,150,0> translate <285,72,185> }
object { Enceinte_table scale 1.2 rotate <0,-60,0> translate <222,71,105> }
object { Tapis_souris scale <1.5,1,1.5> rotate <0,70,0> translate <195,70.5,175> }
object { Souris scale 2 rotate <0,-30,0> translate <210,67,170> }
             } 
             
        union{
object { Table scale 1 rotate <0,-110,0> translate <430,0,150> }
object { Imac  scale 1 rotate <0,-170,0> translate <400,72,120> }
             }

        }
     //Fauteuils 
     union {
object { Fauteuil scale <1,0.85,1> rotate <0,-80,0> translate <280,0,-120> }
object { Casque scale 2 rotate <0,0,0> translate <190,55,-100> }


object { Fauteuil scale <1,0.85,1> rotate <0,-90,0> translate <400,0,-110> }
object { Casque scale 2 rotate <0,0,0> translate <387,55,-80> }

object { Fauteuil scale <1,0.85,1> rotate <0,-290,0> translate <170,0,260> }
object { Casque scale 2 rotate <90,70,-13> translate <300,131.5,375> }

object { Fauteuil scale <1,0.85,1> rotate <0,-290,0> translate <260,0,290> }
            }        
} 

    //Pied de micro
object { Pied_micro scale <1.7,2,1.7> rotate <0,-90,0> translate <500,0,10> }

    // Ampli
object { Ampli scale 1 rotate <0,90,0> translate <800,0,350> }
 
    //Guitare
object { Guitare scale 1.7 rotate <0,90,-14> translate <800,0,380> }
        }

*/
