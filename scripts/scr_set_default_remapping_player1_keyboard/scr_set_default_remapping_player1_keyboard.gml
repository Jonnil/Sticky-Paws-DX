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
	#endregion /* Player 1 Key 2 defaults END */
	
	global.player1_up_key_is_jump_key = false;
	global.player1_double_tap_to_run = true;
	global.player1_sprint_toggle = false;
	global.player1_cancel_dive_by_pressing_jump_or_dive_button = false;
	global.player1_cancel_dive_by_pressing_opposite_direction = false;
	global.player1_down_and_jump_to_groundpound = false;
	global.player1_wall_jump_setting = 1;
	global.player1_drop_from_rope = 1;
	global.player1_show_controls = 1;
	#endregion /* Player 1 Keyboard Remapping END */
	
}