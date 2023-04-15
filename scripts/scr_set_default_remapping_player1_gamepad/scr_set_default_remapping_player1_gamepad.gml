function scr_set_default_remapping_player1_gamepad()
{
	
	//#region /* Player Key Remapping */
	
	///* [player] [key number] [key name] */
	
	//#region /* Player Key 1 defaults */
	
	//// global.player_[key/gp][player][key1/key2][action]
	//global.player_["gp"][1][1]["dive"] = gp_face3;
	//global.player_["gp"][1][1]["jump"] = gp_face1;
	//global.player_["gp"][1][1]["crouch"] = gp_padd;
	//global.player_["gp"][1][1]["crouch_toggle"] = noone;
	//global.player_["gp"][1][1]["sprint"] = gp_face3;
	//global.player_["gp"][1][1]["sprint_toggle"] = noone;
	//global.player_["gp"][1][1]["left"] = gp_padl;
	//global.player_["gp"][1][1]["right"] = gp_padr;
	//global.player_["gp"][1][1]["down"] = gp_padd;
	//global.player_["gp"][1][1]["up"] = gp_padu;
	//global.player_["gp"][1][1]["tongue"] = noone;
	//global.player_["gp"][1][1]["zoom_in"] = noone;
	//global.player_["gp"][1][1]["zoom_out"] = noone;
	//if (os_type == os_switch)
	//{
	//	global.player_["gp"][1][1]["accept"]  = gp_face2;
	//	global.player_["gp"][1][1]["back"]  = gp_face1;
	//}
	//else
	//{
	//	global.player_["gp"][1][1]["accept"]  = gp_face1;
	//	global.player_["gp"][1][1]["back"]  = gp_face2;
	//}
	//#endregion /* Player Key 1 defaults END */
	
	//#region
	//// global.player_[keyboard/gamepad][player][key1/key2][action]
	//global.player_["gp"][1][2]["dive"] = noone;
	//global.player_["gp"][1][2]["jump"] = noone;
	//global.player_["gp"][1][2]["crouch"] = noone;
	//global.player_["gp"][1][2]["crouch_toggle"] = noone;
	//global.player_["gp"][1][2]["sprint"] = gp_shoulderrb;
	//global.player_["gp"][1][2]["sprint_toggle"] = noone;
	//global.player_["gp"][1][2]["left"] = noone;
	//global.player_["gp"][1][2]["right"] = noone;
	//global.player_["gp"][1][2]["down"] = noone;
	//global.player_["gp"][1][2]["up"] = noone;
	//global.player_["gp"][1][2]["tongue"] = noone;
	//global.player_["gp"][1][2]["zoom_in"] = noone;
	//global.player_["gp"][1][2]["zoom_out"] = noone;
	//global.player_["gp"][1][2]["accept"] = noone;
	//global.player_["gp"][1][2]["back"] = noone;
	//#endregion /* Player Key 1 defaults END */
	
	//#endregion /* Player Key Remapping END */
	
	
	
	
	
	#region /* Player 1 Gamepad Remapping */
	
	#region /* Player 1 Gamepad Buttons 1 defaults */
	global.player1_gamepad_button_dive = gp_face3;
	global.player1_gamepad_button_jump = gp_face1;
	global.player1_gamepad_button_crouch = gp_padd;
	global.player1_gamepad_button_crouch_toggle = noone;
	global.player1_gamepad_button_sprint = gp_face3;
	global.player1_gamepad_button_sprint_toggle = noone;
	global.player1_gamepad_button_left = gp_padl;
	global.player1_gamepad_button_right = gp_padr;
	global.player1_gamepad_button_down = gp_padd;
	global.player1_gamepad_button_up = gp_padu;
	global.player1_gamepad_button_tongue = noone;
	global.player1_gamepad_button_zoom_in = noone;
	global.player1_gamepad_button_zoom_out = noone;
	if (os_type == os_switch)
	{
		global.player1_gamepad_button_accept = gp_face2;
		global.player1_gamepad_button_back = gp_face1;
	}
	else
	{
		global.player1_gamepad_button_accept = gp_face1;
		global.player1_gamepad_button_back = gp_face2;
	}
	#endregion /* Player 1 Gamepad Buttons 1 defaults END */
	
	#region /* Player 1 Gamepad Buttons 2 defaults */
	global.player1_gamepad_button2_dive = noone;
	global.player1_gamepad_button2_jump = noone;
	global.player1_gamepad_button2_crouch = noone;
	global.player1_gamepad_button2_crouch_toggle = noone;
	global.player1_gamepad_button2_sprint = gp_shoulderrb;
	global.player1_gamepad_button2_sprint_toggle = noone;
	global.player1_gamepad_button2_left = noone;
	global.player1_gamepad_button2_right = noone;
	global.player1_gamepad_button2_down = noone;
	global.player1_gamepad_button2_up = noone;
	global.player1_gamepad_button2_tongue = noone;
	global.player1_gamepad_button2_zoom_in = noone;
	global.player1_gamepad_button2_zoom_out = noone;
	global.player1_gamepad_button2_accept = noone;
	global.player1_gamepad_button2_back = noone;
	#endregion /* Player 1 Gamepad Buttons 2 defaults END */
	
	global.player1_up_is_also_jump = false;
	global.player1_double_tap_to_run = true;
	global.player1_sprint_toggle = false;
	global.player1_double_tap_to_dive = false;
	global.player1_cancel_dive_by_pressing_jump_or_dive_button = false;
	global.player1_cancel_dive_by_pressing_opposite_direction = false;
	global.player1_down_and_jump_to_groundpound = false;
	global.player1_wall_jump_setting = 1;
	global.player1_drop_from_rope = 1;
	global.player1_show_controls = 1;
	#endregion /* Player 1 Gamepad Remapping END */
	
	#region /* After setting the gamepad controls back to default, save these settings in config */
	ini_open(working_directory + "config.ini");
	ini_write_real("config", "player1_gamepad_button_dive", global.player1_gamepad_button_dive);
	ini_write_real("config", "player1_gamepad_button2_dive", global.player1_gamepad_button2_dive);
	ini_write_real("config", "player1_gamepad_button_jump", global.player1_gamepad_button_jump);
	ini_write_real("config", "player1_gamepad_button2_jump", global.player1_gamepad_button2_jump);
	ini_write_real("config", "player1_gamepad_button_crouch", global.player1_gamepad_button_crouch);
	ini_write_real("config", "player1_gamepad_button2_crouch", global.player1_gamepad_button2_crouch);
	ini_write_real("config", "player1_gamepad_button_crouch_toggle", global.player1_gamepad_button_crouch_toggle);
	ini_write_real("config", "player1_gamepad_button2_crouch_toggle", global.player1_gamepad_button2_crouch_toggle);
	ini_write_real("config", "player1_gamepad_button_sprint", global.player1_gamepad_button_sprint);
	ini_write_real("config", "player1_gamepad_button2_sprint", global.player1_gamepad_button2_sprint);
	ini_write_real("config", "player1_gamepad_button_sprint_toggle", global.player1_gamepad_button_sprint_toggle);
	ini_write_real("config", "player1_gamepad_button2_sprint_toggle", global.player1_gamepad_button2_sprint_toggle);
	ini_write_real("config", "player1_gamepad_button_left", global.player1_gamepad_button_left);
	ini_write_real("config", "player1_gamepad_button2_left", global.player1_gamepad_button2_left);
	ini_write_real("config", "player1_gamepad_button_right", global.player1_gamepad_button_right);
	ini_write_real("config", "player1_gamepad_button2_right", global.player1_gamepad_button2_right);
	ini_write_real("config", "player1_gamepad_button_down", global.player1_gamepad_button_down);
	ini_write_real("config", "player1_gamepad_button2_down", global.player1_gamepad_button2_down);
	ini_write_real("config", "player1_gamepad_button_up", global.player1_gamepad_button_up);
	ini_write_real("config", "player1_gamepad_button2_up", global.player1_gamepad_button2_up);
	ini_write_real("config", "player1_gamepad_button_tongue", global.player1_gamepad_button_tongue);
	ini_write_real("config", "player1_gamepad_button2_tongue", global.player1_gamepad_button2_tongue);
	ini_write_real("config", "player1_gamepad_button_zoom_in", global.player1_gamepad_button_zoom_in);
	ini_write_real("config", "player1_gamepad_button2_zoom_in", global.player1_gamepad_button2_zoom_in);
	ini_write_real("config", "player1_gamepad_button_zoom_out", global.player1_gamepad_button_zoom_out);
	ini_write_real("config", "player1_gamepad_button2_zoom_out", global.player1_gamepad_button2_zoom_out);
	ini_write_real("config", "player1_gamepad_button_accept", global.player1_gamepad_button_accept);
	ini_write_real("config", "player1_gamepad_button2_accept", global.player1_gamepad_button2_accept);
	ini_write_real("config", "player1_gamepad_button_back", global.player1_gamepad_button_back);
	ini_write_real("config", "player1_gamepad_button2_back", global.player1_gamepad_button2_back);
	ini_write_real("config", "player1_up_is_also_jump", global.player1_up_is_also_jump);
	ini_write_real("config", "player1_double_tap_to_run", global.player1_double_tap_to_run);
	ini_write_real("config", "player1_sprint_toggle", global.player1_sprint_toggle);
	ini_write_real("config", "player1_double_tap_to_dive", global.player1_double_tap_to_dive);
	ini_write_real("config", "player1_cancel_dive_by_pressing_jump_or_dive_button", global.player1_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config", "player1_cancel_dive_by_pressing_opposite_direction", global.player1_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config", "player1_down_and_jump_to_groundpound", global.player1_down_and_jump_to_groundpound);
	ini_write_real("config", "player1_wall_jump_setting", global.player1_wall_jump_setting);
	ini_write_real("config", "player1_drop_from_rope", global.player1_drop_from_rope);
	ini_write_real("config", "player1_show_controls", global.player1_show_controls);
	ini_close();
	#endregion /* After setting the gamepad controls back to default, save these settings in config END */
	
}