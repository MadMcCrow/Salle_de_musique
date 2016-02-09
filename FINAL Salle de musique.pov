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

        //Hauteur de la structure
#local H = 400;
        //Rayon des articulations
#local R = 2 ;
        //Epaisseur de la fenetre                                                         
        s
#local E = 10 ;                 



//----------------------------------------------------------------------------------------------------------------------------
//-----------------------------------   ROOM         -------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------
#local R_height = 400;
#local R_depth_1 = 1200;
#local R_depth_2 = 1000;
#local R_width = 1200;

#declare Room_element_box = object {box { <0,-1,0>          , < R_width,R_height+1,R_depth_1>          }    texture {T_Mur}     }
#declare Room_ground_box  = object {box { <0,-2,0>          , < R_Width,0,R_depth_1>                   }    texture {T_Sol}     }
#declare Room_plafond_box = object {box { <0,,R_height,0>   , < R_Width+2,R_depth_1>                   }    texture {T_Plafond} }
#declare V_Room_edge_box  = object {box { <0,0,0>           ,< R_Width,R_height,R_depth_1 - R_depth_2> } rotate y*45 scale <2,2,2> translate <R_width, 0, R_depth2}
#declare Room             = object { difference  {
                                                 object {Room_element_box}
                                                 object {Room_ground_box}
                                                 object {Room_plafond_box}
                                                 object {V_Room_edge_box}
                                                 }
                                                 
                                      hollow}


/*
#declare Mur = object { box { <0,0,0> <1000,H,50> } }
#declare Mur_Joint = object { box { <0,0,0> <220,H,50> } }                           
#declare plafond = object { box { <0,0,0> <1206,0,1206> } }

#declare V_mur = object { box { <0,0,0> <200,H-60,100> } }
 
#declare Murs = union {    

                difference{
                
                object { Mur texture {T_Mur} }
                 
                object { V_mur texture {T_Mur} translate <450,40,-0.01> }
                object { V_mur texture {T_Mur} translate <750,40,-0.01> }
                 
                } 
                 
                
                object { Mur texture {T_Mur} rotate <0,90,0> translate <1150,0,-150>}
                
                
                difference {
                
                object { Mur_Joint texture {T_Mur} rotate<0,45,0> translate <1000,0,0>}
                
                object { V_mur texture {T_Mur} rotate<0,45,0> translate <1010,40,-10.01>}
                }
                
                object { plafond texture {T_Mur} translate <0,H,-1150>}
                object { plafond texture {T_woodenfloor} translate <0,0,-1150> }
                 
                }
#declare fenetre = union { 
                   object { Verre_fenetre translate <750,40,40> }

                           union { 
                           
                                 union{
                                 #local Nr = 1;     
                                 #local EndNr = 4; 
                                 #while (Nr<= EndNr) 
                                 object { Articulation_fenetre translate <950,((((H-60)/4)*Nr)+(40-(R/2)))+5,40> texture { T_Mur} }  
                                 #local Nr = Nr + 1;  
                                 #end }
                                 
                                 object { Contour_fenetre_l texture { T_Mur } translate <750,39,40-R> }
                                 object { Contour_fenetre_l texture { T_Mur } translate <750,H-31,40-R> }
                                 
                                 object { Contour_fenetre_L texture { T_Mur } translate <749,40,40-R> }
                                 object { Contour_fenetre_L texture { T_Mur } translate <951-E,40,40-R> }
                                 
                                 object { Contour_fenetre_L texture { T_Mur } translate <850-E,40,40-R> }
                                 object { Contour_fenetre_L texture { T_Mur } translate <850,40,40-R> }
                                 
                                 object { Loquet_fenetre texture { T_Mur} translate <851,40,40-R> }
                                 object { Verrou_fenetre1 texture { T_Mur} translate <851,150,40-R> }
                                 object { Verrou_fenetre2 texture { T_Mur} translate <851,157.5,34> }
                                 object { Verrou_fenetre3 texture {T_Mur} translate <851,157.5,32> }
                                 }    
                
                } 


#declare Room = box  

 
    //Murs 
object { Murs translate <-300,0,600> }

    //fenêtre
object { fenetre translate <-300,0,610-E> }
object { fenetre translate <-600,0,610-E> }
object { fenetre translate <-665,1,930> rotate <0,45,0> }

    //Rideaux
object { Rideaux translate <1000,H,590> }  



    //Exterieur
//object { exterieur scale <2,2,0> translate <0,0,1500> }    
   
   
   
   */
    //OBJET IMPORTEE!!!!
