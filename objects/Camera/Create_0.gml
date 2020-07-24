/// @description initialize variables

cam = view_camera[0];
view_width = camera_get_view_width(cam);
view_height = camera_get_view_height(cam);
view_w_half = view_width / 2;
view_h_half = view_height / 2;

buff = 16;

screenshake = 0;
shake_length = 0;
shake_magnitude = 6;
shake_remain = 6;








follow = Player;
xTo = xstart;
yTo = ystart;