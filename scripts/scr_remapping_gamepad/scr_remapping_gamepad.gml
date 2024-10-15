function scr_remapping_gamepad()
{
	player_profile = global.player_profile[remapping_player + 1];
	
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
	
	#region /* Check for player button presses */
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_face1))
	{
		last_key = gp_face1;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_face2))
	{
		last_key = gp_face2;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_face3))
	{
		last_key = gp_face3;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_face4))
	{
		last_key = gp_face4;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_shoulderl))
	{
		last_key = gp_shoulderl;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_shoulderlb))
	{
		last_key = gp_shoulderlb;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_shoulderr))
	{
		last_key = gp_shoulderr;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_shoulderrb))
	{
		last_key = gp_shoulderrb;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_stickl))
	{
		last_key = gp_stickl;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_stickr))
	{
		last_key = gp_stickr;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_padu))
	|| (keyboard_check_pressed(vk_up))
	{
		last_key = gp_padu;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_padd))
	|| (keyboard_check_pressed(vk_down))
	{
		last_key = gp_padd;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_padl))
	|| (keyboard_check_pressed(vk_left))
	{
		last_key = gp_padl;
		can_remap_key = true;
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[remapping_player + 1], gp_padr))
	|| (keyboard_check_pressed(vk_right))
	{
		last_key = gp_padr;
		can_remap_key = true;
	}
	else
	if (gamepad_axis_value(global.player_slot[remapping_player + 1], gp_axislv) < -0.3)
	{
		last_key = JOYSTICK_VALUE.JOYLEFT_UP;
		can_remap_key = true;
	}
	else
	if (gamepad_axis_value(global.player_slot[remapping_player + 1], gp_axislv) > +0.3)
	{
		last_key = JOYSTICK_VALUE.JOYLEFT_DOWN;
		can_remap_key = true;
	}
	else
	if (gamepad_axis_value(global.player_slot[remapping_player + 1], gp_axislh) < -0.3)
	{
		last_key = JOYSTICK_VALUE.JOYLEFT_LEFT;
		can_remap_key = true;
	}
	else
	if (gamepad_axis_value(global.player_slot[remapping_player + 1], gp_axislh) > +0.3)
	{
		last_key = JOYSTICK_VALUE.JOYLEFT_RIGHT;
		can_remap_key = true;
	}
	else
	if (gamepad_axis_value(global.player_slot[remapping_player + 1], gp_axisrv) < -0.3)
	{
		last_key = JOYSTICK_VALUE.JOYRIGHT_UP;
		can_remap_key = true;
	}
	else
	if (gamepad_axis_value(global.player_slot[remapping_player + 1], gp_axisrv) > +0.3)
	{
		last_key = JOYSTICK_VALUE.JOYRIGHT_DOWN;
		can_remap_key = true;
	}
	else
	if (gamepad_axis_value(global.player_slot[remapping_player + 1], gp_axisrh) < -0.3)
	{
		last_key = JOYSTICK_VALUE.JOYRIGHT_LEFT;
		can_remap_key = true;
	}
	else
	if (gamepad_axis_value(global.player_slot[remapping_player + 1], gp_axisrh) > +0.3)
	{
		last_key = JOYSTICK_VALUE.JOYRIGHT_RIGHT;
		can_remap_key = true;
	}
	#endregion /* Check for player button presses END */
	
	else
	
	if (keyboard_check_pressed(vk_escape))
	|| (gamepad_button_check(global.player_slot[remapping_player + 1], gp_start))
	{
		last_key = noone;
		can_remap_key = true;
	}
	
	var force_back = false;
	for(var i = 1; i <= global.max_players; i += 1) {
		if (i != remapping_player && gamepad_is_connected(global.player_slot[i])) {
			if (gamepad_button_check(global.player_slot[i], global.player_[inp.gp][i][1][action.back])) {
				force_back = true;
				break; /* Exit the loop if any player button is pressed */
			}
		}
	}
	
	if (mouse_check_button_pressed(mb_right))
	|| (force_back) {
		can_remap_key = false;
		input_key = false;
		menu_delay = 3;
	}
	
	#region /* Remapping Gamepad */
	if (can_remap_key)
	{
		/* global.player_[keyboard/gamepad][player][key1/key2][action] */
		if (menu == "remap_key_dive")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.dive] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_dive", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_jump")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.jump] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_jump", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_double_jump")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.double_jump] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_double_jump", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_crouch")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.crouch] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_crouch", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_crouch_toggle")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.crouch_toggle] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_crouch_toggle", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_run")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.run] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_run", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_run_toggle")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.run_toggle] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_run_toggle", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_left")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = gp_padl;
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.left] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_left", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_right")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = gp_padr;
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.right] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_right", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_down")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = gp_padd;
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.down] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_down", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_up")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				last_key = gp_padu;
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.up] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_up", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_tongue")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.tongue] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_tongue", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_zoom_in")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.zoom_in] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_zoom_in", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_zoom_out")
		{
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.zoom_out] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_zoom_out", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_accept")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				if (os_type == os_switch)
				{
					last_key = gp_face2;
				}
				else
				{
					last_key = gp_face1;
				}
			}
			if (global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back] == last_key)
			{
				global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back] = global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept];
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_back", global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept]);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_accept", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		else
		if (menu == "remap_key_back")
		{
			if (last_key == noone)
			&& (menu_remap_key_number == 0)
			{
				if (os_type == os_switch)
				{
					last_key = gp_face1;
				}
				else
				{
					last_key = gp_face2;
				}
			}
			if (global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept] == last_key)
			{
				global.player_[inp.gp][remapping_player + 1][remap_key_number][action.accept] = global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back];
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_accept", global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back]);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
			global.player_[inp.gp][remapping_player + 1][remap_key_number][action.back] = last_key;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("player" + string(remapping_player + 1) + "_profile" + string(player_profile + 1), "player" + string(remapping_player + 1) + "_gamepad_button" + string(remap_key_number_string) + "_back", last_key);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		can_remap_key = false;
		input_key = false;
		menu_delay = 6;
	}
	#endregion /* Remapping Gamepad END */
	
}
