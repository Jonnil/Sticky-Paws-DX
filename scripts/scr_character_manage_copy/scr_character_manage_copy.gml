function scr_character_manage_copy()
{
	var fixed_player = 1;
	
	#region /* Copy Actual Characters Code */
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]))))
	{
		load_from_where = "characters";
	}
	else
	if (directory_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]))))
	{
		load_from_where = working_directory + "custom_characters";
	}
	
	if (!can_navigate)
	&& (ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]) != undefined)
	{
		file_load_timer ++;
		
		#region /* LOAD OK Create the directories first, so files can be copied into these folders */
		if (file_load_timer > 1)
		&& (load_ok == 0)
		{
			if (!initialized_copy)
			{
				first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sound/*", fa_directory)
				if (directory_exists(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sound/" + string(first_copy_file)))
				{
					directory_create(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sound/" + string(first_copy_file))
				}
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
				if (directory_exists(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sound/" + string(file_found)))
				{
					directory_create(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sound/" + string(file_found))
				}
				
				file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
			}
		}
		#endregion /* LOAD OK Create the directories first, so files can be copied into these folders END */
		
		else
		
		#region /* LOAD OK 1 */
		if (file_load_timer > 1)
		&& (load_ok == 1)
		{
			file_load_timer = 0;
			load_ok ++;
			load_specific_folder = 0;
		}
		#endregion /* LOAD OK 1 END */
		
		else
		
		#region /* LOAD OK 2 - Create the directories first, so files can be copied into these folders */
		if (file_load_timer > 1)
		&& (load_ok == 2)
		{
			if (!initialized_copy)
			{
				first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sprites/*", fa_directory)
				if (directory_exists(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sprites/" + string(first_copy_file)))
				{
					directory_create(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sprites/" + string(first_copy_file))
				}
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
				if (directory_exists(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sprites/" + string(file_found)))
				{
					directory_create(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sprites/" + string(file_found))
				}
				
				file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
			}
		}
		#endregion /* LOAD OK 2 - Create the directories first, so files can be copied into these folders END */
		
		else
		
		#region /* LOAD OK 3 */
		if (file_load_timer > 1)
		&& (load_ok == 3)
		{
			file_load_timer = 0;
			load_ok ++;
			load_specific_folder = 0;
		}
		#endregion /* LOAD OK 3 END */
		
		else
		
		#region /* LOAD OK 4 */
		if (file_load_timer > 1)
		&& (load_ok == 4)
		{
			if (!initialized_copy)
			{
				first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sound/*.ogg", 0)
				file_copy(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sound/" + string(first_copy_file),
				working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sound/" + string(first_copy_file))
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
				file_copy(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sound/" + string(file_found),
				working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sound/" + string(file_found))
				
				file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
			}
		}
		#endregion /* LOAD OK 4 END */
		
		else
		
		#region /* LOAD OK 5 */
		if (file_load_timer > 1)
		&& (load_ok == 5)
		{
			file_load_timer = 0;
			load_ok ++;
			load_specific_folder = 0;
		}
		#endregion /* LOAD OK 5 END */
		
		else
		
		#region /* LOAD OK 6 */
		if (file_load_timer > 1)
		&& (load_ok == 6)
		{
			if (!initialized_copy)
			{
				first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sprites/*.png", 0)
				file_copy(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sprites/" + string(first_copy_file),
				working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sprites/" + string(first_copy_file))
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
				file_copy(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sprites/" + string(file_found),
				working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sprites/" + string(file_found))
				
				file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
			}
		}
		#endregion /* LOAD OK 6 END */
		
		else
		
		#region /* LOAD OK 7 */
		if (file_load_timer > 1)
		&& (load_ok == 7)
		{
			file_load_timer = 0;
			load_ok ++;
			load_specific_folder = 0;
		}
		#endregion /* LOAD OK 7 END */
		
		else
		
		#region /* LOAD OK 8 */
		if (file_load_timer > 1)
		&& (load_ok == 8)
		{
			if (!initialized_copy)
			{
				if (directory_exists(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sound/voicepack" + string(load_specific_folder)))
				{
					first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sound/voicepack" + string(load_specific_folder) + "/*.ogg", 0)
					file_copy(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sound/voicepack" + string(load_specific_folder) + "/" + string(first_copy_file),
					working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sound/voicepack" + string(load_specific_folder) + "/" + string(first_copy_file))
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
				file_copy(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sound/voicepack" + string(load_specific_folder) + "/" + string(file_found),
				working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sound/voicepack" + string(load_specific_folder) + "/" + string(file_found))
				
				file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
			}
		}
		#endregion /* LOAD OK 8 END */
		
		else
		
		#region /* LOAD OK 9 */
		if (file_load_timer > 1)
		&& (load_ok == 9)
		{
			file_load_timer = 0;
			load_ok ++;
			load_specific_folder = 0;
		}
		#endregion /* LOAD OK 9 END */
		
		else
		
		#region /* LOAD OK 10 */
		if (file_load_timer > 1)
		&& (load_ok == 10)
		{
			if (!initialized_copy)
			{
				if (directory_exists(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sprites/skin" + string(load_specific_folder)))
				{
					first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sprites/skin" + string(load_specific_folder) + "/*.png", 0)
					file_copy(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sprites/skin" + string(load_specific_folder) + "/" + string(first_copy_file),
					working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sprites/skin" + string(load_specific_folder) + "/" + string(first_copy_file))
					initialized_copy = true;
				}
				else
				{
					
					#region /* Copying character is finished! */
					copied_character_name = string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy"; /* Get the name of the copied character first */
					
					var file_find_copied_character = string(file_find_first(working_directory + "custom_characters/" + string(copied_character_name), fa_directory))
					if (file_exists(working_directory + "custom_characters/" + file_find_copied_character + "/data/character_config.ini"))
					{
						/* We need to add the coptied character to the ds list, but we also need to sort it correctly */
						repeat(2) /* We have 2 official characters */
						{
							ds_list_delete(global.all_loaded_characters, 0); /* Deletes all official characters from ds list. We delete at position 0 because the order of the list changes as you delete values */
						}
						ds_list_add(global.all_loaded_characters, file_find_copied_character);
						ds_list_sort(global.all_loaded_characters, true); /* After adding the copied character to the "all loaded characters ds list", Sort the characters in alphabetical order */
						ds_list_insert(global.all_loaded_characters, 0, "catlyn"); /* Add official character 2 to the beginning of the ds list */
						ds_list_insert(global.all_loaded_characters, 0, "sticky"); /* Add official character 1 to the beginning of the ds list, this pushes official character 2 forward */
						file_found = ""; /* Reset "file found" so it's empty */
					}
					
					with(instance_create_depth(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 0, obj_score_up))
					{
						above_gui = true;
						score_up = "Copied"; /* Show that you have copied the character */
					}
					
					#region /* After copying character, show the copied character */
					global.character_index[fixed_player - 1] = ds_list_find_index(global.all_loaded_characters, copied_character_name);
					global.character_for_player[fixed_player] = ds_list_find_index(global.all_loaded_characters, global.character_index[fixed_player - 1]);
					xx[fixed_player] = player_display_x[fixed_player] + 32;
					#endregion /* After copying character, show the copied character END */
					
					#region /* Player 1 character select portrait sprite */
					global.skin_for_player[fixed_player] = global.actual_skin_for_player[fixed_player]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
					global.sprite_select_player[fixed_player] = spr_noone;
					scr_set_character_folder(fixed_player, global.skin_for_player[fixed_player], copied_character_name);
					global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("stand", global.sprite_select_player[fixed_player]);
					global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[fixed_player]);
					#endregion /* Player 1 character select portrait sprite END */
					
					menu_delay = 3;
					load_specific_folder = 0; /* Set this variable to 0 before going to the next loading code */
					can_navigate = true;
					file_load_timer = 0;
					load_ok = 0;
					
					menu = "click_copy_character"; /* menu = "load_characters"; */
					player_menu[fixed_player] = "click_copy_character"; /* Go back to this menu after reloading all characters */
					menu_specific_joystick_delay[fixed_player] = 30;
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
				file_copy(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/sprites/skin" + string(load_specific_folder) + "/" + string(file_found),
				working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + " - Copy/sprites/skin" + string(load_specific_folder) + "/" + string(file_found));
				
				file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
			}
		}
		#endregion /* LOAD OK 10 END */
		
	}
	#endregion /* Copy Actual Characters Code END */
	
}