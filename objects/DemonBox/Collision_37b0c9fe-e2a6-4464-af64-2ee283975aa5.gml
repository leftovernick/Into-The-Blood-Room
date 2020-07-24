/// @description Insert description here
// You can write your code in this editor
if (creator == noone || creator == other) {
	exit
}


//show_debug_message("groundRequirement: " + string(groundRequirement))
//show_debug_message("Place_meeting: " + string(!place_meeting(Player.x, Player.y+1, Wall)))
if instance_exists(Player) {
	if ((airRequirement && !Player.inAir && !place_meeting(x, y+16, Wall)) || (groundRequirement && Player.inAir) || (alarm[0] > 0)) {
		exit
	} else {
	
		
		if (Player.x > other.x) {
			Player.image_xscale = -1;	
		} else {
			Player.image_xscale = 1;	
		}
		Player.state = attack_script;
		alarm[0] = 180;	
		Player.horizDemonBox.alarm[0] = 180;
	}
	
}