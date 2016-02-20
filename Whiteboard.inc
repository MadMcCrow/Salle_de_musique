#include "shapes.inc"
#include "T_materiaux.inc"


#declare Whiteboard_foot =object { merge { 
cylinder { <0,0,0>,<0,6.00,0>, 0.10   translate<0,0,0>}
object{ Round_Box(<-0.15,0,-1>,<0.15,0.3,1>, 0.02   , 1)  }
}
texture{T_Plastic_BLANC}
}




#declare Whiteboard_itself = object{
                                    difference {
                                                box { <0,0,0>,     < 6.00, 4.00, 0.05>  texture {T_Metal}          scale <1,1,1> rotate<0,0,0> translate<0,2,-0.05>} 
                                                box { <0.1,0.1,-1>,< 5.90, 3.90, 0.02>  texture {T_Whiteboard}  scale <1,1,1> rotate<0,0,0> translate<0,2,-0.05>}
                                                }
                                    } 
                                    
#declare Whiteboard = object {merge { 
object {Whiteboard_foot translate x*-0.05}
object {Whiteboard_foot translate x*+6.05}
object {Whiteboard_itself  }  
}
scale 40
}                                 
                                    