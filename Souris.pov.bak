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

              
              

//TEXTURES: couleurs de l'objet, réflection... etc
#declare G = 0.05;
#declare T_Casque = texture { pigment { rgb <G,G,G> } }
                                             
//MATERIAUX 
              
        //Objets de base               
#declare Ecouteur =difference {
                             object { sphere { <0,0,0> 3 } texture {T_Casque} }
                             object { box { <0,0,0> <10,6,10> } texture { T_Casque } translate <-0.5 ,-3,-3>} 
                             }

#declare Lien_casque = difference { 
                              object{ Supertorus( 5, 0.35, /* Radius_Major, Radius_Minor*/ 1.00, 0.2, /* Major_Control, Minor_Control*/  0.001, 1.5) /* Accuracy, Max_Gradient) */texture{T_Casque} rotate <90,0,0> scale <0,1.1,2.5>}
                              object { box { <0,0,0> <15,15,15> } texture { T_Casque } translate <-6,-15,-3>}  
                              }
        //Objets invisibles qui vont permettrent de  créer les creux/relief...


                                  
                  

//ASSEMBLAGE DU CASQUE 
 #declare Casque = union {
                            object { Ecouteur translate <0,3,0> }
                            object { Ecouteur rotate <0,180,0> translate <7,3,0> }
                            object { Lien_casque translate <3.5,5,0> }
                         }

//MIS EN PLACE
object { Casque } 

// Sol
plane {y, -1 pigment {Gray50}}