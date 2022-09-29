function scr_draw_darken_screen_when_window_is_unfocused()
{
	
	#region /* If Window is unfocused, make the screen darker */
	if (!window_has_focus()) /* First check if window is unfocused before doing any other code */
	{
		if (asset_get_type("obj_pause") == asset_object)
		and (self == obj_pause)
		and (hide_menu_for_clean_screenshots == false)
		or (asset_get_type("obj_pause") == asset_object)
		and (self != obj_pause)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, window_get_width() * 3, window_get_height() * 3, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
		}
	}
	#endregion /* If Window is unfocused, make the screen darker END */
	
}