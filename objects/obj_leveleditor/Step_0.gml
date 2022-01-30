#region /*Fullscreen Toggle if camera doesn't exist. Default: F11*/
if (keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("config.ini");
	ini_write_real("config", "fullscreen_mode", window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera doesn't exist. Default: F11 END*/

scr_parallax_scrolling_background();

#region /*Deactivate instances outside view*/
if (startup_loading_timer <= 3)
{
	startup_loading_timer += 1;
}

if (quit_level_editor = 0)
and (global.play_edited_level = false)
and (startup_loading_timer >= 3)
{
	instance_activate_all();
	if (global.deactivate_objects_outsiede_view= true)
	{
		instance_deactivate_region(
		camera_get_view_x(view_camera[0]) - 32,
		camera_get_view_y(view_camera[0]) - 32,
		camera_get_view_width(view_camera[0]) + 32 /*Camera Width*/,
		camera_get_view_height(view_camera[0]) + 32 /*Camera Height*/,
		false, true);
	}
}
else
{
	instance_activate_all();
}

#region /*Activate objects that always should be active*/
if (asset_get_type("obj_player") == asset_object)
{
	instance_activate_object(obj_player);
}
if (asset_get_type("obj_player_die") == asset_object)
{
	instance_activate_object(obj_player_die);
}
if (asset_get_type("obj_foreground1") == asset_object)
{
	instance_activate_object(obj_foreground1);
}
if (asset_get_type("obj_foreground_above_static_objects") == asset_object)
{
	instance_activate_object(obj_foreground_above_static_objects);
}
if (asset_get_type("obj_foreground2") == asset_object)
{
	instance_activate_object(obj_foreground2);
}
if (asset_get_type("obj_foreground_secret") == asset_object)
{
	instance_activate_object(obj_foreground_secret);
}
if (asset_get_type("obj_level_player_1_start") == asset_object)
{
	instance_activate_object(obj_level_player_1_start);
}
if (asset_get_type("obj_level_player_2_start") == asset_object)
{
	instance_activate_object(obj_level_player_2_start);
}
if (asset_get_type("obj_level_player_3_start") == asset_object)
{
	instance_activate_object(obj_level_player_3_start);
}
if (asset_get_type("obj_level_player_4_start") == asset_object)
{
	instance_activate_object(obj_level_player_4_start);
}
if (asset_get_type("obj_level_end") == asset_object)
{
	instance_activate_object(obj_level_end);
}
if (asset_get_type("obj_level_height") == asset_object)
{
	instance_activate_object(obj_level_height);
}
if (asset_get_type("obj_level_width") == asset_object)
{
	instance_activate_object(obj_level_width);
}
if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
{
	instance_activate_object(obj_background_brightness_gameplay);
}
#endregion /*Activate objects that always should be active END*/

#endregion /*Deactivate instances outside view END*/

#region /*Always keep the brush size within these values*/
if (place_brush_size < 0)
{
	place_brush_size = 0;
}
if (place_brush_size >5)
{
	place_brush_size =5;
}
if (erase_brush_size < 0)
{
	erase_brush_size = 0;
}
if (erase_brush_size >5)
{
	erase_brush_size =5;
}
#endregion /*Always keep the brush size within these values END*/

if (window_get_height() != old_window_get_height)
or(window_get_width() != old_window_get_width)
{
	scr_set_screen_size();
	old_window_get_height = window_get_height();
	old_window_get_width = window_get_width();
}