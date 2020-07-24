/// @description animate_sprites(speed);
/// @param speed

/*
Increments the image index of sprites drawn in the running object, adjusting
for room speed so as to animate consistently at any framerate. Can also animate
at custom speeds for faster or slower animations than normal.

This script is meant to be run in the Step event.

Note that running this script will affect the animation speed of all sprites
drawn in the running object.

argument0 = speed multiplier at which to animate sprites, where 1 is 100% (real)

Example usage: animate_sprites(1);
*/

//Increment image_index
image_index += (argument0*(30/room_speed));

//Do not allow image_index to exceed 32-bit values
if (image_index > 2000000000) {
   image_index = 0;
}
