#include "T_materiaux.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "shapesq.inc"


#declare Micro = union{ 
                                    object { cylinder { <0,0,0> <0,3,0> 0.7 } texture { T_Metal_Gris_clair}  }
                                    object { Round_Cone( <0,0,0> , 1.8 , <0,7,0>  2, 0.6,0 ) texture { T_Metal_Gris_fonce } translate <0,3,0>  }
                                    object { Round_Cylinder ( <0,0,0> <0,6,0> 1.7,1,0 ) texture {T_Micro_grill } translate <0,8,0> }
                                    rotate <-90,90,0>
    
                                 }  
                                 
                                 
       