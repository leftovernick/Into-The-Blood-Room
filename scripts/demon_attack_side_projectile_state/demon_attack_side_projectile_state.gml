set_state_sprite(spr_player_demon_side_attack, 1, 0);

hspd = 0;
vspd = 0;

if (animation_hit_frame(0)) {
	audio_play_sound(a_fireball_chargeup, 8, false);
	add_screenshake(5, 45)
}

if (animation_hit_frame(4)) {
	audio_play_sound(a_fireball, 8, false)
	var demonBlast = instance_create_layer(x+(8*image_xscale), y, "Instances", DemonBlast)
	demonBlast.image_xscale = image_xscale;	
	demonBlast.depth = 1;
}

if animation_end() {;
	state = move_state;

}