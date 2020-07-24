set_state_sprite(spr_player_demon_stretch_attack, 1, 0);

if (animation_hit_frame(5)) {
	create_hitbox(x, y, self, spr_hb_demon_stretch, 0, 30, 1, image_xscale);	
}

if (animation_end()) {
	state =	move_state;
}