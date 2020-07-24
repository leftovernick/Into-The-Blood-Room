/// @description edgess_draw_splash(sprite, fade in, pause, fade out, hide mouse);
/// @param sprite
/// @param  fade in
/// @param  pause
/// @param  fade out
/// @param  hide mouse

/*
Draws the given sprite as a splash screen with automatic positioning
relative to the size of the GUI and the given fade in, pause, and 
fade out times.

argument0 = sprite to draw as splash (sprite)
argument1 = length of time to fade splash screen in, in seconds (real)
argument2 = length of time to pause splash screen, in seconds (real)
argument3 = length of time to fade splash screen out, in seconds (real)
argument4 = enables or disables hiding the mouse cursor (boolean) (true/false)

Example usage: edgess_draw_splash(spr_mysplash, 3, 4, 2, true);
*/

//Get splash ID
splash_id += 1;

//Perform splash
if (splash_current == splash_id) {

   /*
   INITIALIZATION
   */
   
   if (splash_init == true) {
      //Force sprite alignment
      sprite_set_offset(argument0, sprite_get_width(argument0)*0.5, sprite_get_height(argument0)*0.5);
      
      //Initialize splash variables
      splash_alpha = 0;
      splash_effect = false;
      splash_skip = false;
      splash_skip_mode = -1;
      splash_state = 0;
      splash_rotation = 0;
      splash_xoffset = display_get_gui_width()*0.5;
      splash_yoffset = display_get_gui_height()*0.5;
      splash_xscale = 1;
      splash_yscale = 1;
      
      //Hide mouse, if enabled
      if (argument4 == true) {
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
   
   //Automatically position the splash screen, if no effect is playing
   if (splash_effect == false) {
      splash_rotation = 0;
      splash_xoffset = display_get_gui_width()*0.5;
      splash_yoffset = display_get_gui_height()*0.5;
      splash_xscale = 1;
      splash_yscale = 1;   
   }

   //Draw splash screen
   draw_sprite_ext(argument0, image_index, splash_xoffset, splash_yoffset, splash_xscale, splash_yscale, splash_rotation, c_white, splash_alpha);
}
