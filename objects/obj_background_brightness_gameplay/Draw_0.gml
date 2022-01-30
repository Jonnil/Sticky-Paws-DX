#region /*Background Brightness in Gameplay Options*/
if (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	background_brightness_lerp = lerp(background_brightness_lerp, global.background_brightness_gameplay, 0.1);
	if (background_brightness_lerp < 0)
	{
		draw_set_alpha(abs(background_brightness_lerp));
		draw_rectangle_color(-32,-32, room_width*2, room_height*2, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	else
	if (background_brightness_lerp > 0)
	{
		draw_set_alpha(abs(background_brightness_lerp));
		draw_rectangle_color(-32,-32, room_width*2, room_height*2, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
}
#endregion /*Background Brightness in Gameplay Options END*/