///get_input()


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));

dpad_right = false;
dpad_left = false;
dpad_up = false;
dpad_down = false;

down_released = keyboard_check_released(ord("S"));

action = keyboard_check_pressed(vk_space)
action_released = keyboard_check_released(vk_space)

start = keyboard_check_pressed(vk_enter)

pad_left = keyboard_check_pressed(vk_left);
pad_top = keyboard_check_pressed(vk_up);
pad_right = keyboard_check_pressed(vk_right);

//override for gamepad
var gp_id = 0;
var thresh = .5;

if (gamepad_is_connected(gp_id)) {
	//show_message("Connected");
	right = gamepad_axis_value(gp_id, gp_axislh) > thresh;	
	left = gamepad_axis_value(gp_id, gp_axislh) < -thresh;
	up = gamepad_axis_value(gp_id, gp_axislv) < -thresh;
	down = gamepad_axis_value(gp_id, gp_axislv) > thresh;
	
	
	dpad_right = gamepad_button_check(gp_id, gp_padr);
	dpad_left = gamepad_button_check(gp_id, gp_padl);
	dpad_up = gamepad_button_check(gp_id, gp_padu);
	dpad_down = gamepad_button_check(gp_id, gp_padd);
	
	dpad_down_released = gamepad_button_check_released(gp_id, gp_padd);
	
	action = gamepad_button_check_pressed(gp_id, gp_face1);
	action_released = gamepad_button_check_released(gp_id, gp_face1);
	
	start = gamepad_button_check_pressed(gp_id, gp_start)
	
	pad_left = gamepad_button_check_pressed(gp_id, gp_face3);
	pad_top = gamepad_button_check_pressed(gp_id, gp_face4);
	pad_right = gamepad_button_check_pressed(gp_id, gp_face2);
	}