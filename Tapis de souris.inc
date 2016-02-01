#include "T_materiaux.inc"
#include "shapes.inc"

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

//MATERIAUX 
              
        //Objets de base 
        
#declare Tapis = object { Round_Box (<0,0,0> <15,1,15>,0.25,0) texture {T_Tapis_souris} }
#declare Contour_Tapie = object { Round_Box (<0,0,0> <15.1,0.9,15.1>,0.25,0) texture {T_TissuNoir } } 

                                  
                  

//ASSEMBLAGE DU TAPIE DE SOURIS 
#declare Tapis_souris = union { 
                                object { Tapis }
                                object { Contour_Tapie translate <-0.05,0.05,-0.05>}
                                }


// Sol
//plane {y, -1 pigment {Gray50}}