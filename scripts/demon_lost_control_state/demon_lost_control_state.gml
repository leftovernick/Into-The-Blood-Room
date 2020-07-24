
if instance_exists(DemonBox) {
	instance_destroy(DemonBox);	
}
set_state_sprite(spr_player_demon_control_lost, 1, 0);
if animation_end() {
	audio_stop_all();
	room_goto(rm_gameOver);	
}

add_screenshake(5, 1)
y -= .5;