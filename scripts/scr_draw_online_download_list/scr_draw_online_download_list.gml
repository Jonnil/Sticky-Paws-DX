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
				caution_online_takes_you_back_to = "download_online_search_id";
				menu = "no_internet_character";
			}
			else
			if (content_type == "level")
			{
				in_online_download_list_menu = false;
				select_custom_level_menu_open = true;
				show_level_editor_corner_menu = false;
				caution_online_takes_you_back_to = "level_editor_upload";
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
			scr_draw_loading(1,,,"Loading from server"); /* Draw loading screen when loading download list */
			
			#region /* If there is an online download list loaded, interpret that as a struct using "json parse" */
			if (global.online_download_list != "")
			&& (global.online_download_list != "HTTP request exception")
			&& (global.online_download_list != "Unauthorized")
			{
				try
				{
					data = json_parse(global.online_download_list); /* When there is data here, then go to the online downloads menu */
					
					//scr_delete_sprite_properly(spr_download_list_thumbnail); /* Delete the previous thumbnail sprite so you can load in a new one */
					
					for(var i = 0; i < array_length(data) + 1; i++;)
					{
						spr_download_list_thumbnail[i] = spr_thumbnail_missing;
					}
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
				
				online_download_index = 0;
				
				for(var i = 0; i < num_items; i++;)
				{
					scr_draw_online_download_list_thumbnail(i, num_items);
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
						
						if (spr_download_list_thumbnail[global.selected_online_download_index] == spr_thumbnail_missing) /* Get the thumbnail data */
						{
							var downloaded_thumbnail_path = temp_directory + "thumbnail.png";
							var buffer = buffer_base64_decode(item.thumbnail);
							buffer_save(buffer, downloaded_thumbnail_path);
							spr_download_list_thumbnail[global.selected_online_download_index] = sprite_add(downloaded_thumbnail_path, 0, false, true, 0, 0);
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
					menu = "download_online_" + string(global.selected_online_download_index - 1);
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (global.selected_online_download_index < num_items)
				{
					menu_delay = 3;
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
				caution_online_takes_you_back_to = "download_online_search_id";
				menu = "no_internet_character";
			}
			else
			if (content_type == "level")
			{
				in_online_download_list_menu = false;
				select_custom_level_menu_open = true;
				show_level_editor_corner_menu = false;
				caution_online_takes_you_back_to = "level_editor_upload";
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
					if (global.character_select_in_this_menu == "level_editor")
					{
						menu = "load_custom_level"; /* Always reload all custom levels before going to the level select menu, just in case */
					}
					else
					if (global.character_select_in_this_menu == "online_level_list_title")
					{
						menu = "online_level_list_title";
					}
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
			global.can_load_custom_level_assets = draw_menu_checkmark(can_load_custom_level_assets_x, can_load_custom_level_assets_y, l10n_text("Load Custom Level Assets"), "online_list_can_load_custom_level_assets", global.can_load_custom_level_assets, true,,false);
			
			scr_draw_option_description();
		}
		#endregion /* Draw the Load Custom Level Assets END */
		
		menu_y_offset_real = clamp(menu_y_offset_real, - 250 + window_get_height() - (300 * array_length(data)), 0); /* Dont let "meny y offset" get above 0 */
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
				menu = "download_online_" + string(num_items);
				menu_cursor_y_position = menu_cursor_y_position_start;
				menu_y_offset = menu_y_offset_real_start  - 999;
				menu_y_offset_real = menu_y_offset_real_start  - 999;
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
				menu = "download_online_" + string(num_items);
				menu_cursor_y_position = menu_cursor_y_position_start;
				menu_y_offset = menu_y_offset_real_start - 999;
				menu_y_offset_real = menu_y_offset_real_start - 999;
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