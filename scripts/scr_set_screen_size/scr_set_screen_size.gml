function scr_set_screen_size()
{
	
	#region /*Set screen size*/
	camera_set_view_border(view_camera[view_current], camera_get_view_width(view_camera[view_current]), camera_get_view_height(view_camera[view_current])); /*View Border*/
	
	if (window_get_width()<=1920)
	and(window_get_height()<=1080)
	{
		camera_set_view_size(view_camera[view_current], window_get_width()+view_wview_lerp, window_get_height()+view_hview_lerp);
		//camera_set_view_size(view_camera[view_current], window_get_width(), window_get_height());
	}
	else
	if (window_get_width()>1920)
	and(window_get_height()<=1080)
	{
		camera_set_view_size(view_camera[view_current], 1920+view_wview_lerp, window_get_height()+view_hview_lerp);
		//camera_set_view_size(view_camera[view_current], 1920, window_get_height());
	}
	else
	if (window_get_width()<=1920)
	and(window_get_height()>1080)
	{
		camera_set_view_size(view_camera[view_current], window_get_width()+view_wview_lerp, 1080+view_hview_lerp);
		//camera_set_view_size(view_camera[view_current], window_get_width(), 1080);
	}
	else
	{
		camera_set_view_size(view_camera[view_current], 1920+view_wview_lerp, 1080+view_hview_lerp);
		//camera_set_view_size(view_camera[view_current], 1920, 1080);
	}
	
	if (global.play_edited_level = true)
	or (room = room_level_select)
	{
		camera_set_view_speed(view_camera[view_current], -1, -1);
	}
	else
	{
		camera_set_view_speed(view_camera[view_current], 0, 0);
	}
	camera_set_view_target(view_camera[view_current], self);
	display_set_gui_size(window_get_width(), window_get_height());
	#endregion /*Set screen size END*/
	
}