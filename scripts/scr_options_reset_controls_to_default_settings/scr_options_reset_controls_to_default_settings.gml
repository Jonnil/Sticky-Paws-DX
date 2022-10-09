function scr_options_reset_controls_to_default_settings(xx, yy)
{
	
	#region /* Reset to Default Settings */
	draw_menu_button(xx, yy + menu_y_offset, l10n_text("Default Settings"), "remap_reset", "remap_reset");
	if (menu == "remap_reset")
	{
		menu_cursor_y_position = yy;
		if (key_a_pressed)
		and (menu_delay == 0)
		or (mouse_check_button_pressed(mb_left))
		and (window_mouse_get_x() > 370)
		and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), xx, yy + menu_y_offset + 1, xx + 370, yy + menu_y_offset + 41))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (menu_delay == 0)
		{
			
			#region /* Reset Player 1 Keyboard Remapping */
			if (remapping_player == 0)
			{
				image_speed = 0;
				if (global.settings_sidebar_menu == "controller_settings")
				{
					scr_set_default_remapping_player1_gamepad();
				}
				else
				{
					scr_set_default_remapping_player1_keyboard();
				}
			}
			#endregion /* Reset Player 1 Keyboard Remapping END */
			
			else
			
			#region /* Reset Player 2 Keyboard Remapping */
			if (remapping_player == 1)
			{
				image_speed = 0;
				if (global.settings_sidebar_menu == "controller_settings")
				{
					scr_set_default_remapping_player2_gamepad();
				}
				else
				{
					scr_set_default_remapping_player2_keyboard();
				}
			}
			#endregion /* Reset Player 2 Keyboard Remapping END */
			
			else
			
			#region /* Reset Player 3 Keyboard Remapping */
			if (remapping_player = 2)
			{
				image_speed = 0;
				if (global.settings_sidebar_menu == "controller_settings")
				{
					scr_set_default_remapping_player3_gamepad();
				}
				else
				{
					scr_set_default_remapping_player3_keyboard();
				}
			}
			#endregion /* Reset Player 3 Keyboard Remapping END */
			
			else
			
			#region /* Reset Player 4 Keyboard Remapping */
			if (remapping_player = 3)
			{
				image_speed = 0;
				if (global.settings_sidebar_menu == "controller_settings")
				{
					scr_set_default_remapping_player4_gamepad();
				}
				else
				{
					scr_set_default_remapping_player4_keyboard();
				}
			}
			#endregion /* Reset Player 4 Keyboard Remapping END */
			
			menu_delay = 3;
		}
	}
	#endregion /* Reset to Default Settings END */
	
	#region /* Save all default controls to config file */
	ini_open(working_directory + "config.ini");
	
	#region /* Save All Gamepad Remappings */
	
	#region /* Save Player 1 Gamepad Remapping */
	ini_write_real("config", "player1_gamepad_button_dive", global.player1_gamepad_button_dive);
	ini_write_real("config", "player1_gamepad_button_jump", global.player1_gamepad_button_jump);
	ini_write_real("config", "player1_gamepad_button_crouch", global.player1_gamepad_button_crouch);
	ini_write_real("config", "player1_gamepad_button_crouch_toggle", global.player1_gamepad_button_crouch_toggle);
	ini_write_real("config", "player1_gamepad_button_sprint", global.player1_gamepad_button_sprint);
	ini_write_real("config", "player1_gamepad_button_sprint_toggle", global.player1_gamepad_button_sprint_toggle);
	ini_write_real("config", "player1_gamepad_button_left", global.player1_gamepad_button_left);
	ini_write_real("config", "player1_gamepad_button_right", global.player1_gamepad_button_right);
	ini_write_real("config", "player1_gamepad_button_down", global.player1_gamepad_button_down);
	ini_write_real("config", "player1_gamepad_button_up", global.player1_gamepad_button_up);
	ini_write_real("config", "player1_gamepad_button_tongue", global.player1_gamepad_button_tongue);
	ini_write_real("config", "player1_gamepad_button_zoom_in", global.player1_gamepad_button_zoom_in);
	ini_write_real("config", "player1_gamepad_button_zoom_out", global.player1_gamepad_button_zoom_out);
	ini_write_real("config", "player1_gamepad_button2_dive", global.player1_gamepad_button2_dive);
	ini_write_real("config", "player1_gamepad_button2_jump", global.player1_gamepad_button2_jump);
	ini_write_real("config", "player1_gamepad_button2_crouch", global.player1_gamepad_button2_crouch);
	ini_write_real("config", "player1_gamepad_button2_crouch_toggle", global.player1_gamepad_button2_crouch_toggle);
	ini_write_real("config", "player1_gamepad_button2_sprint", global.player1_gamepad_button2_sprint);
	ini_write_real("config", "player1_gamepad_button2_sprint_toggle", global.player1_gamepad_button2_sprint_toggle);
	ini_write_real("config", "player1_gamepad_button2_left", global.player1_gamepad_button2_left);
	ini_write_real("config", "player1_gamepad_button2_right", global.player1_gamepad_button2_right);
	ini_write_real("config", "player1_gamepad_button2_down", global.player1_gamepad_button2_down);
	ini_write_real("config", "player1_gamepad_button2_up", global.player1_gamepad_button2_up);
	ini_write_real("config", "player1_gamepad_button2_tongue", global.player1_gamepad_button2_tongue);
	ini_write_real("config", "player1_gamepad_button2_zoom_in", global.player1_gamepad_button2_zoom_in);
	ini_write_real("config", "player1_gamepad_button2_zoom_out", global.player1_gamepad_button2_zoom_out);
	#endregion /* Save Player 1 Gamepad Remapping END */
	
	#region /* Save Player 2 Gamepad Remapping */
	ini_write_real("config", "player2_gamepad_button_dive", global.player2_gamepad_button_dive);
	ini_write_real("config", "player2_gamepad_button_jump", global.player2_gamepad_button_jump);
	ini_write_real("config", "player2_gamepad_button_crouch", global.player2_gamepad_button_crouch);
	ini_write_real("config", "player2_gamepad_button_crouch_toggle", global.player2_gamepad_button_crouch_toggle);
	ini_write_real("config", "player2_gamepad_button_sprint", global.player2_gamepad_button_sprint);
	ini_write_real("config", "player2_gamepad_button_sprint_toggle", global.player2_gamepad_button_sprint_toggle);
	ini_write_real("config", "player2_gamepad_button_left", global.player2_gamepad_button_left);
	ini_write_real("config", "player2_gamepad_button_right", global.player2_gamepad_button_right);
	ini_write_real("config", "player2_gamepad_button_down", global.player2_gamepad_button_down);
	ini_write_real("config", "player2_gamepad_button_up", global.player2_gamepad_button_up);
	ini_write_real("config", "player2_gamepad_button_tongue", global.player2_gamepad_button_tongue);
	ini_write_real("config", "player2_gamepad_button_zoom_in", global.player2_gamepad_button_zoom_in);
	ini_write_real("config", "player2_gamepad_button_zoom_out", global.player2_gamepad_button_zoom_out);
	ini_write_real("config", "player2_gamepad_button2_dive", global.player2_gamepad_button2_dive);
	ini_write_real("config", "player2_gamepad_button2_jump", global.player2_gamepad_button2_jump);
	ini_write_real("config", "player2_gamepad_button2_crouch", global.player2_gamepad_button2_crouch);
	ini_write_real("config", "player2_gamepad_button2_crouch_toggle", global.player2_gamepad_button2_crouch_toggle);
	ini_write_real("config", "player2_gamepad_button2_sprint", global.player2_gamepad_button2_sprint);
	ini_write_real("config", "player2_gamepad_button2_sprint_toggle", global.player2_gamepad_button2_sprint_toggle);
	ini_write_real("config", "player2_gamepad_button2_left", global.player2_gamepad_button2_left);
	ini_write_real("config", "player2_gamepad_button2_right", global.player2_gamepad_button2_right);
	ini_write_real("config", "player2_gamepad_button2_down", global.player2_gamepad_button2_down);
	ini_write_real("config", "player2_gamepad_button2_up", global.player2_gamepad_button2_up);
	ini_write_real("config", "player2_gamepad_button2_tongue", global.player2_gamepad_button2_tongue);
	ini_write_real("config", "player2_gamepad_button2_zoom_in", global.player2_gamepad_button2_zoom_in);
	ini_write_real("config", "player2_gamepad_button2_zoom_out", global.player2_gamepad_button2_zoom_out);
	#endregion /* Save Player 2 Gamepad Remapping END */
	
	#region /* Save Player 3 Gamepad Remapping */
	ini_write_real("config", "player3_gamepad_button_dive", global.player3_gamepad_button_dive);
	ini_write_real("config", "player3_gamepad_button_jump", global.player3_gamepad_button_jump);
	ini_write_real("config", "player3_gamepad_button_crouch", global.player3_gamepad_button_crouch);
	ini_write_real("config", "player3_gamepad_button_crouch_toggle", global.player3_gamepad_button_crouch_toggle);
	ini_write_real("config", "player3_gamepad_button_sprint", global.player3_gamepad_button_sprint);
	ini_write_real("config", "player3_gamepad_button_sprint_toggle", global.player3_gamepad_button_sprint_toggle);
	ini_write_real("config", "player3_gamepad_button_left", global.player3_gamepad_button_left);
	ini_write_real("config", "player3_gamepad_button_right", global.player3_gamepad_button_right);
	ini_write_real("config", "player3_gamepad_button_down", global.player3_gamepad_button_down);
	ini_write_real("config", "player3_gamepad_button_up", global.player3_gamepad_button_up);
	ini_write_real("config", "player3_gamepad_button_tongue", global.player3_gamepad_button_tongue);
	ini_write_real("config", "player3_gamepad_button_zoom_in", global.player3_gamepad_button_zoom_in);
	ini_write_real("config", "player3_gamepad_button_zoom_out", global.player3_gamepad_button_zoom_out);
	ini_write_real("config", "player3_gamepad_button2_dive", global.player3_gamepad_button2_dive);
	ini_write_real("config", "player3_gamepad_button2_jump", global.player3_gamepad_button2_jump);
	ini_write_real("config", "player3_gamepad_button2_crouch", global.player3_gamepad_button2_crouch);
	ini_write_real("config", "player3_gamepad_button2_crouch_toggle", global.player3_gamepad_button2_crouch_toggle);
	ini_write_real("config", "player3_gamepad_button2_sprint", global.player3_gamepad_button2_sprint);
	ini_write_real("config", "player3_gamepad_button2_sprint_toggle", global.player3_gamepad_button2_sprint_toggle);
	ini_write_real("config", "player3_gamepad_button2_left", global.player3_gamepad_button2_left);
	ini_write_real("config", "player3_gamepad_button2_right", global.player3_gamepad_button2_right);
	ini_write_real("config", "player3_gamepad_button2_down", global.player3_gamepad_button2_down);
	ini_write_real("config", "player3_gamepad_button2_up", global.player3_gamepad_button2_up);
	ini_write_real("config", "player3_gamepad_button2_tongue", global.player3_gamepad_button2_tongue);
	ini_write_real("config", "player3_gamepad_button2_zoom_in", global.player3_gamepad_button2_zoom_in);
	ini_write_real("config", "player3_gamepad_button2_zoom_out", global.player3_gamepad_button2_zoom_out);
	#endregion /* Save Player 3 Gamepad Remapping END */
	
	#region /* Save Player 4 Gamepad Remapping */
	ini_write_real("config", "player4_gamepad_button_dive", global.player4_gamepad_button_dive);
	ini_write_real("config", "player4_gamepad_button_jump", global.player4_gamepad_button_jump);
	ini_write_real("config", "player4_gamepad_button_crouch", global.player4_gamepad_button_crouch);
	ini_write_real("config", "player4_gamepad_button_crouch_toggle", global.player4_gamepad_button_crouch_toggle);
	ini_write_real("config", "player4_gamepad_button_sprint", global.player4_gamepad_button_sprint);
	ini_write_real("config", "player4_gamepad_button_sprint_toggle", global.player4_gamepad_button_sprint_toggle);
	ini_write_real("config", "player4_gamepad_button_left", global.player4_gamepad_button_left);
	ini_write_real("config", "player4_gamepad_button_right", global.player4_gamepad_button_right);
	ini_write_real("config", "player4_gamepad_button_down", global.player4_gamepad_button_down);
	ini_write_real("config", "player4_gamepad_button_up", global.player4_gamepad_button_up);
	ini_write_real("config", "player4_gamepad_button_tongue", global.player4_gamepad_button_tongue);
	ini_write_real("config", "player4_gamepad_button_zoom_in", global.player4_gamepad_button_zoom_in);
	ini_write_real("config", "player4_gamepad_button_zoom_out", global.player4_gamepad_button_zoom_out);
	ini_write_real("config", "player4_gamepad_button2_dive", global.player4_gamepad_button2_dive);
	ini_write_real("config", "player4_gamepad_button2_jump", global.player4_gamepad_button2_jump);
	ini_write_real("config", "player4_gamepad_button2_crouch", global.player4_gamepad_button2_crouch);
	ini_write_real("config", "player4_gamepad_button2_crouch_toggle", global.player4_gamepad_button2_crouch_toggle);
	ini_write_real("config", "player4_gamepad_button2_sprint", global.player4_gamepad_button2_sprint);
	ini_write_real("config", "player4_gamepad_button2_sprint_toggle", global.player4_gamepad_button2_sprint_toggle);
	ini_write_real("config", "player4_gamepad_button2_left", global.player4_gamepad_button2_left);
	ini_write_real("config", "player4_gamepad_button2_right", global.player4_gamepad_button2_right);
	ini_write_real("config", "player4_gamepad_button2_down", global.player4_gamepad_button2_down);
	ini_write_real("config", "player4_gamepad_button2_up", global.player4_gamepad_button2_up);
	ini_write_real("config", "player4_gamepad_button2_tongue", global.player4_gamepad_button2_tongue);
	ini_write_real("config", "player4_gamepad_button2_zoom_in", global.player4_gamepad_button2_zoom_in);
	ini_write_real("config", "player4_gamepad_button2_zoom_out", global.player4_gamepad_button2_zoom_out);
	#endregion /* Save Player 4 Gamepad Remapping END */
	
	#endregion /* Save All Gamepad Remappings END */
	
	#region /* Save All Keyboard and Mouse Remappings */
	
	#region /* Save Player 1 Keyboard and Mouse Remapping */
	ini_write_real("config", "player1_key_dive", global.player1_key_dive);
	ini_write_real("config", "player1_key_jump", global.player1_key_jump);
	ini_write_real("config", "player1_key_crouch", global.player1_key_crouch);
	ini_write_real("config", "player1_key_crouch_toggle", global.player1_key_crouch_toggle);
	ini_write_real("config", "player1_key_sprint", global.player1_key_sprint);
	ini_write_real("config", "player1_key_sprint_toggle", global.player1_key_sprint_toggle);
	ini_write_real("config", "player1_key_left", global.player1_key_left);
	ini_write_real("config", "player1_key_right", global.player1_key_right);
	ini_write_real("config", "player1_key_down", global.player1_key_down);
	ini_write_real("config", "player1_key_up", global.player1_key_up);
	ini_write_real("config", "player1_key_tongue", global.player1_key_tongue);
	ini_write_real("config", "player1_key_zoom_in", global.player1_key_zoom_in);
	ini_write_real("config", "player1_key_zoom_out", global.player1_key_zoom_out);
	ini_write_real("config", "player1_key2_dive", global.player1_key2_dive);
	ini_write_real("config", "player1_key2_jump", global.player1_key2_jump);
	ini_write_real("config", "player1_key2_crouch", global.player1_key2_crouch);
	ini_write_real("config", "player1_key2_crouch_toggle", global.player1_key2_crouch_toggle);
	ini_write_real("config", "player1_key2_sprint", global.player1_key2_sprint);
	ini_write_real("config", "player1_key2_sprint_toggle", global.player1_key2_sprint_toggle);
	ini_write_real("config", "player1_key2_left", global.player1_key2_left);
	ini_write_real("config", "player1_key2_right", global.player1_key2_right);
	ini_write_real("config", "player1_key2_down", global.player1_key2_down);
	ini_write_real("config", "player1_key2_up", global.player1_key2_up);
	ini_write_real("config", "player1_key2_tongue", global.player1_key2_tongue);
	ini_write_real("config", "player1_key2_zoom_in", global.player1_key2_zoom_in);
	ini_write_real("config", "player1_key2_zoom_out", global.player1_key2_zoom_out);
	#endregion /* Save Player 1 Keyboard and Mouse Remapping END */
	
	#region /* Save Player 2 Keyboard and Mouse Remapping */
	ini_write_real("config", "player2_key_dive", global.player2_key_dive);
	ini_write_real("config", "player2_key_jump", global.player2_key_jump);
	ini_write_real("config", "player2_key_crouch", global.player2_key_crouch);
	ini_write_real("config", "player2_key_crouch_toggle", global.player2_key_crouch_toggle);
	ini_write_real("config", "player2_key_sprint", global.player2_key_sprint);
	ini_write_real("config", "player2_key_sprint_toggle", global.player2_key_sprint_toggle);
	ini_write_real("config", "player2_key_left", global.player2_key_left);
	ini_write_real("config", "player2_key_right", global.player2_key_right);
	ini_write_real("config", "player2_key_down", global.player2_key_down);
	ini_write_real("config", "player2_key_up", global.player2_key_up);
	ini_write_real("config", "player2_key_tongue", global.player2_key_tongue);
	ini_write_real("config", "player2_key_zoom_in", global.player2_key_zoom_in);
	ini_write_real("config", "player2_key_zoom_out", global.player2_key_zoom_out);
	ini_write_real("config", "player2_key2_dive", global.player2_key2_dive);
	ini_write_real("config", "player2_key2_jump", global.player2_key2_jump);
	ini_write_real("config", "player2_key2_crouch", global.player2_key2_crouch);
	ini_write_real("config", "player2_key2_crouch_toggle", global.player2_key2_crouch_toggle);
	ini_write_real("config", "player2_key2_sprint", global.player2_key2_sprint);
	ini_write_real("config", "player2_key2_sprint_toggle", global.player2_key2_sprint_toggle);
	ini_write_real("config", "player2_key2_left", global.player2_key2_left);
	ini_write_real("config", "player2_key2_right", global.player2_key2_right);
	ini_write_real("config", "player2_key2_down", global.player2_key2_down);
	ini_write_real("config", "player2_key2_up", global.player2_key2_up);
	ini_write_real("config", "player2_key2_tongue", global.player2_key2_tongue);
	ini_write_real("config", "player2_key2_zoom_in", global.player2_key2_zoom_in);
	ini_write_real("config", "player2_key2_zoom_out", global.player2_key2_zoom_out);
	#endregion /* Save Player 2 Keyboard and Mouse Remapping END */
	
	#region /* Save Player 3 Keyboard and Mouse Remapping */
	ini_write_real("config", "player3_key_dive", global.player3_key_dive);
	ini_write_real("config", "player3_key_jump", global.player3_key_jump);
	ini_write_real("config", "player3_key_crouch", global.player3_key_crouch);
	ini_write_real("config", "player3_key_crouch_toggle", global.player3_key_crouch_toggle);
	ini_write_real("config", "player3_key_sprint", global.player3_key_sprint);
	ini_write_real("config", "player3_key_sprint_toggle", global.player3_key_sprint_toggle);
	ini_write_real("config", "player3_key_left", global.player3_key_left);
	ini_write_real("config", "player3_key_right", global.player3_key_right);
	ini_write_real("config", "player3_key_down", global.player3_key_down);
	ini_write_real("config", "player3_key_up", global.player3_key_up);
	ini_write_real("config", "player3_key_tongue", global.player3_key_tongue);
	ini_write_real("config", "player3_key_zoom_in", global.player3_key_zoom_in);
	ini_write_real("config", "player3_key_zoom_out", global.player3_key_zoom_out);
	ini_write_real("config", "player3_key2_dive", global.player3_key2_dive);
	ini_write_real("config", "player3_key2_jump", global.player3_key2_jump);
	ini_write_real("config", "player3_key2_crouch", global.player3_key2_crouch);
	ini_write_real("config", "player3_key2_crouch_toggle", global.player3_key2_crouch_toggle);
	ini_write_real("config", "player3_key2_sprint", global.player3_key2_sprint);
	ini_write_real("config", "player3_key2_sprint_toggle", global.player3_key2_sprint_toggle);
	ini_write_real("config", "player3_key2_left", global.player3_key2_left);
	ini_write_real("config", "player3_key2_right", global.player3_key2_right);
	ini_write_real("config", "player3_key2_down", global.player3_key2_down);
	ini_write_real("config", "player3_key2_up", global.player3_key2_up);
	ini_write_real("config", "player3_key2_tongue", global.player3_key2_tongue);
	ini_write_real("config", "player3_key2_zoom_in", global.player3_key2_zoom_in);
	ini_write_real("config", "player3_key2_zoom_out", global.player3_key2_zoom_out);
	#endregion /* Save Player 3 Keyboard and Mouse Remapping END */
	
	#region /* Save Player 4 Keyboard and Mouse Remapping */
	ini_write_real("config", "player4_key_dive", global.player4_key_dive);
	ini_write_real("config", "player4_key_jump", global.player4_key_jump);
	ini_write_real("config", "player4_key_crouch", global.player4_key_crouch);
	ini_write_real("config", "player4_key_crouch_toggle", global.player4_key_crouch_toggle);
	ini_write_real("config", "player4_key_sprint", global.player4_key_sprint);
	ini_write_real("config", "player4_key_sprint_toggle", global.player4_key_sprint_toggle);
	ini_write_real("config", "player4_key_left", global.player4_key_left);
	ini_write_real("config", "player4_key_right", global.player4_key_right);
	ini_write_real("config", "player4_key_down", global.player4_key_down);
	ini_write_real("config", "player4_key_up", global.player4_key_up);
	ini_write_real("config", "player4_key_tongue", global.player4_key_tongue);
	ini_write_real("config", "player4_key_zoom_in", global.player4_key_zoom_in);
	ini_write_real("config", "player4_key_zoom_out", global.player4_key_zoom_out);
	ini_write_real("config", "player4_key2_dive", global.player4_key2_dive);
	ini_write_real("config", "player4_key2_jump", global.player4_key2_jump);
	ini_write_real("config", "player4_key2_crouch", global.player4_key2_crouch);
	ini_write_real("config", "player4_key2_crouch_toggle", global.player4_key2_crouch_toggle);
	ini_write_real("config", "player4_key2_sprint", global.player4_key2_sprint);
	ini_write_real("config", "player4_key2_sprint_toggle", global.player4_key2_sprint_toggle);
	ini_write_real("config", "player4_key2_left", global.player4_key2_left);
	ini_write_real("config", "player4_key2_right", global.player4_key2_right);
	ini_write_real("config", "player4_key2_down", global.player4_key2_down);
	ini_write_real("config", "player4_key2_up", global.player4_key2_up);
	ini_write_real("config", "player4_key2_tongue", global.player4_key2_tongue);
	ini_write_real("config", "player4_key2_zoom_in", global.player4_key2_zoom_in);
	ini_write_real("config", "player4_key2_zoom_out", global.player4_key2_zoom_out);
	#endregion /* Save Player 4 Keyboard and Mouse Remapping END */
	
	#endregion /* Save All Keyboard and Mouse Remappings END */
	
	ini_close();
	#endregion /* Save all default controls to config file END */
	
}