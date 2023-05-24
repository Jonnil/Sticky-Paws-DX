function scr_enemy_dying_offscreen()
{
	var view_left = camera_get_view_x(view_camera[view_current]);
	var view_right = (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current]));
	var view_top = camera_get_view_y(view_camera[view_current]);
	var view_bottom = (camera_get_view_y(view_camera[view_current])) + (camera_get_view_height(view_camera[view_current]));
	
	if (bbox_top > room_height + 16)
	{
		y = room_height * 2
		instance_destroy();
	}
	
	if (bbox_left > view_right + 16)
	or (bbox_right < view_left - 16)
	or (bbox_top > view_bottom + 16)
	or (bbox_bottom < view_top - 16)
	{
		if (die)
		{
			y = room_height * 2
			instance_destroy();
		}
	}
}