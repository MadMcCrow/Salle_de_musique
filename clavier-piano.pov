    //this is the file containing the piano keyboards ( midi input) that you can see on the photo
    #version 3.7;
    global_settings {assumed_gamma 1.0}
    #include "colors.inc"
    #include "functions.inc"
    #include "math.inc"
    #include "transforms.inc" // some not built in basic shapes
    #include "shapes.inc"
    #include "shapes2.inc"
    #include "shapesq.inc"
    
    #declare PCB_NOIR = texture { pigment{ color rgb< 1, 1, 1>*0.10 } //  color Gray10
                    // normal { bumps 0.5 scale 0.05 }
                       finish { phong 1 reflection 0.00}
                     } // end of texture 
    
    
    #declare PCB_BLANC = texture{ pigment{ color rgb< 1, 1, 1> } //  color White
                    // normal { bumps 0.5 scale 0.05 }
                       finish { phong 1 reflection 0.00}
                     } // end of texture 
    
                                    
    #
    //---------------------------------------------------------
    //corps de clavier 66 x 8,3 x 18,4 cm
    #declare base = box { <0,0,0>,< 28.00, 2.00, 5.00>}
    //#declare renflement
    
    
        
//---------------------------------------------------------  
// ---------------------------------------------------------
    
   
// ---------------------------------------------------------
 
    // touches noires 
    
    #declare BlackKEY =  object {Round_Box ( <0,0,1.50>,< 0.60, 1.00, 4.00>  , 0.10, 0  )
        texture{PCB_NOIR} }         
    #declare BLACK3Keys = object {
     union{ 
     #local Nr = 0;     // start
     #local EndNr = 3; // end
      #while (Nr< EndNr) 
       object{ BlackKEY translate<Nr*1.1,0,0>} 
     #local Nr = Nr + 1;  // next Nr
     #end // end of loop 
    }
    }
    #declare BLACK2Keys = object {
     union{ 
     #local Nr = 0;     // start
     #local EndNr = 2; // end
      #while (Nr< EndNr) 
       object{ BlackKEY translate<Nr*1.1,0,0>} 
     #local Nr = Nr + 1;  // next Nr
     #end // end of loop 
    }
    }
    
    #declare BLACKKeys = object { 
        union {
                object { BLACK2Keys translate <0.8 ,0, 0.00>}
                object { BLACK3Keys translate <4.0 ,0, 0.00>}
                object { BLACK2Keys translate <8.4 ,0, 0.00>}
                object { BLACK3Keys translate <11.8,0, 0.00>}
                object { BLACK2Keys translate <16.0,0, 0.00>} 
                object { BLACK3Keys translate <19.4,0, 0.00>}      
        }
    } 
    
    // trou des touches noires
    #declare BlackKEY_hole = box { <-0.1,0,1.4>,< 0.70, 3, 4.00> }
    
    #declare BLACK3Keys_hole = object {
     union{ 
     #local Nr = 0;     // start
     #local EndNr = 3; // end
     #while (Nr< EndNr) 
       object{ BlackKEY_hole translate<Nr*1.1,0,0>} 
       #local Nr = Nr + 1;  // next Nr
     #end // end of loop 
    }
    }
    #declare BLACK2Keys_hole = object {
     union{ 
     #local Nr = 0;     // start
     #local EndNr = 2; // end
     #while (Nr< EndNr) 
       object{ BlackKEY_hole translate<Nr*1.1,0,0>} 
       #local Nr = Nr + 1;  // next Nr
     #end // end of loop 
    }
    }
    
    
    #declare BLACKKeys_hole = object { 
        union {
                object { BLACK2Keys_hole translate <0.8 ,0, 0.00>}
                object { BLACK3Keys_hole translate <4.0 ,0, 0.00>}
                object { BLACK2Keys_hole translate <8.4 ,0, 0.00>}
                object { BLACK3Keys_hole translate <11.8,0, 0.00>}
                object { BLACK2Keys_hole translate <16.0,0, 0.00>} 
                object { BLACK3Keys_hole translate <19.4,0, 0.00>}      
        }
    }  
    
       
       
    // touches blanches 
    #declare WhiteKEY =  object { Round_Box ( <0,0,0>,< 1.00, 1.00, 4.00> , 0.10, 0)  texture{PCB_BLANC} }
    #declare WHITEKeys = object {
     union{ 
     #local Nr = 0;     // start
     #local EndNr = 22; // end
     // il y a 23 touches blanches sur le clavier.
      #while (Nr< EndNr) 
       object{ WhiteKEY translate<Nr*1.1,0,0>} 
     #local Nr = Nr + 1;  // next Nr
     #end // end of loop 
    }
    }
          
       
    #declare KEYS = object {
        
            union { 
                difference{
                    object { WHITEKeys }
                     object { BLACKKeys_hole}                 
                }
                 object { BLACKKeys translate <0,0.5, 0.00>}
            
        }
        }
    object {KEYS translate <3.0,1.50, 0.10>}
    object {base translate <0,0.00, 0.00>}
                
     
     
    
    
    
    
    
    
    //Scene for better visualisation
    //--------------------------------------------------------------------------
    #version 3.7;
    global_settings{ assumed_gamma 1.0 }
    #default{ finish{ ambient 0.1 diffuse 0.9 }} 
     
    
    
    // camera ------------------------------------------------------------------
    #declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                                location  <0.0 , 1.0 ,-10.0>
                                right     x*image_width/image_height
                                look_at   <0.0 , 1.0 , 0.0>}
    #declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                                location  <10.0 , 2.5 ,-3.0>
                                right     x*image_width/image_height
                                look_at   <0.0 , 1.0 , 0.0>}
    #declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                                location  <10.0 , 1.0 , 0.0>
                                right     x*image_width/image_height
                                look_at   <0.0 , 1.0 , 0.0>}
    #declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                                location  <0.0 , 18.0 ,-0.001>
                                right     x*image_width/image_height
                                look_at   <0.0 , 1.0 , 0.0>}
    camera{Camera_3 translate <12.0,0.00, 0.00>}
    // sun ---------------------------------------------------------------------
    light_source{<-1500,2500,-2500> color White}
    // sky ---------------------------------------------------------------------
    sky_sphere { pigment { gradient <0,1,0>
                           color_map { [0.00 rgb <1.0,1.0,1.0>]
                                       [0.30 rgb <0.0,0.1,1.0>]
                                       [0.70 rgb <0.0,0.1,1.0>]
                                       [1.00 rgb <1.0,1.0,1.0>] 
                                     } 
                           scale 2         
                         } // end of pigment
               } //end of skysphere
    // fog ---------------------------------------------------------------------
    fog{fog_type   2
        distance   50
        color      White
        fog_offset 0.1
        fog_alt    2.0
        turbulence 0.8}
    // ground ------------------------------------------------------------------
    plane{ <0,1,0>, 0 
           texture{ pigment{ color rgb <1.00,0.95,0.8>}
                    finish { phong 0.1 } 
                  } // end of texture
         } // end of plane
    //--------------------------------------------------------------------------
    //---------------------------- objects in scene ----------------------------
    //--------------------------------------------------------------------------
 
         
    
    
    
    
    
    
    