//----------------------------------------------------------------------------------------------------------------------------
//-----------------------------------   CAMERA LUMIERES  SCENE     -----------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------  
// atmospheric media can be generated by adding a media statement
// to the scene not attached to any specific object

box{
   <-600,200,-10>, <1200, 400, 1200>
   pigment { rgbt 1 } // clear
   hollow
   interior{
     media{
       scattering{ 1, 0.17 extinction 0.01}
       samples 100, 500  // min, max
     } // end media
   } // end interior
 } // end box



camera { perspective location <-600,200,-10>   right     x*image_width/image_height look_at <700,100,600> angle 60 }  

// sky --------------------------------------------------------------- 
// Create an infinite sphere around scene and allow any pigment on it
sky_sphere{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgb <0.25, 0.35, 1.0>*0.7]
                                     [0.50 rgb <0.25, 0.35, 1.0>*0.7]
                                     [0.70 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                        scale<1,1,1.5>*2.5  translate< 0,0,0>
                       }       
                    }
          





//light_source { <0,1000,0>   color White }        
//light_source {<0,500,700>   color White }
light_source {<00,390,-50>  color White }
light_source { <1000,1000,1000>   color White }        

#declare T_Glass =  material{   //-----------------------------------------------------------
        texture { pigment{ rgbf <0.98, 0.98, 0.98, 0.9> }
                  finish { diffuse 0.1 reflection 0.2  
                          specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
        interior{ ior 1.5 caustics 0.5
                } // end of interior ------------------------------------------
      } // end of material ----------------------------------------------------




//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------   MESHS     -----------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------  


        
            //MUR


            //FENETRE
#declare Verre_fenetre = object { box { <0,0,0> <200,H-60,E> } material { T_Glass }}  

#declare Articulation_fenetre = object { cylinder { <0,0,0> <0,200,10-E> R } rotate <0,0,90> }
#declare Contour_fenetre_L = object { Round_Box ( <0,0,0> <E,H-60,E> 0.125,0 ) }
#declare Contour_fenetre_l = object { Round_Box ( <0,0,0> <210,E,E> 0.125,0 ) }

#declare Loquet_fenetre = object { cylinder { <0,0,0> <0,H-60,0> R } }
#declare Verrou_fenetre1 = object { cylinder { <0,0,0> <0,15,0 > R+1 } }
#declare Verrou_fenetre2 = object { cylinder { <0,0,0> <0,5,0> R rotate <90,0,0> } }
#declare Verrou_fenetre3 = object { sphere{ <0,0,0>, 1 }  scale <3,4.5,1> } 

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
                           object { Barre_rideau1 texture { Polished_Chrome } translate <0,-15,-200> }
                           object { Barre_rideau1 rotate <0,90,0> texture { Polished_Chrome } translate <-160,-15,-1130> }
                           object { Barre_rideau2 rotate <0,45,0> texture { Polished_Chrome } translate <-160,-15,-160>}
                           
                           
                           object { Rideau1 texture { T_rideau } translate <-650,-H+5,0> }
                           object { Rideau2 texture { T_rideau } translate <-450,-H+5,0> }
                           object { Rideau3 texture { T_rideau } translate <-300,-H+5,-0> }
                           object { Rideau2 rotate <0,90,0> texture { T_rideau } translate <-160,-H+5,-150> }
                           object { Rideau4 texture { T_rideau } translate <-160,-H+5,-300> }
                           object { Rideau4 rotate <0,-90,0> texture { T_rideau } translate <-1050,-H+5,0> }
                          
                           }
                           

                              
                 
//----------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------  MISE EN SCENE     -------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------                  

    
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
    //Plafond 


    //Sol


