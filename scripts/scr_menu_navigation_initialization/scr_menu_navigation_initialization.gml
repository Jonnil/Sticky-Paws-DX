function scr_menu_navigation_initialization()
{
	
	//#region /* Keyboard Controls */
	
	//key_up = scr_key_initialize(key_up, 0, 1, global.player_["key"][global.pause_player + 1][1]["up"], global.player_["key"][global.pause_player + 1][2]["up"], global.player_["gp"][global.pause_player + 1][1]["up"], global.player_["gp"][global.pause_player + 1][2]["up"]);
	//key_left = scr_key_initialize(key_left, 0, 1, global.player_["key"][global.pause_player + 1][1]["left"], global.player_["key"][global.pause_player + 1][2]["left"], global.player_["gp"][global.pause_player + 1][1]["left"], global.player_["gp"][global.pause_player + 1][2]["left"]);
	//key_right = scr_key_initialize(key_right, 0, 1, global.player_["key"][global.pause_player + 1][1]["right"], global.player_["key"][global.pause_player + 1][2]["right"], global.player_["gp"][global.pause_player + 1][1]["right"], global.player_["gp"][global.pause_player + 1][2]["right"]);
	//key_down = scr_key_initialize(key_down, 0, 1, global.player_["key"][global.pause_player + 1][1]["down"], global.player_["key"][global.pause_player + 1][2]["down"], global.player_["gp"][global.pause_player + 1][1]["down"], global.player_["gp"][global.pause_player + 1][2]["down"]);
	///* Player 1 Key Accept Pressed */ key_a_pressed = scr_key_initialize(key_a_released, 1, 1, global.player_["key"][global.pause_player + 1][1]["accept"], global.player_["key"][global.pause_player + 1][2]["accept"], global.player_["gp"][global.pause_player + 1][1]["accept"], global.player_["gp"][global.pause_player + 1][2]["accept"]);
	///* Player 1 Key Accept Hold */ key_a_hold = scr_key_initialize(key_a_hold, 0, 1, global.player_["key"][global.pause_player + 1][1]["accept"], global.player_["key"][global.pause_player + 1][2]["accept"], global.player_["gp"][global.pause_player + 1][1]["accept"], global.player_["gp"][global.pause_player + 1][2]["accept"]);
	///* Player 1 Key Accept Released */ key_a_released = scr_key_initialize(key_a_released, 2, 1, global.player_["key"][global.pause_player + 1][1]["accept"], global.player_["key"][global.pause_player + 1][2]["accept"], global.player_["gp"][global.pause_player + 1][1]["accept"], global.player_["gp"][global.pause_player + 1][2]["accept"]);
	///* Player 1 Key Back Pressed */ key_b_pressed = scr_key_initialize(key_b_pressed, 1, 1, global.player_["key"][global.pause_player + 1][1]["back"], global.player_["key"][global.pause_player + 1][2]["back"], global.player_["gp"][global.pause_player + 1][1]["back"], global.player_["gp"][global.pause_player + 1][2]["back"]);
	
	//#endregion /* Keyboard Controls END */
	
	#region /* Keyboard Controls */
	
	#region /* Player 1 */
	if (global.pause_player == 0)
	{
		key_up = scr_key_initialize(key_up, 0, 1, global.player1_key_up, global.player1_key2_up, global.player1_gamepad_button_up, global.player1_gamepad_button_up);
		key_left = scr_key_initialize(key_left, 0, 1, global.player1_key_left, global.player1_key2_left, global.player1_gamepad_button_left, global.player1_gamepad_button_left);
		key_right = scr_key_initialize(key_right, 0, 1, global.player1_key_right, global.player1_key2_right, global.player1_gamepad_button_right, global.player1_gamepad_button_right);
		key_down = scr_key_initialize(key_down, 0, 1, global.player1_key_down, global.player1_key2_down, global.player1_gamepad_button_down, global.player1_gamepad_button_down);
		/* Player 1 Key Accept Pressed */ key_a_pressed = scr_key_initialize(key_a_released, 1, 1, global.player1_key_accept, global.player1_key2_accept, global.player1_gamepad_button_accept, global.player1_gamepad_button_accept);
		/* Player 1 Key Accept Hold */ key_a_hold = scr_key_initialize(key_a_hold, 0, 1, global.player1_key_accept, global.player1_key2_accept, global.player1_gamepad_button_accept, global.player1_gamepad_button_accept);
		/* Player 1 Key Accept Released */ key_a_released = scr_key_initialize(key_a_released, 2, 1, global.player1_key_accept, global.player1_key2_accept, global.player1_gamepad_button_accept, global.player1_gamepad_button_accept);
		/* Player 1 Key Back Pressed */ key_b_pressed = scr_key_initialize(key_b_pressed, 1, 1, global.player1_key_back, global.player1_key2_back, global.player1_gamepad_button_back, global.player1_gamepad_button_back);
	}
	#endregion /* Player 1 END */
	
	#region /* Player 2 */
	if (global.pause_player == 1)
	{
		key_up = (keyboard_check_pressed(global.player2_key_up)) or (gamepad_button_check_pressed(global.player2_slot, gp_padu)) or (gamepad_axis_value(global.player2_slot, gp_axislv) < 0);
		key_left = (keyboard_check_pressed(global.player2_key_left)) or (gamepad_button_check_pressed(global.player2_slot, gp_padl)) or (gamepad_axis_value(global.player2_slot, gp_axislh) < 0);
		key_right = (keyboard_check_pressed(global.player2_key_right)) or (gamepad_button_check_pressed(global.player2_slot, gp_padr)) or (gamepad_axis_value(global.player2_slot, gp_axislh) > 0);
		key_down = (keyboard_check_pressed(global.player2_key_down)) or (gamepad_button_check_pressed(global.player2_slot, gp_padd)) or (gamepad_axis_value(global.player2_slot, gp_axislv) > 0);
		/* Player 2 Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_accept)) or (keyboard_check_pressed(global.player2_key_accept)) or (keyboard_check_pressed(global.player2_key2_accept)) or (keyboard_check_pressed(vk_space));
		/* Player 2 Key Accept Hold */ key_a_hold = (gamepad_button_check(global.player2_slot, global.player2_gamepad_button_accept)) or (gamepad_button_check(global.player2_slot, global.player2_gamepad_button2_accept)) or (keyboard_check(global.player2_key_accept)) or (keyboard_check(global.player2_key2_accept)) or (keyboard_check(vk_space));
		/* Player 2 Key Accept Released */ key_a_released = (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button_accept)) or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button2_accept)) or (keyboard_check_released(global.player2_key_accept)) or (keyboard_check_released(global.player2_key2_accept)) or (keyboard_check_released(vk_space));
		/* Player 2 Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_back)) or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_back)) or (keyboard_check_pressed(global.player2_key_back)) or (keyboard_check_pressed(global.player2_key2_back)) or (keyboard_check_pressed(vk_escape));
	}
	#endregion /* Player 2 END */
	
	#region /* Player 3 */
	if (global.pause_player = 2)
	{
		key_up = (keyboard_check_pressed(global.player3_key_up)) or (gamepad_button_check_pressed(global.player3_slot, gp_padu)) or (gamepad_axis_value(global.player3_slot, gp_axislv) < 0);
		key_left = (keyboard_check_pressed(global.player3_key_left)) or (gamepad_button_check_pressed(global.player3_slot, gp_padl)) or (gamepad_axis_value(global.player3_slot, gp_axislh) < 0);
		key_right = (keyboard_check_pressed(global.player3_key_right)) or (gamepad_button_check_pressed(global.player3_slot, gp_padr)) or (gamepad_axis_value(global.player3_slot, gp_axislh) > 0);
		key_down = (keyboard_check_pressed(global.player3_key_down)) or (gamepad_button_check_pressed(global.player3_slot, gp_padd)) or (gamepad_axis_value(global.player3_slot, gp_axislv) > 0);
		/* Player 3 Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_accept)) or (keyboard_check_pressed(global.player3_key_accept)) or (keyboard_check_pressed(global.player3_key2_accept)) or (keyboard_check_pressed(vk_space));
		/* Player 3 Key Accept Hold */ key_a_hold = (gamepad_button_check(global.player3_slot, global.player3_gamepad_button_accept)) or (gamepad_button_check(global.player3_slot, global.player3_gamepad_button2_accept)) or (keyboard_check(global.player3_key_accept)) or (keyboard_check(global.player3_key2_accept)) or (keyboard_check(vk_space));
		/* Player 3 Key Accept Released */ key_a_released = (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button_accept)) or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button2_accept)) or (keyboard_check_released(global.player3_key_accept)) or (keyboard_check_released(global.player3_key2_accept)) or (keyboard_check_released(vk_space));
		/* Player 3 Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_back)) or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_back)) or (keyboard_check_pressed(global.player3_key_back)) or (keyboard_check_pressed(global.player3_key2_back)) or (keyboard_check_pressed(vk_escape));
	}
	#endregion /* Player 3 END */
	
	#region /* Player 4 */
	if (global.pause_player = 3)
	{
		key_up = (keyboard_check_pressed(global.player4_key_up)) or (gamepad_button_check_pressed(global.player4_slot, gp_padu)) or (gamepad_axis_value(global.player4_slot, gp_axislv) < 0);
		key_left = (keyboard_check_pressed(global.player4_key_left)) or (gamepad_button_check_pressed(global.player4_slot, gp_padl)) or (gamepad_axis_value(global.player4_slot, gp_axislh) < 0);
		key_right = (keyboard_check_pressed(global.player4_key_right)) or (gamepad_button_check_pressed(global.player4_slot, gp_padr)) or (gamepad_axis_value(global.player4_slot, gp_axislh) > 0);
		key_down = (keyboard_check_pressed(global.player4_key_down)) or (gamepad_button_check_pressed(global.player4_slot, gp_padd)) or (gamepad_axis_value(global.player4_slot, gp_axislv) > 0);
		/* Player 4 Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_accept)) or (keyboard_check_pressed(global.player4_key_accept)) or (keyboard_check_pressed(global.player4_key2_accept)) or (keyboard_check_pressed(vk_space));
		/* Player 4 Key Accept Hold */ key_a_hold = (gamepad_button_check(global.player4_slot, global.player4_gamepad_button_accept)) or (gamepad_button_check(global.player4_slot, global.player4_gamepad_button2_accept)) or (keyboard_check(global.player4_key_accept)) or (keyboard_check(global.player4_key2_accept)) or (keyboard_check(vk_space));
		/* Player 4 Key Accept Released */ key_a_released = (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button_accept)) or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button2_accept)) or (keyboard_check_released(global.player4_key_accept)) or (keyboard_check_released(global.player4_key2_accept)) or (keyboard_check_released(vk_space));
		/* Player 4 Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_back)) or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_back)) or (keyboard_check_pressed(global.player4_key_back)) or (keyboard_check_pressed(global.player4_key2_back)) or (keyboard_check_pressed(vk_escape));
	}
	#endregion /* Player 4 END */
	
	#endregion /* Keyboard Controls END */
	
}