/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y+1, Wall) && state != transforming_state && state != demon_attack_side_projectile_state && state != demon_attack_ora_state && state != demon_attack_stretch_state) {
	state = attack_state;
}
