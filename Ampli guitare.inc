#include "shapes.inc"
#include "T_materiaux.inc"
           
//MATERIAUX 
              
        //Objets de base               
#declare Corps_ampli = Round_Box (<0,0,0> <52,44,27>, 1, 0  )

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
#declare Text =  text {ttf "timrom.ttf" "Amp 66" 0.5, 0 scale 3  }
  
                  

//ASSEMBLAGE DE L'AMPLI
#declare Ampli =union {
                
                difference {
                            object {Corps_ampli texture {Ampli_peau} }
                            
                            object {V_Grille translate <2,2,-0.0001> texture {Ampli_peau} }
                            object {V_Boutons translate <2,41.0001,21.0001> texture {Ampli_peau} } 
                             
                            }
                union {
                        object {Poignet_boite translate <15,44,15> texture {Gris_metal} } 
                        object {Poignet_boite translate <29,44,15> texture {Gris_metal} }
                        
                        difference {
                                    object {Poignet_cylindre1 translate <25,44,15> texture {T_Cuir_Ampli} }
                                    object {Poignet_cylindre2 translate <25,44,14.99999> texture {T_Cuir_Ampli} }
                                    }
                      }
                object {Bouton translate <46,38,24> texture {T_Plastic_NOIR } }
                object {Bouton translate <42,38,24> texture {T_Plastic_NOIR } }   
                object {Bouton_repere1 translate <46,44.5,24> texture {T_Plastic_BLANC} }
                object {Bouton_repere2 translate <42,44.5,24> texture {T_Plastic_BLANC} }
                
                object {Grille translate <2,2,1.5> texture {texture_Grille2} } 
                
                object {Text translate <4,38,1.2> texture {T_Cuir_Ampli} }
                scale 1.5
                 }
                             

           