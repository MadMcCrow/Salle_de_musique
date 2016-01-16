#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc" 

//POINT DE VUE
/*camera {
        location <200,100,200>
        look_at <50,35,50>
        }*/
           
           
      
      
           
//LUMIERES      
/*light_source {
              <0,1000,-100>
              color White
              }
light_source {
              <0,1000,1000>
              color White
              }
light_source {
              <25,1000,-52>
              color White
              }*/

             
                                             
//MATERIAUX 
              
        //Objets de base               
#declare Pied_table = Round_Box (<0,0,0> <10,65,10>, 0.2, 0  )
#declare Dessus_table = Round_Box (<0,0,0> <110,5,110>, 0.2, 0  )
#declare Cale_table = Round_Box (<0,0,0> <80,10,10>, 0.2, 0  )





//TEXTURES: couleurs de l'objet, réflection... etc
#declare T_bois = texture { pigment {Tan_Wood} finish {  diffuse 0.46 phong 0.0005} scale 1.1}
                                   
                                    
                  

//ASSEMBLAGE DE LA TABLE
#declare Pieds_table = union {
                              object {Pied_table}
                              object {Pied_table translate <90,0,0> }  
                              object {Pied_table translate <90,0,90> }
                              object {Pied_table translate <0,0,90> }  
                             }
                              
#declare Cales_table = union {
                               object {Cale_table translate <10,55,0> }
                               object {Cale_table translate <10,55,90> }
                               object {Cale_table translate <-90,55,0> rotate <0,90,0> }
                               object {Cale_table translate <-90,55,90> rotate <0,90,0> }                              
                              }



#declare Table = union {
                object { Pieds_table texture { T_bois } }
                object { Dessus_table translate <-5,65,-5> texture { T_bois } }
                object { Cales_table texture { T_bois } }
                }
                           


                     

//MIS EN PLACE
object { Table }

// Sol 
/*plane {y, -1 pigment {Gray50}}*/
       





           