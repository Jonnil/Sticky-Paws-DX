function scr_character_manage_menu_step()
{
	if (menu == "click_copy_character")
	|| (menu == "click_delete_character")
	|| (menu == "click_delete_character_no")
	|| (menu == "click_delete_character_yes")
	|| (menu == "click_upload_character")
	|| (menu == "open_folder_copy_character")
	|| (menu == "back_from_copy_character")
	{
		player_display_x[1] = 0;
		xx[1] = lerp(xx[1], player_display_x[1], 0.1);
		if (menu_specific_joystick_delay[1] > 0)
		{
			menu_specific_joystick_delay[1] --;
		}
		
		#region /* Player 1 */
		
		#region /* Player 1 change portrait when clicking left or right */
		
		#region /* Player 1 Key Left (change portrait sprites) */
		if (keyboard_check_pressed(global.player_[inp.key][1][1][action.left]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.left]))
		|| (gamepad_button_check_pressed(global.player1_slot, gp_padl))
		|| (gamepad_axis_value(global.player1_slot, gp_axislh) < 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		display_get_gui_width() * 0.5 + player_display_x[1] - arrow_offset - 16,
		display_get_gui_height() * 0.5 - 16,
		display_get_gui_width() * 0.5 + player_display_x[1] - arrow_offset + 16,
		display_get_gui_height() * 0.5 + 16))
		&& (mouse_check_button_released(mb_left))
		{
			if (menu != "click_delete_character_no")
			&& (menu != "click_delete_character_no")
			&& (menu_delay == 0)
			&& (can_navigate)
			&& (global.character_index[0] > 0)
			{
				menu_delay = 3;
				menu_specific_joystick_delay[1] = 30;
				if (global.character_index[0] > 0)
				{
					global.character_index[0] --;
					global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
					xx_delay[1] = -1;
				}
				else
				{
					global.character_index[0] = 0;
					global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
				}
				
				#region /* Player 1 character select portrait sprite */
				global.skin_for_player[1] = global.actual_skin_for_player[1]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
				#endregion /* Player 1 character select portrait sprite END */
				
				character_portrait_for_player_update_directory[1] = true;
				alarm[0] = 1;
				alarm[1] = 1;
			}
		}
		#endregion /* Player 1 Key Left (change portrait sprites) END */
		
		#region /* Player 1 Key Right (change portrait sprites) */
		if (keyboard_check_pressed(global.player_[inp.key][1][1][action.right]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.right]))
		|| (gamepad_button_check_pressed(global.player1_slot, gp_padr))
		|| (gamepad_axis_value(global.player1_slot, gp_axislh) > 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		display_get_gui_width() * 0.5 + player_display_x[1] + arrow_offset - 16,
		display_get_gui_height() * 0.5 - 16,
		display_get_gui_width() * 0.5 + player_display_x[1] + arrow_offset + 16,
		display_get_gui_height() * 0.5 + 16))
		&& (mouse_check_button_released(mb_left))
		{
			if (menu != "click_delete_character_no")
			&& (menu != "click_delete_character_no")
			&& (menu_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				menu_specific_joystick_delay[1] = 30;
				
				if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
				{
					global.character_index[0] = clamp(global.character_index[0] + 1, 0, ds_list_size(global.all_loaded_characters) - 1);
					global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
					xx_delay[1] = +1;
				}
				
				#region /* Player 1 character select portrait sprite */
				global.skin_for_player[1] = global.actual_skin_for_player[1]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
				#endregion /* Player 1 character select portrait sprite END */
				
				character_portrait_for_player_update_directory[1] = true;
				alarm[0] = 1;
				alarm[1] = 1;
			}
		}
		#endregion /* Player 1 Key Right (change portrait sprites) END */
		
		#endregion /* Player 1 change portrait when clicking left or right END */
		
		#region /* Key Left */
		if (global.character_index[0] > 0)
		&& (can_navigate)
		{		
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 + player_display_x[1] - arrow_offset - 16, display_get_gui_height() * 0.5 - 16, display_get_gui_width() * 0.5 + player_display_x[1] - arrow_offset + 16, display_get_gui_height() * 0.5 + 16))
			{
				player_menu[1] = "select_character";
			}
		}
		#endregion /* Key Left END */
		
		#region /* Key Right */
		if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
		&& (can_navigate)
		{
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 + player_display_x[1] + arrow_offset - 16, display_get_gui_height() * 0.5 - 16, display_get_gui_width() * 0.5 + player_display_x[1] + arrow_offset + 16, display_get_gui_height() * 0.5 + 16))
			{
				player_menu[1] = "select_character";
			}
		}
		#endregion /* Key Right END */
		
		#endregion /* Player 1 END */
		
		if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
		{
			var selecting_official_character = true;
		}
		else
		{
			var selecting_official_character = false;
		}
		
		if (global.enable_open_custom_folder)
		{
			if (selecting_official_character == false)
			{
				var copy_character_y = display_get_gui_height() - (42 * 5);
				var delete_character_y = display_get_gui_height() - (42 * 4);
				var upload_character_y = display_get_gui_height() - (42 * 3);
			}
			else
			{
				var copy_character_y = display_get_gui_height() - (42 * 3);
				var delete_character_y = -9999;
				var upload_character_y = -9999;
			}
			var open_character_folder_y = display_get_gui_height() - 42 - 42;
		}
		else
		{
			if (selecting_official_character == false)
			{
				var copy_character_y = display_get_gui_height() - (42 * 4);
				var delete_character_y = display_get_gui_height() - (42 * 3);
				var upload_character_y = display_get_gui_height() - (42 * 2);
			}
			else
			{
				var copy_character_y = display_get_gui_height() - (42 * 2);
				var delete_character_y = -9999;
				var upload_character_y = -9999;
			}
			var open_character_folder_y = -9999;
		}
		var back_y = display_get_gui_height() - 42;
		var delete_character_no_y = display_get_gui_height() - (42 * 3);
		var delete_character_yes_y = display_get_gui_height() - (42 * 2);
		
		#region /* Copy Characters */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, copy_character_y + 2, display_get_gui_width() * 0.5 - 185 + 371, copy_character_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		&& (can_navigate)
		&& (ds_list_find_value(global.all_loaded_characters, global.character_index[0]) != undefined)
		|| (menu == "click_copy_character")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		&& (ds_list_find_value(global.all_loaded_characters, global.character_index[0]) != undefined)
		{
			menu_delay = 3;
			can_navigate = false;
			load_ok = 0;
			load_specific_folder = 0;
			first_copy_file = "";
			
			#region /* Copy character files to new character folder */
			
			if (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy")
			}
			if (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data")
			}
			if (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound")
			}
			if (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites")
			}
			
			#region /* Copy files from selected character to custom character copy */
			if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini"))
			{
				file_copy(
				"characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini",
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data/character_config.ini");
			}
			if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini"))
			{
				file_copy(
				"characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini",
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data/sprite_origin_point.ini");
			}
			if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini"))
			{
				file_copy(
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini",
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data/character_config.ini");
			}
			if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini"))
			{
				file_copy(
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini",
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data/sprite_origin_point.ini");
			}
			#endregion /* Copy files from selected character to custom character copy END */
			
			#endregion /* Copy character files to new character folder END */
			
		}
		if (keyboard_check_pressed(global.player_[inp.key][1][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.up]))
		|| (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		|| (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		{
			if (menu == "click_copy_character")
			&& (menu_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				player_menu[1] = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}
		if (menu == "click_copy_character")
		&& (key_down)
		&& (menu_delay == 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			if (selecting_official_character == false)
			{
				player_menu[1] = "click_delete_character";
				menu = "click_delete_character";
			}
			else
			{
				player_menu[1] = "open_folder_copy_character";
				menu = "open_folder_copy_character";
			}
		}
		
		#region /* Copy Actual Characters Code */
		if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
		{
			load_from_where = "characters";
		}
		else
		if (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
		{
			load_from_where = working_directory + "/custom_characters";
		}
		
		if (can_navigate == false)
		&& (ds_list_find_value(global.all_loaded_characters, global.character_index[0]) != undefined)
		{
			file_load_timer ++;
			
			if (file_load_timer > 1)
			&& (load_ok == 0)
			{
				if (initialized_copy == false)
				{
					first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/*.ogg", 0)
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/" + string(first_copy_file),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/" + string(first_copy_file))
					initialized_copy = true;
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_ok ++;
				}
				else
				{
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/" + string(file_found),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			&& (load_ok == 1)
			{
				file_load_timer = 0;
				load_ok ++;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			&& (load_ok = 2)
			{
				if (initialized_copy == false)
				{
					first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/*.png", 0)
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/" + string(first_copy_file),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/" + string(first_copy_file))
					initialized_copy = true;
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_ok ++;
				}
				else
				{
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/" + string(file_found),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			&& (load_ok = 3)
			{
				file_load_timer = 0;
				load_ok ++;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			&& (load_ok = 4)
			{
				if (initialized_copy == false)
				{
					first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/*", fa_directory)
					directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/" + string(first_copy_file))
					initialized_copy = true;
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_ok ++;
				}
				else
				{
					directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			&& (load_ok == 5)
			{
				file_load_timer = 0;
				load_ok ++;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			&& (load_ok == 6)
			{
				if (initialized_copy == false)
				{
					first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/*", fa_directory)
					directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/" + string(first_copy_file))
					initialized_copy = true;
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_ok ++;
				}
				else
				{
					directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			&& (load_ok == 7)
			{
				file_load_timer = 0;
				load_ok ++;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			&& (load_ok == 8)
			{
				if (initialized_copy == false)
				{
					if (directory_exists(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(load_specific_folder)))
					{
						first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(load_specific_folder) + "/*.ogg", 0)
						file_copy(
						string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(load_specific_folder) + "/" + string(first_copy_file),
						working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/voicepack" + string(load_specific_folder) + "/" + string(first_copy_file))
						initialized_copy = true;
					}
					else
					{
						load_specific_folder = 0; /* Set this variable to 0 before going to the next loading code */
						file_load_timer = 0;
						load_ok ++;
					}
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_specific_folder ++;
				}
				else
				{
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(load_specific_folder) + "/" + string(file_found),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/voicepack" + string(load_specific_folder) + "/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			&& (load_ok = 9)
			{
				file_load_timer = 0;
				load_ok ++;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			&& (load_ok = 10)
			{
				if (initialized_copy == false)
				{
					if (directory_exists(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(load_specific_folder)))
					{
						first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(load_specific_folder) + "/*.png", 0)
						file_copy(
						string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(load_specific_folder) + "/" + string(first_copy_file),
						working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/skin" + string(load_specific_folder) + "/" + string(first_copy_file))
						initialized_copy = true;
					}
					else
					{
						
						#region /* Copying character is finished! */
						load_specific_folder = 0; /* Set this variable to 0 before going to the next loading code */
						can_navigate = true;
						file_load_timer = 0;
						load_ok = 0;
						
						scr_load_character_initializing();
						menu = "load_characters";
						player_menu[1] = "click_copy_character"; /* Go back to this menu after reloading all characters */
						menu_delay = 3;
						menu_specific_joystick_delay[1] = 30;
						#endregion /* Copying character is finished! END */
						
					}
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					load_specific_folder ++;
					initialized_copy = false;
					file_load_timer = 0;
				}
				else
				{
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(load_specific_folder) + "/" + string(file_found),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/skin" + string(load_specific_folder) + "/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
		}
		#endregion /* Copy Actual Characters Code END */
		
		#endregion /* Copy Characters END */
		
		#region /* Delete Characters */
		if (menu == "click_delete_character")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, delete_character_y + 2, display_get_gui_width() * 0.5 - 185 + 371, delete_character_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (menu == "click_delete_character")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (player_menu[1] = "click_delete_character")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		{
			if (selecting_official_character == false)
			{
				menu = "click_delete_character_no";
				player_menu[1] = "click_delete_character_no";
			}
		}
		else
		if (menu == "click_delete_character_no")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, delete_character_no_y + 2, display_get_gui_width() * 0.5 - 185 + 371, delete_character_no_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (menu == "click_delete_character_no")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (player_menu[1] = "click_delete_character_no")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		{
			if (selecting_official_character == false)
			{
				menu = "click_delete_character";
				player_menu[1] = "click_delete_character";
			}
		}
		else
		if (menu == "click_delete_character_yes")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, delete_character_yes_y + 2, display_get_gui_width() * 0.5 - 185 + 371, delete_character_yes_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (menu == "click_delete_character_yes")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (player_menu[1] = "click_delete_character_yes")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		{
			if (selecting_official_character == false)
			{
				if (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
				{
					directory_destroy(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])));
				}
				
				#region /* After deleting character, go to previous character, so you don't accidentally go to a undefined character */
				if (global.character_index[0] > 0)
				{
					global.character_index[0] = clamp(global.character_index[0] - 1, 0, ds_list_size(global.all_loaded_characters) - 1);
					global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
					xx_delay[1] = -1;
				}
				#endregion /* After deleting character, go to previous character, so you don't accidentally go to a undefined character END */
				
				scr_load_character_initializing();
				menu = "load_characters";
				player_menu[1] = "click_delete_character"; /* Go back to this menu after reloading all characters */
				menu_delay = 3;
			}
		}
		
		if (keyboard_check_pressed(global.player_[inp.key][1][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.up]))
		|| (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		|| (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		{
			if (menu == "click_delete_character")
			&& (menu_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				player_menu[1] = "click_copy_character";
				menu = "click_copy_character";
			}
		}
		if (menu == "click_delete_character")
		&& (key_down)
		&& (menu_delay == 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			if (selecting_official_character == false)
			{
				player_menu[1] = "click_upload_character";
				menu = "click_upload_character";
			}
			else
			if (global.enable_open_custom_folder)
			{
				player_menu[1] = "open_folder_copy_character";
				menu = "open_folder_copy_character";
			}
			else
			{
				player_menu[1] = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}
		
		if (keyboard_check_pressed(global.player_[inp.key][1][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.up]))
		|| (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		|| (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		{
			if (menu == "click_delete_character_yes")
			&& (menu_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				player_menu[1] = "click_delete_character_no";
				menu = "click_delete_character_no";
			}
		}
		if (menu == "click_delete_character_no")
		&& (key_down)
		&& (menu_delay == 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			player_menu[1] = "click_delete_character_yes";
			menu = "click_delete_character_yes";
		}
		#endregion /* Delete Characters END */
		
		#region /* Upload Characters */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, upload_character_y + 2, display_get_gui_width() * 0.5 - 185 + 371, upload_character_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (menu == "click_upload_character")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		{
			if (selecting_official_character == false)
			{
				menu_delay = 3;
				menu = "upload_yes_character"
			}
		}
		if (keyboard_check_pressed(global.player_[inp.key][1][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.up]))
		|| (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		|| (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		{
			if (menu == "click_upload_character")
			&& (menu_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				if (selecting_official_character == false)
				{
					player_menu[1] = "click_delete_character";
					menu = "click_delete_character";
				}
				else
				{
					player_menu[1] = "click_copy_character";
					menu = "click_copy_character";
				}
			}
		}
		if (menu == "click_upload_character")
		&& (key_down)
		&& (menu_delay == 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			if (global.enable_open_custom_folder)
			{
				player_menu[1] = "open_folder_copy_character";
				menu = "open_folder_copy_character";
			}
			else
			{
				player_menu[1] = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}
		#endregion /* Upload Characters END */
		
		#region /* Open Character Folder */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, open_character_folder_y + 2, display_get_gui_width() * 0.5 - 185 + 371, open_character_folder_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (menu == "open_folder_copy_character")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (player_menu[1] = "open_folder_copy_character")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			menu = "open_folder_copy_character";
			player_menu[1] = "open_folder_copy_character";
			
			if (directory_exists("characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
			{
				scr_open_folder(game_save_id + "\custom_characters\\");
			}
			else
			if (directory_exists(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
			{
				scr_open_folder(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])));
			}
		}
		if (keyboard_check_pressed(global.player_[inp.key][1][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.up]))
		|| (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		|| (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		{
			if (menu == "open_folder_copy_character")
			&& (menu_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				if (selecting_official_character == false)
				{
					player_menu[1] = "click_upload_character";
					menu = "click_upload_character";
				}
				else
				{
					player_menu[1] = "click_copy_character";
					menu = "click_copy_character";
				}
			}
		}
		if (menu == "open_folder_copy_character")
		&& (key_down)
		&& (menu_delay == 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			player_menu[1] = "back_from_copy_character";
			menu = "back_from_copy_character";
		}
		#endregion /* Open Character Folder END */
		
		#region /* Back from Copy Characters */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, back_y + 2, display_get_gui_width() * 0.5 - 185 + 371, back_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (menu == "back_from_copy_character")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (player_menu[1] = "back_from_copy_character")
		&& (key_a_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		|| (key_b_pressed)
		&& (menu_delay == 0)
		&& (can_navigate)
		{
			character_portrait_for_player_update_directory[1] = true;
			alarm[0] = 1;
			menu = "manage_character";
			player_menu[1] = "manage_character"; /* When going back to previous menu from "manage character", you have to set this to "manage character" */
			menu_delay = 3;
		}
		if (keyboard_check_pressed(global.player_[inp.key][1][1][action.up]))
		|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.up]))
		|| (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		|| (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		{
			if (menu == "back_from_copy_character")
			&& (menu_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				can_navigate = true;
				if (global.enable_open_custom_folder)
				{
					player_menu[1] = "open_folder_copy_character";
					menu = "open_folder_copy_character";
				}
				else
				{
					player_menu[1] = "click_copy_character";
					menu = "click_copy_character";
				}
			}
		}
		if (menu == "back_from_copy_character")
		&& (key_down)
		&& (menu_delay == 0)
		&& (menu_specific_joystick_delay[1] <= 0)
		&& (can_navigate)
		{
			menu_delay = 3;
			can_navigate = true;
			player_menu[1] = "click_copy_character";
			menu = "click_copy_character";
		}
		#endregion /* Back from Copy Characters END */
		
		if (can_navigate == false) /* When game is loading in assets, display a detailed loading progress, showing exactly what is being loaded in */
		{
			global.loading_spinning_angle -= 10;
		}
	}
}