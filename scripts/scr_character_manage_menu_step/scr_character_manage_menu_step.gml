function scr_character_manage_menu_step()
{
	if (variable_instance_exists(self, "in_edit_character_menu"))
	{
		var enable_edit_character = true;
	}
	else
	{
		var enable_edit_character = false;
	}

	if (ds_list_size(global.all_loaded_characters) >= global.max_custom_characters)
	{
		var max_custom_characters_reached = true;
	}
	else
	{
		var max_custom_characters_reached = false;
	}

	if (os_type == os_switch)
	{
		var enable_copy_character = false;
		var enable_upload_character = false;
	}
	else
	{
		var enable_copy_character = true;
		var enable_upload_character = true;
	}

	var get_window_height = display_get_gui_height();
	var fixed_player = 1;

	if (menu == "click_edit_character")
	|| (menu == "click_copy_character")
	|| (menu == "click_delete_character")
	|| (menu == "click_delete_character_no")
	|| (menu == "click_delete_character_yes")
	|| (menu == "click_upload_character")
	|| (menu == "open_folder_copy_character")
	|| (menu == "back_from_copy_character")
	{
		player_display_x[fixed_player] = 0;
		xx[fixed_player] = lerp(xx[fixed_player], player_display_x[fixed_player], 0.1);
		if (menu_specific_joystick_delay[fixed_player] > 0)
		{
			menu_specific_joystick_delay[fixed_player]--;
		}

		#region /* Player */

		#region /* Player change portrait when clicking left or right */

		#region /* Player Key Left (change portrait sprites) */
		if (keyboard_check_pressed(global.player_[inp.key][fixed_player][1][action.left]))
		|| (keyboard_check_pressed(global.player_[inp.key][fixed_player][2][action.left]))
		|| (gamepad_button_check_pressed(global.player_slot[fixed_player], gp_padl))
		|| (gamepad_axis_value(global.player_slot[fixed_player], gp_axislh) < -0.3)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		display_get_gui_width() * 0.5 + player_display_x[fixed_player] - arrow_offset - 16,
		display_get_gui_height() * 0.5 - 16,
		display_get_gui_width() * 0.5 + player_display_x[fixed_player] - arrow_offset + 16,
		display_get_gui_height() * 0.5 + 16))
		&& (mouse_check_button_released(mb_left))
		{
			if (menu != "click_delete_character_no")
			&& (menu != "click_delete_character_no")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			&& (global.character_index[fixed_player - 1] > 0)
			{
				menu_delay = 3;
				menu_specific_joystick_delay[fixed_player] = 30;
				if (global.character_index[fixed_player - 1] > 0)
				{
					global.character_index[fixed_player - 1]--;
					global.character_for_player[fixed_player] = ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])
					xx_delay[fixed_player] = -1;
				}
				else
				{
					global.character_index[fixed_player - 1] = 0;
					global.character_for_player[fixed_player] = ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])
				}

				#region /* Player character select portrait sprite */
				global.skin_for_player[fixed_player] = global.actual_skin_for_player[fixed_player]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
				#endregion /* Player character select portrait sprite END */

				scr_change_character_portrait();
			}
		}
		#endregion /* Player Key Left (change portrait sprites) END */

		#region /* Player Key Right (change portrait sprites) */
		if (keyboard_check_pressed(global.player_[inp.key][fixed_player][1][action.right]))
		|| (keyboard_check_pressed(global.player_[inp.key][fixed_player][2][action.right]))
		|| (gamepad_button_check_pressed(global.player_slot[fixed_player], gp_padr))
		|| (gamepad_axis_value(global.player_slot[fixed_player], gp_axislh) > +0.3)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		display_get_gui_width() * 0.5 + player_display_x[fixed_player] + arrow_offset - 16,
		display_get_gui_height() * 0.5 - 16,
		display_get_gui_width() * 0.5 + player_display_x[fixed_player] + arrow_offset + 16,
		display_get_gui_height() * 0.5 + 16))
		&& (mouse_check_button_released(mb_left))
		{
			if (menu != "click_delete_character_no")
			&& (menu != "click_delete_character_no")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				menu_specific_joystick_delay[fixed_player] = 30;

				if (global.character_index[fixed_player - 1] < ds_list_size(global.all_loaded_characters) - 1)
				{
					global.character_index[fixed_player - 1] = clamp(global.character_index[fixed_player - 1] + 1, 0, ds_list_size(global.all_loaded_characters) - 1);
					global.character_for_player[fixed_player] = ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])
					xx_delay[fixed_player] = +1;
				}

				#region /* Player character select portrait sprite */
				global.skin_for_player[fixed_player] = global.actual_skin_for_player[fixed_player]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
				#endregion /* Player character select portrait sprite END */

				scr_change_character_portrait();
			}
		}
		#endregion /* Player Key Right (change portrait sprites) END */

		#endregion /* Player change portrait when clicking left or right END */

		#region /* Key Left */
		if (global.character_index[fixed_player - 1] > 0 && can_navigate)
		{
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 + player_display_x[fixed_player] - arrow_offset - 16, display_get_gui_height() * 0.5 - 16, display_get_gui_width() * 0.5 + player_display_x[fixed_player] - arrow_offset + 16, display_get_gui_height() * 0.5 + 16))
			{
				player_menu[fixed_player] = "select_character";
			}
		}
		#endregion /* Key Left END */

		#region /* Key Right */
		if (global.character_index[fixed_player - 1] < ds_list_size(global.all_loaded_characters) - 1 && can_navigate)
		{
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 + player_display_x[fixed_player] + arrow_offset - 16, display_get_gui_height() * 0.5 - 16, display_get_gui_width() * 0.5 + player_display_x[fixed_player] + arrow_offset + 16, display_get_gui_height() * 0.5 + 16))
			{
				player_menu[fixed_player] = "select_character";
			}
		}
		#endregion /* Key Right END */

		#endregion /* Player END */

		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/character_config.ini"))
		{
			var selecting_official_character = true;
			enable_edit_character = false;
		}
		else
		{
			var selecting_official_character = false;
		}

		var character_name_y, edit_character_y, copy_character_y, delete_character_y, upload_character_y, open_character_folder_y;

		if (global.enable_open_custom_folder)
		{
			character_name_y = get_window_height - (42 * 6);
			open_character_folder_y = get_window_height - 42;
		}
		else
		{
			character_name_y = get_window_height - (42 * 5);
			open_character_folder_y = -9999;
		}

		if (!selecting_official_character)
		{
			if (global.free_communication_available)
			{
				copy_character_y = enable_copy_character ? get_window_height - (42 * 4) : -9999;
				delete_character_y = get_window_height - (42 * 3);
				upload_character_y = enable_copy_character ? get_window_height - (42 * 2) : -9999;
				edit_character_y = copy_character_y - 42;
			}
			else
			{
				copy_character_y = enable_copy_character ? get_window_height - (42 * 3) : -9999;
				delete_character_y = get_window_height - (42 * 2);
				upload_character_y = -9999;
				edit_character_y = copy_character_y - 42;
			}
		}
		else
		{
			copy_character_y = enable_copy_character ? get_window_height - (42 * 2) : -9999;
			delete_character_y = -9999;
			upload_character_y = -9999;
			edit_character_y = copy_character_y - 42;
		}

		var delete_character_no_y = display_get_gui_height() - (42 * 3);
		var delete_character_yes_y = display_get_gui_height() - (42 * 2);

		#region /* Edit Characters */
		if (enable_edit_character)
		{
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, edit_character_y + 2, display_get_gui_width() * 0.5 - 185 + 371, edit_character_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			&& (ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]) != undefined)
			|| (menu == "click_edit_character")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			&& (ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]) != undefined)
			{
				/* Go to the edit character menu */
				in_edit_character_menu = true;
				menu = "edit_character_load";
				menu_delay = 20;
			}
		}
		if (keyboard_check_pressed(global.player_[inp.key][fixed_player][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][fixed_player][2][action.up]))
		|| (gamepad_button_check_pressed(global.player_slot[fixed_player], gp_padu))
		|| (gamepad_axis_value(global.player_slot[fixed_player], gp_axislv) < -0.3)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		{
			if (menu == "click_edit_character")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				player_menu[fixed_player] = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}
		if (menu == "click_edit_character")
		&& (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			if (enable_copy_character)
			{
				player_menu[fixed_player] = "click_copy_character";
				menu = "click_copy_character";
			}
			else
			if (!selecting_official_character)
			{
				player_menu[fixed_player] = "click_delete_character";
				menu = "click_delete_character";
			}
			else
			{
				player_menu[fixed_player] = "open_folder_copy_character";
				menu = "open_folder_copy_character";
			}
		}
		#endregion /* Edit Characters END */

		#region /* Copy Characters */
		if (enable_copy_character)
		{
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, copy_character_y + 2, display_get_gui_width() * 0.5 - 185 + 371, copy_character_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			&& (ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]) != undefined)
			&& (!max_custom_characters_reached)
			|| (menu == "click_copy_character")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			&& (ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]) != undefined)
			&& (!max_custom_characters_reached)
			{
				menu_delay = 3;
				can_navigate = false;
				load_ok = 0;
				load_specific_folder = 0;
				first_copy_file = "";

				#region /* Copy character files to new character folder */
				if (!directory_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy"))
				{
					directory_create(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy")
				}
				if (!directory_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/data"))
				{
					directory_create(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/data")
				}
				if (!directory_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sound"))
				{
					directory_create(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sound")
				}
				if (!directory_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sprites"))
				{
					directory_create(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sprites")
				}

				#region /* Copy files from selected character to custom character copy */
				if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/character_config.ini"))
				{
					file_copy("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/character_config.ini",
					game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/data/character_config.ini");
				}
				if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/sprite_origin_point.ini"))
				{
					file_copy("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/sprite_origin_point.ini",
					game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/data/sprite_origin_point.ini");
				}
				if (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/character_config.ini"))
				{
					file_copy(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/character_config.ini",
					game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/data/character_config.ini");
				}
				if (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/sprite_origin_point.ini"))
				{
					file_copy(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/sprite_origin_point.ini",
					game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/data/sprite_origin_point.ini");
				}
				#endregion /* Copy files from selected character to custom character copy END */

				#endregion /* Copy character files to new character folder END */

			}
		}
		if (keyboard_check_pressed(global.player_[inp.key][fixed_player][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][fixed_player][2][action.up]))
		|| (gamepad_button_check_pressed(global.player_slot[fixed_player], gp_padu))
		|| (gamepad_axis_value(global.player_slot[fixed_player], gp_axislv) < -0.3)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		{
			if (menu == "click_copy_character")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				if (enable_edit_character)
				{
					player_menu[fixed_player] = "click_edit_character";
					menu = "click_edit_character";
				}
				else
				{
					player_menu[fixed_player] = "back_from_copy_character";
					menu = "back_from_copy_character";
				}
			}
		}
		if (menu == "click_copy_character")
		&& (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			if (!selecting_official_character)
			{
				player_menu[fixed_player] = "click_delete_character";
				menu = "click_delete_character";
			}
			else
			{
				player_menu[fixed_player] = "open_folder_copy_character";
				menu = "open_folder_copy_character";
			}
		}

		scr_character_manage_copy();

		#endregion /* Copy Characters END */

		#region /* Delete Characters */
		if (menu == "click_delete_character")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, delete_character_y + 2, display_get_gui_width() * 0.5 - 185 + 371, delete_character_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		|| (menu == "click_delete_character")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		{
			if (!selecting_official_character)
			{
				menu_delay = 3;
				menu = "click_delete_character_no";
				player_menu[fixed_player] = "click_delete_character_no";
			}
		}
		else
		if (menu == "click_delete_character_no")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, delete_character_no_y + 2, display_get_gui_width() * 0.5 - 185 + 371, delete_character_no_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		|| (menu == "click_delete_character_no")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		|| (menu == "click_delete_character_no")
		&& (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		|| (menu == "click_delete_character_yes")
		&& (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		{
			if (!selecting_official_character)
			{
				menu_delay = 3;
				menu = "click_delete_character";
				player_menu[fixed_player] = "click_delete_character";
			}
		}
		else
		if (menu == "click_delete_character_yes")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, delete_character_yes_y + 2, display_get_gui_width() * 0.5 - 185 + 371, delete_character_yes_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		|| (menu == "click_delete_character_yes")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		{
			if (!selecting_official_character)
			{
				if (directory_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]))))
				{
					directory_destroy(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])));
				}

				#region /* After deleting character, go to previous character, so you don't accidentally go to a undefined character */
				global.character_index[fixed_player - 1] = clamp(global.character_index[fixed_player - 1] - 1, 0, ds_list_size(global.all_loaded_characters) - 1);
				global.character_for_player[fixed_player] = ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])
				xx_delay[fixed_player] = -1;

				/* Update the player sprite */
				scr_delete_sprite_properly(global.sprite_select_player[fixed_player]);
				global.sprite_select_player[fixed_player] = spr_noone;
				scr_set_character_folder(fixed_player, global.skin_for_player[fixed_player]);
				ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
				global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("idle", global.sprite_select_player[fixed_player]);
				global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("stand", global.sprite_select_player[fixed_player]);
				global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[fixed_player]);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				#endregion /* After deleting character, go to previous character, so you don't accidentally go to a undefined character END */

				scr_load_character_initializing();
				menu_delay = 3;
				menu = "load_characters";
				player_menu[fixed_player] = "click_delete_character"; /* Go back to this menu after reloading all characters */
			}
		}

		if (keyboard_check_pressed(global.player_[inp.key][fixed_player][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][fixed_player][2][action.up]))
		|| (gamepad_button_check_pressed(global.player_slot[fixed_player], gp_padu))
		|| (gamepad_axis_value(global.player_slot[fixed_player], gp_axislv) < -0.3)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		{
			if (menu == "click_delete_character")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				if (enable_copy_character)
				{
					player_menu[fixed_player] = "click_copy_character";
					menu = "click_copy_character";
				}
				else
				{
					player_menu[fixed_player] = "back_from_copy_character";
					menu = "back_from_copy_character";
				}
			}
		}
		if (menu == "click_delete_character")
		&& (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			if (!selecting_official_character)
			&& (global.free_communication_available)
			&& (enable_upload_character)
			{
				player_menu[fixed_player] = "click_upload_character";
				menu = "click_upload_character";
			}
			else
			if (global.enable_open_custom_folder)
			{
				player_menu[fixed_player] = "open_folder_copy_character";
				menu = "open_folder_copy_character";
			}
			else
			{
				player_menu[fixed_player] = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}

		if (keyboard_check_pressed(global.player_[inp.key][fixed_player][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][fixed_player][2][action.up]))
		|| (gamepad_button_check_pressed(global.player_slot[fixed_player], gp_padu))
		|| (gamepad_axis_value(global.player_slot[fixed_player], gp_axislv) < -0.3)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		{
			if (menu == "click_delete_character_yes")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				player_menu[fixed_player] = "click_delete_character_no";
				menu = "click_delete_character_no";
			}
		}
		if (menu == "click_delete_character_no")
		&& (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			player_menu[fixed_player] = "click_delete_character_yes";
			menu = "click_delete_character_yes";
		}
		#endregion /* Delete Characters END */

		#region /* Upload Characters */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, upload_character_y + 2, display_get_gui_width() * 0.5 - 185 + 371, upload_character_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		&& (enable_upload_character)
		|| (menu == "click_upload_character")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		&& (enable_upload_character)
		{
			if (!selecting_official_character)
			&& (global.free_communication_available)
			{
				ini_open("save_file/config.ini"); /* Save what character, skin, and name is being used for player 1, before trying to upload a character to the server */
				ini_write_real("config", "character_index_player1", global.character_index[0]);
				ini_write_real("config", "skin_for_player1", global.skin_for_player[1]);
				ini_write_string("config", "player1_name", global.player_name[1]);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

				menu_delay = 3;

				if (global.online_enabled)
				&& (scr_check_network_connection(network_connect_active))
				{
					if (global.switch_logged_in)
					{
						if (global.switch_account_network_service_available) /* Need to make sure that network service is available before going online */
						{
							if (scr_online_token_is_valid() == true)
							{
								if (global.upload_rules_do_not_show_character)
								{
									ini_open(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/character_config.ini");
									if (ini_key_exists("info", "clear_check_character"))
									{
										if (ini_read_real("info", "clear_check_character", false))
										{
											visibility_index = ini_read_real("info", "visibility_index", 0);
											menu = "upload_yes_character";
										}
										else
										{
											menu = "clear_check_character_yes";
										}
									}
									else
									{
										menu = "clear_check_character_yes";
									}
									ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
								}
								else
								{
									caution_online_takes_you_to = "upload_yes_character";
									caution_online_takes_you_back_to = "click_upload_character";
									
									if (content_type != "character")
									{
										global.force_online_list_refresh = true;
										content_type = "character"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
									}
									
									menu = "upload_rules";
									menu_delay = 3;
								}
							}
							else
							{
								menu_delay = 3;
								caution_online_takes_you_to = "upload_yes_character";
								caution_online_takes_you_back_to = "click_upload_character";
								menu = "caution_online_network_error";
							}
						}
						else
						{
							menu_delay = 3;
							caution_online_takes_you_to = "upload_yes_character";
							caution_online_takes_you_back_to = "click_upload_character";
							menu = "caution_online_network_error";
						}
					}
					else
					{
						menu_delay = 3;
						menu = "click_upload_character";
					}
				}
				else
				{
					caution_online_takes_you_to = "upload_yes_character";

					scr_handle_no_network_connection("scr_character_manage_menu_step", "click_upload_character");
				}
			}
		}
		if (keyboard_check_pressed(global.player_[inp.key][fixed_player][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][fixed_player][2][action.up]))
		|| (gamepad_button_check_pressed(global.player_slot[fixed_player], gp_padu))
		|| (gamepad_axis_value(global.player_slot[fixed_player], gp_axislv) < -0.3)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		{
			if (menu == "click_upload_character")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				if (!selecting_official_character)
				{
					player_menu[fixed_player] = "click_delete_character";
					menu = "click_delete_character";
				}
				else
				if (enable_copy_character)
				{
					player_menu[fixed_player] = "click_copy_character";
					menu = "click_copy_character";
				}
			}
		}
		if (menu == "click_upload_character")
		&& (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			if (global.enable_open_custom_folder)
			{
				player_menu[fixed_player] = "open_folder_copy_character";
				menu = "open_folder_copy_character";
			}
			else
			{
				player_menu[fixed_player] = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}
		#endregion /* Upload Characters END */

		#region /* Open Character Folder */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, open_character_folder_y + 2, display_get_gui_width() * 0.5 - 185 + 371, open_character_folder_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		|| (menu == "open_folder_copy_character")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			menu = "open_folder_copy_character";
			player_menu[fixed_player] = "open_folder_copy_character";

			if (directory_exists("characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]))))
			{
				scr_open_folder(game_save_id + "\custom_characters\\");
			}
			else
			if (directory_exists(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]))))
			{
				scr_open_folder(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])));
			}
		}
		if (keyboard_check_pressed(global.player_[inp.key][fixed_player][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][fixed_player][2][action.up]))
		|| (gamepad_button_check_pressed(global.player_slot[fixed_player], gp_padu))
		|| (gamepad_axis_value(global.player_slot[fixed_player], gp_axislv) < -0.3)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		{
			if (menu == "open_folder_copy_character")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				if (!selecting_official_character)
				&& (global.free_communication_available)
				&& (enable_upload_character)
				{
					player_menu[fixed_player] = "click_upload_character";
					menu = "click_upload_character";
				}
				else
				if (!selecting_official_character)
				{
					player_menu[fixed_player] = "click_delete_character";
					menu = "click_delete_character";
				}
				else
				if (enable_copy_character)
				{
					player_menu[fixed_player] = "click_copy_character";
					menu = "click_copy_character";
				}
			}
		}
		if (menu == "open_folder_copy_character")
		&& (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			player_menu[fixed_player] = "back_from_copy_character";
			menu = "back_from_copy_character";
		}
		#endregion /* Open Character Folder END */

		#region /* Back from Copy Characters */
		if (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, 0, 370, 41))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		|| (menu == "back_from_copy_character")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		{
			if (menu != "click_delete_character_no")
			&& (menu != "click_delete_character_yes")
			{
				menu_delay = 3;
				menu = "manage_character";
				player_menu[fixed_player] = "manage_character"; /* When going back to previous menu from "manage character", you have to set this to "manage character" */
				scr_change_character_portrait();
			}
		}
		if (keyboard_check_pressed(global.player_[inp.key][fixed_player][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][fixed_player][2][action.up]))
		|| (gamepad_button_check_pressed(global.player_slot[fixed_player], gp_padu))
		|| (gamepad_axis_value(global.player_slot[fixed_player], gp_axislv) < -0.3)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		{
			if (menu == "back_from_copy_character")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				if (global.enable_open_custom_folder)
				{
					player_menu[fixed_player] = "open_folder_copy_character";
					menu = "open_folder_copy_character";
				}
				else
				if (enable_copy_character)
				{
					player_menu[fixed_player] = "click_copy_character";
					menu = "click_copy_character";
				}
				else
				if (!selecting_official_character)
				{
					player_menu[fixed_player] = "click_delete_character";
					menu = "click_delete_character";
				}
			}
		}
		if (menu == "back_from_copy_character")
		&& (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu_specific_joystick_delay[fixed_player] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			if (enable_edit_character)
			{
				player_menu[fixed_player] = "click_edit_character";
				menu = "click_edit_character";
			}
			else
			if (enable_copy_character)
			{
				player_menu[fixed_player] = "click_copy_character";
				menu = "click_copy_character";
			}
			else
			if (!selecting_official_character)
			{
				player_menu[fixed_player] = "click_delete_character";
				menu = "click_delete_character";
			}
		}
		#endregion /* Back from Copy Characters END */

	}
}
