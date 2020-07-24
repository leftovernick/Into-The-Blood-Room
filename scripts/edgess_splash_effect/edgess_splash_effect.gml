/// @description edgess_splash_effect(effect);
/// @param effect

/*
Performs a special animation effect on the current splash.
Note that animation effects will override position, scale, and
other settings declared in the edgess_draw_splash script.

argument0 = effect script to perform (script)

Example usage: edgess_splash_effect(ef_flimsy);
*/

//When the target splash is playing...
if (splash_current == splash_id) {
   //...execute the given effect...
   script_execute(argument0);
   
   //...and mark the effect as playing
   splash_effect = true;
}
