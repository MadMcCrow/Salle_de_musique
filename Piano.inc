#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

//POINT DE VUE

           
           
           
           
//LUMIERES                                                                                                               

/*light_source {
              <100,1000,-100>
              color White
              }
light_source {
              <75,50,-550>
              color White
              } */

              
              

//TEXTURES: couleurs de l'objet, réflection... etc
#declare T_piano_bois = texture { pigment {DMFWood5} finish {ambient 0.1 phong 1 diffuse 0.9 } }
#declare T_piano_interieur = texture { pigment {DMFWood4} finish {ambient 0.1 phong 1 diffuse 0.9 } }
                                             
//MATERIAUX 
              
        //Objets de base                           
#declare Corps_piano1 = object { Round_Box ( <0,0,0> <150,110,30>, 0.125,0) texture { T_piano_bois } }
#declare Piano_interieur_pilier = object { Round_Box ( <0,0,0> <10,80,20>, 0.125,0) texture { T_piano_interieur } }
#declare Piano_interieur_cylindre = object { cylinder { <0,0,0> <0,30,0> 1.5 } rotate <0,0,90> texture { T_piano_interieur } }
#declare Piano_interieur_rayure = object { Round_Box ( <0,0,0> <3,120,5>, 0.125,0) texture { T_piano_interieur } rotate <0,0,-45> }

#declare Planche1 = object { Round_Box ( <0,0,0> <2,113,30>, 0.125,0) texture { T_piano_bois } }
#declare Planche2 = object { Round_Box ( <0,0,0> <2,20,70>, 0.125,0) texture { T_piano_bois } }
#declare Planche3 = object { prism { 2 ,0.00 , 4 <0.00, 0.00>,< 5.00, 0.00>, < 0.00, 32>,<.00, 0.00> rotate<-90,-90,0> texture {T_piano_bois } } }
#declare Planche4 = object { prism { 2 ,0.00 , 4 <-2.00, 0.00>,< 5.00, 0.00>, < 0.00, -60>,<.00, 0.00> rotate<-90,-90,0> texture {T_piano_bois } } }
#declare Planche5 = object { Round_Box ( <0,0,0> <150,2,30>, 0.125,0) texture {Rosewood}  }   

#declare Post = object { Round_Box ( <0,0,0> <8,8,3>, 0.125,0)  }


    
        //Objets invisibles qui vont permettrent de  créer les creux/relief...
#declare V_Corps_piano1 = object { Round_Box ( <0,0,0> <140,80,10>, 0.125,0) texture { T_piano_interieur } }
#declare V_Piano_interieur_rayure = object { box { <0,0,0> <-140,510,100>} texture { T_piano_bois } }
                                  
                  

//ASSEMBLAGE DU PIANO
#declare Corps_piano = union {


                        //INTERIEUR DU PIANO
                            difference{
                              object {Corps_piano1}
                              object {V_Corps_piano1 translate <5,10,-0.000001>}
                              }
                       
                       union{ 
                            #local Nr = 0;    
                            #local EndNr = 3; 
                            #while (Nr< EndNr) 
                            object{ Piano_interieur_pilier translate<35+(35*Nr),10,0.99999>} 
                            #local Nr = Nr + 1;
                            #end 
                            }
                        difference{   
                            union{ 
                                #local Nr = 0;    
                                #local EndNr = 12; 
                                #while (Nr< EndNr) 
                                object{ Piano_interieur_rayure translate<-60+(20*Nr),10,4.99999>} 
                                #local Nr = Nr + 1;
                                #end 
                                }
                                
                             object { V_Piano_interieur_rayure }
                             object { V_Piano_interieur_rayure translate <290,0,0>}
                             object { V_Piano_interieur_rayure translate <150,110,0>}
                            }
                            
                            object { Piano_interieur_cylindre translate <35,65,4> }
                            object { Piano_interieur_cylindre translate <145,65,4> }

                              }
#declare Planche_cote = union { 
                                object {Planche1 translate <-2,0,0>}
                                object {Planche2 translate <-2,60,0>}
                                object {Planche3 translate <-2,79.9,29.8>}
                                object {Planche4 translate <-2,60.1,29.8>}

                                
                                
                               }
                               
#declare Post_it = union {
                           object { Post texture {Cork} translate <100,95,-0.1>}
                           object { Post texture {Yellow_Pine} translate <140,100,-0.1>}
       
                           }                               
                               
                               
#declare Piano = union {
                        object {Corps_piano}
                        object {Planche_cote}
                        object {Planche_cote translate <152,0,0>}
                        object {Planche5 translate <0,110,0>}
                        object {Planche5 translate <0,60,30>}
                        object {Post_it}
                        }


//MIS EN PLACE
object { Piano } 

// Sol
//plane {y, -1 pigment {Gray50}}