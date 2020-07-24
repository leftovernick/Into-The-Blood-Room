/// @description Insert description here
// You can write your code in this editor
get_input();
if room != rm_title && room != rm_init_ && room != rm_gameOver {
	if start {
		if !pause {
			audio_play_sound(a_pause, 10, false)
		} else {
			audio_play_sound(a_unpause, 10, false)
		}
		pause = !pause;	
	}
} else if (room == rm_title) {
	
	if action || start {
		if (!audio_is_playing(a_game_start)) {
			audio_play_sound(a_game_start, 10, false)
			audio_stop_sound(m_title_screen)
			transitioning = true;
		}

	}
} else if (room == rm_gameOver) {
	if action || start {
		room_goto(rm_title);
	}

}


