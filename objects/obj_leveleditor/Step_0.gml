if (window_get_height() != old_window_get_height)
or (window_get_width() != old_window_get_width)
{
	scr_set_screen_size();
	old_window_get_height = window_get_height();
	old_window_get_width = window_get_width();
}

#region /*Activate objects that always should be active*/
if (asset_get_type("obj_foreground1")==asset_object)
{
	instance_activate_object(obj_foreground1);
}
if (asset_get_type("obj_foreground2")==asset_object)
{
	instance_activate_object(obj_foreground2);
}
if (asset_get_type("obj_level_player_1_start")==asset_object)
{
	instance_activate_object(obj_level_player_1_start);
}
if (asset_get_type("obj_level_player_2_start")==asset_object)
{
	instance_activate_object(obj_level_player_2_start);
}
if (asset_get_type("obj_level_player_3_start")==asset_object)
{
	instance_activate_object(obj_level_player_3_start);
}
if (asset_get_type("obj_level_player_4_start")==asset_object)
{
	instance_activate_object(obj_level_player_4_start);
}
if (asset_get_type("obj_level_end")==asset_object)
{
	instance_activate_object(obj_level_end);
}
if (asset_get_type("obj_level_height")==asset_object)
{
	instance_activate_object(obj_level_height);
}
if (asset_get_type("obj_level_width")==asset_object)
{
	instance_activate_object(obj_level_width);
}
#endregion /*Activate objects that always should be active END*/