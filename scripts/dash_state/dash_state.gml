
vspd = 0;
hspd = 10 * image_xscale;

if alarm[0] < 0 {
	alarm[0] = (dashLength);
}

if animation_end() {
	image_speed = 0;	
}

move(Wall);