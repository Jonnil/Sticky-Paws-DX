#region /* When editing a level, make the foreground transparent */
if (!global.play_edited_level)
{
	image_alpha = 0.5;
}
else
{
	if (place_meeting(x, y, obj_player))
	{
		image_alpha = lerp(image_alpha, 0, 0.1);
	}
	else
	{
		image_alpha = lerp(image_alpha, 1, 0.1);
	}
}
#endregion /* When editing a level, make the foreground transparent END */

#region /* When Foreground secret should be visible */
if (global.custom_foreground_secret > noone)
&& (global.enable_foreground_layer_secret)
&& (!global.full_level_map_screenshot)
{
	visible = true;
}
else
{
	visible = false;
}
#endregion /* When Foreground secret should be visible END */