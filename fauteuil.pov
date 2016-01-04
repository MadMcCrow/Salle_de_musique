#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "shapes3.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc" 

//POINT DE VUE
camera {
        location <200,100,-40>
        look_at <25,32.5,45>
        }
           
           
      
      
           
//LUMIERES      
light_source {
              <0,1000,-100>
              color White
              }
light_source {
              <0,1000,1000>
              color White
              }
light_source {
              <200,10,-52>
              color White
              }

             
                                             
//MATERIAUX 
              
        //Objets de base               
#declare Pied_fauteuil = object{ Round_Cone( <0,0,0>,0.25, <0,1.5,0>, 0.35, 0.05, 0) scale <10,10,10> } 
#declare Contour_fauteuil_box = Round_Box(<0,0,0>,<50,65,90>, 0.125, 0)  
#declare Contour_fauteuil_cylindre = Round_Cylinder(<0,0,0>,<0,65,0>,45,0.2,0)

#declare Coussinet = cylinder { <0,0,0> <0,50,0>,5 rotate <0,0,90> }
#declare Coussinet_arrondi = torus {40,5}
#declare Coussinet_hauteur = cylinder { <0,0,0> <0,65,0>,5 rotate <0,0,0> }
#declare Coussinet_box =  Round_Box(<0,0,0>,<6,13,80>, 0.9, 0)
#declare Coussinet_boule = sphere { <0,0,0>, 5 }

#declare Coussin_box = Round_Box(<0,0,0>,<50,20,70>, 2, 0)
#declare Coussin_cylindre = Round_Cylinder(<5,0,35>,<5,20,35>,35,1.5,0)


        //Objets invisibles qui vont permettrent de  créer les creux/relief...
#declare V_Contour_fauteuil_box = Round_Box(<0,0,0>,<70,70,70>, 0.125, 0)
#declare V_Contour_fauteuil_cylindre = Round_Cylinder(<0,0,0>,<0,70,0>,35,0.20,0)
#declare V_Coussinet = box { <0,0,0> <50,100,100> }
 





//TEXTURES: couleurs de l'objet, réflection... etc
#declare Laine = texture { pigment { Flesh} normal { wrinkles 0.5 scale 0.5}  }
#declare T_pied = texture { pigment { DMFWood5} }

                                   
                                    
                  

//ASSEMBLAGE Du Fauteuil

#declare Coussin = union { object {Coussin_box }
                           object {Coussin_cylindre}
                         }
                         
                         
            //Assemblage des pieds du fauteuil
#declare Pieds_fauteuil = union {
                          object {Pied_fauteuil translate <-15,0,20> }
                          object {Pied_fauteuil translate <-15,0,65> }
                          object {Pied_fauteuil translate <45,0,5> }
                          object {Pied_fauteuil translate <45,0,85> }
                          }  


            //Assemblage du corps du fauteuil
#declare Corps_fauteuil =   difference {

                            union {  
                            object { Contour_fauteuil_cylindre translate <0,0,45>}
                            object { Contour_fauteuil_box}
                            object { Coussinet translate <50,65,5>}
                            object { Coussinet translate <50,65,85>}
                            object { Coussinet_hauteur translate <50,0,5>}
                            object { Coussinet_hauteur translate <50,0,85>}
                            object { Coussinet_box translate <48.5,0,5>}
                            object { Coussinet_boule translate <50,65,5>}
                            object { Coussinet_boule translate <50,65,85>}
                            
                            
                                difference {
                                object { Coussinet_arrondi translate <0,65,45>}
                                
                                object { V_Coussinet translate <0,0,0.00001>} 
                                }
                                  
                            }
                            
                            object{ V_Contour_fauteuil_box translate <0.0001,13.0001,10>} 
                            object{ V_Contour_fauteuil_cylindre translate <0,13.00001,45>}
                            }

//MIS EN PLACE
object { Corps_fauteuil translate <0,15,0> texture {Laine} }
object { Pieds_fauteuil texture {T_pied} }
object { Coussin translate <5,28,10> texture {Laine} }
 


// Sol
plane {y, -1 pigment {Gray50}}
       





           