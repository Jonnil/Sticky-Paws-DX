function scr_character_select_player_navigation(what_player = 1)
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	var player_key_left = global.player_[inp.key][what_player][1][action.left];
	var player_key_right = global.player_[inp.key][what_player][1][action.right];
	var player_key2_left = global.player_[inp.key][what_player][2][action.left];
	var player_key2_right = global.player_[inp.key][what_player][2][action.right];
	var player_key_up = global.player_[inp.key][what_player][1][action.up];
	var player_key_down = global.player_[inp.key][what_player][1][action.down];
	var player_key2_up = global.player_[inp.key][what_player][2][action.up];
	var player_key2_down = global.player_[inp.key][what_player][2][action.down];
	
	#region /* If player is player 1, set all the variables to Player variables */
	if (what_player == 1)
	{
		var player_accept_selection = player1_accept_selection;
		var can_input_player_name = can_input_player1_name;
		var can_input_player_name2 = can_input_player2_name;
		var can_input_player_name3 = can_input_player3_name;
		var can_input_player_name4 = can_input_player4_name;
		var player_name = global.player_name[1];
		var player_key_a_pressed = player1_key_a_pressed;
	}
	#endregion /* If player is player 1, set all the variables to Player variables END */
	
	#region /* If player is player 2, set all the variables to Player variables */
	if (what_player == 2)
	{
		var player_accept_selection = player2_accept_selection;
		var can_input_player_name = can_input_player2_name;
		var can_input_player_name2 = can_input_player1_name;
		var can_input_player_name3 = can_input_player3_name;
		var can_input_player_name4 = can_input_player4_name;
		var player_name = global.player_name[2];
		var player_key_a_pressed = player2_key_a_pressed;
	}
	#endregion /* If player is player 2, set all the variables to Player variables END */
	
	#region /* If player is player 3, set all the variables to Player variables */
	if (what_player == 3)
	{
		var player_accept_selection = player3_accept_selection;
		var can_input_player_name = can_input_player3_name;
		var can_input_player_name2 = can_input_player1_name;
		var can_input_player_name3 = can_input_player2_name;
		var can_input_player_name4 = can_input_player4_name;
		var player_name = global.player_name[3];
		var player_key_a_pressed = player3_key_a_pressed;
	}
	#endregion /* If player is player 3, set all the variables to Player variables END */
	
	#region /* If player is player 4, set all the variables to Player variables */
	if (what_player == 4)
	{
		var player_accept_selection = player4_accept_selection;
		var can_input_player_name = can_input_player4_name;
		var can_input_player_name2 = can_input_player1_name;
		var can_input_player_name3 = can_input_player2_name;
		var can_input_player_name4 = can_input_player3_name;
		var player_name = global.player_name[4];
		var player_key_a_pressed = player4_key_a_pressed;
	}
	#endregion /* If player is player 4, set all the variables to Player variables END */
	
	#region /* Player Menu Navigation */
	if (player_menu[what_player] == "select_character")
	{
		/* Navigate Character Selection */
		
		#region /* Player */
		if (menu_specific_joystick_delay[what_player] <= 0)
		&& (!input_key)
		&& (can_navigate)
		&& (player_accept_selection == false)
		{
			
			#region /* Player change portrait when clicking left or right */
			
			#region /* Player Key Left (change portrait sprites) */
			if (keyboard_check_pressed(player_key_left))
			|| (keyboard_check_pressed(player_key2_left))
			|| (gamepad_button_check_pressed(global.player_slot[what_player], gp_padl))
			|| (gamepad_axis_value(global.player_slot[what_player], gp_axislh) < -0.3)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 + player_display_x[what_player] - arrow_offset - 16,
			get_window_height * 0.5 - 16,
			get_window_width * 0.5 + player_display_x[what_player] - arrow_offset + 16,
			get_window_height * 0.5 + 16))
			&& (mouse_check_button_released(mb_left))
			{
				
				if (menu_delay == 0 && menu_joystick_delay == 0)
				&& (global.character_index[what_player - 1] > 0)
				{
					menu_delay = 3;
					if (gamepad_axis_value(global.player_slot[what_player], gp_axislh) < -0.3)
					{
						menu_specific_joystick_delay[what_player] = 30;
					}
					if (global.character_index[what_player - 1] > 0)
					{
						global.character_index[what_player - 1] --;
						character_portrait_for_player_update_directory[what_player] = true;
						alarm[0] = 1;
						alarm[1] = 1;
						global.character_for_player[what_player] = ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])
						xx_delay[what_player] = -1;
					}
					else
					{
						global.character_index[what_player - 1] = 0;
						global.character_for_player[what_player] = ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])
					}
					
					#region /* Player character select portrait sprite */
					global.skin_for_player[what_player] = global.actual_skin_for_player[what_player]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
					#endregion /* Player character select portrait sprite END */
					
				}
			}
			#endregion /* Player Key Left (change portrait sprites) END */
			
			#region /* Player Key Right (change portrait sprites) */
			if (keyboard_check_pressed(player_key_right))
			|| (keyboard_check_pressed(player_key2_right))
			|| (gamepad_button_check_pressed(global.player_slot[what_player], gp_padr))
			|| (gamepad_axis_value(global.player_slot[what_player], gp_axislh) > +0.3)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 + player_display_x[what_player] + arrow_offset - 16,
			get_window_height * 0.5 - 16,
			get_window_width * 0.5 + player_display_x[what_player] + arrow_offset + 16,
			get_window_height * 0.5 + 16))
			&& (mouse_check_button_released(mb_left))
			{
				
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (gamepad_axis_value(global.player_slot[what_player], gp_axislh) > +0.3)
					{
						menu_specific_joystick_delay[what_player] = 30;
					}
					if (global.character_index[what_player - 1] < ds_list_size(global.all_loaded_characters) - 1)
					{
						global.character_index[what_player - 1] = clamp(global.character_index[what_player - 1] + 1, 0, ds_list_size(global.all_loaded_characters) - 1);
						character_portrait_for_player_update_directory[what_player] = true;
						alarm[0] = 1;
						alarm[1] = 1;
						global.character_for_player[what_player] = ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])
						xx_delay[what_player] = +1;
					}
					
					#region /* Player character select portrait sprite */
					global.skin_for_player[what_player] = global.actual_skin_for_player[what_player]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
					#endregion /* Player character select portrait sprite END */
					
				}
			}
			#endregion /* Player Key Right (change portrait sprites) END */
			
			#endregion /* Player change portrait when clicking left or right END */
			
		}
		#endregion /* Player END */
		
	}
	else
	if (player_menu[what_player] == "select_name")
	{
		
		#region /* Player key up */
		if (keyboard_check_pressed(player_key_up))
		|| (keyboard_check_pressed(player_key2_up))
		|| (gamepad_button_check_pressed(global.player_slot[what_player], gp_padu))
		|| (gamepad_axis_value(global.player_slot[what_player], gp_axislv) < -0.3)
		&& (menu_specific_joystick_delay[what_player] <= 0)
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (gamepad_axis_value(global.player_slot[what_player], gp_axislv) < -0.3)
				{
					menu_specific_joystick_delay[what_player] = 30;
				}
				if (character_portrait_for_player_dir_exists_3[what_player])
				{
					player_menu[what_player] = "select_voicepack";
				}
				else
				if (character_portrait_for_player_dir_exists_1[what_player])
				{
					player_menu[what_player] = "select_skin";
				}
				else
				{
					player_menu[what_player] = "select_character";
				}
			}
		}
		#endregion /* Player key up END */
		
		if (!can_input_player_name && !can_input_player_name2 && !can_input_player_name3 && !can_input_player_name4)
		{
			if (player_key_a_pressed && menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				keyboard_string = global.player_name[what_player];
				can_input_player_name = true;
				can_input_player_name2 = false;
				can_input_player_name3 = false;
				can_input_player_name4 = false;
			}
		}
	}
	#endregion /* Player Menu Navigation END */
	
	/* Reset "menu specific joystick delay" to 0 if you aren't moving joystick at all */
	if (gamepad_axis_value(global.player_slot[what_player], gp_axislh) > -0.3)
	&& (gamepad_axis_value(global.player_slot[what_player], gp_axislh) < +0.3)
	&& (gamepad_axis_value(global.player_slot[what_player], gp_axislv) > -0.3)
	&& (gamepad_axis_value(global.player_slot[what_player], gp_axislv) < +0.3)
	{
		menu_specific_joystick_delay[what_player] = 0;
	}
	
}