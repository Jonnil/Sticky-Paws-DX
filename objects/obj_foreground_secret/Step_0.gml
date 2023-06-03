#region /* When editing a level, make the foreground transparent */
if (global.play_edited_level == false)
{
	image_alpha = 0.5;
}
else
{
	if (asset_get_type("obj_player") == asset_object)
	&& (place_meeting(x, y, obj_player))
	{
		image_alpha = lerp(image_alpha, 0, 0.1);
	}
	else
	{
		image_alpha = lerp(image_alpha, 1, 0.1);
	}
}
#endregion /* When editing a level, make the foreground transparent END */

#region /* Destroy this object if it ever appears in the wrong room */
if (asset_get_type("room_title") == asset_room)
&& (room == room_title)
{
	instance_destroy();
}
#endregion /* Destroy this object if it ever appears in the wrong room END */

instance_activate_object(self);

#region /* When Foreground secret should be visible */
if (global.custom_foreground_secret > noone)
&& (global.enable_foreground_layer_secret)
&& (global.full_level_map_screenshot == false)
&& (asset_get_type("room_leveleditor") == asset_room)
&& (room == room_leveleditor)
{
	visible = true;
}
#endregion /* When Foreground secret should be visible END */