//this is the file containing the piano keyboards ( midi input) that you can see on the photo
//global_settings {assumed_gamma 1.0}

#include "functions.inc"
#include "math.inc"
#include "transforms.inc" // some not built in basic shapes
#include "shapes.inc"
#include "shapes2.inc"
#include "shapesq.inc"
#include "T_materiaux.inc"



//---------------------------------------------------------
// touches de clavier
//---------------------------------------------------------

// touches noires

#declare BlackKEY =  object {Round_Box ( <0,0,2>,< 0.60, 1.00, 6.00>  , 0.15, 0  )
texture {T_Plastic_NOIR}
}
#declare BLACK3Keys = object {
union
{
#local Nr = 0;     // start
#local EndNr = 3; // end
#while (Nr< EndNr)
    object { BlackKEY translate<Nr*1.1,0,0>}
#local Nr = Nr + 1;  // next Nr
#end // end of loop 
}
}
#declare BLACK2Keys = object {
union
{
#local Nr = 0;     // start
#local EndNr = 2; // end
#while (Nr< EndNr)
    object { BlackKEY translate<Nr*1.1,0,0>}
#local Nr = Nr + 1;  // next Nr
#end // end of loop 
}
}

#declare BLACKKeys = object {
union
{
    object { BLACK2Keys translate <0.8 ,0, 0.00> }
    object { BLACK3Keys translate <4.0 ,0, 0.00> }
    object { BLACK2Keys translate <8.4 ,0, 0.00> }
    object { BLACK3Keys translate <11.8,0, 0.00> }
    object { BLACK2Keys translate <16.0,0, 0.00> }
    object { BLACK3Keys translate <19.4,0, 0.00> }
}
}

// trou des touches noires
#declare BlackKEY_hole = box { <-0.1,0,1.9>,< 0.70, 3, 6> }

#declare BLACK3Keys_hole = object {
union
{
#local Nr = 0;     // start
#local EndNr = 3; // end
#while (Nr< EndNr)
    object { BlackKEY_hole translate<Nr*1.1,0,0>}
#local Nr = Nr + 1;  // next Nr
#end // end of loop 
}
}
#declare BLACK2Keys_hole = object {
union
{
#local Nr = 0;     // start
#local EndNr = 2; // end
#while (Nr< EndNr)
    object { BlackKEY_hole translate<Nr*1.1,0,0>}
#local Nr = Nr + 1;  // next Nr
#end // end of loop 
}
}


#declare BLACKKeys_hole = object {
union
{
    object { BLACK2Keys_hole translate <0.8 ,0, 0.00> }
    object { BLACK3Keys_hole translate <4.0 ,0, 0.00> }
    object { BLACK2Keys_hole translate <8.4 ,0, 0.00> }
    object { BLACK3Keys_hole translate <11.8,0, 0.00> }
    object { BLACK2Keys_hole translate <16.0,0, 0.00> }
    object { BLACK3Keys_hole translate <19.4,0, 0.00> }
}
}



// touches blanches
#declare WhiteKEY =  object { Round_Box ( <0,0,0>,< 1.00, 1.0, 6.00> , 0.15, 0)  texture{T_Plastic_BLANC} }
#declare WHITEKeys = object {
union
{
#local Nr = 0;     // start
#local EndNr = 22; // end
    // il y a 23 touches blanches sur le clavier.
#while (Nr< EndNr)
    object { WhiteKEY translate<Nr*1.1,0,0>}
#local Nr = Nr + 1;  // next Nr
#end // end of loop 
}
}


#declare KEYS = object {

union
{
    difference
    {
        object { WHITEKeys }
        object { BLACKKeys_hole }
    }
    object { BLACKKeys translate <0,0.5, 0.00> }

} scale <2.15,2.15,2.15>
translate <9,5,-10>
}
//---------------------------------------------------------




//---------------------------------------------------------
//corps de clavier 66 x 8,3 x 18,4 cm
//---------------------------------------------------------   

#declare molette      = object {Round_Cylinder( <-1,0,0>,<1,0,0>, 4.0,       0.50,   0) scale <0.60,0.80,0.80> }
#declare molette_hole = object {molette scale <1.2,1.1,1.1>}

#declare KEY_cutout = box { <0,0,0>,< 52.7, 50.00, 17>  }

// main box of the keyboard
// linear prism in x-direction: from ... to ..., number of points (first = last)
#declare body = object{
#local Xbox = 66.00;
#local Ybox = 8.3;
#local Zbox = 18.4;
difference
{
    merge {

        object {
            //main box
            prism {
                0.00 ,1.00 , 5
                <-1.00, 0.00>, // first point
                < 1.00, 0.00>,
                < 1.00,1>,
                <-1.00,2/3>,
                <-1.00, 0.00>  // last point = first point!!!
                rotate<-90,-90,0> //turns prism in x direction! Don't change this line!
                //setting to the right size
                scale <Xbox*0.95 ,Ybox*0.95 ,(Zbox*0.5)*0.95 >
                translate <Xbox*0.025,0,Zbox/2>
            }
        } //close object {prism}

        //superior box
        object {Round_Box ( <0,0,0> , < Xbox,Ybox*0.16,Zbox >  , 0.80, 0)   rotate <-1*degrees(atan((Ybox/3)/Zbox)),0,0> translate <0,Ybox*0.60,0> }


    }//close merge
    object {KEY_cutout translate <8.5,Ybox*0.60, -2.10>}
    object { molette_hole translate <6.5,5.8,(Zbox/2)+1>}
    object { molette_hole translate <4.0,5.8,(Zbox/2)+1>}
    //object { molette_hole translate <0,0,0>}
} //close difference
//remise au centre
translate <0,0,-Zbox/2>
texture {T_Plastic_NOIR }
} //close object   

//---------------------------------------------------------

#declare midi_keyboard = object{
union {
object{body}
object{molette texture {T_Plastic_NOIR } translate <6.5,5.8,1>}
object{molette texture {T_Plastic_NOIR } translate <4.0,5.8,1>}
object{KEYS translate <0,-0.50, 2.0>}
text { ttf "arial.ttf", "KONAR", 0.2, 0.0 // thickness, offset

       texture{ T_Plastic_BLANC}
       rotate <90-(degrees(atan((8.3/3)/18.4))),0,0> 
       scale<1,1.25,1>*1.7
       translate<7,8.90,6.5 >
       
      }  
 
}
}



                   




