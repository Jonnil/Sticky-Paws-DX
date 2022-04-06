if (instance_exists(obj_player))
{
	draw_text_outlined(obj_player.x, obj_player.y, string(x) + "-" + string(y), global.default_text_size, c_white, c_black, 1);
}

#region /*When editing a level, make the foreground transparent*/
if (global.play_edited_level = false)
{
	image_alpha = 0.5;
}
else
{
	if (asset_get_type("obj_player") == asset_object)
	and (place_meeting(x, y, obj_player))
	{
		image_alpha = lerp(image_alpha, 0, 0.1);
	}
	else
	{
		image_alpha = lerp(image_alpha, 1, 0.1);
	}
}
#endregion /*When editing a level, make the foreground transparent END*/

#region /*Destroy this object if it ever appears in the wrong room*/
if (asset_get_type("room_title") == asset_room)
and (room = room_title)
{
	instance_destroy();
}
#endregion /*Destroy this object if it ever appears in the wrong room END*/

x = 0;
y = 0;
instance_activate_object(self);

#region /*Update Foreground secret*/
if (global.custom_foreground_secret > noone)
and (global.enable_foreground_layer_secret = true)
and (global.full_level_map_screenshot = false)
and (asset_get_type("room_leveleditor") == asset_room)
and (room = room_leveleditor)
{
	draw_sprite_ext(global.custom_foreground_secret, image_index, x_offset, y_offset, 1, 1, 0, c_white, image_alpha);
}
#endregion /*Update Foreground secret END*/