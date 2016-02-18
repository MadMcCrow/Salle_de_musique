
// PoVRay 3.7 Scene File "tambourin.inc"
// author:  Noe PERARD-GAYOT & Baptiste DRAPEAUD
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }   
#include "shapes.inc"
#include "shapes3.inc"
#include "T_materiaux.inc"

#declare V_hole    = object { cylinder { <0,0.22,0>,<0,0.78,0>, 0.52 }} 
#declare Cymbale   = object { difference { object {Round_Cone( <0,0,0>, 0.50, <0,0.20,0>, 0.20 , 0.05, 1) texture{ T_brass } scale<1,1,1>  rotate<0,0,0> translate<0,0.0,0>} cylinder { <0,-1,0>, <0,0.01,0>, 0.8}} }
#declare Cymbales  = object { union { object { Cymbale  scale y*-1 translate <0,0.45,0>} object { Cymbale translate <0,0.5,0>} object {cylinder { <0,0.2,0>,<0,0.8,0>, 0.05} } }} 
#declare tambourin = object {
        union { 
                object {
                        difference {
                                    cylinder { <0,0,0>,<0,1,0>, 2.0 } 
                                    cylinder { <0,-1,0>,<0,2,0>, 1.9 }
                                    union{ 
                                         #local Nr = 0;    
                                         #local EndNr = 5; 
                                         #while (Nr< EndNr) 
                                           object{ V_hole translate<1.95,0,0> rotate<0,Nr * 260/EndNr,0>}
                                         #local Nr = Nr + 1;  
                                         #end
                                         }
                                   }
                        texture {T_bois scale 0.050}
                       }
              union{ 
                     #local Nr = 0;    
                     #local EndNr = 5; 
                     #while (Nr< EndNr) 
                       object{ Cymbales translate<1.95,0,0> rotate<0,Nr * 260/EndNr,0>}
                     #local Nr = Nr + 1;  
                     #end 
                    }
              }        
        scale 12
}
                              