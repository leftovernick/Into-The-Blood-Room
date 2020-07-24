/// @description ef_flimsy();

/*
A preset animation effect for use with the edgess_splash_effect script

No parameters
*/

//Initialize
if (splash_state == 0) {
   if (splash_alpha == 0) {
      //Create a variable for counting steps
      splash_step = 0;
      
      //Begin small
      splash_xscale = 0;
      splash_yscale = 0;
   } else {      
      //Scale up and rotate
      splash_xscale = splash_alpha;
      splash_yscale = splash_alpha;
      splash_rotation = 1080*splash_alpha;      
   }
}

//Flimsy!
if (splash_state >= 1) and (splash_state < 2) {
   //Increment step counter
   if (splash_step < 9) {
      splash_step += (30/room_speed);
   }
   
   //Perform flimsy effect
   if (splash_step >= 1) and (splash_step < 2) {
      splash_rotation = 20;
   }
   if (splash_step >= 2) and (splash_step < 3) {
      splash_rotation = -20;
   }   
   if (splash_step >= 3) and (splash_step < 4) {
      splash_rotation = 10;
   }
   if (splash_step >= 4) and (splash_step < 5) {
      splash_rotation = -10;
   }
   if (splash_step >= 5) and (splash_step < 6) {
      splash_rotation = 5;
   }
   if (splash_step >= 6) and (splash_step < 7) {
      splash_rotation = -5;
   }
   if (splash_step >= 7) and (splash_step < 8) {
      splash_rotation = 2;
   }
   if (splash_step >= 8) and (splash_step < 9) {
      splash_rotation = -1;
   }
   if (splash_step >= 9) {
      splash_rotation = 0;
   }
}
