#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

//POINT DE VUE
/*camera {
        location <20,10,-30>
        look_at <10,5,0>
        }
           
           
           
           
//LUMIERES                                                                                                               

light_source {
              <100,1000,-100>
              color White
              } */

              
              

//TEXTURES: couleurs de l'objet, réflection... etc
#declare T_Tapie_souris = texture { pigment { Blue } normal {wrinkles 20 scale 0.2} }
                                             
//MATERIAUX 
              
        //Objets de base 
        
#declare Tapie = object { Round_Box (<0,0,0> <15,1,15>,0.25,0) texture {T_Tapie_souris} }
#declare Contour_Tapie = object { Round_Box (<0,0,0> <15.1,0.9,15.1>,0.25,0) texture {pigment { Black } } } 

                                  
                  

//ASSEMBLAGE DU TAPIE DE SOURIS 
#declare Tapie_souris = union { 
                                object { Tapie }
                                object { Contour_Tapie translate <-0.05,0.05,-0.05>}
                                }

//MIS EN PLACE
object { Tapie_souris scale <0,0.4,0> } 
              
// Sol
//plane {y, -1 pigment {Gray50}}