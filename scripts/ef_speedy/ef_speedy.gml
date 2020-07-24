/// @description ef_speedy();

/*
A preset animation effect for use with the edgess_splash_effect script

No parameters
*/

//Animate in
if (splash_state == 0) {
   //Begin off-screen to the left
   if (splash_alpha == 0) {
      splash_xoffset = display_get_gui_width()*-2;
      splash_yoffset = display_get_gui_height()*0.5;
   }
   
   //Slide across the screen horizontally
   if (splash_alpha > 0.1) and (splash_alpha < 0.4) {
      splash_xoffset += ((display_get_gui_width()*2) - splash_xoffset)*(0.25*(30/room_speed));
   }
   
   //Reposition off-screen to the top
   if (splash_alpha >= 0.4) and (splash_alpha <= 0.55) {
      splash_xoffset = display_get_gui_width()*0.5;
      splash_yoffset = display_get_gui_height()*-2;
   }
   
   //Slide across the screen vertically
   if (splash_alpha > 0.55) and (splash_alpha < 0.7) {
      splash_yoffset += ((display_get_gui_height()*2) - splash_yoffset)*(0.25*(30/room_speed));
   }
   
   //Resposition to center screen and scale down to 0
   if (splash_alpha >= 0.7) and (splash_alpha <= 0.8) {
      splash_yoffset = display_get_gui_height()*0.5;
      splash_xscale = 0;
      splash_yscale = 0;
   }
   
   //Scale in to full size
   if (splash_alpha > 0.8) {
      splash_xscale = power(splash_alpha, 10);
      splash_yscale = splash_xscale;
   }
}

//Animate out
if (splash_state == 2) {
   //Bump out a little before sliding away
   if (splash_alpha > 0.85) {
      splash_xoffset += (((display_get_gui_width()*0.5)-150) - splash_xoffset)*(0.25*(30/room_speed));
   }
   
   //Slide away
   if (splash_alpha < 0.85) {
      splash_xoffset += ((display_get_gui_width()*2) - splash_xoffset)*(0.25*(30/room_speed));
   }
}
