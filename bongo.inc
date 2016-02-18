// this is the bongo file   


#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc" 

#include "T_materiaux.inc"

                   
#declare Tome_wood         = object{ Round_Cone(  <0,0,0>, 0.40    , <0,1.20,0>, 0.70 , 0.15, 0) texture{ T_Wood } } 
#declare tender_box        = object{ Round_Cone2( <0,0,0>, 0.70    , <0,1.00,0>, 0.40 , 0 )      texture{ T_Metal}  scale <1,-1,1>*0.15 rotate<0,0,-25> translate<0,0.9,0> }
#declare tender_screw      = object{ cylinder { <0,0,0>,<0,9.00,0>, 0.4  scale <1,1,1>*0.05 rotate<0,0,0> translate<0.06,0.9,0> texture{ T_Metal}  }}
#declare tender            = object{ union { object { tender_box} object { tender_screw}}}                        
#declare Middle_bar        = object{ Round_Box(<0,0.5,-0.25>,<1.5,1,0.25>, 0.05   , 0)   texture{T_piano_bois }}
#declare Skin              = object{ object {  Round_Cylinder  (<0,1 , 0>, <0,1.5,0>, 0.65 ,       0.20,   1)  texture{T_leatherskin }}} 
#declare Metal_ring_top    = object{ Round_Cylinder   (<0,1.1,0>, <0,1.3,0>, 0.75,       0.05,   1) texture{ T_Metal }}
#declare Metal_ring_bottom = object{ cylinder   {<0,0,0>, <0,1,0>, 0.45}  texture{T_Metal }}
#declare Tome              = object{ merge { 
                                            object{Tome_wood}
                                            object{Skin}
                                            object{Metal_ring_top}
                                            object{Metal_ring_bottom}
                                            object{tender translate x*0.65 rotate y*45 }
                                            object{tender translate x*0.65 rotate y*135}
                                            object{tender translate x*0.65 rotate y*225}
                                            object{tender translate x*0.65 rotate y*315}
                                           }
                                    }  
      
#declare Bongos = object{ merge {   object{Middle_bar} object {Tome } object {Tome translate x*1.6}}}

