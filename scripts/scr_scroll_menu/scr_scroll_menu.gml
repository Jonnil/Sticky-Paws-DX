function scr_scroll_menu(offset_display_height = 300, clamp_menu_y_offset_real = true)
{
	#region /* Scroll menu */
	menu_y_offset = lerp(menu_y_offset, menu_y_offset_real, 0.25);

	if (clamp_menu_y_offset_real)
	{
		menu_y_offset_real = clamp(menu_y_offset_real, -(menu_cursor_y_position_end - window_get_height() + 200), 0); /* Don't let "menu_y_offset_real" get above 0 */
		menu_y_offset = clamp(menu_y_offset, -(menu_cursor_y_position_end - window_get_height() + 200), 0); /* Don't let "menu_y_offset" get above 0 */
	}

	/* Only adjust scrolling when not using the mouse for navigation and not currently scrolling with the mouse wheel */
	if (global.controls_used_for_navigation != "mouse"
	&& !scrolling_menu_with_mousewheel)
	{
		/* Calculate the target position for the menu scroll */
		var target_position = abs(menu_y_offset_real) + display_get_gui_height() - offset_display_height;

		/* Check if the current cursor position is out of the desired range (more than 10 pixels off) */
		/* This condition checks if the target position is significantly above or below the menu cursor */
		if (target_position < menu_cursor_y_position - 10
		|| target_position > menu_cursor_y_position + 10)
		{
			/* Adjust the real menu offset so that the menu scrolls to align the cursor properly */
			/* The calculation centers the view based on the cursor's position, the GUI height, and the offset display height */
			/* The negative sign is applied because scrolling offsets are typically negative when moving content upward */
			menu_y_offset_real = -(menu_cursor_y_position - display_get_gui_height() + offset_display_height);
		}
	}
	#endregion /* Scroll menu END */

	#region /* Use Mousewheel to scroll menu */
	if (mouse_wheel_up())
	{
		menu_cursor_y_position += 100;
		menu_y_offset_real += 100; /* Snap directly to the new value */
		scrolling_menu_with_mousewheel = true;
	}
	else
	if (mouse_wheel_down())
	{
		menu_cursor_y_position -= 100;
		menu_y_offset_real -= 100; /* Snap directly to the new value */
		scrolling_menu_with_mousewheel = true;
	}
	else
	if (key_up
	|| key_down)
	{
		scrolling_menu_with_mousewheel = false;
	}
	#endregion /* Use Mousewheel to scroll menu END */
}
