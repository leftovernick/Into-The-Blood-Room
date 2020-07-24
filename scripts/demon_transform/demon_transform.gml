demon = true;
add_screenshake(8, 20);

//set sprites
idle_sprite = spr_player_demon_idle;
run_sprite = spr_player_demon_run;
jump_sprite = spr_player_demon_jump;
dash_sprite = spr_player_demon_dash;
wallgrab_sprite = spr_player_demon_wallgrab;
attack_sprite = spr_player_demon_attack;

//set audio
footstep_audio1 = a_demon_footstep1;
footstep_audio2 = a_demon_footstep2;
footstep_audio3 = a_demon_footstep3;
jump_audio = a_jump3

//set abilities
spd = 4;
acc = 2.5;
hspd = 0;
vspd = 0;
grav = .4;
jumpHeight = 10;
dashLength = 10;

//create hitboxes
horizDemonBox = instance_create_layer(x, y, "Instances", DemonBox);
horizDemonBox.creator = self;
horizDemonBox.attack_script = demon_attack_side_projectile_state;
horizDemonBox.sprite_index = spr_hb_demon_side;
horizDemonBox.groundRequirement = true;
horizDemonBox.alarm[0] = 90;

oraDemonBox = instance_create_layer(x, y, "Instances", DemonBox);
oraDemonBox.creator = self;
oraDemonBox.attack_script = demon_attack_ora_state;
oraDemonBox.sprite_index = spr_hb_demon_ora;
oraDemonBox.airRequirement = true;


verticleDemonBox = instance_create_layer(x, y, "Instances", DemonBox);
verticleDemonBox.creator = self;
verticleDemonBox.attack_script = demon_attack_stretch_state;
verticleDemonBox.sprite_index = spr_hb_demon_verticle;
verticleDemonBox.groundRequirement = true;
