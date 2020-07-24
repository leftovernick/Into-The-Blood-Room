/// @description Insert description here
// You can write your code in this editor

if (instance_exists(Player)) {
	if (Player.state != demon_attack_ora_state) {
		instance_destroy()	
	}
} else {
	instance_destroy();	
}

if (animation_hit_frame(0) or animation_hit_frame(2)) {
	audio_play_sound(choose(a_ora_hit1, a_ora_hit2), 3, false);
}