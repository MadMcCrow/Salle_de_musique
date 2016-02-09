//includes that may be usefull
#include "colors.inc"
#include "textures.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

#declare light_wood = pigment { P_WoodGrain7A color_map { M_Wood7A } }
#declare  dark_wood = pigment { P_WoodGrain14A color_map { M_Wood14A } }


// material file for the scene and object in salle_de_music

//clavier midi
#declare T_Plastic_NOIR = texture { pigment{ color rgb< 1, 1, 1>*0.10 } finish {ambient 0.001 phong 0.4 diffuse 0.6 } } 
                                                                                          

#declare T_Plastic_BLANC = texture{ pigment{ color rgb< 1, 1, 1>*0.9}   finish {ambient 0.01 phong 0.9 diffuse 0.9 } } 





//piano de dos

#declare T_piano_bois = texture { pigment {DMFWood5} finish {ambient 0.1 phong 1 diffuse 0.9  } }
#declare T_piano_interieur = texture { pigment {DMFWood4} finish {ambient 0.1 phong 1 diffuse 0.9 } }
        
//Ampli
#declare Gris = pigment {rgbf < 0.5,0.5,0.5> }  
#declare Ampli_peau =texture { pigment {rgbf < 0.05,0.05,0.05> }   normal { marble 1.5 scale 0.8 turbulence 1.0} finish {ambient 0.01 diffuse 0.9 phong 0.01  crand 0.05  }}
#declare Gris_metal = texture {pigment {rgbf < 0.3,0.3,0.3> } finish {ambient 0.1 diffuse 0.9 phong 1 }   } 
#declare T_Cuir_Ampli = texture { pigment {rgbf <0.5,0.35,0.1>} normal { bozo 3.00 scale 0.1} }
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
                   finish { phong 1  specular 0.5 }
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
                                                                

//micro
                                                                                                          
#declare T_Metal_Gris_clair = texture {  pigment { color rgb <1,1,1>*1.0 } normal { bumps 0.01 scale 0.05 }    finish {ambient 0.01 phong 0.5 diffuse 1.5 brilliance 8 crand 0.05 reflection 0.01} }
#declare T_Metal_Gris_fonce = texture {  pigment { color rgb <1,1,1>*0.5 } normal { bumps 0.01 scale 0.05 }    finish {ambient 0.01 phong 0.5 diffuse 1.5 brilliance 6 crand 0.05 reflection 0.01} } 
#declare T_Micro_grill =      texture {  pigment { checker color Black color rgb<0.8,0.8,0.8> scale 0.2 }      finish {ambient 0.01 phong 0.5 diffuse 2.0 brilliance 5 crand 0.05 } }       




//enceinte 
#declare T_Gris_clair = texture { pigment { rgbf <0.3,0.3,0.3> } finish {ambient 0.01 phong 0.05 diffuse 0.4 } }
#declare T_Gris_fonce = texture { pigment { rgbf <0.1,0.1,0.1> } finish {ambient 0.01 phong 0.05 diffuse 0.4 } }
#declare T_Bois_fonce = texture { pigment { rgbf <0.05,0.05,0.05> } normal { granite 0.15  scale 1.2}  finish {ambient 0.02 phong 0.5 diffuse 0.5 } }
                                             
//Tapis de souris
#declare T_Tapis_souris = texture { pigment { rgbf <0.05,0.05,0.7> } normal {wrinkles 20 scale 0.1}  finish {ambient 0.001 phong 0.4 diffuse 0.9 } }
#declare T_TissuNoir = texture { pigment { rgbf <0.01,0.01,0.01> } finish {ambient 0.01 phong 0.1 diffuse 0.9 } }

// fauteuil

#declare T_Laine = texture { pigment { Flesh} normal { wrinkles 0.5 scale 0.5} finish {ambient 0.01 phong 0.1 diffuse 0.9 } }
#declare T_pied = texture { pigment { DMFWood5} finish {ambient 0.01 phong 0.01 diffuse 0.9 } }

//table
#declare T_bois = texture { pigment {Tan_Wood} finish {  diffuse 0.46 phong 0.0005} scale 1.1} 

//souris 

#declare T_Souris = texture { pigment { rgb <1,1,1>*0.95 } finish {diffuse 0.9  phong 0.0005} }
#declare T_Gris_Neutre = texture { pigment { rgbf <0.5,0.5,0.5> } finish {ambient 0.01 phong 0.05 diffuse 0.4 } }

//Wooden Floor


#local board_length = 1.5*2;
#local board_width = 0.25*2; 
#local board_offset = 0.8*2;

#declare T_woodenfloor = texture{ pigment { gradient y
                pigment_map { [ 0.0 DMFWood3 scale 0.5 ]
                              [ 0.5 DMFWood1 scale 0.7 ] }
                warp { repeat board_length *z offset 0.28*y }
                warp { repeat board_width*x offset board_offset } }
      normal {	quilted 0.10 
                control0 0.0
                control1 0.5
                bump_size 0.15
                scale <board_width,1,board_length>
                warp { repeat board_length *z  }
                warp { repeat board_width*x offset board_length*1.5*z } }
        }
      
              
//scène finale

#declare T_Mur     = texture { pigment {  rgb <0.95,0.95,0.95> }  normal { bumps 0.1 scale 0.1 } finish {ambient 0.01 diffuse 0.9 specular 0.2}  }
#declare T_Sol     = texture {T_woodenfloor scale 4                                             finish {ambient 0.01 diffuse 0.9 specular 0.2}  }

#declare T_Plafond = texture { pigment {  rgb <1.00,1.00,1.00> }                                  finish {ambient 0.01 diffuse 0.9 specular 0.2}  }

#declare T_rideau = texture { pigment { rgbf <1,1,1,0.5> } finish {ambient 0.01 diffuse 0.9 specular 0.2} }



//bongos..
#declare T_Wood = texture {  
    average
    texture_map {
      [0.6  Rosewood   scale 0.5  normal { wood 0.5 scale 0.1 turbulence 0.1} finish {ambient 0.1 phong 1.0 diffuse 0.9 specular 0.3 }]     // weighting 1.0
      [0.8  pigment{rgb <0.7,0.2,0.2>}                                        finish {ambient 0.0 phong 1.2 diffuse 0.9 specular  4.5}]     // weighting 0.5
    } 
    } 
   
#declare T_leatherskin = texture { pigment{ color rgb<1,1,1>*0.8}  normal { ripples 0.2 sine_wave  frequency 20 scale 1.0  translate<0,0.5,0> } finish { diffuse 0.9 specular 0.3 }   }
 

              
