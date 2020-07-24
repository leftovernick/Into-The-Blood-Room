/// @description ef_bubbly();

/*
A preset animation effect for use with the edgess_splash_effect script

No parameters
*/

//Scale in
if (splash_state == 0) {
   //Begin scaled at 0
   if (splash_alpha == 0) {
      splash_xscale = 0;
      splash_yscale = 0;
   } 
   
   //Pop in
   if (splash_alpha > 0.3) {
      if splash_xscale < 0.5 {
         splash_xscale += (1 - splash_xscale)*(0.25*(30/room_speed));
         splash_yscale += (3 - splash_yscale)*(0.25*(30/room_speed));      
      }
   
      if (splash_xscale >= 0.3) {
         splash_xscale += (1 - splash_xscale)*(0.5*(30/room_speed));
         splash_yscale += (1 - splash_yscale)*(0.5*(30/room_speed));  
      }
   }
}

//Scale down to normal when fully scaled
if (splash_state >= 1) and (splash_state < 2) {
   splash_xscale += (1 - splash_xscale)*(0.5*(30/room_speed));
   splash_yscale += (1 - splash_yscale)*(0.5*(30/room_speed));  
}

//Scale up, then scale all the way down
if (splash_state >= 1.9) {
   if (splash_alpha == 1) {
      splash_xscale += (1.5 - splash_xscale)*(0.5*(30/room_speed));
      splash_yscale += (1.3 - splash_yscale)*(0.5*(30/room_speed));     
   }
   
   if (splash_alpha < 1) {
      splash_xscale += (0 - splash_xscale)*(0.8*(30/room_speed));
      splash_yscale += (0 - splash_yscale)*(0.8*(30/room_speed));  
   }
}
