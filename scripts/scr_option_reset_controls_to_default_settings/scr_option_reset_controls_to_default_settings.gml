function scr_option_reset_controls_to_default_settings(xx, yy)
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Reset to Default Settings */
	draw_menu_button(xx, yy + menu_y_offset, l10n_text("Default Settings"), "remap_reset", "remap_reset");
	if (menu == "remap_reset")
	{
		menu_cursor_y_position = yy;
		if (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (mouse_check_button_released(mb_left))
		&& (mouse_get_x > 370)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx, yy + menu_y_offset + 1, xx + 370, yy + menu_y_offset + 41))
		&& (global.controls_used_for_navigation == "mouse")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			
			#region /* Reset Player Gamepad and Keyboard Remapping */
			image_speed = 0;
			if (global.settings_sidebar_menu == "controller_settings")
			{
				scr_set_default_remapping_player_gamepad(remapping_player + 1, true);
			}
			else
			{
				scr_set_default_remapping_player_keyboard(remapping_player + 1, true);
			}
			#endregion /* Reset Player Gamepad and Keyboard Remapping END */
			
			menu_delay = 3;
		}
	}
	#endregion /* Reset to Default Settings END */
	
}