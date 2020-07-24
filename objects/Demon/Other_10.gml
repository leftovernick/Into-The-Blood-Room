/// @description Kill Demon

if random_range(0,100) < 2 {
	audio_play_sound(a_demon_meh, 10, false);	
} else {
	audio_play_sound(a_demon_death, 3, false);
}


instance_destroy()