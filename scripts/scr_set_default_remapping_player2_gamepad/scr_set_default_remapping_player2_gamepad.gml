function scr_set_default_remapping_player2_gamepad()
{
	
	#region /*Player 2 Keyboard Remapping (everything should be set to noone)*/
	
	#region /*Player 2 Gamepad Buttons 1 defaults*/
	global.player2_gamepad_button_dive = gp_face3;
	global.player2_gamepad_button_jump = gp_face1;
	global.player2_gamepad_button_crouch = noone;
	global.player2_gamepad_button_crouch_toggle = noone;
	global.player2_gamepad_button_sprint = gp_face3;
	global.player2_gamepad_button_sprint_toggle = noone;
	global.player2_gamepad_button_left = gp_padl;
	global.player2_gamepad_button_right = gp_padr;
	global.player2_gamepad_button_down = gp_padd;
	global.player2_gamepad_button_up = gp_padu;
	global.player2_gamepad_button_tongue = noone;
	#endregion /*Player 2 Gamepad Buttons 1 defaults END*/
	
	#region /*Player 2 Gamepad Buttons 2 defaults*/
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
	#endregion /*Player 2 Gamepad Buttons 2 defaults END*/
	
	global.player2_up_key_is_jump_key = false;
	global.player2_double_tap_to_run = true;
	global.player2_sprint_toggle = false;
	global.player2_cancel_dive_by_pressing_jump_or_dive_button = false;
	global.player2_cancel_dive_by_pressing_opposite_direction = false;
	global.player2_down_and_jump_to_groundpound = false;
	global.player2_wall_jump_setting = 1;
	global.player2_drop_from_rope = 1;
	global.player2_show_controls = 1;
	#endregion /*Player 2 Keyboard Remapping (everything should be set to noone) END*/
	
}