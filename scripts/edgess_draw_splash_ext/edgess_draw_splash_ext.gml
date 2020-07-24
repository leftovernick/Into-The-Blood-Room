/// @description edgess_draw_splash_ext(sprite, fade in, pause, fade out, image_index, xoffset, yoffset, xscale, yscale, rotation, hide mouse);
/// @param sprite
/// @param  fade in
/// @param  pause
/// @param  fade out
/// @param  image_index
/// @param  xoffset
/// @param  yoffset
/// @param  xscale
/// @param  yscale
/// @param  rotation
/// @param  hide mouse
//                          0         1      2        3          4          5        6        7       8        9         10     

/*
Draws the given sprite as a splash screen with manual positioning and the given 
fade in, pause, and fade out times, in addition to a host of extra parameters.

argument0  = sprite to draw as splash (sprite)
argument1  = length of time to fade splash screen in, in seconds (real)
argument2  = length of time to pause splash screen, in seconds (real)
argument3  = length of time to fade splash screen out, in seconds (real)
argument4  = the frame of the sprite set in argument0 to draw (integer)
argument5  = the x position to draw the splash (real)
argument6  = the y position to draw the splash (real)
argument7  = horizontal scale multiplier (real) (1 is default)
argument8  = vertical scale multiplier (real) (1 is default)
argument9 = rotation of the sprite, in degrees (real) (0 is default)
argument10 = enables or disables hiding the mouse cursor (boolean) (true/false)

Example usage: edgess_draw_splash_ext(spr_mysplash, 3, 4, 2, 0, view_wview[0]*0.5, view_hview[0]*0.5, 1, 1, 0, true);
*/

//Get splash ID
splash_id += 1;

//Perform splash
if (splash_current == splash_id) {

   /*
   INITIALIZATION
   */
   
   if (splash_init == true) {
      //Initialize splash variables
      splash_alpha = 0;
      splash_effect = false;
      splash_skip = false;
      splash_skip_mode = -1;
      splash_state = 0;
      splash_rotation = argument9;
      splash_xoffset = 0;
      splash_yoffset = 0;
      splash_xscale = 1;
      splash_yscale = 1;
	  image_index = 0;
      
      //Hide mouse, if enabled
      if (argument10 == true) {
         window_set_cursor(cr_none);
      }      
      
      //End initialization
      splash_init = false;
      exit;
   }

   /*
   SKIPPING
   */
   
   //Skip animation, if skipped
   if (splash_skip_mode == 0) { //Soft skip
      splash_state = 2;
      splash_skip_mode = -1;
   }
   
   if (splash_skip_mode == 1) { //Hard skip
      splash_state = 4;
      splash_skip_mode = -1;
   }
   
   /*
   ANIMATION
   */ 
   
   //Fade in
   if (splash_state == 0) {
      if (splash_alpha < 1) {
         splash_alpha += (((argument1/room_speed)/argument1)/argument1)*(delta_time/splash_delta);
      }
      
      if (splash_alpha >= 1) {
         splash_alpha = 1;
         splash_state = 1;
      }
   }
   
   //Pause
   if (splash_state >= 1) and (splash_state < 2) {
      splash_state += (((argument2/room_speed)/argument2)/argument2)*(delta_time/splash_delta);
      
      if (splash_state > 2) {
         splash_state = 2;
      }
   }
   
   //Fade out
   if (splash_state == 2) {
      if (splash_alpha > 0) {
         splash_alpha -= (((argument3/room_speed)/argument3)/argument3)*(delta_time/splash_delta);
      }
      
      if (splash_alpha <= 0) {
         splash_alpha = 0;
         splash_state = 3;
      }
   }
   
   //Pause one second before continuing
   if (splash_state >= 3) and (splash_state < 4) {
      splash_state += (1/room_speed)*(delta_time/splash_delta);
   }
   
   //Begin next splash (if any)
   if (splash_state >= 4) and (splash_state < 5) {
      splash_current += 1;
      splash_init = true;
      
      //Unhide mouse, if hidden
      if (window_get_cursor() == cr_none) {
         window_set_cursor(cr_default);
      }        
   }

   /*
   DRAWING
   */   
   
   //Force splash position settings if no effect is playing
   if (splash_effect == false) {
      splash_rotation = argument9;
      splash_xoffset = 0;
      splash_yoffset = 0;
      splash_xscale = 1;
      splash_yscale = 1;
   }   

   //Draw splash screen
   draw_sprite_ext(argument0, argument4, argument5 + splash_xoffset, argument6 + splash_yoffset, argument7*splash_xscale, argument8*splash_yscale, splash_rotation, c_white, splash_alpha);
}