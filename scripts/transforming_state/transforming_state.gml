set_state_sprite(spr_player_transform, 1, 0);

if animation_end() {
	demon_transform();
	state = move_state;	
}

stamina += 1.5;