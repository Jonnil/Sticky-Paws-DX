function scr_remapping_gamepad()
{
	
	#region /* Check for player 1 button presses */
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.accept]))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.accept]))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.accept]))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.accept]))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = gp_face1;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.back]))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.back]))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][2][1][action.back]))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][2][1][action.back]))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = gp_face2;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_face3))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_face3))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_face3))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_face3))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = gp_face3;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_face4))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_face4))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_face4))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_face4))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = gp_face4;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_shoulderl))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_shoulderl))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_shoulderl))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_shoulderl))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = gp_shoulderl;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_shoulderlb))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_shoulderlb))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_shoulderlb))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_shoulderlb))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = gp_shoulderlb;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_shoulderr))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_shoulderr))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_shoulderr))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_shoulderr))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = gp_shoulderr;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_shoulderrb))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_shoulderrb))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_shoulderrb))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_shoulderrb))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = gp_shoulderrb;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_stickl))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_stickl))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_stickl))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_stickl))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = gp_stickl;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_stickr))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_stickr))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_stickr))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_stickr))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = gp_stickr;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_padu))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_padu))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_padu))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_padu))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	or (keyboard_check_pressed(vk_up))
	{
		last_key = gp_padu;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_padd))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_padd))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_padd))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_padd))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	or (keyboard_check_pressed(vk_down))
	{
		last_key = gp_padd;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_padl))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_padl))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_padl))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_padl))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	or (keyboard_check_pressed(vk_left))
	{
		last_key = gp_padl;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(global.player1_slot, gp_padr))
	and (!gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(global.player2_slot, gp_padr))
	and (!gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(global.player3_slot, gp_padr))
	and (!gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(global.player4_slot, gp_padr))
	and (!gamepad_button_check(global.player4_slot, gp_start))
	or (keyboard_check_pressed(vk_right))
	{
		last_key = gp_padr;
		can_remap_key = true;
	}
	#endregion /* Check for player 1 button presses END */
	
	else
	
	if (keyboard_check_pressed(vk_escape))
	or (remapping_player == 0)
	and (gamepad_button_check(global.player1_slot, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check(global.player2_slot, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check(global.player3_slot, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check(global.player4_slot, gp_start))
	{
		last_key = noone;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_right))
	{
		can_remap_key = true;
	}
	
	#region /* Remapping Gamepad */
	if (menu_remap_key_number == 0)
	{
		var remap_key_number_string = "";
		var remap_key_number = 1;
	}
	else
	if (menu_remap_key_number == 2)
	{
		var remap_key_number_string = "2";
		var remap_key_number = 2;
	}
	
	if (can_remap_key == true)
	{
		/* global.player_[keyboard/gamepad][player][key1/key2][action] */
		if (menu == "remap_key_dive")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.dive] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_dive", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_jump")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.jump] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_jump", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_crouch")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.crouch] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_crouch", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_crouch_toggle")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.crouch_toggle] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_crouch_toggle", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_sprint")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.sprint] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_sprint", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_sprint_toggle")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.sprint_toggle] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_sprint_toggle", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_left")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.left] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_left", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_right")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.right] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_right", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_down")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.down] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_down", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_up")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.up] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_up", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_tongue")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.tongue] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_tongue", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_zoom_in")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.zoom_in] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_zoom_in", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_zoom_out")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.zoom_out] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_zoom_out", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_accept")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_accept", last_key);
			ini_close();
		}
		else
		if (menu == "remap_key_back")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back] = last_key;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_back", last_key);
			ini_close();
		}
		can_remap_key = false;
		input_key = false;
		menu_delay = 10;
	}
	#endregion /* Remapping Gamepad END */
	
}
