function scr_controls_for_level_editor()
{
	
	#region /* Controls for level editor */
	key_up = scr_key_initialize(key_up, 0, 1, action.up) || (gamepad_axis_value(global.player_slot[1], gp_axislv) < 0) && (menu_joystick_delay == 0);
	key_left = scr_key_initialize(key_left, 0, 1, action.left) || (gamepad_axis_value(global.player_slot[1], gp_axislh) < 0) && (menu_joystick_delay == 0);
	key_right = scr_key_initialize(key_right, 0, 1, action.right) || (gamepad_axis_value(global.player_slot[1], gp_axislh) > 0) && (menu_joystick_delay == 0);
	key_down = scr_key_initialize(key_down, 0, 1, action.down) || (gamepad_axis_value(global.player_slot[1], gp_axislv) > 0) && (menu_joystick_delay == 0);
	
	#region /* Player 1 Key Accept */
	
	/* Player 1 Key Accept Hold */ key_a_hold = (gamepad_button_check(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
	|| (gamepad_button_check(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]))
	|| (keyboard_check(global.player_[inp.key][1][1][action.accept]))
	|| (keyboard_check(global.player_[inp.key][1][2][action.accept]))
	|| (keyboard_check(vk_space));
	
	/* Player 1 Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
	|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]))
	|| (keyboard_check_pressed(global.player_[inp.key][1][1][action.accept]))
	|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.accept]))
	|| (keyboard_check_pressed(vk_space));
	
	/* Player 1 Key Accept Released */ key_a_released = (gamepad_button_check_released(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
	|| (gamepad_button_check_released(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]))
	|| (keyboard_check_released(global.player_[inp.key][1][1][action.accept]))
	|| (keyboard_check_released(global.player_[inp.key][1][2][action.accept]))
	|| (keyboard_check_released(vk_space));
	
	#endregion /* Player 1 Key Accept END */
	
	#region /* Player 1 Key Back */
	
	/* Player 1 Key Back Hold */ key_b_hold = (gamepad_button_check(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
	|| (gamepad_button_check(global.player_slot[1], global.player_[inp.gp][1][2][action.back]))
	|| (keyboard_check(global.player_[inp.key][1][1][action.back]))
	|| (keyboard_check(global.player_[inp.key][1][2][action.back]))
	|| (keyboard_check(vk_escape));
	
	/* Player 1 Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
	|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.back]))
	|| (keyboard_check_pressed(global.player_[inp.key][1][1][action.back]))
	|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.back]))
	|| (keyboard_check_pressed(vk_escape));
	#endregion /* Player 1 Key Back END */
	
	/* Player 1 Key Move Faster */ key_move_faster = (gamepad_button_check(global.player_slot[1], gp_shoulderrb))
	|| (gamepad_button_check(global.player_slot[1], gp_stickl))
	|| (gamepad_button_check(global.player_slot[1], gp_stickr))
	|| (keyboard_check(vk_control))
	
	/* Player 1 Keyboard Shortcut Change Draw Size */ key_change_draw_size = ord("D");
	/* Player 1 Gamepad Shortcut Change Draw Size */ button_change_draw_size = gp_face3;
	
	/* Player 1 Keyboard Shortcut Change Erase Size */ key_change_erase_size = ord("E");
	/* Player 1 Gamepad Shortcut Change Erase Size */ button_change_erase_size = gp_face3;
	
	/* Player 1 Keyboard Shortcut Change Fill Type */ key_change_fill_type = ord("F");
	/* Player 1 Gamepad Shortcut Change Fill Type */ button_change_fill_type = gp_face3;
	
	/* Player 1 Keyboard Shortcut Draw */ key_draw = ord("D");
	/* Player 1 Gamepad Shortcut Draw */ button_draw = global.player_[inp.gp][1][1][action.accept];
	
	/* Player 1 Keyboard Shortcut Erase */ key_erase = ord("E");
	/* Player 1 Gamepad Shortcut Erase */ button_erase = global.player_[inp.gp][1][1][action.back];
	
	/* Player 1 Keyboard Erase Objects */ key_erase_object = ord("X");
	
	/* Player 1 Keyboard Shortcut Fill */ key_fill = ord("F");
	/* Player 1 Gamepad Shortcut Fill */ button_fill = gp_face4;
	
	/* Player 1 Keyboard Shortcut Grid */ key_grid = ord("G");
	/* Player 1 Gamepad Shortcut Grid */ button_grid = noone;
	
	/* Player 1 Keyboard Shortcut Play */ key_play = vk_enter;
	/* Player 1 Gamepad Shortcut Play */ button_play = gp_select;
	
	/* Player 1 Gamepad Shortcut Scroll Object Left */ button_scroll_object_left = gp_shoulderl;
	
	/* Player 1 Gamepad Shortcut Scroll Object Right */ button_scroll_object_right = gp_shoulderr;
	
	#endregion /* Controls for level editor END */
	
}