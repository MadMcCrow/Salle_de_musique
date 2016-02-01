#include "shapes.inc"
#include "shapes3.inc"
#include "T_materiaux.inc"
                           
                                 
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
#declare Fauteuil = union{
                            object { Corps_fauteuil translate <0,15,0> texture {T_Laine} }
                            object { Pieds_fauteuil texture {T_pied} }
                            object { Coussin translate <5,28,10> texture {T_Laine} }
                            }




           