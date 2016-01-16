#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

//CAMERA

camera { 
        location <0,150,-200> look_at <500,100,500>
        }                                                                                                                                                            
        
//LUMIERES

light_source {
           <0,1000,0>
           color White
             }

//TEXTURES

#declare T_Mur = texture { pigment { White } }


//MESHS

#declare Mur = object { box { <0,0,0> <1000,400,50> } }
#declare Mur_Joint = object { box { <0,0,0> <220,400,50> } }

#declare V_mur = object { box { <0,0,0> <200,340,100> } }

//ASSEMBLAGE

#declare Murs = union {    

                difference{
                
                object { Mur texture {T_Mur} }
                 
                object { V_mur texture {T_Mur} translate <450,40,-0.01> }
                object { V_mur texture {T_Mur} translate <750,40,-0.01> }
                 
                } 
                
                difference { 
                
                object { Mur texture {T_Mur} rotate <0,90,0> translate <1150,0,-150>} 
                
                object { V_mur texture {T_Mur } rotate <0,90,0> translate <1149.99,40,-190> }
                }
                
                object { Mur_Joint texture {T_Mur} rotate <0,45,0> translate <1000,0,0>}
                }
#declare fenetre = union {
                
                }
//MIS EN SCENE
 
 
    //Murs 
object { Murs translate <-300,0,600> }

    //Sol
plane {y, -1 pigment { Gray50} }

    //Plafond
//plane {y, 400 pigment { Gray50} }