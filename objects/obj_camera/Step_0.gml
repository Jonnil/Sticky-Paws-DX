#region /*Deactivate instances outside view*/
if (delay = 2)
{
	instance_activate_all();
	if (global.deactivate_objects_outsiede_view = true) /*This global variable is for debug purposes, and should always be set to true when playing the game normally*/
	{
		instance_deactivate_region(
		camera_get_view_x(view_camera[view_current]) - 64,
		camera_get_view_y(view_camera[view_current]) - 64,
		camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 64 + view_wview_lerp,
		camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 128 + view_hview_lerp,
		false, true);
	}
}
else
{
	delay += 1;
}
#endregion /*Deactivate instances outside view END*/

#region /*Activate objects that always should be active*/
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
if (asset_get_type("obj_player") == asset_object)
{
	instance_activate_object(obj_player);
}
if (asset_get_type("obj_player_map") == asset_object)
{
	instance_activate_object(obj_player_map);
}
if (asset_get_type("obj_player_die") == asset_object)
{
	instance_activate_object(obj_player_die);
}
if (asset_get_type("obj_foreground1") == asset_object)
{
	instance_activate_object(obj_foreground1);
}
if (asset_get_type("obj_foreground2") == asset_object)
{
	instance_activate_object(obj_foreground2);
}
if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
{
	instance_activate_object(obj_background_brightness_gameplay);
}
if (asset_get_type("obj_water_level") == asset_object)
{
	instance_activate_object(obj_water_level);
}
if (asset_get_type("obj_level_height") == asset_object)
{
	instance_activate_object(obj_level_height);
}
if (asset_get_type("obj_level_width") == asset_object)
{
	instance_activate_object(obj_level_width);
}
if (asset_get_type("obj_credits") == asset_object)
{
	instance_activate_object(obj_credits);
}
#endregion /*Activate objects that always should be active END*/

#region /*Make sure the lives counter never goes below 0*/
if (lives < 0)
{
	lives = 0;
}
#endregion /*Make sure the lives counter never goes below 0 END*/