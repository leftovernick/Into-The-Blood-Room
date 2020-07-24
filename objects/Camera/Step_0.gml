/// @description control camera

if GameController.pause {
	exit	
}

if (instance_exists(follow)) {
	xTo = follow.x
	yTo = follow.y
}

x += (xTo - x) / 15;
y += (yTo - y) / 15;

x = clamp(x, view_w_half+buff, room_width-view_w_half-buff);
y = clamp(y, view_h_half+buff, room_height-view_h_half-buff);

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length)*shake_magnitude));

camera_set_view_pos(cam, x-view_w_half, y-view_h_half);

if (layer_exists("Moon")) {
	layer_x("Moon", x/9);
}
if (layer_exists("Stars")) {
	layer_x("Stars", x/8);
}
if (layer_exists("mountain")) {
	layer_x("mountain", x/6);
}
if (layer_exists("Trees")) {
	layer_x("Trees", x/5);
}
 