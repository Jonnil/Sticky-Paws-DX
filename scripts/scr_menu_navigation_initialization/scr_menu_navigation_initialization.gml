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
	|| (global.player_can_play[1])
	|| (only_player1_can_navigate)
	{
		var what_player = 1;
		var player_slot = global.player_slot[1];
	}
	#endregion /* Player 1 END */
	
	else
	
	#region /* Player 2 */
	if (global.pause_player == 1)
	|| (global.player_can_play[2])
	{
		var what_player = 2;
		var player_slot = global.player_slot[2];
	}
	#endregion /* Player 2 END */
	
	else
	
	#region /* Player 3 */
	if (global.pause_player == 2)
	|| (global.player_can_play[3])
	{
		var what_player = 3;
		var player_slot = global.player_slot[3];
	}
	#endregion /* Player 3 END */
	
	else
	
	#region /* Player 4 */
	if (global.pause_player == 3)
	|| (global.player_can_play[4])
	{
		var what_player = 4;
		var player_slot = global.player_slot[4];
	}
	#endregion /* Player 4 END */
	
	key_up = scr_key_initialize(key_up, key_direction_hold_press_release, what_player, action.up);
	key_left = scr_key_initialize(key_left, key_direction_hold_press_release, what_player, action.left);
	key_right = scr_key_initialize(key_right, key_direction_hold_press_release, what_player, action.right);
	key_down = scr_key_initialize(key_down, key_direction_hold_press_release, what_player, action.down);
	/* Key Accept Pressed */ key_a_pressed = scr_key_initialize(key_a_pressed, 1, what_player, action.accept) || (keyboard_check_pressed(vk_space));
	/* Key Accept Hold */ key_a_hold = scr_key_initialize(key_a_hold, 0, what_player, action.accept) || (keyboard_check(vk_space));
	/* Key Accept Released */ key_a_released = scr_key_initialize(key_a_released, 2, what_player, action.accept) || (keyboard_check_released(vk_space));
	/* Key Back Pressed */ key_b_pressed = scr_key_initialize(key_b_pressed, 1, what_player, action.back) || (keyboard_check_pressed(vk_escape));
	
	#endregion /* Menu Navigation Controls END */
	
}