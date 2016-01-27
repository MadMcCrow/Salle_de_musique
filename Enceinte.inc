#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"
#include "T_materiaux.inc"
                                            
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


//ASSEMBLAGE DE L'ENCEINTE
#declare Enceinte = union{
                    // On pose la partie basse et aigu de l'enceinte                                                                             
                    difference {
                      object {Corps_enceinte texture { T_Bois_fonce } }
                            
                      object {V_Sphere_basse translate <12.5,13,-5.0000001> texture {T_Plastic_BLANC } }
                      object {V_Sphere_aigu translate <12.5,32,-5.0000001> texture {T_Plastic_BLANC } }           
                    }
                     
                     //Partie basse
                    object {Anneau_basse1 translate <12.5,13,0> texture { T_Gris_fonce } }
                    object {Anneau_basse2 translate <12.5,13,0> texture { T_Gris_clair } }
                    object {Boule_basse translate <12.5,13,8> texture {T_Gris_fonce  } } 
                    
                    //Partie Haute
                    object {Boule_aigu translate <12.5,32,3> texture { T_Gris_fonce } } 
                    }
                   
                    
          
                    
                     

//MIS EN PLACE
object { Enceinte }




           