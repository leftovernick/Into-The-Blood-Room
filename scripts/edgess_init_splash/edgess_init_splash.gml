/// @description edgess_init_splash();

/*
Initializes the necessary variables for drawing splash screens. Designed for use 
in the Create event of the object being used to draw splash screens. Only needs
to be run ONCE for ALL splash screens in a single object.

No parameters

Example usage: edgess_init_splash();
*/

//Initialize core splash variables
splash_id = -1;
splash_current = 0;
splash_delta = (1/room_speed)*1000000;
splash_init = true;
