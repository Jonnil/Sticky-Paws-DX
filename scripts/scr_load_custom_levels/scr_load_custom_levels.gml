function scr_load_custom_levels()
{
	
	#region /* Load Custom Level */
	if (menu == "load_custom_level")
	{
		show_debug_message("[scr_load_custom_levels] Entered load_custom_level branch");
		
		/* Load custom level data */
		file_found = file_find_next();
		show_debug_message("[scr_load_custom_levels] file_find_next returned: " + string(file_found));
		
		if (file_found == "")
		{
			show_debug_message("[scr_load_custom_levels] No more files found, closing search");
			file_find_close(); /* Don't commit the save data on Switch, this is only temporary! */
			
			#region /* Get clear check and level ID information */
			show_debug_message("[scr_load_custom_levels] Verifying thumbnail arrays and variables existence");
			if (variable_instance_exists(self, "thumbnail_level_name")
			&& variable_instance_exists(self, "thumbnail_level_description")
			&& variable_instance_exists(self, "thumbnail_clear_check")
			&& variable_instance_exists(self, "thumbnail_daily_build")
			&& variable_instance_exists(self, "thumbnail_level_id")
			&& variable_instance_exists(self, "thumbnail_level_unlisted")
			&& variable_instance_exists(self, "thumbnail_custom_background")
			&& is_array(thumbnail_level_name) && array_length(thumbnail_level_name) > 0
			&& is_array(thumbnail_level_description) && array_length(thumbnail_level_description) > 0
			&& is_array(thumbnail_clear_check) && array_length(thumbnail_clear_check) > 0
			&& is_array(thumbnail_daily_build) && array_length(thumbnail_daily_build) > 0
			&& is_array(thumbnail_level_id) && array_length(thumbnail_level_id) > 0
			&& is_array(thumbnail_level_unlisted) && array_length(thumbnail_level_unlisted) > 0
			&& is_array(thumbnail_custom_background) && array_length(thumbnail_custom_background) > 0)
			{
				show_debug_message("[scr_load_custom_levels] Thumbnail data arrays valid, reading INI entries...");
				
				for (var i = 1; i < ds_list_size(global.thumbnail_sprite); i += 1)
				{
					var levelName = ds_list_find_value(global.all_loaded_custom_levels, i);
					var iniPath = game_save_id + "custom_levels/" + string(levelName) + "/data/level_information.ini";
					show_debug_message("[scr_load_custom_levels] Opening INI for level " + string(i) + ": " + string(iniPath));
					ini_open(iniPath);
					
					thumbnail_clear_check[i] = ini_read_real("info", "clear_check", false);
					thumbnail_daily_build[i] = ini_read_real("info", "if_daily_build", false);
					thumbnail_level_id[i] = string(ini_read_string("info", "level_id", ""));
					thumbnail_level_unlisted[i] = string(ini_read_real("info", "visibility_index", 0));
					thumbnail_custom_background[i] = ini_read_real("info", "level_has_custom_background", false);
					
					show_debug_message("[scr_load_custom_levels] clear_check[" + string(i) + "]=" + string(thumbnail_clear_check[i]) + ", daily_build[" + string(i) + "]=" + string(thumbnail_daily_build[i]));
					show_debug_message("[scr_load_custom_levels] level_id[" + string(i) + "]=" + string(thumbnail_level_id[i]) + ", visibility[" + string(i) + "]=" + string(thumbnail_level_unlisted[i]) + ", custom_bg[" + string(i) + "]=" + string(thumbnail_custom_background[i]));
					
					/* Read and mask name */
					var rawName = ini_read_string("info", "level_name", "");
					
					if (switch_check_profanity(string(rawName)))
					{
						thumbnail_level_name[i] = string(switch_mask_profanity(rawName));
					}
					else
					{
						thumbnail_level_name[i] = string(rawName);
					}
					
					show_debug_message("[scr_load_custom_levels] thumbnail_level_name[" + string(i) + "]=" + string(thumbnail_level_name[i]) + " (raw: " + string(rawName) + ")");
					
					/* Read and mask description */
					var rawDesc = ini_read_string("info", "level_description", "");
					
					if (switch_check_profanity(string(rawDesc)))
					{
						thumbnail_level_description[i] = string(switch_mask_profanity(rawDesc));
					}
					else
					{
						thumbnail_level_description[i] = string(rawDesc);
					}
					
					show_debug_message("[scr_load_custom_levels] thumbnail_level_description[" + string(i) + "]=" + string(thumbnail_level_description[i]) + " (raw: " + string(rawDesc) + ")");
					
					/* Read and mask username */
					var rawUser = ini_read_string("info", "username", "");
					
					if (switch_check_profanity(string(rawUser)))
					{
						thumbnail_level_username[i] = string(switch_mask_profanity(rawUser));
					}
					else
					{
						thumbnail_level_username[i] = string(rawUser);
					}
					
					show_debug_message("[scr_load_custom_levels] thumbnail_level_username[" + string(i) + "]=" + string(thumbnail_level_username[i]) + " (raw: " + string(rawUser) + ")");
					
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				}
			}
			else
			if (global.go_to_menu_when_going_back_to_title == "level_editor_delete")
			{
				show_debug_message("[scr_load_custom_levels] Fallback: go_to_menu_when_going_back_to_title == level_editor_delete");
				show_level_editor_corner_menu = true;
				select_custom_level_menu_open = false;
				file_found = "";
				menu = "load_custom_level"; /* reload and then return */
				menu_delay = 3;
				show_debug_message("[scr_load_custom_levels] menu set to load_custom_level for reload");
			}
			#endregion /* Get clear check and level ID information END */
			
			if (global.level_name != "")
			{
				global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, global.level_name);
				show_debug_message("[scr_load_custom_levels] select_level_index set to " + string(global.select_level_index));
			}
			
			if (global.go_to_menu_when_going_back_to_title != "online_download_list_load"
			&& !global.automatically_play_downloaded_level)
			{
				select_custom_level_menu_open = true;
				show_debug_message("[scr_load_custom_levels] select_custom_level_menu_open = " + string(select_custom_level_menu_open));
			}
			
			if (global.go_to_menu_when_going_back_to_title != "level_editor_delete"
			&& global.go_to_menu_when_going_back_to_title != "")
			{
				show_debug_message("[scr_load_custom_levels] Jumping to menu: " + string(global.go_to_menu_when_going_back_to_title));
				menu = global.go_to_menu_when_going_back_to_title;
				global.go_to_menu_when_going_back_to_title = "";
				
				#region /* Scroll menu to renamed level */
				if (variable_global_exists("select_level_index"))
				{
					show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] Global 'select_level_index' before update: " + string(global.select_level_index));
					
					if (global.level_name != "")
					&& (global.level_name != undefined)
					{
						global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, global.level_name);
						show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] Updated 'select_level_index': " + string(global.select_level_index) + " - 'global level name': " + string(global.level_name));
					}
					
					if (variable_instance_exists(self, "scroll_to")
					&& variable_instance_exists(self, "row"))
					{
						show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] 'row' exists: " + string(row));
						scroll_to = floor(global.select_level_index / row);
						show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] Computed scroll_to: " + string(scroll_to));
					}
					else
					{
						show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] Warning: 'scroll_to' or 'row' variable missing");
					}
				}
				else
				{
					show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] Error: global.select_level_index does not exist");
				}
				#endregion /* End scroll-to-after-rename */
				
			}
			else
			if (menu_delay == 0)
			{
				/* Go to the custom level select menu */
				show_debug_message("[scr_load_custom_levels] menu_delay is 0, navigating to level_editor_play");
				can_navigate = true;
				file_load_timer = 0;
				file_found = "";
				menu = "level_editor_play";
				menu_delay = 3;
				show_debug_message("[scr_load_custom_levels] menu set to level_editor_play");
				
				if (global.go_to_menu_when_going_back_to_title == "level_editor_delete")
				{
					global.go_to_menu_when_going_back_to_title = "";
				}
				
				#region /* Scroll menu to renamed level */
				if (variable_global_exists("select_level_index"))
				{
					show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] Global 'select_level_index' before update: " + string(global.select_level_index));
					
					if (global.level_name != "")
					&& (global.level_name != undefined)
					{
						global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, global.level_name);
						show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] Updated 'select_level_index': " + string(global.select_level_index) + " - 'global level name': " + string(global.level_name));
					}
					
					if (variable_instance_exists(self, "scroll_to")
					&& variable_instance_exists(self, "row"))
					{
						show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] 'row' exists: " + string(row));
						scroll_to = floor(global.select_level_index / row);
						show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] Computed scroll_to: " + string(scroll_to));
					}
					else
					{
						show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] Warning: 'scroll_to' or 'row' variable missing");
					}
				}
				else
				{
					show_debug_message("[scr_load_custom_levels][scroll_to_after_rename] Error: global.select_level_index does not exist");
				}
				#endregion /* End scroll-to-after-rename */
				
			}
		}
		else
		{
			/* Found a custom level folder */
			show_debug_message("[scr_load_custom_levels] Found folder: " + string(file_found));
			
			if (file_exists(game_save_id + "custom_levels/" + string(file_found) + "/data/level_information.ini"))
			{
				ds_list_add(global.all_loaded_custom_levels, file_found);
				show_debug_message("[scr_load_custom_levels] Added custom level '" + string(file_found) + "'. Total levels: " + string(ds_list_size(global.all_loaded_custom_levels)));
				
				#region /* Update Thumbnail */
				show_debug_message("[scr_load_custom_levels] Loading thumbnail for level '" + string(file_found) + "'");
				
				/* PNG Custom Thumbnail */
				if (file_exists(game_save_id + "custom_levels/" + string(file_found) + "/thumbnail.png"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(game_save_id + "custom_levels/" + string(file_found) + "/thumbnail.png", 0, false, false, 0, 0));
					show_debug_message("[scr_load_custom_levels] Used custom thumbnail.png");
				}
				else
				if (file_exists(game_save_id + "custom_levels/" + string(file_found) + "/automatic_thumbnail.png"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(game_save_id + "custom_levels/" + string(file_found) + "/automatic_thumbnail.png", 0, false, false, 0, 0));
					show_debug_message("[scr_load_custom_levels] Used automatic_thumbnail.png");
				}
				else
				{
					ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing);
					show_debug_message("[scr_load_custom_levels] Used missing thumbnail sprite");
				}
				#endregion /* Update Thumbnail END */
				
			}
			
			file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
			show_debug_message("[scr_load_custom_levels] file_load_timer reset to " + string(file_load_timer));
		}
	}
	#endregion /* Load Custom Level END */
	
}