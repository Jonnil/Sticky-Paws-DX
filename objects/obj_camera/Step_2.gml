#region /*Deactivate instances outside view*/
instance_activate_all();
if (global.deactivate_objects_outsiede_view = true) /*This global variable is for debug purposes, and should always be set to true when playing the game normally*/
{
	instance_deactivate_region(
	camera_get_view_x(view_camera[view_current]) - 32,
	camera_get_view_y(view_camera[view_current]) - 32,
	camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32,
	camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32,
	false, true);
}
#endregion /*Deactivate instances outside view END*/

#region /*Activate objects that always should be active*/
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
#endregion /*Activate objects that always should be active END*/