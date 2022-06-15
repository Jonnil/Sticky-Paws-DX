function scr_options_reset_controls_to_default_settings()
{
	
	#region /*Reset to Default Settings*/
	draw_menu_button(430, menu_y_remap_reset + menu_y_offset, Text("Default Settings"), "remap_reset", "remap_reset");
	if (menu = "remap_reset")
	{
		menu_cursor_y_position = menu_y_remap_reset;
		if (key_a_pressed)
		and (menu_delay = 0)
		or(mouse_check_button_pressed(mb_left))
		and (window_mouse_get_x() > 370)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 430, menu_y_remap_reset + menu_y_offset + 1, 430 + 370, menu_y_remap_reset + menu_y_offset + 41))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (menu_delay = 0)
		{
			
			#region /*Reset Player 1 Keyboard Remapping*/
			if (remapping_player = 0)
			{
				image_speed = 0;
				if (global.settings_sidebar_menu = "controller_settings")
				{
					scr_set_default_remapping_player1_gamepad();
				}
				else
				{
					scr_set_default_remapping_player1_keyboard();
				}
			}
			#endregion /*Reset Player 1 Keyboard Remapping END*/
			
			else
			
			#region /*Reset Player 2 Keyboard Remapping*/
			if (remapping_player = 1)
			{
				image_speed = 0;
				if (global.settings_sidebar_menu = "controller_settings")
				{
					scr_set_default_remapping_player2_gamepad();
				}
				else
				{
					scr_set_default_remapping_player2_keyboard();
				}
			}
			#endregion /*Reset Player 2 Keyboard Remapping END*/
			
			else
			
			#region /*Reset Player 3 Keyboard Remapping*/
			if (remapping_player = 2)
			{
				image_speed = 0;
				if (global.settings_sidebar_menu = "controller_settings")
				{
					scr_set_default_remapping_player3_gamepad();
				}
				else
				{
					scr_set_default_remapping_player3_keyboard();
				}
			}
			#endregion /*Reset Player 3 Keyboard Remapping END*/
			
			else
			
			#region /*Reset Player 4 Keyboard Remapping*/
			if (remapping_player = 3)
			{
				image_speed = 0;
				if (global.settings_sidebar_menu = "controller_settings")
				{
					scr_set_default_remapping_player4_gamepad();
				}
				else
				{
					scr_set_default_remapping_player4_keyboard();
				}
			}
			#endregion /*Reset Player 4 Keyboard Remapping END*/
			
			menu_delay = 3;
		}
	}
	#endregion /*Reset to Default Settings END*/
	
}