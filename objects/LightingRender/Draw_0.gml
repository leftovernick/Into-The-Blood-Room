/// @description Insert description here
// You can write your code in this editor

if (surface_exists(lighting_surface) == false) {
	 lighting_surface = surface_create(3000, 3000);
}

surface_set_target(lighting_surface);

draw_clear_alpha(c_black, .5);

with(LightingCutout) {
	
	var wobble_amount_x = image_xscale + random_range(-wobble, wobble);
	var wobble_amount_y = image_yscale + random_range(-wobble, wobble);
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index, image_index, x, y, wobble_amount_x, wobble_amount_y, 0, c_white, 1);
	
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, wobble_amount_x, wobble_amount_y, 0, color, intensity);
	
	gpu_set_blendmode(bm_normal);
}

surface_reset_target();

draw_surface(lighting_surface, 0, 0);

