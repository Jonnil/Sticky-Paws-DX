function scr_scroll_menu(offset_display_height = 200)
{
	
	#region /* Scroll menu */
	menu_y_offset = lerp(menu_y_offset, menu_y_offset_real, 0.5);
	if (menu_y_offset_real >= 0)
	{
		menu_y_offset_real = 0;
	}
	if (abs(menu_y_offset_real) + display_get_gui_height() - offset_display_height < menu_cursor_y_position)
	{
		menu_y_offset_real -= 10;
	}
	if (abs(menu_y_offset_real) + 200 > menu_cursor_y_position)
	{
		menu_y_offset_real += 10;
	}
	if (abs(menu_y_offset_real) + display_get_gui_height() + offset_display_height < menu_cursor_y_position)
	{
		menu_y_offset_real -= 100;
	}
	if (abs(menu_y_offset_real) - 200 > menu_cursor_y_position)
	{
		menu_y_offset_real += 100;
	}
	#endregion /* Scroll menu END */
	
}