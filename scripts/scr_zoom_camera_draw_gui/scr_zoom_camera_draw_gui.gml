/// @function scr_zoom_camera_draw_gui(width)
/// @description scr_zoom_camera_draw_gui(width)
/// @param width
function scr_zoom_camera_draw_gui(width = 10)
{
	if (variable_instance_exists(self, "zoom_border_lerp"))
	{
		draw_set_alpha(zoom_border_lerp);
	}
	else
	{
		draw_set_alpha(1);
	}
	draw_rectangle_color(0, width + 1, width, window_get_height() - (width + 1), c_red, c_red, c_red, c_red, false); /* Left */
	draw_rectangle_color(window_get_width() - width, 0, room_width * 2, window_get_height() - (width + 1), c_red, c_red, c_red, c_red, false); /* Right */
	draw_rectangle_color(0, 0, window_get_width() - (width + 1), width, c_red, c_red, c_red, c_red, false); /* Top */
	draw_rectangle_color(0, window_get_height() - width, room_width * 2, room_height* 2, c_red, c_red, c_red, c_red, false); /* Bottom */
	draw_set_alpha(1);
}