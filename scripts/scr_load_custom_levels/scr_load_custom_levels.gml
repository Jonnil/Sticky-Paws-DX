function scr_load_custom_levels()
{
	
	#region /* Load Custom Level */
	if (menu == "load_custom_level")
	{
		/* Load custom level data */
		file_found = file_find_next();
		
		if (file_found == "")
		{
			file_find_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			
			#region /* Get clear check and level ID information */
			if (variable_instance_exists(self, "thumbnail_level_name"))
			&& (variable_instance_exists(self, "thumbnail_level_description"))
			&& (variable_instance_exists(self, "thumbnail_clear_check"))
			&& (variable_instance_exists(self, "thumbnail_daily_build"))
			&& (variable_instance_exists(self, "thumbnail_level_id"))
			&& (is_array(thumbnail_level_name))
			&& (array_length(thumbnail_level_name) > 0)
			&& (is_array(thumbnail_level_description))
			&& (array_length(thumbnail_level_description) > 0)
			&& (is_array(thumbnail_clear_check))
			&& (array_length(thumbnail_clear_check) > 0)
			&& (is_array(thumbnail_daily_build))
			&& (array_length(thumbnail_daily_build) > 0)
			&& (is_array(thumbnail_level_id))
			&& (array_length(thumbnail_level_id) > 0)
			//&& (i >= 0)
			//&& (i < array_length(thumbnail_level_name))
			//&& (i < array_length(thumbnail_level_description))
			//&& (i < array_length(thumbnail_clear_check))
			//&& (i < array_length(thumbnail_daily_build))
			//&& (i < array_length(thumbnail_level_id))
			{
				for(i = 1; i < ds_list_size(global.thumbnail_sprite); i += 1)
				{
					ini_open(game_save_id + "custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, i)) + "/data/level_information.ini");
					thumbnail_clear_check[i] = ini_read_string("info", "clear_check", false);
					thumbnail_daily_build[i] = ini_read_string("info", "if_daily_build", false);
					thumbnail_level_id[i] = string(ini_read_string("info", "level_id", ""));
					if (switch_check_profanity(string(ini_read_string("info", "level_name", ""))))
					{
						thumbnail_level_name[i] = string(switch_mask_profanity(ini_read_string("info", "level_name", "")));
					}
					else
					{
						thumbnail_level_name[i] = string(ini_read_string("info", "level_name", ""));
					}
					if (switch_check_profanity(string(ini_read_string("info", "level_description", ""))))
					{
						thumbnail_level_description[i] = string(switch_mask_profanity(ini_read_string("info", "level_description", "")));
					}
					else
					{
						thumbnail_level_description[i] = string(ini_read_string("info", "level_description", ""));
					}
					if (switch_check_profanity(string(ini_read_string("info", "username", ""))))
					{
						thumbnail_level_username[i] = string(switch_mask_profanity(ini_read_string("info", "username", "")));
					}
					else
					{
						thumbnail_level_username[i] = string(ini_read_string("info", "username", ""));
					}
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
			}
			else
			if (global.go_to_menu_when_going_back_to_title == "level_editor_delete")
			{
				show_level_editor_corner_menu = true;
				select_custom_level_menu_open = false;
				i = 0;
				file_found = "";
				menu = "load_custom_level"; /* If all custom levels are not loaded, then reload all custom levels before going to the level select menu */
				menu_delay = 3;
				show_debug_message("menu = load_custom_level; /* If all custom levels are not loaded, then reload all custom levels before going to the level select menu */");
			}
			#endregion /* Get clear check and level ID information END */
			
			if (global.level_name != "")
			{
				global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, global.level_name); /* "Select level index" should be set to where the new custom level is saved */
			}
			
			if (global.go_to_menu_when_going_back_to_title != "online_download_list_load")
			&& (!global.automatically_play_downloaded_level)
			{
				select_custom_level_menu_open = true;
			}
			
			if (global.go_to_menu_when_going_back_to_title != "level_editor_delete")
			&& (global.go_to_menu_when_going_back_to_title != "")
			{
				menu = global.go_to_menu_when_going_back_to_title; /* Go to specific menu if this is assigned to something */
				global.go_to_menu_when_going_back_to_title = "";
			}
			else
			if (menu_delay == 0)
			{
				/* Go to the custom level select menu */
				can_navigate = true;
				file_load_timer = 0;
				i = 0;
				file_found = "";
				menu = "level_editor_play";
				menu_delay = 3;
				show_debug_message("menu = level_editor_play;");
				
				if (global.go_to_menu_when_going_back_to_title == "level_editor_delete")
				{
					global.go_to_menu_when_going_back_to_title = "";
				}
			}
		}
		else
		{
			if (file_exists(game_save_id + "custom_levels/" + file_found + "/data/level_information.ini"))
			{
				ds_list_add(global.all_loaded_custom_levels, file_found);
				
				#region /* Update Thumbnail */
				/* PNG Custom Thumbnail */if (file_exists(game_save_id + "custom_levels/" + file_found + "/thumbnail.png"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(game_save_id + "custom_levels/" + file_found + "/thumbnail.png", 0, false, false, 0, 0));
				}
				else
				/* PNG Automatic Thumbnail */
				if (file_exists(game_save_id + "custom_levels/" + file_found + "/automatic_thumbnail.png"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(game_save_id + "custom_levels/" + file_found + "/automatic_thumbnail.png", 0, false, false, 0, 0));
				}
				else
				{
					ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing);
				}
				#endregion /* Update Thumbnail END */
				
			}
			
			file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
		}
	}
	#endregion /* Load Custom Level END */
	
}