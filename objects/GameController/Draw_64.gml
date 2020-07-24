/// @description Insert description here
// You can write your code in this editor


if (room == rm_title) {
	if transitioning {
		draw_set_alpha(alpha)
		draw_set_colour(c_black);
		draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
		alpha += .005;
		if (alpha >= 1) {
			transitioning = false
			draw_set_alpha(1);	
			room_goto_next();
		}
	}	
}




if (instance_exists(Player)) {
	

	//draw stamina gems
	for(var i=1; i<=5; i++) {

		if (floor(Player.stamina) >= i*20) {
			draw_sprite(spr_stamina_gem, 0, display_get_gui_width() - 128, (display_get_gui_height() - 308) - (i*48));
		} else {
			draw_sprite(spr_stamina_gem, 1, display_get_gui_width() - 128, (display_get_gui_height() - 308) - (i*48));
		}	
	}
	
	//draw bloodlust
	var col = make_colour_rgb(190, 38, 51);
	draw_set_colour(col);
	draw_rectangle(display_get_gui_width() - 96, 636 - (Player.bloodlust*3.1), display_get_gui_width() - 36, 640, false);
	if Player.demon {
		draw_sprite(spr_blood_boil, floor(frame), display_get_gui_width() - 64, 616 - (Player.bloodlust*3.1))
	} else {
		draw_sprite(spr_blood_swish, floor(frame), display_get_gui_width() - 64, 616 - (Player.bloodlust*3.1))
	}
	draw_sprite(spr_bloodlust_bar, 1, display_get_gui_width() - 64, display_get_gui_height() / 2)

	if !GameController.pause {
		if Player.demon {
			frame = (frame + animation_speed) % sprite_get_number(spr_blood_boil);
		} else {
			frame = (frame + animation_speed) % sprite_get_number(spr_blood_swish);
		}
	}
	
	
	
	
	
	
	if pause {
		draw_sprite(spr_pause_screen, 0, 0, 0);
	}
	
}