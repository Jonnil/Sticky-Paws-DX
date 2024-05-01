function scr_draw_online_download_list()
{
	var download_online_x = display_get_gui_width() * 0.5 - 300;
	var menu_cursor_y_position_start = 114 + (300 * (global.selected_online_download_index - 1));
	var menu_y_offset_real_start = -(170 * (global.selected_online_download_index - 1));
	
	if (menu == "online_download_list_load")
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* Get Online Download List */
		/* Don't ever change "content type" in this script, so Async - HTTP Event is running correctly */
		in_online_download_list_load_menu = true; /* Let Async - HTTP Event know that we want to load a onload download list */
		
		finished_level = undefined;
		zero_defeats_level = undefined;
		liked_content = undefined;
		
		/* Create DS Map to hold the HTTP Header info */
		map = ds_map_create();
		
		/* Add to the header DS Map */
		ds_map_add(map, "Host", global.base_url);
		ds_map_add(map, "Content-Type", "application/json");
		ds_map_add(map, "User-Agent", "gmdownloader");
		ds_map_add(map, "X-API-Key", global.api_key);
		
		/* Send the HTTP GET request to the /level endpoint */
		global.http_request_id = http_request("https://" + global.base_url + "/" + string(content_type) + "s", "GET", map, "");
		ds_map_destroy(map);
		#endregion /* Get Online Download List END */
		
		menu = "download_online_" + string(global.selected_online_download_index);
		
		/* Put the scroll position on the selected thumbnail immediately */
		menu_cursor_y_position = menu_cursor_y_position_start;
		menu_y_offset_real = menu_y_offset_real_start;
		menu_y_offset = menu_y_offset_real_start;
		
		automatically_search_for_id = false;
		in_online_download_list_menu = true;
		menu_delay = 3;
		
		scr_draw_loading(1,,,"Loading from server"); /* Draw loading screen when loading download list END */
		
		if (!os_is_network_connected())
		{
			if (content_type == "character")
			{
				in_online_download_list_menu = false;
				menu = "no_internet_character";
			}
			else
			if (content_type == "level")
			{
				in_online_download_list_menu = false;
				select_custom_level_menu_open = true;
				show_level_editor_corner_menu = false;
				menu = "no_internet_level";
			}
		}
	}
	else
	if (in_online_download_list_menu)
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* If there is no data, then apply the retrieved download data to it */
		if (data == undefined)
		&& (in_online_download_list_menu)
		{
			scr_draw_loading(1); /* Draw loading screen when loading download list */
			
			#region /* If there is an online download list loaded, interpret that as a struct using "json parse" */
			if (global.online_download_list != "")
			&& (global.online_download_list != "HTTP request exception")
			&& (global.online_download_list != "Unauthorized")
			{
				try
				{
					data = json_parse(global.online_download_list); /* When there is data here, then go to the online downloads menu */
				}
			}
			else
			if (global.online_download_list == "HTTP request exception")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42 + 42, l10n_text("HTTP request exception"), global.default_text_size, c_white, c_black, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42 + 42, l10n_text("HTTP request exception"), global.default_text_size, c_white, c_red, scr_wave(0, 1, 1, 0));
			}
			else
			if (global.online_download_list == "Unauthorized")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42 + 42, l10n_text("Unauthorized"), global.default_text_size, c_white, c_black, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42 + 42, l10n_text("Unauthorized"), global.default_text_size, c_white, c_red, scr_wave(0, 1, 1, 0));
			}
			#endregion /* If there is an online download list loaded, interpret that as a struct using "json parse" END */
			
		}
		#endregion /* If there is no data, then apply the retrieved download data to it END */
		
		#region /* If there is data, then show an online downloads menu */
		if (data != undefined)
		&& (menu != "search_id_ok")
		{
			scr_scroll_menu(300, false);
			
			/* Check if it's an array */
			if (is_array(data))
			{
				
				#region /* Thumbnail for each level / character */
				/* Get the number of items in the JSON array */
				var num_items = array_length(data);
				
				if (!is_array(finished_level))
				{
					finished_level = array_create(num_items, undefined); /* Create finished level array */
				}
				if (!is_array(zero_defeats_level))
				{
					zero_defeats_level = array_create(num_items, undefined); /* Create zero defeats level array */
				}
				if (!is_array(liked_content))
				{
					liked_content = array_create(num_items, undefined); /* Create liked content array */
				}
				
				var online_download_index = 0;
				for(var i = 0; i < num_items; i++;)
				{
					online_download_index ++;
					var download_online_y = 80 + (300 * i); /* The distance between each thumbnail */
					
					if (i == num_items - 1)
					{
						draw_line_width_color(30, menu_y_offset + download_online_y + 300, display_get_gui_width() - 30, menu_y_offset + download_online_y + 300, 7, c_black, c_black);
						draw_line_width_color(32, menu_y_offset + download_online_y + 300, display_get_gui_width() - 32, menu_y_offset + download_online_y + 300, 3, c_white, c_white);
					}
					
					if (menu == "download_online_" + string(online_download_index))
					{
						var custom_level_select_arrows_moving = scr_wave(10, 0, 1, 0);
						var top_left_of_thumbnail_x = download_online_x + 100 - 4;
						top_left_of_thumbnail_y = download_online_y - 4;
						var bottom_right_of_thumbnail_x = download_online_x + 484 + 4;
						var bottom_right_of_thumbnail_y = download_online_y + menu_y_offset + 216 + 4;
						var top_left_x_offset = top_left_of_thumbnail_x - custom_level_select_arrows_moving;
						var top_left_y_offset = top_left_of_thumbnail_y + menu_y_offset - custom_level_select_arrows_moving;
						var bottom_right_x_offset = bottom_right_of_thumbnail_x + custom_level_select_arrows_moving;
						var bottom_right_y_offset = bottom_right_of_thumbnail_y + custom_level_select_arrows_moving;
						var triangle_size = 32 - custom_level_select_arrows_moving;
						var thumbnail_select_blinking = scr_wave(1, 0, 2, 0);
						
						/* Put a white highlight underneath selected level */
						draw_set_alpha(scr_wave(0.1, 0.2, 3, 0));
						draw_roundrect_color_ext(top_left_of_thumbnail_x - 16, top_left_of_thumbnail_y + menu_y_offset - 16, bottom_right_of_thumbnail_x + 16, bottom_right_of_thumbnail_y + 64, 50, 50, c_white, c_white, false);
						
						/* Red and yellow rectangle around the selected thumbnail */
						draw_set_alpha(1);
						draw_rectangle_color(top_left_of_thumbnail_x, top_left_of_thumbnail_y + menu_y_offset, bottom_right_of_thumbnail_x, bottom_right_of_thumbnail_y, c_red, c_red, c_red, c_red, false);
						draw_set_alpha(thumbnail_select_blinking);
						draw_rectangle_color(top_left_of_thumbnail_x, top_left_of_thumbnail_y + menu_y_offset, bottom_right_of_thumbnail_x, bottom_right_of_thumbnail_y, c_yellow, c_yellow, c_yellow, c_yellow, false);
						draw_set_alpha(1);
					}
					
					/* Draw a placeholder thumbnail if the real thumbnail is not loaded */ draw_sprite_ext(spr_thumbnail_missing, 0, download_online_x + 100, download_online_y + menu_y_offset, 1, 1, 0, c_white, 1);
					
					#region /* Draw 4 red small triangles above the level thumbnail to be even more certain what level you are selecting */
					if (menu == "download_online_" + string(online_download_index))
					{
						/* Draw red triangles */
						draw_triangle_color(top_left_x_offset, top_left_y_offset, top_left_x_offset + triangle_size, top_left_y_offset,
							top_left_x_offset, top_left_y_offset + triangle_size, c_red, c_red, c_red, false);
						
						draw_triangle_color(bottom_right_x_offset, bottom_right_y_offset, bottom_right_x_offset - triangle_size, bottom_right_y_offset,
							bottom_right_x_offset, bottom_right_y_offset - triangle_size, c_red, c_red, c_red, false);
						
						draw_triangle_color(bottom_right_x_offset, top_left_y_offset, bottom_right_x_offset - triangle_size, top_left_y_offset,
							bottom_right_x_offset, top_left_y_offset + triangle_size, c_red, c_red, c_red, false);
						
						draw_triangle_color(top_left_x_offset, bottom_right_y_offset, top_left_x_offset + triangle_size, bottom_right_y_offset,
							top_left_x_offset, bottom_right_y_offset - triangle_size, c_red, c_red, c_red, false);
						
						draw_set_alpha(thumbnail_select_blinking);
						
						/* Draw yellow triangles */
						draw_triangle_color(top_left_x_offset, top_left_y_offset, top_left_x_offset + triangle_size, top_left_y_offset,
							top_left_x_offset, top_left_y_offset + triangle_size, c_yellow, c_yellow, c_yellow, false);
						
						draw_triangle_color(bottom_right_x_offset, bottom_right_y_offset, bottom_right_x_offset - triangle_size, bottom_right_y_offset,
							bottom_right_x_offset, bottom_right_y_offset - triangle_size, c_yellow, c_yellow, c_yellow, false);
						
						draw_triangle_color(bottom_right_x_offset, top_left_y_offset, bottom_right_x_offset - triangle_size, top_left_y_offset,
							bottom_right_x_offset, top_left_y_offset + triangle_size, c_yellow, c_yellow, c_yellow, false);
						
						draw_triangle_color(top_left_x_offset, bottom_right_y_offset, top_left_x_offset + triangle_size, bottom_right_y_offset,
							top_left_x_offset, bottom_right_y_offset - triangle_size, c_yellow, c_yellow, c_yellow, false);
						
						draw_set_alpha(1);
					}
					#endregion /* Draw 4 red small triangles above the level thumbnail to be even more certain what level you are selecting END */
					
					if (global.controls_used_for_navigation == "mouse")
					&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), download_online_x + 100 - 16, download_online_y + menu_y_offset - 16, download_online_x + 484 + 16, download_online_y + menu_y_offset + 216 + 62))
					&& (is_array(data))
					&& (array_length(data) > 0)
					{
						if (menu != "download_online_" + string(online_download_index))
						{
							if (menu != "download_online_back"
							&& menu != "download_online_search_id"
							&& menu != "online_list_can_load_custom_level_assets")
							{
								scr_delete_sprite_properly(spr_download_list_thumbnail);spr_download_list_thumbnail = noone; /* Delete the previous thumbnail sprite so you can load in a new one */
							}
							menu = "download_online_" + string(online_download_index);
						}
					}
					
					/* Fetch the "name" and "time_created" properties from the JSON object */
					var item = data[i];
					var draw_download_id = item.name;
					draw_download_id = string_replace(draw_download_id, string(content_type) + "s/", "");
					draw_download_id = string_replace(draw_download_id, ".zip", "");
					var draw_download_time = string_replace(item.time_created, "T", " ");
					draw_download_time = string_replace(draw_download_time, "Z", "");
					
					#region /* If you are hovering on thumbnail download button */
					if (menu == "download_online_" + string(online_download_index))
					{
						currently_selected_id = draw_download_id;
						
						if (global.controls_used_for_navigation != "mouse")
						{
							menu_cursor_y_position = 64 + download_online_y;
						}
						var selected_download_c_menu_fill = c_lime;
						/* Highlight the text in lime green so the player knows they are selecting this download */
						global.selected_online_download_index = online_download_index;
						
						#region /* Download selected file when pressing A */
						if (key_a_pressed)
						|| (mouse_check_button_released(mb_left))
						&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), download_online_x + 100, download_online_y + menu_y_offset, download_online_x + 484, download_online_y + menu_y_offset + 216))
						{
							if (menu_delay == 0 && menu_joystick_delay == 0)
							{
								
								#region /* Go to download menu */
								global.automatically_play_downloaded_level = false; /* You will be taken to a menu showing you different options what you want to do with the downloaded file */
								global.use_temp_or_working = game_save_id; /* When downloading levels from online and temporarily playing the level, you have to use the "temp directory", but normally you need to use the "working directory" */
								global.search_id = string_upper(draw_download_id);
								keyboard_string = string_upper(draw_download_id);
								search_id = string_upper(draw_download_id); /* Then need to set search ID */
								automatically_search_for_id = true; /* Don't set this variable to false yet, it's used in "scr_draw_menu_search_id" to automatically enter the search ID. We need to do the HTTP Request in that script */
								in_online_download_list_menu = false; /* We are not supposed to show the online download list menu when going to search ID menu */
								
								/* Set the correct thumbnail sprite variable */
								scr_delete_sprite_properly(downloaded_thumbnail_sprite);
								downloaded_thumbnail_sprite = noone;
								downloaded_thumbnail_sprite = spr_download_list_thumbnail;
								
								menu = "search_id_ok";
								#endregion /* Go to download menu END */
								
							}
						}
						#endregion /* Download selected file when pressing A END */
						
					}
					#endregion /* If you are hovering on thumbnail download button END */
					
					if (menu != "download_online_" + string(online_download_index))
					{
						var selected_download_c_menu_fill = c_gray;
					}
					
					/* Write the list index to the left of download button */
					draw_set_halign(fa_right);
					scr_draw_text_outlined(download_online_x + 70, 110 + download_online_y + menu_y_offset, string(online_download_index), global.default_text_size * 0.75, c_menu_outline, selected_download_c_menu_fill, 0.5);
					
					/* Write the ID */ draw_set_halign(fa_left);
					scr_draw_text_outlined(download_online_x + 108, 20 + download_online_y + menu_y_offset, string(draw_download_id), global.default_text_size * 0.75, c_menu_outline, selected_download_c_menu_fill, 1);
					
					#region /* Let player know when you have already beaten a downloaded level */
					if (content_type == "level")
					{
						if (is_array(finished_level))
						{
							if (finished_level[i] == undefined)
							{
								if (file_exists(game_save_id + "save_file/custom_level_save.ini"))
								{
									ini_open(game_save_id + "save_file/custom_level_save.ini");
									
									/* See if the online level has already been beaten by you or not */
									if (ini_key_exists("finished_downloaded_level", draw_download_id))
									{
										finished_level[i] = ini_read_real("finished_downloaded_level", draw_download_id, 0);
									}
									else
									{
										finished_level[i] = 0; /* Overwrite so it's 0 instead of undefined, so you don't check this level ID again */
									}
									
									/* See if the online level has been completed with zero defeats or zero hits */
									if (ini_key_exists("zero_defeats_downloaded_level", draw_download_id))
									{
										zero_defeats_level[i] = ini_read_real("zero_defeats_downloaded_level", draw_download_id, 0);
									}
									else
									{
										zero_defeats_level[i] = 0; /* Overwrite so it's 0 instead of undefined, so you don't check this level ID again */
									}
									
									ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
								}
								else
								{
									finished_level[i] = 0; /* Overwrite so it's 0 instead of undefined, so you don't check this level ID again */
									zero_defeats_level[i] = 0; /* Overwrite so it's 0 instead of undefined, so you don't check this level ID again */
								}
							}
						}
						
						#region /* Display finished icon */
						if (is_array(finished_level))
						{
							if (finished_level[i] == 1) /* Only Played */
							{
								/* Player haven't reached the goal */
								var played_level_text = "Played";
								var played_level_icon = spr_icon_played;
								var played_level_color = c_yellow;
							}
							else
							if (finished_level[i] == 2) /* Played and finished */
							{
								/* Player haven't collected all the big collectibles */
								var played_level_text = "Finished";
								var played_level_icon = spr_icon_finished;
								var played_level_color = c_lime;
							}
							else
							if (finished_level[i] == 3) /* Finished and collected every big collectible */
							{
								/* Player have collected all the big collectibles */
								var played_level_text = "Completed";
								var played_level_icon = spr_icon_finished;
								var played_level_color = c_lime;
							}
							else /* Not played */
							{
								var played_level_text = "Unplayed";
								var played_level_icon = spr_icon_unplayed;
								var played_level_color = c_red;
							}
							draw_sprite_ext(played_level_icon, 0, download_online_x + 524, 32 + download_online_y + menu_y_offset, 1, 1, 0, c_white, 1);
							scr_draw_text_outlined(download_online_x + 548, 32 + download_online_y + menu_y_offset, l10n_text(played_level_text), global.default_text_size, c_menu_outline, played_level_color, 1);
						}
						#endregion /* Display finished icon END */
						
						#region /* Display zero defeats icon */
						if (is_array(zero_defeats_level))
						{
							if (zero_defeats_level[i] == 1) /* Zero Defeats */
							{
								var zero_defeats_level_text = "Zero Defeats";
								var zero_defeats_level_icon = spr_icon_zero_defeats;
								var zero_defeats_level_color = c_red;
							}
							else
							if (zero_defeats_level[i] == 2) /* Zero Hits */
							{
								var zero_defeats_level_text = "Zero Hits";
								var zero_defeats_level_icon = spr_icon_zero_hits;
								var zero_defeats_level_color = c_lime;
							}
							else /* No Zero Defeats */
							{
								var zero_defeats_level_text = "";
								var zero_defeats_level_icon = spr_noone;
								var zero_defeats_level_color = c_red;
							}
							if (zero_defeats_level_text != "")
							{
								draw_sprite_ext(zero_defeats_level_icon, 0, download_online_x + 524, 64 + download_online_y + menu_y_offset, 1, 1, 0, c_white, 1);
								scr_draw_text_outlined(download_online_x + 548, 64 + download_online_y + menu_y_offset, l10n_text(zero_defeats_level_text), global.default_text_size, c_menu_outline, zero_defeats_level_color, 1);
							}
						}
						#endregion /* Display finished icon END */
						
					}
					#endregion /* Let player know when you have already beaten a downloaded level END */
					
					#region /* Show if you have liked or disliked content */
					if (is_array(liked_content))
					{
						if (liked_content[i] == undefined)
						{
							if (file_exists(game_save_id + "save_file/custom_" + string(content_type) + "_save.ini"))
							{
								ini_open(game_save_id + "save_file/custom_" + string(content_type) + "_save.ini");
								
								/* See if the online content has already been liked or disliked by you or not */
								if (ini_key_exists("liked_downloaded_" + string(content_type), draw_download_id))
								{
									liked_content[i] = ini_read_real("liked_downloaded_" + string(content_type), draw_download_id, 0);
								}
								else
								{
									liked_content[i] = 0; /* Overwrite so it's false instead of undefined, so you don't check this variable again */
								}
									
								ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
							}
							else
							{
								liked_content[i] = 0; /* Overwrite so it's false instead of undefined, so you don't check this variable again */
							}
						}
					}
					if (is_array(liked_content))
					{
						if (liked_content[i] == +1) /* You have liked the content */
						{
							var liked_content_text = "Liked";
							var liked_content_icon = spr_icon_liked;
							var liked_content_color = c_aqua;
						}
						else
						if (liked_content[i] == -1) /* You have disliked the content */
						{
							var liked_content_text = "Disliked";
							var liked_content_icon = spr_icon_disliked;
							var liked_content_color = c_red;
						}
						else /* Not liked or disliked content */
						{
							var liked_content_text = "";
							var liked_content_icon = spr_noone;
							var liked_content_color = c_white;
						}
						if (liked_content_text != "")
						{
							draw_sprite_ext(liked_content_icon, 0, download_online_x + 524, 32 + download_online_y + menu_y_offset, 1, 1, 0, c_white, 1);
							scr_draw_text_outlined(download_online_x + 548, 32 + download_online_y + menu_y_offset, l10n_text(liked_content_text), global.default_text_size, c_menu_outline, liked_content_color, 1);
						}
					}
					#endregion /* Show if you have liked or disliked content END */
					
					/* Write date of upload */
					scr_draw_text_outlined(download_online_x + 100, 270 + download_online_y + menu_y_offset, string(get_relative_timezone(draw_download_time)), global.default_text_size * 0.75, c_menu_outline, selected_download_c_menu_fill, 1);
					draw_set_halign(fa_right);
					scr_draw_text_outlined(download_online_x + 490, 270 + download_online_y + menu_y_offset, string(draw_download_time), global.default_text_size * 0.6, c_menu_outline, selected_download_c_menu_fill, 0.9);
				}
				#endregion /* Thumbnail for each level / character END */
				
				
				
				
				
				
				
				
				
				
			}
			
			#region /* Get information about currently selected ID. If there is information data, then show info about currently selected ID */
			if (old_currently_selected_id != currently_selected_id)
			{
				/* Get level information. The level info should be retrieved only once you select a new ID */
				old_currently_selected_id = currently_selected_id;
				info_data = undefined;
				global.online_download_list_info = "";
				//global.http_request_info = http_request("https://" + global.base_url + "/metadata/" + string(content_type) + "s/" + string_upper(currently_selected_id), "GET", map, "");
				global.http_request_info = http_request("https://" + global.base_url + "/metadata/" + string(content_type) + "s/" + string_upper(currently_selected_id) + "?os_type=" + string(os_type), "GET", map, "");
			}
			
			if (info_data == undefined) && (in_online_download_list_menu)
			{
				/* If there is an online download list information loaded, interpret that as a struct using "json parse" */
				if (global.online_download_list_info != "")
				&& (global.online_download_list_info != "HTTP request exception")
				&& (global.online_download_list_info != "Unauthorized")
				{
					/* Handle potential JSON parsing error */
					try
					{
						info_data = json_parse(global.online_download_list_info); /* When there is data here, then go to the online downloads menu */
						info_data = array_create(1, info_data);
					}
					catch (e)
					{
						show_debug_message("Invalid JSON format: " + global.online_download_list_info);
						info_data = undefined; /* Handle the error as needed, and set "info data" to a default value */
					}
				}
				
				/* Check if it's an array */
				if (is_array(info_data))
				{
					/* Get the number of items in the JSON array */
					var num_info_items = array_length(info_data);
					for(var i = 0; i < num_info_items; i++;)
					{
						/* Fetch the "name" and "thumbnail" properties from the JSON object */
						var item = info_data[i];
						
						if (switch_check_profanity(item.name))
						{
							draw_download_name = string(switch_mask_profanity(item.name));
						}
						else
						{
							draw_download_name = string(item.name);
						}
						
						if (spr_download_list_thumbnail == noone) /* Get the thumbnail data */
						{
							var downloaded_thumbnail_path = temp_directory + "thumbnail.png";
							var buffer = buffer_base64_decode(item.thumbnail);
							buffer_save(buffer, downloaded_thumbnail_path);
							spr_download_list_thumbnail = sprite_add(downloaded_thumbnail_path, 0, false, true, 0, 0);
						}
					}
				}
			}
			
			if (is_array(data) && array_length(data) > 0 && info_data == undefined)
			{
				scr_draw_loading(1, download_online_x + 300, top_left_of_thumbnail_y + menu_y_offset + 100);
			}
			else
			if (is_array(data) && array_length(data) <= 0)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("There is nothing uploaded yet!"), global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
			}
			
			/* Draw the thumbnail */
			if (sprite_exists(spr_download_list_thumbnail) && data != undefined && info_data != undefined)
			{
				draw_sprite_ext(spr_download_list_thumbnail, 0, download_online_x + 100, top_left_of_thumbnail_y + menu_y_offset + 4, 384 / sprite_get_width(spr_download_list_thumbnail), 216 / sprite_get_height(spr_download_list_thumbnail), 0, c_white, 1);
			}
			
			/* Draw the name associated with the ID */ if (data != undefined && info_data != undefined)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				if (string_width(draw_download_name) > 640)
				{
					var draw_level_name_scale = global.default_text_size * 0.6;
				}
				else
				if (string_width(draw_download_name) > 320)
				{
					var draw_level_name_scale = global.default_text_size * 0.8;
				}
				else
				{
					var draw_level_name_scale = global.default_text_size;
				}
				scr_draw_text_outlined(download_online_x + 300, top_left_of_thumbnail_y + menu_y_offset + 240, string(draw_download_name), draw_level_name_scale, c_menu_outline, c_menu_fill, 1);
			}
			
			/* Write the ID for currently selected level */ draw_set_halign(fa_left);
			scr_draw_text_outlined(download_online_x + 108, 20 + top_left_of_thumbnail_y + menu_y_offset + 4, string(currently_selected_id), global.default_text_size * 0.75, c_menu_outline, c_lime, 1);
			
			#endregion /* Get information about currently selected ID. If there is information data, then show info about currently selected ID END */
			
			#region /* Online download list menu navigation when there is data */
			if (menu == "download_online_1")
			{
				if (is_array(data))
				&& (array_length(data) <= 0)
				{
					menu = "download_online_back";
				}
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_search_id";
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (num_items >= 2)
					{
						scr_delete_sprite_properly(spr_download_list_thumbnail);spr_download_list_thumbnail = noone; /* Delete the previous thumbnail sprite so you can load in a new one */
						menu = "download_online_2";
					}
					else
					{
						menu = "download_online_back";
					}
				}
			}
			else
			if (menu == "download_online_" + string(global.selected_online_download_index))
			{
				if (is_array(data))
				&& (array_length(data) <= 0)
				{
					menu = "download_online_back";
				}
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					scr_delete_sprite_properly(spr_download_list_thumbnail);spr_download_list_thumbnail = noone; /* Delete the previous thumbnail sprite so you can load in a new one */
					menu = "download_online_" + string(global.selected_online_download_index - 1);
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (global.selected_online_download_index < num_items)
				{
					menu_delay = 3;
					scr_delete_sprite_properly(spr_download_list_thumbnail);spr_download_list_thumbnail = noone; /* Delete the previous thumbnail sprite so you can load in a new one */
					menu = "download_online_" + string(global.selected_online_download_index + 1);
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_back";
				}
			}
			#endregion /* Online download list menu navigation when there is data END */
			
		}
		#endregion /* If there is data, then show an online downloads menu END */
		
		if (!os_is_network_connected())
		{
			if (content_type == "character")
			{
				in_online_download_list_menu = false;
				menu = "no_internet_character";
			}
			else
			if (content_type == "level")
			{
				in_online_download_list_menu = false;
				select_custom_level_menu_open = true;
				show_level_editor_corner_menu = false;
				menu = "no_internet_level";
			}
		}
		
		#region /* Draw the Back and Search ID buttons on top of everything */
		draw_menu_button(0, 0, l10n_text("Back"), "download_online_back", "");
		draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
		
		var draw_search_id_y = 42;
		
		if (global.free_communication_available)
		{
			if (content_type == "character")
			{
				draw_menu_button(0, draw_search_id_y, l10n_text("Search Character ID"), "download_online_search_id", "");
			}
			else
			if (content_type == "level")
			{
				draw_menu_button(0, draw_search_id_y, l10n_text("Search Level ID"), "download_online_search_id", "");
			}
			
			#region /* Draw Search Key */
			if (gamepad_is_connected(global.player_slot[1]))
			&& (global.controls_used_for_navigation == "gamepad")
			|| (global.always_show_gamepad_buttons)
			{
				scr_draw_gamepad_buttons(gp_face4, 16, draw_search_id_y + 21, 0.5, c_white, 1, 1, 1, 1);
			}
			#endregion /* Draw Search key END */
			
		}
		
		#region /* Pressing the Back button */
		if (key_b_pressed)
		|| (menu == "download_online_back")
		&& (key_a_pressed)
		|| (menu == "download_online_back")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, 0, 370, 42))
		&& (mouse_check_button_released(mb_left))
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (content_type == "level")
				{
					if (variable_instance_exists(self, "show_level_editor_corner_menu"))
					{
						show_level_editor_corner_menu = true;
					}
					global.go_to_menu_when_going_back_to_title = "online_level_list";
					select_custom_level_menu_open = false;
					menu = "load_custom_level"; /* Always reload all custom levels before going to the level select menu, just in case */
				}
				else
				{
					menu = "online_character_list";
				}
				global.automatically_play_downloaded_level = false;
				global.use_temp_or_working = game_save_id; /* When downloading levels from online and temporarily playing the level, you have to use the "temp directory", but normally you need to use the "working directory" */
				global.online_download_list = ""; /* Reset "global online download list" so you can reload online download list next time you go to this menu */
				data = undefined; /* Reset "data" so you can reload online download list next time you go to this menu */
				info_data = undefined; /* Don't forget to reset info data too */
				spr_download_list_thumbnail = noone; /* Don't forget to reset download list thumbnail too */
				automatically_search_for_id = false;
				in_online_download_list_menu = false;
				in_online_download_list_load_menu = false;
				keyboard_string = "";
				search_id = "";
			}
		}
		#endregion /* Pressing the Back button END*/
		
		#region /* Pressing the Search ID button */
		if (menu == "download_online_search_id")
		&& (key_a_pressed)
		|| (menu == "download_online_search_id")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, 42, 370, 42 + 42))
		&& (mouse_check_button_released(mb_left))
		|| (gamepad_button_check_pressed(global.player_slot[1], gp_face4))
		{
			menu_delay = 3;
			in_online_download_list_menu = false; /* Get out of the online download list menu */
			automatically_search_for_id = false; /* Manual search ID */
			keyboard_string = "";
			search_id = "";
			menu = "search_id_ok";
			select_custom_level_menu_open = false;
		}
		#endregion /* Pressing the Search ID button END */
		
		#endregion /* Draw the Back and Search ID buttons on top of everything END */
		
		#region /* Draw the Load Custom Level Assets */
		if (content_type == "level")
		{
			var can_load_custom_level_assets_x = display_get_gui_width() - string_width(l10n_text("Load Custom Level Assets")) - 16;
			var can_load_custom_level_assets_y = 16;
			global.can_load_custom_level_assets = draw_menu_checkmark(can_load_custom_level_assets_x, can_load_custom_level_assets_y, l10n_text("Load Custom Level Assets"), "online_list_can_load_custom_level_assets", global.can_load_custom_level_assets, true);
			
			scr_draw_option_description();
		}
		#endregion /* Draw the Load Custom Level Assets END */
		
		menu_y_offset_real = clamp(menu_y_offset_real, - 100 + window_get_height() - (300 * array_length(data)), 0); /* Dont let "meny y offset" get above 0 */
	}
	else
	
	#region /* If you are no longer in "online download list menu", but somehow still in a menu selection only appearing in this menu, force you out of the menu */
	if (!in_online_download_list_menu)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		if (menu == "download_online_back")
		|| (menu == "download_online_search_id")
		|| (menu == "download_online_1")
		|| (menu == "download_online_" + string(global.selected_online_download_index))
		{
			if (content_type == "level")
			{
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
				menu = "online_level_list";
				select_custom_level_menu_open = true;
			}
			else
			{
				menu = "online_character_list";
			}
			global.online_download_list = ""; /* Reset "global online download list" so you can reload online download list next time you go to this menu */
			data = undefined; /* Reset "data" so you can reload online download list next time you go to this menu */
			info_data = undefined; /* Don't forget to reset info data too */
			spr_download_list_thumbnail = noone; /* Don't forget to reset download list thumbnail too */
			automatically_search_for_id = false;
			in_online_download_list_menu = false;
			in_online_download_list_load_menu = false;
			keyboard_string = "";
			menu_delay = 3;
			search_id = "";
		}
	}
	#endregion /* If you are no longer in "online download list menu", but somehow still in a menu selection only appearing in this menu, force you out of the menu END */
	
	#region /* Online download list menu navigation even when there isn't any data */
	if (menu == "download_online_back")
	{
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (is_array(data))
		&& (array_length(data) > 0)
		{
			menu_delay = 3;
			if (is_array(data))
			&& (array_length(data) > 0)
			{
				if (global.selected_online_download_index != num_items)
				{
					scr_delete_sprite_properly(spr_download_list_thumbnail);spr_download_list_thumbnail = noone; /* Delete the previous thumbnail sprite so you can load in a new one */
				}
				menu = "download_online_" + string(num_items);
				menu_cursor_y_position = menu_cursor_y_position_start;
				menu_y_offset_real = menu_y_offset_real_start;
			}
		}
		else
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = "download_online_search_id";
		}
		else
		if (key_right)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (content_type == "level")
		{
			menu_delay = 3;
			menu = "online_list_can_load_custom_level_assets";
		}
	}
	else
	if (menu == "download_online_search_id")
	{
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = "download_online_back";
		}
		else
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (is_array(data))
			&& (array_length(data) > 0)
			{
				if (global.selected_online_download_index != 1)
				{
					scr_delete_sprite_properly(spr_download_list_thumbnail);spr_download_list_thumbnail = noone; /* Delete the previous thumbnail sprite so you can load in a new one */
				}
				menu = "download_online_1";
				menu_y_offset_real = 0;
				menu_cursor_y_position = 0;
			}
		}
		if (key_right)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (content_type == "level")
		{
			menu_delay = 3;
			menu = "online_list_can_load_custom_level_assets";
		}
	}
	else
	if (menu == "online_list_can_load_custom_level_assets")
	{
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (is_array(data))
		&& (array_length(data) > 0)
		{
			menu_delay = 3;
			if (is_array(data))
			&& (array_length(data) > 0)
			{
				if (global.selected_online_download_index != num_items)
				{
					scr_delete_sprite_properly(spr_download_list_thumbnail);spr_download_list_thumbnail = noone; /* Delete the previous thumbnail sprite so you can load in a new one */
				}
				menu = "download_online_" + string(num_items);
				menu_cursor_y_position = menu_cursor_y_position_start;
				menu_y_offset_real = menu_y_offset_real_start;
			}
		}
		else
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (is_array(data))
			&& (array_length(data) > 0)
			{
				if (global.selected_online_download_index != 1)
				{
					scr_delete_sprite_properly(spr_download_list_thumbnail);spr_download_list_thumbnail = noone; /* Delete the previous thumbnail sprite so you can load in a new one */
				}
				menu = "download_online_1";
				menu_y_offset_real = 0;
				menu_cursor_y_position = 0;
			}
		}
		else
		if (key_left)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = "download_online_back";
		}
	}
	else
	if (menu == "download_online_1")
	{
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = "download_online_search_id";
		}
	}
	#endregion /* Online download list menu navigation even when there isn't any data END */
	
	//draw_set_halign(fa_left);
	//scr_draw_text_outlined(32, 320 + (32 * 4), "scrolling_menu_with_mousewheel: " + string(scrolling_menu_with_mousewheel));
	//scr_draw_text_outlined(32, 320 + (32 * 5), "debug online download list info");
	//scr_draw_text_outlined(32, 320 + (32 * 6), "data: " + string(data));
	//scr_draw_text_outlined(32, 320 + (32 * 7), "info_data: " + string(info_data));
	//scr_draw_text_outlined(32, 320 + (32 * 8), "global.online_download_list_info: " + string(global.online_download_list_info));
	
}