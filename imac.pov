#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"
#include "shapes3.inc"
 

//POINT DE VUE
camera {
        location <0,60,-100>
        look_at <30,30,0>
        }
           
           
      
      
           
//LUMIERES                                                                                                               

light_source {
              <100,1000,-100>
              color White
              }
light_source {
              <0,10,-100>
              color White
              }
              
              


             
#declare L = 5 ;                       
  
        //Objets de base               

#declare Ecran_corps    = object { Round_Box ( <0,0,0> <62,49,0> 3,0 )         texture { T_Ecran_corps   }                                        }
#declare Ecran_surface1 = object { Round_Box ( <0,0,0> <61.999,38.999,0> 3,0 ) texture { T_Ecran_surface }                   translate <0,10,0>   }
#declare Ecran_surface2 = object { box       { <0,0,0> <62,35,0> }           texture { T_Ecran_surface }                   translate <0,10,0>   }   
#declare Logo           = object { box       { <0,0,0> <L,L,0>  }              texture { T_Logo }                                                 }
#declare Ecran_ecran    = object { box       { <0,0,0> <58,33,0>  }            texture { T_ecran }                                                 }

#declare Truc_chelou_base = object{ Round_Conic_Prism( 9.5, 9, 4, 8, 0.10, 0 ) rotate <180,0,0> }  
 
  


        //Objets invisibles qui vont permettrent de  créer les creux/relief...

#declare V_Ecran_corps   = object { box { <0,0,0> <65,52,10>  } texture { T_Ecran_corps } }
#declare V_Ecran_surface = object { box { <0,0,0> <65,10,4.5> } texture { T_Ecran_corps } }

#declare V_Truc_chelou_base = object { box { <0,0,0> <50,10,50> } texture { T_Ecran_corps } translate <-20,-22,-5> }
#declare V_Truc_chelou = object{ Round_Conic_Prism( 9.5, 9, 4, 8, 0.10, 0 ) rotate <180,0,0> scale <1,1,1.01> }







                                   
                                    
                  

//ASSEMBLAGE DE L'IMAC 

#declare Ecran = union {  
                        object { Logo translate <28.5,2.5,0.49> }
                        object { Ecran_ecran translate <2,14,0.49> }
                        difference {
                                    object { Ecran_corps                                         }
                                    object { V_Ecran_corps    translate <-1.51,-1.51,-9.4999999> }
                                    }
                                    
                        difference { 
                                    object { Ecran_surface1   translate <0.001,0,-0.001>                                }
                                    object { V_Ecran_corps    translate <0,0,-9.5>        texture { T_Ecran_surface }   }
                                    object { V_Ecran_surface  translate <0,0,-3.000001>                                 }
                                    }
                        object { Ecran_surface2   translate <0,0,0.499> }
                        rotate <10,0,0>                                                    
                        }            
#declare Support_chelou = union { 
                                
                                difference {
                                object { Truc_chelou_base texture { T_Ecran_corps }   }
                                object { V_Truc_chelou_base texture { T_Ecran_corps }   }
                                
                                difference{
                                object { V_Truc_chelou texture { T_Ecran_corps }   }
                                object { V_Truc_chelou_base texture { T_Ecran_corps }   }
                                translate <1,0.5,-0.01> }
                                translate<0,11,0> rotate <0,90,0> }
                                                        
                                }
#declare Imac = union {
                        object { Ecran translate <0,6,0>}
                        object {Support_chelou translate <15.5,0,3> scale <1.6,0,0>}
                      }
                
                             

//MIS EN PLACE
object { Imac } 

// Sol
plane {y, -1 pigment {Gray50}}
       





           