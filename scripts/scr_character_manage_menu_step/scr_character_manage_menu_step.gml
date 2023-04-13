function scr_character_manage_menu_step()
{
	if (menu == "click_copy_character")
	or (menu == "click_delete_character")
	or (menu == "click_delete_character_no")
	or (menu == "click_delete_character_yes")
	or (menu == "click_upload_character")
	or (menu == "open_folder_copy_character")
	or (menu == "back_from_copy_character")
	{
		player1_display_x = 0;
		xx1 = lerp(xx1, player1_display_x, 0.1);
		if (menu_joystick1_delay > 0)
		{
			menu_joystick1_delay -= 1;
		}
		
		#region /* Player 1 */
		
		#region /* Player 1 change portrait when clicking left or right */
		
		#region /* Player 1 Key Left (change portrait sprites) */
		if (keyboard_check_pressed(global.player1_key_left))
		or (keyboard_check_pressed(global.player1_key2_left))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padl))
		or (gamepad_axis_value(global.player1_slot, gp_axislh) < 0)
		and (menu_joystick1_delay <= 0)
		or (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		display_get_gui_width() * 0.5 + player1_display_x - arrow_offset - 16,
		display_get_gui_height() * 0.5 - 16,
		display_get_gui_width() * 0.5 + player1_display_x - arrow_offset + 16,
		display_get_gui_height() * 0.5 + 16))
		and (mouse_check_button_released(mb_left))
		{
			if (menu != "click_delete_character_no")
			and (menu != "click_delete_character_no")
			and (menu_delay == 0)
			and (can_navigate == true)
			and (global.character_index[0] > 0)
			{
				menu_delay = 3;
				menu_joystick1_delay = 30;
				if (global.character_index[0] > 0)
				{
					global.character_index[0] -= 1;
					global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
					xx1 = player1_display_x - 32;
				}
				else
				{
					global.character_index[0] = 0;
					global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
				}
				
				#region /* Player 1 character select portrait sprite */
				global.skin_for_player_1 = global.actual_skin_for_player_1; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
				global.sprite_select_player_1 = spr_noone;
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
				#endregion /* Player 1 character select portrait sprite END */
				
			}
		}
		#endregion /* Player 1 Key Left (change portrait sprites) END */
		
		#region /* Player 1 Key Right (change portrait sprites) */
		if (keyboard_check_pressed(global.player1_key_right))
		or (keyboard_check_pressed(global.player1_key2_right))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padr))
		or (gamepad_axis_value(global.player1_slot, gp_axislh) > 0)
		and (menu_joystick1_delay <= 0)
		or (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		display_get_gui_width() * 0.5 + player1_display_x + arrow_offset - 16,
		display_get_gui_height() * 0.5 - 16,
		display_get_gui_width() * 0.5 + player1_display_x + arrow_offset + 16,
		display_get_gui_height() * 0.5 + 16))
		and (mouse_check_button_released(mb_left))
		{
			if (menu != "click_delete_character_no")
			and (menu != "click_delete_character_no")
			and (menu_delay == 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				menu_joystick1_delay = 30;
				
				if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
				{
					global.character_index[0] = clamp(global.character_index[0] + 1, 0, ds_list_size(global.all_loaded_characters) - 1);
					global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
					xx1 = player1_display_x + 32;
				}
				
				#region /* Player 1 character select portrait sprite */
				global.skin_for_player_1 = global.actual_skin_for_player_1; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
				global.sprite_select_player_1 = spr_noone;
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
				#endregion /* Player 1 character select portrait sprite END */
				
			}
		}
		#endregion /* Player 1 Key Right (change portrait sprites) END */
		
		#endregion /* Player 1 change portrait when clicking left or right END */
		
		#region /* Key Left */
		if (global.character_index[0] > 0)
		and (can_navigate == true)
		{		
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 + player1_display_x - arrow_offset - 16, display_get_gui_height() * 0.5 - 16, display_get_gui_width() * 0.5 + player1_display_x - arrow_offset + 16, display_get_gui_height() * 0.5 + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				player1_menu = "select_character";
			}
		}
		#endregion /* Key Left END */
		
		#region /* Key Right */
		if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
		and (can_navigate == true)
		{
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 + player1_display_x + arrow_offset - 16, display_get_gui_height() * 0.5 - 16, display_get_gui_width() * 0.5 + player1_display_x + arrow_offset + 16, display_get_gui_height() * 0.5 + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				player1_menu = "select_character";
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
		
		if (global.enable_open_custom_folder == true)
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
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		and (ds_list_find_value(global.all_loaded_characters, global.character_index[0]) != undefined)
		or (menu == "click_copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		and (ds_list_find_value(global.all_loaded_characters, global.character_index[0]) != undefined)
		{
			menu_delay = 3;
			can_navigate = false;
			load_ok = 0;
			load_specific_folder = 0;
			first_copy_file = "";
			
			#region /* Copy character files to new character folder */
			
			if (!file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy")
			}
			if (!file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data")
			}
			if (!file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound")
			}
			if (!file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites"))
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
		if (keyboard_check_pressed(global.player1_key_up))
		or (keyboard_check_pressed(global.player1_key2_up))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		and (menu_joystick1_delay <= 0)
		{
			if (menu == "click_copy_character")
			and (menu_delay == 0)
			and (menu_joystick_delay <= 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				can_navigate = true;
				player1_menu = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}
		if (menu == "click_copy_character")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			if (selecting_official_character == false)
			{
				player1_menu = "click_delete_character";
				menu = "click_delete_character";
			}
			else
			{
				player1_menu = "open_folder_copy_character";
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
		and (ds_list_find_value(global.all_loaded_characters, global.character_index[0]) != undefined)
		{
			file_load_timer += 1;
			
			if (file_load_timer > 1)
			and (load_ok == 0)
			{
				if (initialized_copy = false)
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
					load_ok += 1;
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
			and (load_ok == 1)
			{
				file_load_timer = 0;
				load_ok += 1;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			and (load_ok = 2)
			{
				if (initialized_copy = false)
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
					load_ok += 1;
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
			and (load_ok = 3)
			{
				file_load_timer = 0;
				load_ok += 1;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			and (load_ok = 4)
			{
				if (initialized_copy = false)
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
					load_ok += 1;
				}
				else
				{
					directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			and (load_ok == 5)
			{
				file_load_timer = 0;
				load_ok += 1;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			and (load_ok == 6)
			{
				if (initialized_copy = false)
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
					load_ok += 1;
				}
				else
				{
					directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			and (load_ok == 7)
			{
				file_load_timer = 0;
				load_ok += 1;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			and (load_ok == 8)
			{
				if (initialized_copy = false)
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
						load_ok += 1;
					}
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_specific_folder += 1;
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
			and (load_ok = 9)
			{
				file_load_timer = 0;
				load_ok += 1;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			and (load_ok = 10)
			{
				if (initialized_copy = false)
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
						player1_menu = "click_copy_character"; /* Go back to this menu after reloading all characters */
						menu_delay = 3;
						menu_joystick1_delay = 30;
						#endregion /* Copying character is finished! END */
						
					}
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					load_specific_folder += 1;
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
		and (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, delete_character_y + 2, display_get_gui_width() * 0.5 - 185 + 371, delete_character_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "click_delete_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "click_delete_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		{
			if (selecting_official_character == false)
			{
				menu = "click_delete_character_no";
				player1_menu = "click_delete_character_no";
			}
		}
		else
		if (menu == "click_delete_character_no")
		and (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, delete_character_no_y + 2, display_get_gui_width() * 0.5 - 185 + 371, delete_character_no_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "click_delete_character_no")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "click_delete_character_no")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		{
			if (selecting_official_character == false)
			{
				menu = "click_delete_character";
				player1_menu = "click_delete_character";
			}
		}
		else
		if (menu == "click_delete_character_yes")
		and (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, delete_character_yes_y + 2, display_get_gui_width() * 0.5 - 185 + 371, delete_character_yes_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "click_delete_character_yes")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "click_delete_character_yes")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
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
					global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
					xx1 = player1_display_x - 32;
				}
				#endregion /* After deleting character, go to previous character, so you don't accidentally go to a undefined character END */
				
				scr_load_character_initializing();
				menu = "load_characters";
				player1_menu = "click_delete_character"; /* Go back to this menu after reloading all characters */
				menu_delay = 3;
			}
		}
		
		if (keyboard_check_pressed(global.player1_key_up))
		or (keyboard_check_pressed(global.player1_key2_up))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		and (menu_joystick1_delay <= 0)
		{
			if (menu == "click_delete_character")
			and (menu_delay == 0)
			and (menu_joystick_delay <= 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				can_navigate = true;
				player1_menu = "click_copy_character";
				menu = "click_copy_character";
			}
		}
		if (menu == "click_delete_character")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			if (selecting_official_character == false)
			{
				player1_menu = "click_upload_character";
				menu = "click_upload_character";
			}
			else
			if (global.enable_open_custom_folder == true)
			{
				player1_menu = "open_folder_copy_character";
				menu = "open_folder_copy_character";
			}
			else
			{
				player1_menu = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}
		
		if (keyboard_check_pressed(global.player1_key_up))
		or (keyboard_check_pressed(global.player1_key2_up))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		and (menu_joystick1_delay <= 0)
		{
			if (menu == "click_delete_character_yes")
			and (menu_delay == 0)
			and (menu_joystick_delay <= 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				can_navigate = true;
				player1_menu = "click_delete_character_no";
				menu = "click_delete_character_no";
			}
		}
		if (menu == "click_delete_character_no")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			player1_menu = "click_delete_character_yes";
			menu = "click_delete_character_yes";
		}
		#endregion /* Delete Characters END */
		
		#region /* Upload Characters */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, upload_character_y + 2, display_get_gui_width() * 0.5 - 185 + 371, upload_character_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "click_upload_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "click_upload_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		{
			if (selecting_official_character == false)
			{
				menu_delay = 3;
				menu = "upload_yes_character"
			}
		}
		if (keyboard_check_pressed(global.player1_key_up))
		or (keyboard_check_pressed(global.player1_key2_up))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		and (menu_joystick1_delay <= 0)
		{
			if (menu == "click_upload_character")
			and (menu_delay == 0)
			and (menu_joystick_delay <= 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				can_navigate = true;
				if (selecting_official_character == false)
				{
					player1_menu = "click_delete_character";
					menu = "click_delete_character";
				}
				else
				{
					player1_menu = "click_copy_character";
					menu = "click_copy_character";
				}
			}
		}
		if (menu == "click_upload_character")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			if (global.enable_open_custom_folder == true)
			{
				player1_menu = "open_folder_copy_character";
				menu = "open_folder_copy_character";
			}
			else
			{
				player1_menu = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}
		#endregion /* Upload Characters END */
		
		#region /* Open Character Folder */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, open_character_folder_y + 2, display_get_gui_width() * 0.5 - 185 + 371, open_character_folder_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "open_folder_copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "open_folder_copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			menu = "open_folder_copy_character";
			player1_menu = "open_folder_copy_character";
			
			if (directory_exists("characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
			{
				scr_open_folder("characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])))
			}
			else
			if (directory_exists(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
			{
				scr_open_folder(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])))
			}
		}
		if (keyboard_check_pressed(global.player1_key_up))
		or (keyboard_check_pressed(global.player1_key2_up))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		and (menu_joystick1_delay <= 0)
		{
			if (menu == "open_folder_copy_character")
			and (menu_delay == 0)
			and (menu_joystick_delay <= 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				can_navigate = true;
				if (selecting_official_character == false)
				{
					player1_menu = "click_upload_character";
					menu = "click_upload_character";
				}
				else
				{
					player1_menu = "click_copy_character";
					menu = "click_copy_character";
				}
			}
		}
		if (menu == "open_folder_copy_character")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			player1_menu = "back_from_copy_character";
			menu = "back_from_copy_character";
		}
		#endregion /* Open Character Folder END */
		
		#region /* Back from Copy Characters */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, back_y + 2, display_get_gui_width() * 0.5 - 185 + 371, back_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "back_from_copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "back_from_copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (key_b_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		{
			menu = "manage_character";
			player1_menu = "select_character"; /* When going back to previous menu, you have to set this to "select character" */
			menu_delay = 3;
		}
		if (keyboard_check_pressed(global.player1_key_up))
		or (keyboard_check_pressed(global.player1_key2_up))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		and (menu_joystick1_delay <= 0)
		{
			if (menu == "back_from_copy_character")
			and (menu_delay == 0)
			and (menu_joystick_delay <= 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				can_navigate = true;
				if (global.enable_open_custom_folder == true)
				{
					player1_menu = "open_folder_copy_character";
					menu = "open_folder_copy_character";
				}
				else
				{
					player1_menu = "click_copy_character";
					menu = "click_copy_character";
				}
			}
		}
		if (menu == "back_from_copy_character")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			player1_menu = "click_copy_character";
			menu = "click_copy_character";
		}
		#endregion /* Back from Copy Characters END */
		
		if (can_navigate == false) /* When game is loading in assets, display a detailed loading progress, showing exactly what is being loaded in */
		{
			global.loading_spinning_angle -= 10;
		}
	}
}