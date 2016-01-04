#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc" 

//POINT DE VUE
camera {
        location <30,30,30>
        look_at <0,10,0>
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
              <25,10,-52>
              color White
              }

             
                                             
//MATERIAUX 
              
        //Objets de base               
#declare Cone_base = object{ Round_Cone( <0,0,0>,0.5, <0,2,0>, 0.1, 0.05, 0) scale <10,10,10> }
#declare Cone_enceinte = object{ Round_Cone( <0,0,0>,0.5, <0,0.5,0>, 0.1, 0.05, 0) scale <10,10,10> rotate <0,0,70>}
#declare Boule = object { sphere {<0,0,0>, 1} }
#declare Anneau_enceinte1 = object { cylinder { <0,0,0> <0,0.00005,0>, 0.4 } scale 10 rotate <0,0,70>}
#declare Anneau_enceinte2 = object { cylinder { <0,0,0> <0,0.05,0>, 0.1 } scale 10 rotate <0,0,70>}




                                                                                             

        //Objets invisibles qui vont permettrent de  créer les creux/relief...
#declare V_Anneau_enceinte = object { cylinder { <0,0,0> <0,0.01,0>, 0.4 } scale 10 rotate <0,0,70>}






//TEXTURES: couleurs de l'objet, réflection... etc
#declare T_grille_Enceinte = texture { pigment { checker color Gray50 color rgb <0.35,0.35,0.35> } scale 0.1}
                                   
                                    
                  

//ASSEMBLAGE DE L'ENCEINTE

                       //Assemblage du lien de boule
#declare Boule_lien =  union {
                       object {Boule}                 
                       object {Boule translate <0.75,1.75,0> }
                       object {Boule translate <2.25,3,0> }
                       object {Boule translate <4,3.5,0>  }
                       object {Boule translate <5.75,3.5,0>  }
                       }
                       
                       //Assemblage du haut de l'enceinte
#declare Enceinte_haute = union { 
                                difference {
                                              
                                              object { Cone_enceinte translate <0,0,0> texture { pigment { White } } }
                                               

                                              object {V_Anneau_enceinte translate <0.00001,0,0> }
                                              
                                            }
                                              
                                              object { Anneau_enceinte1 translate<-0.05,0,0> texture { T_grille_Enceinte } }
                                              object { Anneau_enceinte2 translate <0.0005,0,0> texture { pigment { White } } }
                                              
                                              
                                 }
                                              
                                  
                         
                       
                   
#declare Enceinte_table = 
                               object { Cone_base texture { pigment { White } } }
                               object { Enceinte_haute translate <11,22,0> texture { pigment { White } } } 
                               
                               //Mise en place de lien de boule entre les deux parties
                               
                               object { Boule_lien translate <0,20.5,0> texture {pigment { White } } }
                    
          
                    
                     

//MIS EN PLACE
object { Enceinte_table }

// Sol 
plane {y, -1 pigment {Gray50}}
       





           