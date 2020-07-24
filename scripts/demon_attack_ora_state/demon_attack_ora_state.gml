if (sprite_index != spr_player_ora_attack) {
	var yy = y;
	
	while (!place_meeting(x, yy, Wall)) {
		yy++;
	}
	add_screenshake(6, 55)
	instance_create_layer(x, yy, "Instances", OraExplosion);
	alarm[3] = 45;
}
set_state_sprite(spr_player_ora_attack, 1, 0);

if (animation_hit_frame(0) || animation_hit_frame(2)) {
	audio_play_sound(choose(a_ora1, a_ora2, a_ora3), 6, false);	
}


if (!place_meeting(x, y+8, Wall) && alarm[3] > 0) {
	vspd = .5;	
} else {
	hspd = 0;
	state = move_state;	
}
y+= vspd;