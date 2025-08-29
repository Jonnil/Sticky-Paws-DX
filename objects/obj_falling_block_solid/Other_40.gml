var camera_y = camera_get_view_y(view_camera[view_current]);

if (y > camera_y + camera_get_view_height(view_camera[view_current]) && fall >= 60)
{
	if (image_index >= 2)
	{
		instance_destroy();
	}
	x = xstart;
	y = camera_y - 32;
	respawn_timer = 60 * 3; /* 3 seconds before falling block respawns */
	gravity = 0;
	hspeed = 0;
	vspeed = 0;
	image_alpha = 0;
	fall = false;
}
