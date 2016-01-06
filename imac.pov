#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"
 

//POINT DE VUE
camera {
        location <50,60,-60>
        look_at <26,22,18.5>
        }
           
           
      
      
           
//LUMIERES      
light_source {
              <0,1000,-100>
              color White
              }


             
                                             
//MATERIAUX 
              
        //Objets de base               
#declare Ecran_corps = object{ Round_Box(<0,0,0>,<64,51,3>,  5, 0) rotate <35,0,0> translate <0,5,0>} 
        
         


        //Objets invisibles qui vont permettrent de  créer les creux/relief...
#declare V_Ecran_corps = object { Round_Box(<0,0,0>,<64,51,3>,  0.125, 0) rotate <35,0,0> translate <0,15,0> }





//TEXTURES: couleurs de l'objet, réflection... etc


                                   
                                    
                  

//ASSEMBLAGE DE L'IMAC 

#declare Ecran = union {
                        difference {
                                    object { Ecran_corps }
                                    object { V_Ecran_corps }
                                    }
                        }



#declare Imac = union {
                        object { Ecran texture { pigment { Red } } }
                      }
                
                             

//MIS EN PLACE
object { Imac } 

// Sol
plane {y, -1 pigment {Gray50}}
       





           