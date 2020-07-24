/// @description Insert description here
// You can write your code in this editor
if GameController.pause {
	image_speed = 0;
	exit	
} else {
	image_speed = 1;	
}

get_input()
script_execute(state);

if stamina > max_stamina {
	stamina = max_stamina;	
} else if stamina < 0 {
	stamina = 0;	
}

if bloodlust < 0 {
	bloodlust = 0;	
} else if bloodlust >= max_bloodlust && !demon {
	bloodlust = 0;
	audio_play_sound(a_transformation, 10, false)
	state = transforming_state;
	add_screenshake(10, 240);
} else if (bloodlust >= max_bloodlust && demon && !audio_is_playing(a_finalTransformation)) {
	bloodlust = max_bloodlust;	
	audio_play_sound(a_finalTransformation, 10, false)
	state = demon_lost_control_state;
}