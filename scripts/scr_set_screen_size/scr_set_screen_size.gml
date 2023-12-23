function scr_set_screen_size()
{
	var window_width = window_get_width();
	var window_height = window_get_height();
	
	#region /* Set GUI size */
	switch (global.gui_scale_modifier)
	{
		/* GUI Scale Auto */ case 0:
			/* 3840 x 2160 */ if (window_get_width() >= 3840 - 40 && window_get_height() >= 2160 - 40){global.gui_width = window_width * 0.7; global.gui_height = window_height * 0.7; break;}else
			/* 3440 x 1440 */ if (window_get_width() >= 3440 - 40 && window_get_height() >= 1440 - 40){global.gui_width = window_width * 0.8; global.gui_height = window_height * 0.8; break;}else
			/* 2560 x 1440 */ if (window_get_width() >= 2560 - 40 && window_get_height() >= 1440 - 40){global.gui_width = window_width * 0.9; global.gui_height = window_height * 0.9; break;}else
			/* 1920 x 1080 */ if (window_get_width() >= 1920 - 40 && window_get_height() >= 1080 - 40){global.gui_width = window_width; global.gui_height = window_height; break;}else
			/* 1600 x 900 */ if (window_get_width() >= 1600 - 40 && window_get_height() >= 900 - 40){global.gui_width = window_width * 1.0; global.gui_height = window_height * 1.0; break;}else
			/* 1280 x 720 */ if (window_get_width() >= 1280 - 40 && window_get_height() >= 720 - 40){global.gui_width = window_width * 1.0; global.gui_height = window_height * 1.0; break;} /* Nintendo Switch Handheld Resolution */ else
			/* 1024 x 576 */ if (window_get_width() >= 1024 - 40 && window_get_height() >= 576 - 40){global.gui_width = window_width * 1.1; global.gui_height = window_height * 1.1; break;}else
			/* 960 x 540 */ if (window_get_width() >= 960 - 40 && window_get_height() >= 540 - 40){global.gui_width = window_width * 1.2; global.gui_height = window_height * 1.2; break;}else
			/* Lower than 540p, like 480 x 270 */ {global.gui_width = window_width * 2.5; global.gui_height = window_height * 2.5; break;}
		
		/* GUI Scale Fixed */
		case 1: global.gui_width = window_width * 0.6; global.gui_height = window_height * 0.6; break;
		case 2: global.gui_width = window_width * 0.7; global.gui_height = window_height * 0.7; break;
		case 3: global.gui_width = window_width * 0.8; global.gui_height = window_height * 0.8; break;
		case 4: global.gui_width = window_width * 0.9; global.gui_height = window_height * 0.9; break;
		case 5: global.gui_width = window_width; global.gui_height = window_height; break;
		case 6: global.gui_width = window_width * 1.1; global.gui_height = window_height * 1.1; break;
		case 7: global.gui_width = window_width * 1.2; global.gui_height = window_height * 1.2; break;
		case 8: global.gui_width = window_width * 1.3; global.gui_height = window_height * 1.3; break;
		case 9: global.gui_width = window_width * 1.4; global.gui_height = window_height * 1.4; break;
		case 10: global.gui_width = window_width * 2.5; global.gui_height = window_height * 2.5; break;
		default: break;
	}
	if (display_get_gui_width() != global.gui_width)
	|| (display_get_gui_height() != global.gui_height)
	{
		display_set_gui_size(global.gui_width, global.gui_height);
	}
	#endregion /* Set GUI size END */
	
	if (global.gui_scale != -1)
	{
		display_set_gui_maximise(global.gui_scale, global.gui_scale, 0, 0);
	}
	
	#region /* Set screen size */
	var current_camera = view_camera[view_current];
	if (camera_get_view_border_x(current_camera) != camera_get_view_width(current_camera))
	|| (camera_get_view_border_y(current_camera) != camera_get_view_height(current_camera))
	{
		camera_set_view_border(current_camera, camera_get_view_width(current_camera), camera_get_view_height(current_camera));
	}
	
	camera_set_view_size(current_camera, window_width, window_height);
	
	if (global.play_edited_level || room == rm_world_map)
	{
		camera_set_view_speed(current_camera, -1, -1);
	}
	else
	{
		camera_set_view_speed(current_camera, 0, 0);
	}
	
	if (camera_get_view_target(current_camera) != self){camera_set_view_target(current_camera, self);}
	#endregion /* Set screen size END */
	
}