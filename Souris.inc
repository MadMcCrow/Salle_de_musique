#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

/*//POINT DE VUE
camera {
        location <20,10,-20>
        look_at <0,5,0>
        }
           
           
           
           
//LUMIERES                                                                                                               

light_source {
              <100,1000,-100>
              color White
              }     */

              
              

//TEXTURES: couleurs de l'objet, réflection... etc
#declare G = 1;
#declare T_Souris = texture { pigment { rgb <G,G,G> } finish {diffuse 0.9} }
                                             
//MATERIAUX 
              
        //Objets de base 
#declare Corps_souris = difference {
                                object {Spheroid(<0,2.00,0>,<2.0,1.2,2.5> ) texture{ T_Souris } scale<1,1,1>  rotate<0,0,0> translate<0,0,0>}
                                object {box {<0,0,0> <6,2,6>} texture {T_Souris} translate <-2,0,-3.5> }
                                } 

#declare Boule_souris = object { sphere { <0,0,0> 0.2 } texture { pigment {Grey} } }        


                                  
                  

//ASSEMBLAGE DE LA SOURIS 
#declare Souris = union { 
                    object { Corps_souris }
                    object { Boule_souris translate <0,3,-1.5> }
                    }

//MIS EN PLACE
object { Souris } 

// Sol
//plane {y, -1 pigment {Gray50}}