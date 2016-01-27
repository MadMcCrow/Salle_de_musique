#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

//POINT DE VUE
//camera {
   //     location <-250,140,00>
     //   look_at <0,95,0>
       // }
           
           
           
           
//LUMIERES                                                                                                               

/*light_source {
              <100,1000,-100>
              color White
              }
light_source {
              <0,10,-100>
              color White
              } */
                                                                          

              
        //Objets de base               
#declare Pied_micro_pied = object { cylinder { <0,0,0> <0,20,0> 0.8 } texture {T_Pied_micro} rotate <-65,0,0> }
#declare Pied_micro_pied_embout = object { cylinder { <0,0,0> <0,2,0> 1.2 }  texture {pigment {Black}} rotate <-65,0,0> }
#declare R = 3 ;
#declare Sphere_pieds = object { sphere { <0,0,0> R }  texture {T_Pied_micro} }

#declare Pied_micro_corps1 = object { cylinder { <0,0,0> <0,60,> 0.8 } texture { T_Pied_micro } translate <0,10,0> }
#declare Pied_micro_corps2 = object { cylinder { <0,0,0> <0,30,> 0.6 } texture { T_Pied_micro } translate <0,76,0> }
#declare Pied_micro_joint = object { Round_Cylinder ( <0,0,0> <0,6,0> 1.1, 0.5,0 ) texture { T_Pied_micro } translate <0,70,0> }

#declare Pied_micro_perche_corps = object { cylinder { <0,0,0> <0,80,> 0.6 } texture { T_Pied_micro } translate <0,10,0> }
#declare Pied_micro_perche_poid = object { cylinder { <0,0,0> <0,6,> 1.2 } texture { T_Pied_micro } translate <0,10,0> }
#declare Pied_micro_perche_box = object { box { <0,0,0> <2,12,2> } texture { T_Pied_micro } translate <-1,40,-1> }
#declare Pied_micro_perche_joint = object { cylinder { <0,0,0> <0,0.2,0> 2.5 } texture { T_Pied_micro } rotate <90,0,0> translate <-2,46,0.8> }
#declare Pied_micro_perche_vis = object { cylinder { <0,0,0> <0,2,> 0.4 } texture { pigment { rgb 0.2} } translate <0,90,0> }
#declare Pied_micro_perche_antipop = union {
                                            //object { box { <0,0,0> <10,20,10> } texture { pigment { rgbf <0,0,1,0.5> } }translate <-10,85,-2> }
                                            difference {
                                            object { torus { 7,0.3 } texture { T_Pied_micro } rotate <90,-30,0> translate <0,94.5,-1> }
                                            object { box { <0,0,0> <10,30,10> } texture { T_Pied_micro }  translate <-10,85,-6> }
                                            object { box { <0,0,0> <10,30,10> } texture { T_Pied_micro }  translate <-7.25,90,-6> }
                                             
                                            }
                                            object { cylinder { <0,0,0> <0,2,0> 1} texture {T_Pied_micro } translate <0,86,-1>}
                                            object { cylinder  { <0,0,0> <0,0.2,0> 4 } texture { pigment { checker rgbf<0,0,0,0.95> rgbf<1,1,1,0.95> }scale 0.1 } translate <-1,100.75,-1>}
                                            object { torus { 4, 0.2} texture { T_Pied_micro } translate <-1,100.75,-1>}
                                            translate <0,0,1>
                                            }
#declare Pied_micro_micro = union{ 
                                    object { cylinder { <0,0,0> <0,3,0> 0.7 } texture { pigment { rgb 0.7} } }
                                    object { cylinder { <0,0,0> <0,7,0> 2 } texture { pigment { rgb 0.1} } translate <0,3,0>  }
                                    object { Round_Cylinder ( <0,0,0> <0,4,0> 1.7,0.5,0 ) texture { pigment { checker color White color Black} scale 0.2 } translate <0,10,0>  }
                                    rotate <-90,90,0>
                                  }


        //Objets invisibles qui vont permettrent de  créer les creux/relief...
#declare V_Sphere_pieds = object { box { <0,0,0> <10,10,10> }  texture {T_Pied_micro} }







                                   
                                    
                  

//ASSEMBLAGE DU PIED 

#declare Pied_micro_base = union { 


                                   difference { 
                                                object { Sphere_pieds translate <0,10,0> }
                                                object { V_Sphere_pieds translate <-R,10,-R>}
                                                
                                               }
                                   object {Pied_micro_pied translate <0,0,20>  }
                                   object {Pied_micro_pied translate <0,0,20> rotate <0,120,0> }
                                   object {Pied_micro_pied translate <0,0,20> rotate <0,240,0> }
                                   
                                   object {Pied_micro_pied_embout translate <0,0,20> }
                                   object {Pied_micro_pied_embout translate <0,0,20> rotate <0,120,0>  }
                                   object {Pied_micro_pied_embout translate <0,0,20> rotate <0,240,0>  }
                                 }
#declare Pied_micro_haut = union { 
                                   object {Pied_micro_corps1}
                                   object {Pied_micro_corps2}
                                   object {Pied_micro_joint}
                                  } 
#declare Pied_micro_perche = union {  
                                   object {Pied_micro_perche_corps}
                                   object {Pied_micro_perche_poid}
                                   object {Pied_micro_perche_box}
                                   object {Pied_micro_perche_joint}
                                   object {Pied_micro_perche_vis}
                                   object {Pied_micro_perche_antipop}
                                   
                                   translate <0,-10,0>
                                    }                        

#declare Pied_micro = union {
                             object {Pied_micro_base}
                             object {Pied_micro_haut }
                             union {                      
                             object {Pied_micro_perche }
                             object {Pied_micro_micro  translate <8,84,0> }
                             rotate <90,-15,90> translate <0,117,-34>}
                            }                            

//MIS EN PLACE
object { Pied_micro } 

// Sol
//plane {y, -1 pigment {Gray50}}