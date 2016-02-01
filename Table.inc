#include "shapes.inc"
#include "T_materiaux.inc"

       
#declare Pied_table = Round_Box (<0,0,0> <10,65,10>, 0.2, 0  )
#declare Dessus_table = Round_Box (<0,0,0> <110,5,110>, 0.2, 0  )
#declare Cale_table = Round_Box (<0,0,0> <80,10,10>, 0.2, 0  )

//ASSEMBLAGE DE LA TABLE
#declare Pieds_table = union {
                              object {Pied_table}
                              object {Pied_table translate <90,0,0> }  
                              object {Pied_table translate <90,0,90> }
                              object {Pied_table translate <0,0,90> }  
                             }
                              
#declare Cales_table = union {
                               object {Cale_table translate <10,55,0> }
                               object {Cale_table translate <10,55,90> }
                               object {Cale_table translate <-90,55,0> rotate <0,90,0> }
                               object {Cale_table translate <-90,55,90> rotate <0,90,0> }                              
                              }



#declare Table = union {
                object { Pieds_table texture { T_bois } }
                object { Dessus_table translate <-5,65,-5> texture { T_bois } }
                object { Cales_table texture { T_bois } }
                }