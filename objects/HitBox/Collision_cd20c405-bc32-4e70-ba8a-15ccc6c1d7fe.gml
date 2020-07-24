/// @description collide with enemy
// You can write your code in this editor

if (creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1) {
	exit;
}

audio_play_sound(a_medium_hit, 5, false);

ds_list_add(hit_objects, other);
with other {
	event_user(0);
}


add_screenshake(3, 15)
