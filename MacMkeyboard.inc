
// PoVRay 3.7 Scene File "MacMkeyboard.pov" this is   ""MacMkeyboard.inc"
// author:  Noe PERARD-GAYOT & Baptiste DRAPEAUD
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }   
#include "shapes.inc"
#include "shapes3.inc"
#include "T_materiaux.inc"


#declare body_element = object {
                                difference {
                                            object{ Round_Box(<0,-1,0>,<7,1,1.2>, 0.25   , 1)  }
                                            object{ box {<-1,0.18,-1>,<11,2,2> } }
                                            object{ box {<-1,-2,-1>,<11,0,2> } }
                                            object{ box {<-1,-2,1>, <11,2,2> } }
                                            }
                               }

#declare touche  = object { Round_Box(<0,0,0>,<0.23,0.18,0.23>, 0.02   , 1)  texture { T_Plastic_BLANC }}
#declare touches = object {
                            union{ 
                             #local NrX = 0;     
                             #local EndNrX = 22;
                             #while (NrX< EndNrX) 
                                // inner loop
                                #local NrZ = 0;    
                                #local EndNrZ = 3;
                                #while (NrZ< EndNrZ) 
                                       object{touche translate<NrX*0.30, 0, NrZ*0.30>} 
                                #local NrZ = NrZ + 1;  
                                #end
                             #declare NrX = NrX + 1;  
                             #end
                            translate<0.2,0.05,0.2>
                            }
                          }



#declare Keyboard = object { union { 
                                    object {
                                            merge {                                                   
                                                    cylinder { <0,0,0>,<7,0,0>, 0.16  translate  <0,0.16,1.0> }
                                                    object { body_element rotate x*-8}
                                                    }
                                             texture { T_Ecran_corps}
                                            }
                                    object {touches rotate x*-8}
                                    }
                             }
                          