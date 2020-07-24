/// @description edgess_skip(mode);
/// @param mode

/*
Skips the current splash screen in one of two modes: 'soft' skip,
and 'hard' skip. A 'soft' skip will fade the splash screen out,
whereas a 'hard' skip will immediately continue on to the next
splash screen, if any. Mode values are clamped to prevent errors.
Designed for use in global mouse, keyboard, or gamepad input events.
MUST be run in the same object that is drawing splash screens, or
applied to the object via a 'with' statement.

argument0 = sets either 'soft' skip (0) or 'hard' skip (1) (integer)

Example usage: edgess_skip(0);
*/

//Skip the current splash
if (splash_skip == false) {
   splash_skip_mode = clamp(argument0, 0, 1);
   splash_skip = true;
}
