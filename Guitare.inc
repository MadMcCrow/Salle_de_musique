#include "shapes.inc"
#include "T_materiaux.inc"
                               

              
        //Objets de base
        
            //Corps               
#declare Corps_guitare = object { Round_Cone3( <0,20>,16.25, <0,38,0>, 12.25, 0) }
#declare Chevalet = object { Round_Box (<0,0,0>,<10,2,2>, 0.125, 0) }
#declare Mini_chevalet = object { Round_Box (<0,0,0>,<10,4,10>, 0.125, 0) scale 0.3 }
#declare Bouton_guitare1 = object { cylinder {<0,0,0> <0,2,0> 1 rotate <90,0,0> } }
#declare Bouton_guitare2 = object { cylinder {<0,0,0> <0,2,0> 1.5 rotate <90,0,0> } } 
 
            //Manche
#declare Manche_Corps = object { Round_Box (<0,0,0>,<5,45,3>, 0.125, 0) }
#declare Frette = object { cylinder { <0,0,0> <0,5,0>, 0.07 } rotate <0,0,90> texture { pigment { White } } }
#declare Marquage = object { cylinder { <0,0,0> <0,1,0> 0.3 rotate <90,0,0> texture { pigment { White } } } }
#declare Corde = object { cylinder { <0,0,0> <0,71.25,0> 0.1 } texture { pigment { White } } }
             
            //Tete 
#declare Tete_guitare = object { Round_Box (<0,0,0>,<7,9,2.5>, 0.125, 0) }
#declare Bidule_quon_tourne = object { cylinder { <0,0,0> ,<0,2,0> 0.5 rotate <90,0,0> texture {T_Corps_contours } } }
#declare Chevalet_tete = object { Round_Box (<0,0,0>,<5,1.5,1>, 0.125, 0) }
#declare Corde_tete = object { cylinder { <0,0,0>,<0,1,0> 0.1 } texture { pigment { White } } }
#declare Texte_tete = text{ ttf "crystal.ttf", "Fennedeur",1, 0 texture{ pigment{ Black } } }



        //Objets invisibles qui vont permettrent de  créer les creux/relief...
#declare V_corps_guitare = object { box { <0,0,0> <100,100,15> } }
#declare V_caisse_resonance = object { cylinder {<0,0,0> <0,20,0>, 5 rotate <90,0,0>} }
#declare V_Silhouette = object { cylinder {<0,0,0> <0,100,0> 10 rotate <90,0,0> } }
#declare V_tete = object {  cylinder {<0,0,0> <0,100,0> 5 rotate <90,0,0> } }

                  

//ASSEMBLAGE DE LA GUITARE

