audio_play_sound(a_gameOver, 10, false);

if instance_exists(Player) {
	instance_destroy(Player);	
}
if instance_exists(Camera) {
	instance_destroy(Camera);	
}
