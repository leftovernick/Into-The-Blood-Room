hspd = dir * spd;
vspd = grav;

//Horizontal Collision
if (place_meeting(x+hspd, y, Wall)) {
	while (!place_meeting(x+sign(hspd), y, Wall)) {
		x += sign(hspd);	
	}
	hspd = 0

		
	image_xscale = -dir;
	dir *= -1;

	
}
x += hspd;

//Vertical Collision
if (place_meeting(x, y+vspd, Wall)) {
	while (!place_meeting(x, y+sign(vspd), Wall)) {
		y += sign(vspd);	
	}
	vspd = 0;
	
	if (fearOfHeights) && !position_meeting(x+(sprite_width/2), y+(sprite_height/2) + 1, Wall) {

		
	image_xscale = -dir;
	dir *= -1;
	
	}
}
y += vspd;