// material file for the scene and object in salle_de_music


#declare Plastic_NOIR = texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
// normal { bumps 0.5 scale 0.05 }
finish { phong 1 reflection 0.00 }
} // end of texture


#declare Plastic_BLANC = texture{ pigment{ color rgb< 1, 1, 1> } //  color White
// normal { bumps 0.5 scale 0.05 }
finish { phong 1 reflection 0.00 }
} // end of texture


#declare T_piano_bois = texture { pigment {DMFWood5} finish {ambient 0.1 phong 1 diffuse 0.9 } }
#declare T_piano_interieur = texture { pigment {DMFWood4} finish {ambient 0.1 phong 1 diffuse 0.9 } }
        
