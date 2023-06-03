function scr_menu_navigation_initialization(key_direction_hold_press_release = 0, only_player1_can_navigate = false)
{
	
	#region /* Menu Navigation Controls */
	
	key_up = noone;
	key_left = noone;
	key_right = noone;
	key_down = noone;
	key_a_pressed = noone;
	key_a_hold = noone;
	key_a_released = noone;
	key_b_pressed = noone;
	
	#region /* Player 1 */
	if (global.pause_player == 0)
	|| (global.player1_can_play)
	|| (only_player1_can_navigate)
	{
		var which_player = 1;
		var player_slot = global.player1_slot;
	}
	#endregion /* Player 1 END */
	
	else
	
	#region /* Player 2 */
	if (global.pause_player == 1)
	|| (global.player2_can_play)
	{
		var which_player = 2;
		var player_slot = global.player2_slot;
	}
	#endregion /* Player 2 END */
	
	else
	
	#region /* Player 3 */
	if (global.pause_player == 2)
	|| (global.player3_can_play)
	{
		var which_player = 3;
		var player_slot = global.player3_slot;
	}
	#endregion /* Player 3 END */
	
	else
	
	#region /* Player 4 */
	if (global.pause_player == 3)
	|| (global.player4_can_play)
	{
		var which_player = 4;
		var player_slot = global.player4_slot;
	}
	#endregion /* Player 4 END */
	
	key_up = scr_key_initialize(key_up, key_direction_hold_press_release, which_player, action.up) || (gamepad_axis_value(player_slot, gp_axislv) < 0) && (menu_joystick_delay <= 0);
	key_left = scr_key_initialize(key_left, key_direction_hold_press_release, which_player, action.left) || (gamepad_axis_value(player_slot, gp_axislh) < 0) && (menu_joystick_delay <= 0);
	key_right = scr_key_initialize(key_right, key_direction_hold_press_release, which_player, action.right) || (gamepad_axis_value(player_slot, gp_axislh) > 0) && (menu_joystick_delay <= 0);
	key_down = scr_key_initialize(key_down, key_direction_hold_press_release, which_player, action.down) || (gamepad_axis_value(player_slot, gp_axislv) > 0) && (menu_joystick_delay <= 0);
	/* Key Accept Pressed */ key_a_pressed = scr_key_initialize(key_a_pressed, 1, which_player, action.accept) || (keyboard_check_pressed(vk_space));
	/* Key Accept Hold */ key_a_hold = scr_key_initialize(key_a_hold, 0, which_player, action.accept) || (keyboard_check(vk_space));
	/* Key Accept Released */ key_a_released = scr_key_initialize(key_a_released, 2, which_player, action.accept) || (keyboard_check_released(vk_space));
	/* Key Back Pressed */ key_b_pressed = scr_key_initialize(key_b_pressed, 1, which_player, action.back) || (keyboard_check_pressed(vk_escape));
	
	#endregion /* Menu Navigation Controls END */
	
}