set_state_sprite(attack_sprite, 1, 0)
hspd = 0

if (animation_hit_frame(2)) {
	audio_play_sound(a_hit, 4, false);
	create_hitbox(x, y, self, spr_hb_attack, 0, 2, 1, image_xscale);
	if demon {
		horizDemonBox.alarm[0] = 90	
	}
}


if (animation_end()) {
	if (!demon) {
		state = move_state;
		sprite_index = idle_sprite;
		image_index = 0;
	} else {
		state = move_state;
		sprite_index = idle_sprite;
		image_index = 0;
	}
}
