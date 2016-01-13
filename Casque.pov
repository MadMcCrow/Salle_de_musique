#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

//POINT DE VUE
camera {
        location <20,10,-20>
        look_at <0,5,0>
        }
           
           
           
           
//LUMIERES                                                                                                               

light_source {
              <100,1000,-100>
              color White
              }

              
              

//TEXTURES: couleurs de l'objet, r�flection... etc


#declare T_Mousse = texture{ pigment{ color rgb< 1, 1, 1>*0.08}
                 normal { wrinkles 0.75 scale 0.1  }
                 finish { phong 1 reflection{ 0.05 } }
               }
               
#declare T_Cuir = texture{ pigment{ color rgb< 1, 1, 1>*0.1}
                 normal { agate 0.05 scale 0.15 rotate<0,0,0> }
                 finish { phong 0.1 reflection{ 0.0 } }
               } 

#declare T_Casque = texture { pigment{ color rgb< 1, 1, 1>*0.15 }
                     finish { phong 1 reflection 0.1}
                 }
#declare T_Metal = texture{ Chrome_Metal
                   normal { bumps 0.01 scale 0.05 } 
                   finish { phong 1 }
                } 

          
                                           
//MATERIAUX 
              
        //Objets de base               
#declare Ecouteur = object {
                        merge {
                                difference {
                                            object { sphere { <0,0,0> 3 } }
                                            object { box { <0,0,0> <10 ,6,10 > }  translate <-0.5 ,-3,-3>}
                                            cylinder { <-5,0,0>,<-2.5,0,0>, 3 }
                                            cylinder { <-5,0,0>,<-2.4,0,0>, 1.5 }                             
                                           }
                               torus { 2.5,0.60 texture {T_Mousse} scale <1,1,1> rotate<0,0,90> translate<0,0,0> } 
                          }
                          texture {T_Casque}
                          }          


#declare Metal_Strip =  difference { 
                                             object{ Supertorus( 5, 0.09, /* Radius_Major, Radius_Minor*/ 1.00, 0.2, /* Major_Control, Minor_Control*/  0.001, 1.5) /* Accuracy, Max_Gradient) */ rotate <90,0,0> scale <1,1.2,2.5>}
                                             object { box { <0,0,0> <15,15,15> } translate <-6,-15,-3>}  
                                           }
                                           
#declare Metal_Band =  object {
                               union {
                                      object { Metal_Strip translate <3.5,5, 0 >  rotate < 5,0,0> }
                                      object { Metal_Strip translate <3.5,5,0.3> rotate <-5,0,0> }
                                     }
                               translate <0,0,-0.2>
                               texture{T_Metal}
                              }
                               
#declare knot_base =  object {
                          union{
                                cylinder { <-4.7,2.5,0>,<-4,2.2,0>, 0.9 }
                               }
                        }
                        
#declare knot=  object {
                          union{
                                 object { knot_base }
                                 object { knot_base scale <-1,1,1>}
                                texture {T_Casque}
                               }
                        }    
                             
#declare Strap =  object {difference { 
                                             object{ Supertorus( 4.3, 0.2, /* Radius_Major, Radius_Minor*/ 1.00, 0.5, /* Major_Control, Minor_Control*/  0.001, 1.5) /* Accuracy, Max_Gradient) */ rotate <90,0,0> scale <1,1,4.5> }
                                             object { box { <0,0,0> <15,15,15> } translate <-6,-14,-3>}  
                                           }
                   texture{T_Cuir}                         
                   translate <0,0.3,0> }

                                  
#declare Lien_casque = object { 
                            union {
                                    object { Metal_Band  }
                                    object { Metal_Band  }
                                    object { Strap translate <3.5,5,0> }
                                    object { knot translate <3.5,5,0> }
                                  }
                              }               
 
 #declare Casque = union {
                            object { Ecouteur translate <0,3,0> }
                            object { Ecouteur scale <-1,1,1> translate <7,3,0> }
                            object { Lien_casque }   
                         }

//MIS EN PLACE
object { Casque } 

// Sol
plane {y, -1 pigment {Gray50}}