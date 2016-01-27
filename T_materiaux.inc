//includes that may be usefull
#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

// material file for the scene and object in salle_de_music

//clavier midi
#declare T_Plastic_NOIR = texture { pigment{ color rgb< 1, 1, 1>*0.10 }
finish { phong 1 reflection 0.00 }
} // end of texture


#declare T_Plastic_BLANC = texture{ pigment{ color rgb< 1, 1, 1> }
finish { phong 1 reflection 0.00 }
} 


//piano de dos

#declare T_piano_bois = texture { pigment {DMFWood5} finish {ambient 0.1 phong 1 diffuse 0.9 } }
#declare T_piano_interieur = texture { pigment {DMFWood4} finish {ambient 0.1 phong 1 diffuse 0.9 } }
        
//Ampli
#declare Gris = pigment {rgbf < 0.5,0.5,0.5> }  
#declare Ampli_peau =texture { pigment {rgbf < 0.05,0.05,0.05> }   normal { marble 1.5 scale 0.8 turbulence 1.0}}
#declare Gris_metal = texture {pigment {rgbf < 0.3,0.3,0.3> } finish {ambient 0.1 diffuse 0.9 phong 1 }   } 
#declare Cuir = texture { pigment {rgbf <0.5,0.35,0.1>} normal { bozo 3.00 scale 0.1} }
#declare texture_Grille2 = pigment{ checker color White color Black scale 0.3 } 
#declare Blanc = pigment {White}

                                   
                                   
//casque
#declare T_Mousse = texture{ pigment{ color rgb< 1, 1, 1>*0.08}
                 normal { wrinkles 0.75 scale 0.1  }
                 finish { phong 1 reflection{ 0.05 } }
               }
               
#declare T_Cuir = texture{ pigment{ color rgb< 1, 1, 1>*0.1}
                 normal { agate 0.05 scale 0.15 rotate<0,0,0> }
                 finish { phong 0.1 reflection{ 0.0 } }
               } 

#declare T_Casque = texture { pigment{ color rgb< 1, 1, 1>*0.15 }
                     finish { phong 1 reflection 0.1}
                 }
#declare T_Metal = texture{ Chrome_Metal
                   normal { bumps 0.01 scale 0.05 } 
                   finish { phong 1 }
} 

//enceinte bizarre de table
#declare T_grille_Enceinte = texture { pigment { checker color Gray50 color rgb <0.35,0.35,0.35> } scale 0.1} 


//guitare

#declare T_Corps = texture { pigment {DMFWood4} finish {ambient 0.1 phong 1 diffuse 0.9 } }
#declare T_Corps_contours = texture { pigment { rgb <0.01,0.01,0.01> } finish {ambient 0.1 phong 1 diffuse 0.6 } normal { facets size 0.04 } }
#declare T_Manche = texture { pigment {DMFWood5} finish {ambient 0.1 phong 1 diffuse 0.9 } }


//imac

#declare T_Ecran_corps = texture { pigment { rgb <0.7,0.7,0.7> } }
#declare T_Ecran_surface = texture { pigment { Black } }
#declare T_Logo  = texture { pigment {image_map {png "Apple.png" map_type 0 interpolate 2 }scale 5 } }
#declare T_ecran = texture { pigment { image_map { png "Fond_ecran.png"interpolate 2 once} scale <58,33,10>}  }

//pied de micro 



#declare T_Pied_micro = texture { pigment { rgb <1,1,1>*0.1 } } 
                                                                
                                                                

//enceinte 
#declare T_Gris_clair = pigment { rgbf <0.3,0.3,0.3> }
#declare T_Gris_fonce = pigment { rgbf <0.1,0.1,0.1> }
#declare T_Bois_fonce = texture { pigment { rgbf <0.05,0.05,0.05> } normal { granite 1.5  scale 1} }
                                             
                                   