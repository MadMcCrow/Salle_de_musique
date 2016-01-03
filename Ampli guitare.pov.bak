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
#declare Corps_ampli = box {<0,0,0> <52,44,27>  }

       //Poignet de l'ampli
#declare Poignet_boite = box {<0,0,0> <6,0.5,4> } 
#declare Poignet_cylindre1 = cylinder {<0,0,0> <0,4,0>,5  rotate <90,0,0> }
#declare Poignet_cylindre2 = cylinder {<0,0,0> <0,4.0001,0>,4 rotate <90,0,0> }

       //Bouton de l'ampli
#declare Bouton = cylinder {<0,0,0> <0,6.5,0> 1}
#declare Bouton_repere1 = cylinder {<0,0,0> <0,1,0> 0.1 rotate <90,10,0>}
#declare Bouton_repere2 = cylinder {<0,0,0> <0,1,0> 0.1 rotate <90,50,0>}


        //Grille de l'ampli
#declare Grille = box {<0,0,0> <48,40,0.1> }
  
#declare Coussinet_l = cylinder {<0,0,0> <0,27,0> 1 rotate <90,0,0>}
#declare Coussinet_L = cylinder {<0,0,0> <50,0,0> 1 rotate <90,0,0>}

        //Objets invisibles qui vont permettrent de  créer les creux/relief...
#declare V_Grille = box {<0,0,0> <48,40,2> }
#declare V_Boutons = box {<0,0,0> <48,3,6>  } 

        //Texte
#declare Text =  text {ttf "timrom.ttf" "ProutAmp 66" 0.5, 0
scale 3  }





//TEXTURES: couleurs de l'objet, réflection... etc
#declare Gris = pigment {rgbf < 0.1,0.1,0.1> }
#declare Gris_metal = texture {pigment {rgbf < 0.3,0.3,0.3> } finish {ambient 0.1 diffuse 0.9 phong 1 }   }
#declare texture_Grille = pigment {
                            pavement
                                number_of_sides 4  number_of_tiles 1  pattern 1 
                                exterior 0  interior 0  form 1  
#declare Cuir = pigment {rgbf <0.5,0.35,0.1>}
   
 }
#declare texture_Grille2 = pigment{ checker //2 couleurs/textures
         color White
         color Black
         scale 0.3 } 
#declare Blanc = pigment {White}

                                   
                                    
                  

//ASSEMBLAGE DE L'AMPLI
#declare Ampli =
                
                difference {
                            object {Corps_ampli texture {Gris} }
                            
                            object {V_Grille translate <2,2,-0.0000001> texture {Gris} }
                            object {V_Boutons translate <2,41.0001,21.0001> texture {Gris} } 
                             
                            }
                union {
                        object {Poignet_boite translate <15,44,15> texture {Gris_metal} } 
                        object {Poignet_boite translate <29,44,15> texture {Gris_metal} }
                        
                        difference {
                                    object {Poignet_cylindre1 translate <25,44,15> texture {Cuir} }
                                    object {Poignet_cylindre2 translate <25,44,14.99999> texture {Cuir} }
                                    }
                      }
                object {Bouton translate <46,38,24> texture {pigment {Black} } }
                object {Bouton translate <42,38,24> texture {pigment {Black} } }   
                object {Bouton_repere1 translate <46,44.5,24> texture {Blanc}  }
                object {Bouton_repere2 translate <42,44.5,24> texture {Blanc} }
                
                object {Grille translate <2,2,1.5> texture {texture_Grille2} } 
                
                object {Text translate <4,38,1.2> texture {Cuir} }
                
                             

//MIS EN PLACE
object { Ampli } 

// Sol rouge
plane {y, -1 pigment {Gray50}}
       





           