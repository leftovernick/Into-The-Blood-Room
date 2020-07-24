/// @description collide with enemy
// You can write your code in this editor

if (creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1) {
	exit;
}

audio_play_sound(a_medium_hit, 5, false);
other.hp -= damage;
ds_list_add(hit_objects, other);
with other {
	event_user(0);
}
other.knockback_speed = knockback * image_xscale;

//if (other.object_index == Player and 

add_screenshake(14, 8);
