#include "T_materiaux.inc"
#include "shapes.inc"


             
        //Objets de base 
#declare Corps_souris = difference {
                                object {Spheroid(<0,2.00,0>,<2.0,1.2,2.5> ) texture{ T_Souris } scale<1,1,1>  rotate<0,0,0> translate<0,0,0>}
                                object {box {<0,0,0> <6,2,6>} texture {T_Souris} translate <-2,0,-3.5> }
                                } 

#declare Boule_souris = object { sphere { <0,0,0> 0.2 } texture {T_Gris_clair} }        


                                  
                  

//ASSEMBLAGE DE LA SOURIS 
#declare Souris = union { 
                    object { Corps_souris }
                    object { Boule_souris translate <0,3,-1.5> }
                    }
