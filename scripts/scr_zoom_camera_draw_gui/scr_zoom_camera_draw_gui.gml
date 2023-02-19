/// @function scr_zoom_camera_draw_gui(width)
/// @description scr_zoom_camera_draw_gui(width)
/// @param width
function scr_zoom_camera_draw_gui(width = 10)
{
	if (variable_instance_exists(self, "zoom_border_lerp"))
	and (zoom_border_lerp > 0)
	{
		draw_set_alpha(zoom_border_lerp);
		draw_rectangle_color(0, width + 1, width, display_get_gui_height() - (width + 1), c_red, c_red, c_red, c_red, false); /* Left */
		draw_rectangle_color(display_get_gui_width() - width, 0, room_width * 2, display_get_gui_height() - (width + 1), c_red, c_red, c_red, c_red, false); /* Right */
		draw_rectangle_color(0, 0, display_get_gui_width() - (width + 1), width, c_red, c_red, c_red, c_red, false); /* Top */
		draw_rectangle_color(0, display_get_gui_height() - width, room_width * 2, room_height * 2, c_red, c_red, c_red, c_red, false); /* Bottom */
		draw_set_alpha(1);
	}
}