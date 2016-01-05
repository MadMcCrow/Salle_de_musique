#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc" 

//POINT DE VUE
camera {
        location <0,50,-140>
        look_at <12.5,30,5>
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

             
                                             





//TEXTURES: couleurs de l'objet, réflection... etc


                                   
                                    
//MATERIAUX 
              
        //Objets de base
        
            //Corps               
#declare  Corps_guitare = object { Round_Cone3( <0,20>,16.25, <0,38,0>, 12.25, 0) }
#declare Chevalet = object { Round_Box (<0,0,0>,<10,4,2>, 0.125, 0) }
#declare Mini_chevalet = object { Round_Box (<0,0,0>,<10,4,10>, 0.125, 0) scale 0.3 }
 
            //Manche
#declare Manche_Corps = object { Round_Box (<0,0,0>,<5,45,3>, 0.125, 0) }
#declare Frette = object { cylinder { <0,0,0> <0,5,0>, 0.07 } rotate <0,0,90> texture { pigment { White } } }
#declare Marquage = object { cylinder { <0,0,0> <0,1,0> 0.3 rotate <90,0,0> texture { pigment { White } } } }
#declare Corde = object { cylinder { <0,0,0> <0,71.25,0> 0.1 } texture { pigment { White } } }
             
            //Tete 
#declare Tete_guitare = object { Round_Box (<0,0,0>,<7,9,2>, 0.125, 0) }
#declare Bidule_quon_tourne = object { cylinder { <0,0,0> ,<0,2,0> 0.5 rotate <90,0,0> texture { pigment { Green } } } }
#declare Chevalet_tete = object { Round_Box (<0,0,0>,<5,1.5,1>, 0.125, 0) }
#declare Corde_tete = object { cylinder { <0,0,0>,<0,1,0> 0.1 } texture { pigment { White } } }
#declare Texte_tete = text{ ttf "arial.ttf", "Fennedeur",1, 0 texture{ pigment{ Red } } }



        //Objets invisibles qui vont permettrent de  créer les creux/relief...
#declare V_corps_guitare = object { box { <0,0,0> <100,100,15> } }
#declare V_caisse_resonance = object { cylinder {<0,0,0> <0,20,0>, 5 rotate <90,0,0>} }

                  

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
                        
                        object {Corde translate <0.4,-28,0>}
                        object {Corde translate <1.2,-28,0>}
                        object {Corde translate <2,-28,0>}
                        object {Corde translate <2.8,-28,0>}
                        object {Corde translate <3.6,-28,0>}
                        object {Corde translate <4.4,-28,0>}
                         
                        }
                        
 #declare Tete = union {
                        object {Tete_guitare}
                        object {Bidule_quon_tourne translate <1,2.5,-1>}
                        object {Bidule_quon_tourne translate <1,4.5,-1>}
                        object {Bidule_quon_tourne translate <1,6.5,-1>}
                        object {Bidule_quon_tourne translate <6,2.5,-1>}
                        object {Bidule_quon_tourne translate <6,4.5,-1>}
                        object {Bidule_quon_tourne translate <6,6.5,-1>}
                        
                        
                        object {Chevalet_tete translate <1.25,-1,-0.25> texture { pigment { Red } }  }
                        
                        object {Corde_tete translate <1.75,0,0> scale <0,2.5,0> rotate <0,0,10>}
                        object {Corde_tete translate <2.3,-0.2,0> scale <0,5,0> rotate <0,0,17>}
                        object {Corde_tete translate <3.15,-0.2,0> scale <0,8,0> rotate <0,0,20>}
                        object {Corde_tete translate <5.3,0.4,0> scale <0,2.5,0> rotate <0,0,-10>}
                        object {Corde_tete translate <4.5,0.2,0> scale <0,5,0> rotate <0,0,-15>}
                        object {Corde_tete translate <3.7,0.05,0> scale <0,8,0> rotate <0,0,-17>}
                        
                        object {Texte_tete translate <1,7.5,-0.1>}
                       
 
                        }     
                   

 #declare Guitare = union {
 
                    difference {
 
                    object { Corps_guitare texture { pigment { Red } } }
                    
                    
                    object { V_corps_guitare translate <-20,0,-18> texture { pigment { Red } } }
                    object { V_caisse_resonance translate <0,33,-10> texture { pigment { Red } } }         
                    } 
                    
                    object { Chevalet translate <-5,10,-4> texture { pigment { Blue } } }
                    object { Mini_chevalet translate <-1.6,11.5,-4.5> texture { pigment { Green } } scale <2,0,0> }
                    object { Manche translate <-2.5,40,-4> texture { pigment { Green } } }
                    object { Tete translate <-3.725,83,-4.5> texture { pigment { Blue } } }
                    }
                    
                    
//MIS EN PLACE
object { object {Guitare} }  

// Sol
plane {y, -1 pigment {Gray50}}
       





           