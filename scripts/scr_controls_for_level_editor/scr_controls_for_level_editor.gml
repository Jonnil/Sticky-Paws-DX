function scr_controls_for_level_editor()
{
	
	#region /* Controls for level editor */
	key_up = (keyboard_check_pressed(global.player1_key_up)) or (keyboard_check_pressed(vk_up)) or (keyboard_check_pressed(ord("W"))) or (gamepad_button_check_pressed(0, gp_padu)) or (gamepad_axis_value(0, gp_axislv) < 0);
	key_left = (keyboard_check_pressed(global.player1_key_left)) or (keyboard_check_pressed(vk_left)) or (keyboard_check_pressed(ord("A"))) or (gamepad_button_check_pressed(0, gp_padl)) or (gamepad_axis_value(0, gp_axislh) < 0);
	key_right = (keyboard_check_pressed(global.player1_key_right)) or (keyboard_check_pressed(vk_right)) or (keyboard_check_pressed(ord("D"))) or (gamepad_button_check_pressed(0, gp_padr)) or (gamepad_axis_value(0, gp_axislh) > 0);
	key_down = (keyboard_check_pressed(global.player1_key_down)) or (keyboard_check_pressed(vk_down)) or (keyboard_check_pressed(ord("S"))) or (gamepad_button_check_pressed(0, gp_padd)) or (gamepad_axis_value(0, gp_axislv) > 0);
	
	#region /* Player 1 Key Accept */
	
	/* Player 1 Key Accept Hold */ key_a_hold = (gamepad_button_check(0, global.player1_gamepad_button_accept))
	or (gamepad_button_check(0, global.player1_gamepad_button2_accept))
	or (keyboard_check(global.player1_key_accept))
	or (keyboard_check(global.player1_key2_accept))
	or (keyboard_check(vk_space));
	
	/* Player 1 Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(0, global.player1_gamepad_button_accept))
	or (gamepad_button_check_pressed(0, global.player1_gamepad_button2_accept))
	or (keyboard_check_pressed(global.player1_key_accept))
	or (keyboard_check_pressed(global.player1_key2_accept))
	or (keyboard_check_pressed(vk_space));
	
	/* Player 1 Key Accept Released */ key_a_released = (gamepad_button_check_released(0, global.player1_gamepad_button_accept))
	or (gamepad_button_check_released(0, global.player1_gamepad_button2_accept))
	or (keyboard_check_released(global.player1_key_accept))
	or (keyboard_check_released(global.player1_key2_accept))
	or (keyboard_check_released(vk_space));
	
	#endregion /* Player 1 Key Accept END */
	
	#region /* Player 1 Key Back */
	
	/* Player 1 Key Back Hold */ key_b_hold = (gamepad_button_check(0, global.player1_gamepad_button_back))
	or (gamepad_button_check(0, global.player1_gamepad_button2_back))
	or (keyboard_check(global.player1_key_back))
	or (keyboard_check(global.player1_key2_back))
	or (keyboard_check(vk_escape));
	
	/* Player 1 Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(0, global.player1_gamepad_button_back))
	or (gamepad_button_check_pressed(0, global.player1_gamepad_button2_back))
	or (keyboard_check_pressed(global.player1_key_back))
	or (keyboard_check_pressed(global.player1_key2_back))
	or (keyboard_check_pressed(vk_escape));
	
	/* Player 1 Key Back Released */ key_b_released = (gamepad_button_check_released(0, global.player1_gamepad_button_back))
	or (gamepad_button_check_released(0, global.player1_gamepad_button2_back))
	or (keyboard_check_released(global.player1_key_back))
	or (keyboard_check_released(global.player1_key2_back))
	or (keyboard_check_released(vk_escape));
	
	#endregion /* Player 1 Key Back END */
	
	/* Player 1 Key Move Faster */ key_move_faster = (gamepad_button_check(0, gp_face3))
	or (gamepad_button_check(0, gp_face4))
	or (gamepad_button_check(0, gp_stickl))
	or (gamepad_button_check(0, gp_stickr))
	or (keyboard_check(vk_control))
	
	/* Player 1 Keyboard Shortcut Draw */ key_draw = ord("D")
	/* Player 1 Gamepad Shortcut Draw */ button_draw = gp_shoulderr;
	
	/* Player 1 Keyboard Shortcut Erase */ key_erase = ord("E")
	/* Player 1 Gamepad Shortcut Erase */ button_erase = gp_shoulderl;
	
	/* Player 1 Keyboard Shortcut Fill */ key_fill = ord("F")
	/* Player 1 Gamepad Shortcut Fill */ button_fill = gp_shoulderlb;
	
	/* Player 1 Keyboard Shortcut Grid */ key_grid = ord("G")
	/* Player 1 Gamepad Shortcut Grid */ button_grid = noone;
	
	/* Player 1 Keyboard Shortcut Play */ key_play = vk_enter
	/* Player 1 Gamepad Shortcut Play */ button_play = gp_select;
	
	#endregion /* Controls for level editor END */
	
}