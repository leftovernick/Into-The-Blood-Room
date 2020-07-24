var inputRight = (right or dpad_right);
var inputLeft = (left or dpad_left);

sprite_index = wallgrab_sprite;
vspd = 0;
vspd += (grav / 1.2);
stamina -= .2
var backWall = "none";
dashCount = maxDashCount;

if (place_meeting(x-1, y-16, Wall) && place_meeting(x-1, y+16, Wall)) {
	backWall = "left";
} else if (place_meeting(x+1, y-16, Wall) && place_meeting(x+1, y+16, Wall)) {
	backWall = "right";	
} else {
	backWall = "none";	
}

if (action) {
	vspd = -jumpHeight;
	audio_play_sound(jump_audio, 4, false);
	audio_play_sound(walljump_audio, 6, false);
	stamina -= 25
	alarm[2] = 15;

	

	hspd += acc * 2 * -image_xscale;

	state = move_state;
}

if (inputLeft && backWall == "right") {
	hspd -= acc*3;
	state = move_state;
}

if (inputRight && backWall == "left") {
	hspd += acc*3;
	state = move_state;
}

if (stamina < 0) || (backWall == "none") || (backWall == "right" && !(place_meeting(x+1, y, Wall))) || (backWall == "left" && !(place_meeting(x-1, y, Wall))) || (place_meeting(x, y+16, Wall) || (action && stamina < 10)){
	state = move_state;	
}

move(Wall);