function scr_draw_online_download_list()
{
	if (menu == "online_download_list_load")
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* Get Online Download List */
		/* Don't ever change "content type" in this script, so Async - HTTP Event is running correctly */
		in_online_download_list_load_menu = true; /* Let Async - HTTP Event know that we want to load a onload download list */
		
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
		
		menu = "download_online_" + string(selected_online_download_index);
		
		automatically_search_for_id = false;
		in_online_download_list_menu = true;
		menu_delay = 3;
		
		#region /* Draw loading screen when loading download list */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		global.loading_spinning_angle -= 10;
		draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 1, 1, global.loading_spinning_angle, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42, l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
		#endregion /* Draw loading screen when loading download list END */
		
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
		
		#region /* Pressing the Back button */
		if (key_b_pressed)
		|| (menu == "download_online_back")
		&& (key_a_pressed)
		|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, 0, 370, 42))
		&& (mouse_check_button_released(mb_left))
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (content_type == "level")
				{
					if (variable_instance_exists(self, "show_level_editor_corner_menu"))
					{
						show_level_editor_corner_menu = true;
					}
					menu = "online_download_list";
					select_custom_level_menu_open = true;
				}
				else
				{
					menu = "search_character_id";
				}
				global.online_download_list = ""; /* Reset "global online download list" so you can reload online download list next time you go to this menu */
				data = noone; /* Reset "data" so you can reload online download list next time you go to this menu */
				automatically_search_for_id = false;
				in_online_download_list_menu = false;
				in_online_download_list_load_menu = false;
				keyboard_string = "";
				menu_delay = 3;
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
		|| (gamepad_button_check_pressed(global.player1_slot, gp_face4))
		{
			in_online_download_list_menu = false; /* Get out of the online download list menu */
			automatically_search_for_id = false; /* Manual search ID */
			keyboard_string = "";
			search_id = "";
			menu = "search_id_ok";
			select_custom_level_menu_open = false;
			menu_delay = 3;
		}
		#endregion /* Pressing the Search ID button END */
		
		#region /* If there is no data, then apply the retrieved download data to it */
		if (data == noone)
		&& (in_online_download_list_menu)
		{
			scr_draw_loading(1); /* Draw loading screen when loading download list */
			
			#region /* If there is an online download list loaded, interpret that as a struct using "json parse" */
			if (global.online_download_list != "")
			&& (global.online_download_list != "HTTP request exception")
			&& (global.online_download_list != "Unauthorized")
			{
				data = json_parse(global.online_download_list); /* When there is data here, then go to the online downloads menu */
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
		if (data != noone)
		&& (menu != "search_id_ok")
		{
			scr_scroll_menu();
			
			/* Check if it's an array */
			if (is_array(data))
			{
				/* Explain what the code IDs are */
				scr_draw_text_outlined(580, 76 + 24 + menu_y_offset - 32, string_upper(content_type) + " " + l10n_text("ID") + ":", global.default_text_size, c_menu_outline, c_gray, 1);
				
				/* Get the number of items in the JSON array */
				var num_items = array_length(data);
				var online_download_index = 0;
				for (var i = 0; i < num_items; i++;)
				{
					online_download_index ++;
					var download_online_x = 100;
					var download_online_y = 32 + (44 * i);
					draw_menu_button(download_online_x, 64 + download_online_y + menu_y_offset, "Download", "download_online_" + string(online_download_index), "download_online_" + string(online_download_index));
					
					/* Fetch the "name" and "time_created" properties from the JSON object */
					var item = data[i];
					var draw_download_id = item.name;
					draw_download_id = string_replace(draw_download_id, string(content_type) + "s/", "");
					draw_download_id = string_replace(draw_download_id, ".zip", "");
					var draw_download_time = string_replace(item.time_created, "T", " ");
					draw_download_time = string_replace(draw_download_time, "Z", "");
					
					if (menu == "download_online_" + string(online_download_index))
					{
						currently_selected_id = draw_download_id;
						
						menu_cursor_y_position = 64 + download_online_y;
						var selected_download_c_menu_fill = c_lime;
						/* Highlight the text in lime green so the player knows they are selecting this download */
						selected_online_download_index = online_download_index;
						
						#region /* Download selected file when pressing A */
						if (key_a_pressed)
						|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), download_online_x, 64 + download_online_y + menu_y_offset, download_online_x + 370, 64 + download_online_y + menu_y_offset + 41))
						&& (mouse_check_button_released(mb_left))
						{
							if (menu_delay == 0 && menu_joystick_delay == 0)
							{
								
								#region /* Go to download menu */
								global.search_id = string_upper(draw_download_id);
								keyboard_string = string_upper(draw_download_id);
								search_id = string_upper(draw_download_id); /* Then need to set search ID */
								automatically_search_for_id = true; /* Don't set this variable to false yet, it's used in "scr_draw_menu_search_id" to automatically enter the search ID. We need to do the HTTP Request in that script */
								in_online_download_list_menu = false; /* We are not supposed to show the online download list menu when going to search ID menu */
								menu = "search_id_ok";
								#endregion /* Go to download menu END */
								
							}
						}
						#endregion /* Download selected file when pressing A END */
						
					}
					else
					{
						var selected_download_c_menu_fill = c_menu_fill;
					}
					draw_set_halign(fa_left);
					
					/* Write the list index to the left of download button */
					scr_draw_text_outlined(32, 86 + download_online_y + menu_y_offset, string(online_download_index), global.default_text_size, c_menu_outline, selected_download_c_menu_fill, 1);
					
					/* Write the ID */
					scr_draw_text_outlined(510, 76 + download_online_y + menu_y_offset, string(draw_download_id), global.default_text_size, c_menu_outline, selected_download_c_menu_fill, 1);
					
					/* Write date of upload */
					scr_draw_text_outlined(510, 96 + download_online_y + menu_y_offset, string(draw_download_time), global.default_text_size * 0.5, c_menu_outline, selected_download_c_menu_fill, 1);
					
				}
			}
			
			#region /* Get information about currently selected ID. If there is information data, then show info about currently selected ID */
			//if (old_currently_selected_id != currently_selected_id)
			//{
			//	/* Get level information. The level info should be retrieved only once you select a new ID */
			//	old_currently_selected_id = currently_selected_id;
			//	info_data = noone;
			//	global.online_download_list_info = "";
			//	global.http_request_info = http_request("https://" + global.base_url + "/metadata/" + string(content_type) + "s/" + string_upper(currently_selected_id), "GET", map, "");
			//}
			
			//if (info_data == noone)
			//&& (in_online_download_list_menu)
			//{
			//	/* If there is an online download list information loaded, interpret that as a struct using "json parse" */
			//	if (global.online_download_list_info != "")
			//	&& (global.online_download_list_info != "HTTP request exception")
			//	&& (global.online_download_list_info != "Unauthorized")
			//	{
			//		info_data = json_parse(global.online_download_list_info); /* When there is data here, then go to the online downloads menu */
			//	}
			//}
			
			//if (info_data != noone)
			//&& (menu != "search_id_ok")
			//{
			//	/* Check if it's an array */
			//	if (is_array(info_data))
			//	{
			//		/* Get the number of items in the JSON array */
			//		var num_info_items = array_length(info_data);
			//		for (var i = 0; i < num_info_items; i++;)
			//		{
			//			/* Fetch the "name" and "thumbnail" properties from the JSON object */
			//			var item = info_data[i];
			//			var draw_download_name = item.name;
			//			var draw_download_thumbnail = item.thumbnail;
						
			//			scr_delete_sprite_properly(spr_download_list_thumbnail);
			//			spr_download_list_thumbnail = sprite_add(draw_download_thumbnail, 0, false, true, 0, 0);
						
			//			draw_set_halign(fa_center);
						
			//			/* Write the name associated with the ID */
			//			scr_draw_text_outlined(1000, 128, string(draw_download_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
						
			//			/* Draw the thumbnail */
			//			if (sprite_exists(spr_download_list_thumbnail))
			//			{
			//				draw_sprite_ext(spr_download_list_thumbnail, 1, 1000, 256, 1, 1, 0, c_white, 1);
			//			}
						
			//		}
			//	}
			//}
			#endregion /* Get information about currently selected ID. If there is information data, then show info about currently selected ID END */
			
			#region /* Online download List Menu Navigation */
			if (menu == "download_online_back")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_" + string(num_items);
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_search_id";
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
					menu = "download_online_1";
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
			if (menu == "download_online_" + string(selected_online_download_index))
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_" + string(selected_online_download_index - 1);
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (selected_online_download_index < num_items)
				{
					menu_delay = 3;
					menu = "download_online_" + string(selected_online_download_index + 1);
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_back";
				}
			}
			#endregion /* Online download List Menu Navigation END */
			
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
		draw_menu_button(0, 0, "Back", "download_online_back", "download_online_back");
		draw_sprite_ext(spr_icons_back, 0, 20, 21, 1, 1, 0, c_white, 1);
		
		var draw_search_id_y = 42;
		
		if (global.free_communication_available)
		{
			if (content_type == "character")
			{
				draw_menu_button(0, draw_search_id_y, "Search Character ID", "download_online_search_id", "download_online_search_id");
			}
			else
			if (content_type == "level")
			{
				draw_menu_button(0, draw_search_id_y, "Search Level ID", "download_online_search_id", "download_online_search_id");
			}
			
			#region /* Draw Search Key */
			if (gamepad_is_connected(global.player1_slot))
			&& (global.controls_used_for_menu_navigation == "controller")
			|| (global.always_show_gamepad_buttons)
			{
				scr_draw_gamepad_buttons(gp_face4, 16, draw_search_id_y + 21, 0.5, c_white, 1);
			}
			#endregion /* Draw Search key END */
			
		}
		
		#endregion /* Draw the Back and Search ID buttons on top of everything END */
		
	}
	else
	
	#region /* If you are no longer in "online download list menu", but somehow still in a menu selection only appearing in this menu, force you out of the menu */
	if (in_online_download_list_menu == false)
	{
		if (menu == "download_online_back")
		|| (menu == "download_online_search_id")
		|| (menu == "download_online_1")
		|| (menu == "download_online_" + string(selected_online_download_index))
		{
			if (content_type == "level")
			{
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
				menu = "online_download_list";
				select_custom_level_menu_open = true;
			}
			else
			{
				menu = "search_character_id";
			}
			global.online_download_list = ""; /* Reset "global online download list" so you can reload online download list next time you go to this menu */
			data = noone; /* Reset "data" so you can reload online download list next time you go to this menu */
			automatically_search_for_id = false;
			in_online_download_list_menu = false;
			in_online_download_list_load_menu = false;
			keyboard_string = "";
			menu_delay = 3;
			search_id = "";
		}
	}
	#endregion /* If you are no longer in "online download list menu", but somehow still in a menu selection only appearing in this menu, force you out of the menu END */
	
	//draw_set_halign(fa_left);
	//draw_text(32, 320 + (32 * 2), "debug online download list info");
	//draw_text(32, 320 + (32 * 4), "data: " + string(data));
	//draw_text(32, 320 + (32 * 5), "info_data: " + string(info_data));
	//draw_text(32, 320 + (32 * 6), "global.online_download_list_info: " + string(global.online_download_list_info));
	
}