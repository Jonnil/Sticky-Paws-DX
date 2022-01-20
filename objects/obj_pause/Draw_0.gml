#region /*Pause Screenshot*/
if (global.pause_screenshot > noone)
{
	draw_sprite_ext(global.pause_screenshot, 0, 0, 0, 1, 1, 0, c_white, 1);
}
#endregion /*Pause Screenshot END*/

#region /*Darker Background*/
if (hide_menu_for_clean_screenshots = false)
{
	draw_set_alpha(0.5);
	draw_rectangle_color (0, 0, room_width, room_height, c_red, c_blue, c_blue, c_red, false);
	draw_rectangle_color (0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
#endregion /*Darker Background END*/