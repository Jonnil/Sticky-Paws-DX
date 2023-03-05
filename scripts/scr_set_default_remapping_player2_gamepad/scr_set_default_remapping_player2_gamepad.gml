function scr_set_default_remapping_player2_gamepad()
{
	
	#region /* Player 2 Gamepad Remapping */
	
	#region /* Player 2 Gamepad Buttons 1 defaults */
	global.player2_gamepad_button_dive = gp_face3;
	global.player2_gamepad_button_jump = gp_face1;
	global.player2_gamepad_button_crouch = gp_padd;
	global.player2_gamepad_button_crouch_toggle = noone;
	global.player2_gamepad_button_sprint = gp_face3;
	global.player2_gamepad_button_sprint_toggle = noone;
	global.player2_gamepad_button_left = gp_padl;
	global.player2_gamepad_button_right = gp_padr;
	global.player2_gamepad_button_down = gp_padd;
	global.player2_gamepad_button_up = gp_padu;
	global.player2_gamepad_button_tongue = noone;
	global.player2_gamepad_button_zoom_in = noone;
	global.player2_gamepad_button_zoom_out = noone;
	if (os_type == os_switch)
	{
		global.player2_gamepad_button_accept = gp_face2;
		global.player2_gamepad_button_back = gp_face1;
	}
	else
	{
		global.player2_gamepad_button_accept = gp_face1;
		global.player2_gamepad_button_back = gp_face2;
	}
	#endregion /* Player 2 Gamepad Buttons 1 defaults END */
	
	#region /* Player 2 Gamepad Buttons 2 defaults */
	global.player2_gamepad_button2_dive = noone;
	global.player2_gamepad_button2_jump = noone;
	global.player2_gamepad_button2_crouch = noone;
	global.player2_gamepad_button2_crouch_toggle = noone;
	global.player2_gamepad_button2_sprint = gp_shoulderrb;
	global.player2_gamepad_button2_sprint_toggle = noone;
	global.player2_gamepad_button2_left = noone;
	global.player2_gamepad_button2_right = noone;
	global.player2_gamepad_button2_down = noone;
	global.player2_gamepad_button2_up = noone;
	global.player2_gamepad_button2_tongue = noone;
	global.player2_gamepad_button2_zoom_in = noone;
	global.player2_gamepad_button2_zoom_out = noone;
	global.player2_gamepad_button2_accept = noone;
	global.player2_gamepad_button2_back = noone;
	#endregion /* Player 2 Gamepad Buttons 2 defaults END */
	
	global.player2_up_is_also_jump = false;
	global.player2_double_tap_to_run = true;
	global.player2_sprint_toggle = false;
	global.player2_double_tap_to_dive = false;
	global.player2_cancel_dive_by_pressing_jump_or_dive_button = false;
	global.player2_cancel_dive_by_pressing_opposite_direction = false;
	global.player2_down_and_jump_to_groundpound = false;
	global.player2_wall_jump_setting = 1;
	global.player2_drop_from_rope = 1;
	global.player2_show_controls = 1;
	#endregion /* Player 2 Gamepad Remapping END */
	
	#region /* After setting the gamepad controls back to default, save these settings in config */
	ini_open(working_directory + "config.ini");
	ini_write_real("config", "player2_gamepad_button_dive", global.player2_gamepad_button_dive);
	ini_write_real("config", "player2_gamepad_button2_dive", global.player2_gamepad_button2_dive);
	ini_write_real("config", "player2_gamepad_button_jump", global.player2_gamepad_button_jump);
	ini_write_real("config", "player2_gamepad_button2_jump", global.player2_gamepad_button2_jump);
	ini_write_real("config", "player2_gamepad_button_crouch", global.player2_gamepad_button_crouch);
	ini_write_real("config", "player2_gamepad_button2_crouch", global.player2_gamepad_button2_crouch);
	ini_write_real("config", "player2_gamepad_button_crouch_toggle", global.player2_gamepad_button_crouch_toggle);
	ini_write_real("config", "player2_gamepad_button2_crouch_toggle", global.player2_gamepad_button2_crouch_toggle);
	ini_write_real("config", "player2_gamepad_button_sprint", global.player2_gamepad_button_sprint);
	ini_write_real("config", "player2_gamepad_button2_sprint", global.player2_gamepad_button2_sprint);
	ini_write_real("config", "player2_gamepad_button_sprint_toggle", global.player2_gamepad_button_sprint_toggle);
	ini_write_real("config", "player2_gamepad_button2_sprint_toggle", global.player2_gamepad_button2_sprint_toggle);
	ini_write_real("config", "player2_gamepad_button_left", global.player2_gamepad_button_left);
	ini_write_real("config", "player2_gamepad_button2_left", global.player2_gamepad_button2_left);
	ini_write_real("config", "player2_gamepad_button_right", global.player2_gamepad_button_right);
	ini_write_real("config", "player2_gamepad_button2_right", global.player2_gamepad_button2_right);
	ini_write_real("config", "player2_gamepad_button_down", global.player2_gamepad_button_down);
	ini_write_real("config", "player2_gamepad_button2_down", global.player2_gamepad_button2_down);
	ini_write_real("config", "player2_gamepad_button_up", global.player2_gamepad_button_up);
	ini_write_real("config", "player2_gamepad_button2_up", global.player2_gamepad_button2_up);
	ini_write_real("config", "player2_gamepad_button_tongue", global.player2_gamepad_button_tongue);
	ini_write_real("config", "player2_gamepad_button2_tongue", global.player2_gamepad_button2_tongue);
	ini_write_real("config", "player2_gamepad_button_zoom_in", global.player2_gamepad_button_zoom_in);
	ini_write_real("config", "player2_gamepad_button2_zoom_in", global.player2_gamepad_button2_zoom_in);
	ini_write_real("config", "player2_gamepad_button_zoom_out", global.player2_gamepad_button_zoom_out);
	ini_write_real("config", "player2_gamepad_button2_zoom_out", global.player2_gamepad_button2_zoom_out);
	ini_write_real("config", "player2_gamepad_button_accept", global.player2_gamepad_button_accept);
	ini_write_real("config", "player2_gamepad_button2_accept", global.player2_gamepad_button2_accept);
	ini_write_real("config", "player2_gamepad_button_back", global.player2_gamepad_button_back);
	ini_write_real("config", "player2_gamepad_button2_back", global.player2_gamepad_button2_back);
	ini_write_real("config", "player2_up_is_also_jump", global.player2_up_is_also_jump);
	ini_write_real("config", "player2_double_tap_to_run", global.player2_double_tap_to_run);
	ini_write_real("config", "player2_sprint_toggle", global.player2_sprint_toggle);
	ini_write_real("config", "player2_double_tap_to_dive", global.player2_double_tap_to_dive);
	ini_write_real("config", "player2_cancel_dive_by_pressing_jump_or_dive_button", global.player2_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config", "player2_cancel_dive_by_pressing_opposite_direction", global.player2_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config", "player2_down_and_jump_to_groundpound", global.player2_down_and_jump_to_groundpound);
	ini_write_real("config", "player2_wall_jump_setting", global.player2_wall_jump_setting);
	ini_write_real("config", "player2_drop_from_rope", global.player2_drop_from_rope);
	ini_write_real("config", "player2_show_controls", global.player2_show_controls);
	ini_close();
	#endregion /* After setting the gamepad controls back to default, save these settings in config END */
	
}