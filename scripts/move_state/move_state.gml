///move_state()

var inputRight = (right or dpad_right);
var inputLeft = (left or dpad_left);

//make sure we haven't assigned new state
if (state == move_state) {


	if (!place_meeting(x, y+1, Wall)) {
		vspd += grav;
	
		//Player in air
		inAir = true;
		
		image_speed = 0;
		if dashCount != 0 {
			sprite_index = jump_sprite;
			image_index = (vspd > 0) + 1;
		}
		

		if (action) && (dashCount > 0) && (stamina > 0) {
			dashCount --;
			sprite_index = dash_sprite;
			image_index = 0;
			image_speed = 1;
			audio_play_sound(choose(dash_audio1, dash_audio2, dash_audio3), 5, false);
			state = dash_state	
			if stamina > 5 {
				stamina -= 5;	
			} else {
				stamina = 0;	
			}
			
		}
	
		//control jump height
		if(action_released && vspd < -.5) {
			vspd = -.5;	
		}
		
		if (alarm[2] < 0 && stamina != 0 && ((place_meeting(x+1, y-16, Wall) && (place_meeting(x+1, y+16, Wall))) || (place_meeting(x-1, y-16, Wall) && place_meeting(x-1, y+16, Wall))) && (!place_meeting(x, y+16, Wall))) {
			if (place_meeting(x-1, y, Wall) && inputLeft) {
				audio_play_sound(wallgrab_audio, 5, false);
				state = wallgrab_state	
			} else if (place_meeting(x+1, y, Wall) && inputRight) {
				audio_play_sound(wallgrab_audio, 5, false);
				state = wallgrab_state	
			}

		}
		
		//control horizontal air movement
		if (vspd != 0) {
			if (inputRight) {
				debug_message = "input right in air"
				hspd += acc;
				
	
				if (hspd > spd) { 
					debug_message = "HSPD is larger than spd, clamping"
					hspd = spd;
					}
		
		
			} else if (inputLeft && !place_meeting(x+1, y, Wall)) {
				debug_message = "input left in air"
				hspd -= acc/4;
		
				if (hspd < -spd) { 
					hspd = -spd;
					debug_message = "HSPD is smaller than -spd, clamping"
					}

			} else {
				//apply_friction(acc);
				debug_message = "appying air friction"
				if hspd < -1 {
					hspd += acc/10;
				} if hspd > 1 {
					hspd -= acc/10;
				}
		
			}
		}
		
		
	} else {
		debug_message = ""
		inAir = false;
		if (vspd == spd) {
			repeat(7) {
				var xx = x + random_range(-16, 16);
				var yy = y + random_range(12, 18);
				
				//var obj = instance_create_layer(xx, yy, "Particles_Back", Dust);
				
			}
		}
		vspd = 0;	
		dashCount = maxDashCount;
		if (alarm[1] < 0 && stamina < 50) {
			alarm[1] = 120;
			stamina += 25;
		}
		stamina += 1.5;
	
		/*else if (up or dpad_up) {
			
		//allow actions
		if (pad_left) {
			
			state = attack_1_state;	
		} else if (pad_top) {
			state = arrow_state;
		} state = lookup_state;
		} else if (down or dpad_down) {
			state = lookdown_state;	
		} */
	
		//jumping
		if (action && state) {
			vspd = -jumpHeight;
			stamina -= 15;
			alarm[2] = 10;
			audio_play_sound(jump_audio, 6, false);
		}
	
		//Player is on ground
		if (hspd == 0) {
			sprite_index = idle_sprite;
			image_speed = 1;
		} else {
			sprite_index = run_sprite;
			image_speed = 1;
		
		}
	
	
		if (inputRight) {
			debug_message = "input right on ground"
			hspd += acc;
	
			if (hspd > spd) { 
				debug_message = "HSPD is larger than spd, clamping"
				hspd = spd;
				}
		
			if ((animation_hit_frame(1) or animation_hit_frame(3)) && sprite_index != spr_player_idle && sprite_index != spr_player_demon_idle) {
				audio_play_sound(choose(footstep_audio1, footstep_audio2), 3, false);
			}
		
		} else if (inputLeft){
			debug_message = "input left on ground"
			hspd -= acc;

		
			if (hspd < -spd) { 
				debug_message = "HSPD is smaller than -spd, clamping"
				hspd = -spd;
				}
		
			if (animation_hit_frame(1) or animation_hit_frame(3) && sprite_index != spr_player_idle && sprite_index != spr_player_demon_idle) {
				audio_play_sound(choose(footstep_audio1, footstep_audio2), 3, false);
			}
		} else {
			//apply_friction(acc);
			if hspd < -1 {
				hspd += (acc/2);
			} if hspd > 1 {
				hspd -= (acc/2);
			} else {
			hspd = 0	
			}
		
		}


	}
	
	
	
	
	
	if (hspd != 0) {
		image_xscale = sign(hspd);	
	}

	

}

move(Wall);
