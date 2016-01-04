#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc" 

//POINT DE VUE
camera {
        location <50,50,-80>
        look_at <12.5,20,18>
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
#declare Corps_enceinte = Round_Box (<0,0,0> <25,39,33>, 0.225, 0)
#declare Anneau_basse1 = torus { 10, 1 rotate <90,0,0>}
#declare Anneau_basse2 = torus { 8.6, 0.7 rotate <90,0,0>}
#declare Boule_basse = sphere {<0,0,0>,4}
#declare Boule_aigu = sphere {<0,0,0>,2}


        //Objets invisibles qui vont permettrent de  créer les creux/relief...
#declare V_Sphere_basse = sphere {<0,0,0>, 10 }
#declare V_Sphere_aigu = sphere {<0,0,0>, 7 }





//TEXTURES: couleurs de l'objet, réflection... etc
#declare Gris_clair = pigment { rgbf <0.3,0.3,0.3> }
#declare Gris_fonce = pigment { rgbf <0.1,0.1,0.1> }
#declare Bois_fonce = texture { pigment { rgbf <0.05,0.05,0.05> } normal { granite 1.5  scale 1} }
                                   
                                    
                  

//ASSEMBLAGE DE L'ENCEINTE
#declare Enceinte = 
                    // On pose la partie basse et aigu de l'enceinte                                                                             
                    difference {
                      object {Corps_enceinte texture {Bois_fonce } }
                            
                      object {V_Sphere_basse translate <12.5,13,-5.0000001> texture {pigment { White } } }
                      object {V_Sphere_aigu translate <12.5,32,-5.0000001> texture {pigment { White } } }           
                    }
                     
                     //Partie basse
                    object {Anneau_basse1 translate <12.5,13,0> texture { pigment { Gris_fonce } } }
                    object {Anneau_basse2 translate <12.5,13,0> texture { pigment { Gris_clair } } }
                    object {Boule_basse translate <12.5,13,8> texture { pigment { Gris_fonce } } } 
                    
                    //Partie Haute
                    object {Boule_aigu translate <12.5,32,3> texture { pigment { Gris_fonce } } }
                   
                    
          
                    
                     

//MIS EN PLACE
object { Enceinte } 

// Sol rouge
plane {y, -1 pigment {Gray50}}
       





           