// PoVRay 3.7 Scene File "Basket.pov" this is "Basket.inc"
// author:  Noe PERARD-GAYOT & Baptiste DRAPEAUD
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }}
#include "T_materiaux.inc"
#include "shapes.inc"    

#declare foot   = object { cylinder{ <0,0.0,0>,  <0,2.8,0>, 0.5  rotate <0,0,1> translate <5.8,0,0>} }

#declare basket = object{
                        merge {
                        difference {
                                     
                                        cone { <0,0.0,0>, 5.6, <0,1.5,0>, 6.0 translate y*1.2}
                                                                                
                                    cone { <0,0.2,0>, 5.3, <0,2.0,0>, 5.8 translate y*1.2}
                        }
                        object {foot  rotate y*(90+45) }
                                        object {foot  rotate y*(90*2+45) }
                                        object {foot  rotate y*(90*3+45) }
                                        object {foot  rotate y*(90*4+45) }
                        }
                        texture {T_piano_bois scale 2}
                        scale 15  //bottom of the basket is at  25.5
                        }
                        