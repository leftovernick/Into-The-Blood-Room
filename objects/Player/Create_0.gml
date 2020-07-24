/// @description Insert description here
// You can write your code in this editor

event_inherited();

debug_message = ""
demon = false;

spd = 3;
acc = 2;
hspd = 0;
vspd = 0;
grav = .5;
jumpHeight = 8;
dashLength = 8;

inAir = true;

//demon only variables
blast_range = 64;
horizDemonBox = noone;

maxDashCount = 1;
dashCount = maxDashCount;
bloodlust = 0;
max_bloodlust = 100;
max_stamina = 100;
stamina = max_stamina;

state = move_state;

//set sprites
idle_sprite = spr_player_idle;
run_sprite = spr_player_run;
jump_sprite = spr_player_jump;
dash_sprite = spr_player_dash;
wallgrab_sprite = spr_player_wallgrab;
attack_sprite = spr_player_attack;

//set audio
footstep_audio1 = a_footstep1;
footstep_audio2 = a_footstep2;
footstep_audio3 = a_footstep3;
jump_audio = a_jump2;
walljump_audio = a_wall_jump;
wallgrab_audio = a_wall_land;
dash_audio1 = a_dash1;
dash_audio2 = a_dash2;
dash_audio3 = a_dash3;
