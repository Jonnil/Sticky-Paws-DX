var camera_y = camera_get_view_y(view_camera[view_current]);

if (y > camera_y + camera_get_view_height(view_camera[view_current]) && fall >= 100) {
	x = xstart;
	y = camera_y;
	respawn_timer = 60;
	fall = false;
	gravity = 0;
	hspeed = 0;
	vspeed = 0;
	image_alpha = 0;
}