#declare Manche = union { 

                        object {Manche_Corps}
                        

                        object {Frette translate <5,1,0>}
                        object {Frette translate <5,2,0>}
                        object {Frette translate <5,3.5,0>}
                        object {Frette translate <5,5,0>}
                        object {Frette translate <5,6.5,0>}
                        object {Frette translate <5,8,0>}
                        object {Frette translate <5,9.5,0>}
                        object {Frette translate <5,11.5,0>}
                        object {Frette translate <5,13.5,0>}
                        object {Frette translate <5,15.5,0>}
                        object {Frette translate <5,18.5,0>}
                        object {Frette translate <5,21.5,0>}
                        object {Frette translate <5,24.5,0>}
                        object {Frette translate <5,27.5,0>}
                        object {Frette translate <5,30.5,0>}
                        object {Frette translate <5,33.5,0>}
                        object {Frette translate <5,36.5,0>}
                        object {Frette translate <5,39.5,0>}
                        object {Frette translate <5,42.5,0>}
                        
                        
                        object {Marquage translate <2.5,4.25,0> }
                        object {Marquage translate <1.5,8.75,0> }
                        object {Marquage translate <3.5,8.75,0> }
                        object {Marquage translate <2.5,19.75,0> }
                        object {Marquage translate <2.5,34.75,0> }
                        object {Marquage translate <2.5,22.75,0> }
                        
                       //Boucle pour modeliser les cordes 
                        union{ 
                         #local Nr = 0;
                         #local EndNr = 6;
                         #while (Nr< EndNr) 
                         object {Corde translate<0.4+Nr*0.8,-28,0>} 
                         #local Nr = Nr + 1;
                         #end
                         }                       
                        }
                        
 #declare Tete = union {
                        object {Tete_guitare} 
                        
                        //bouce                        
                         union{ 
                         #local Nr = 0;
                         #local EndNr = 3;
                         #while (Nr< EndNr) 
                         object {Bidule_quon_tourne translate<1,2.5+Nr*2,-1>} 
                         #local Nr = Nr + 1;
                         #end
                         }
                         
                          union{ 
                         #local Nr = 0;
                         #local EndNr = 3;
                         #while (Nr< EndNr) 
                         object {Bidule_quon_tourne translate<6,2.5+Nr*2,-1>} 
                         #local Nr = Nr + 1;
                         #end
                         } 
                          
                          
                        
                        object {Chevalet_tete translate <1.25,-1,-0.25> texture { T_Manche }  }
                        
                        object {Corde_tete translate <1.75,0,0> scale <0,2.5,0> rotate <0,0,10>}
                        object {Corde_tete translate <2.3,-0.2,0> scale <0,5,0> rotate <0,0,17>}
                        object {Corde_tete translate <3.15,-0.2,0> scale <0,8,0> rotate <0,0,20>}
                        object {Corde_tete translate <5.3,0.4,0> scale <0,2.5,0> rotate <0,0,-10>}
                        object {Corde_tete translate <4.5,0.2,0> scale <0,5,0> rotate <0,0,-15>}
                        object {Corde_tete translate <3.7,0.05,0> scale <0,8,0> rotate <0,0,-17>}
                        
                        object {Texte_tete translate <1,7.13,-0.1>}
                       
 
                        }     
                   

 #declare Guitare = union { 
                    
                     //Corps de la guitare
 
                     difference {
 
                    object { Corps_guitare texture { T_Corps } }
                    
                    
                    object { V_corps_guitare translate <-20,0,-18> texture { T_Corps } }
                    object { V_caisse_resonance translate <0,33,-10> texture { T_Corps } }
                    object { V_Silhouette translate <-21,28,-10> texture { T_Corps } }
                    object { V_Silhouette translate <21,28,-10> texture { T_Corps } }          
                    }
                      
                    //Contour de celle-ci
                     difference {
 
                    object { Corps_guitare texture { T_Corps_contours } }
                    
                    
                    object { V_corps_guitare translate <-20,0,-18> texture { T_Corps_contours } }
                    object { V_caisse_resonance translate <0,33,-10> texture {T_Corps_contours } }
                    object { V_Silhouette translate <-21,28,-10> texture { T_Corps_contours } }
                    object { V_Silhouette translate <21,28,-10> texture { T_Corps_contours } }
                              
                    scale 1.02 translate <0,-0.55,1>}
                     
                    //Manche,tete... 
                     
                    object { Chevalet translate <-5,11,-4> texture { T_Manche } }
                    object { Mini_chevalet translate <-1.6,11.5,-4.5> texture { T_Manche } scale <2,0,0> }
                    object { Manche translate <-2.5,40,-4> texture { T_Manche } scale <0.9,0,0> }
                    
                        difference{
                        object { Tete translate <-3.725,83,-4.5> texture { T_Corps } } 
                        
                        object { V_tete translate <-0.25,96,-6> texture { T_Corps } }
                    translate <0,0,0.5> }  
                     
                    object { Bouton_guitare1 translate <10,10,-4> texture {T_Corps_contours} }
                    
                    object { Bouton_guitare1 translate <12,15,-4> texture {T_Corps_contours} } 
                    
                    scale 2 rotate <0,0,25>
                    }
