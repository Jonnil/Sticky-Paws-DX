function scr_set_default_remapping_player1_keyboard()
{
	
	#region /* Player 1 Keyboard Remapping */
	
	#region /* Player 1 Key 1 defaults */
	global.player1_key_dive = ord("X");
	global.player1_key_jump = ord("Z");
	global.player1_key_crouch = vk_down;
	global.player1_key_crouch_toggle = noone;
	global.player1_key_sprint = vk_lcontrol;
	global.player1_key_sprint_toggle = 20;
	global.player1_key_left = vk_left;
	global.player1_key_right = vk_right;
	global.player1_key_down = vk_down;
	global.player1_key_up = vk_up;
	global.player1_key_tongue = noone;
	global.player1_key_zoom_in = 187;
	global.player1_key_zoom_out = 189;
	global.player1_key_accept = ord("Z");
	global.player1_key_back = ord("X");
	#endregion /* Player 1 Key 1 defaults END */
	
	#region /* Player 1 Key 2 defaults */
	global.player1_key2_dive = noone;
	global.player1_key2_jump = vk_space;
	global.player1_key2_crouch = vk_shift;
	global.player1_key2_crouch_toggle = noone;
	global.player1_key2_sprint = ord("X");
	global.player1_key2_sprint_toggle = noone;
	global.player1_key2_left = ord("A");
	global.player1_key2_right = ord("D");
	global.player1_key2_down = ord("S");
	global.player1_key2_up = ord("W");
	global.player1_key2_tongue = noone;
	global.player1_key2_zoom_in = vk_add;
	global.player1_key2_zoom_out = vk_subtract;
	global.player1_key2_accept = vk_enter;
	global.player1_key2_back = vk_backspace;
	#endregion /* Player 1 Key 2 defaults END */
	
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
	#endregion /* Player 1 Keyboard Remapping END */
	
	#region /* After setting the keyboard controls back to default, save these settings in config */
	ini_open(working_directory + "config.ini");
	ini_write_real("config", "player1_key_dive", global.player1_key_dive);
	ini_write_real("config", "player1_key2_dive", global.player1_key2_dive);
	ini_write_real("config", "player1_key_jump", global.player1_key_jump);
	ini_write_real("config", "player1_key2_jump", global.player1_key2_jump);
	ini_write_real("config", "player1_key_crouch", global.player1_key_crouch);
	ini_write_real("config", "player1_key2_crouch", global.player1_key2_crouch);
	ini_write_real("config", "player1_key_crouch_toggle", global.player1_key_crouch_toggle);
	ini_write_real("config", "player1_key2_crouch_toggle", global.player1_key2_crouch_toggle);
	ini_write_real("config", "player1_key_sprint", global.player1_key_sprint);
	ini_write_real("config", "player1_key2_sprint", global.player1_key2_sprint);
	ini_write_real("config", "player1_key_sprint_toggle", global.player1_key_sprint_toggle);
	ini_write_real("config", "player1_key2_sprint_toggle", global.player1_key2_sprint_toggle);
	ini_write_real("config", "player1_key_left", global.player1_key_left);
	ini_write_real("config", "player1_key2_left", global.player1_key2_left);
	ini_write_real("config", "player1_key_right", global.player1_key_right);
	ini_write_real("config", "player1_key2_right", global.player1_key2_right);
	ini_write_real("config", "player1_key_down", global.player1_key_down);
	ini_write_real("config", "player1_key2_down", global.player1_key2_down);
	ini_write_real("config", "player1_key_up", global.player1_key_up);
	ini_write_real("config", "player1_key2_up", global.player1_key2_up);
	ini_write_real("config", "player1_key_tongue", global.player1_key_tongue);
	ini_write_real("config", "player1_key2_tongue", global.player1_key2_tongue);
	ini_write_real("config", "player1_key_zoom_in", global.player1_key_zoom_in);
	ini_write_real("config", "player1_key2_zoom_in", global.player1_key2_zoom_in);
	ini_write_real("config", "player1_key_zoom_out", global.player1_key_zoom_out);
	ini_write_real("config", "player1_key2_zoom_out", global.player1_key2_zoom_out);
	ini_write_real("config", "player1_key_accept", global.player1_key_accept);
	ini_write_real("config", "player1_key2_accept", global.player1_key2_accept);
	ini_write_real("config", "player1_key_back", global.player1_key_back);
	ini_write_real("config", "player1_key2_back", global.player1_key2_back);
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
	#endregion /* After setting the keyboard controls back to default, save these settings in config END */
	
}