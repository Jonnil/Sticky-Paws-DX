function scr_draw_online_download_list()
{
	if (menu = "online_download_list_load")
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
		
		/* Send the HTTP GET request to the /level endpoint */
		global.http_request_id = http_request("http://" + global.base_url + "/" + string(content_type) + "s", "GET", map, "");
		ds_map_destroy(map);
		#endregion /* Get Online Download List END */
		
		menu = "download_online_1";
		
		automatically_search_id = false;
		in_online_download_list_menu = true;
		menu_delay = 3;
		
		#region /* Draw loading screen when loading download list */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		global.loading_spinning_angle -= 10;
		draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 1, 1, global.loading_spinning_angle, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42, l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
		#endregion /* Draw loading screen when loading download list END */
		
	}
	else
	if (in_online_download_list_menu == true)
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		draw_menu_button(0, 0, "Back", "download_online_back", "download_online_back");
		if (key_b_pressed)
		or (menu = "download_online_back")
		and (key_a_pressed)
		or (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, 0, 370, 42))
		and (mouse_check_button_released(mb_left))
		{
			if (menu_delay == 0)
			{
				global.online_download_list = ""; /* Reset "global online download list" so you can reload online download list next time you go to this menu */
				data = noone; /* Reset "data" so you can reload online download list next time you go to this menu */
				automatically_search_id = false;
				in_online_download_list_menu = false;
				in_online_download_list_load_menu = false;
				keyboard_string = "";
				if (content_type == "level")
				{
					menu = "online_download_list";
					select_custom_level_menu_open = true;
				}
				else
				if (content_type == "character")
				{
					menu = "search_online_list";
				}
				menu_delay = 3;
				search_id = "";
			}
		}
		
		#region /* If there is no data, then apply the retrieved download data to it */
		if (data == noone)
		and (in_online_download_list_menu == true)
		{
			var number_downloads_loaded = 10; /* How many downloads are loaded at one page */
			
			#region /* If there is a online download list loaded, interpret that as a struct using "json parse" */
			if (global.online_download_list != "")
			{
				/* chr(34) = " */
				str = string_replace_all(global.online_download_list, "[{" + chr(34), "{" + chr(34) + "online_downloads" + chr(34) + ": { " + chr(34)) /* Replace [{ with {"online_downloads": { " */
				str = string_replace_all(str, "}]", "}}"); /* Replace "}] with "}}" */
				str = string_replace_all(str, "},{", ", ");
				
				#region /* Add a number after each "name" and "time created" */
				for(var n = 0; n < number_downloads_loaded ; n++)
				{
					str = string_replace(str, "e" + chr(34), "e" + string(n) + chr(34));
					str = string_replace(str, "d" + chr(34), "d" + string(n) + chr(34));
				}
				#endregion /* Add a number after each "name" and "time created" END */
				
				show_debug_message(str);
				
				json = string(str);
				data = json_parse(json);
			}
			#endregion /* If there is a online download list loaded, interpret that as a struct using "json parse" END */
			
			#region /* Draw loading screen when loading download list */
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			global.loading_spinning_angle -= 10;
			draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 1, 1, global.loading_spinning_angle, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42, l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
			#endregion /* Draw loading screen when loading download list END */
			
		}
		#endregion /* If there is no data, then apply the retrieved download data to it END */
		
		#region /* If there is data, then show a online downloads menu */
		if (data != noone)
		and (menu != "search_id_ok")
		{
			/* Check if the struct has "online downloads" variable */
			if (variable_struct_exists(data, "online_downloads"))
			{
				/* Check if it's a struct */
				if (is_struct(data.online_downloads))
				{
					/* Print all struct members to the log */
					var _names = variable_struct_get_names(data.online_downloads);
					var online_download_index = 0;
					var selected_online_download_index = 0;
					for (var i = 0; i < array_length(_names); i++;)
					{
						online_download_index += 1;
						var download_online_x = 100;
						var download_online_y = 64 + (32 * i);
						draw_menu_button(download_online_x, download_online_y, "Download", "download_online_" + string(online_download_index), "download_online_" + string(online_download_index));
						draw_set_halign(fa_left);
						
						if (string_pos_ext("levels/", string(variable_struct_get(data.online_downloads, _names[i])), 0))
						or (string_pos_ext("characters/", string(variable_struct_get(data.online_downloads, _names[i])), 0))
						{
							var draw_download_id = string(variable_struct_get(data.online_downloads, _names[i]));
							var draw_download_id = string_replace(string(variable_struct_get(data.online_downloads, _names[i])), "levels/", "");
							var draw_download_id = string_replace(draw_download_id, "characters/", "");
							var draw_download_id = string_replace(draw_download_id, ".zip", "");
						}
						if (menu == "download_online_" + string(online_download_index))
						{
							var selected_download_c_menu_fill = c_lime; /* Highlight the text in lime green so player knows they are selecting this download */
							var selected_online_download_index = online_download_index;
								
							#region /* Download selected file when pressing A */
							if (key_a_pressed)
							or (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), download_online_x, download_online_y, download_online_x + 370, download_online_y + 42))
							and (mouse_check_button_released(mb_left))
							{
								if (menu_delay == 0)
								{
									#region /* Go to download download menu first */
									global.search_id = string_upper(draw_download_id);
									keyboard_string = string_upper(draw_download_id);
									search_id = string_upper(draw_download_id); /* Then need to set search ID */
									automatically_search_id = true; /* Don't set this variable to false yet, it's used in "scr_draw_menu_search_id" to automatically enter the search ID. We need to do the HTTP Request in that script */
									in_online_download_list_menu = false; /* We are not supposed to show the online download list menu when going to search ID menu */
									menu = "search_id_ok";
									#endregion /* Go to download download menu first END */
									
								}
							}
							#endregion /* Download selected file when pressing A END */
							
						}
						else
						{
							var selected_download_c_menu_fill = c_menu_fill;
						}
						
						/* Write the list index to the left of download button */ scr_draw_text_outlined(32, 86 + 32 * i, string(online_download_index), global.default_text_size, c_menu_outline, selected_download_c_menu_fill, 1);
						
						/* Write the ID */ scr_draw_text_outlined(510, 76 + 32 * i, string_upper(content_type) + " " + l10n_text("ID") + ": " + string(draw_download_id), global.default_text_size, c_menu_outline, selected_download_c_menu_fill, 1);
						
						i += 1;
						var draw_download_time = string_replace(string(variable_struct_get(data.online_downloads, _names[i])), "T", " ");
						var draw_download_time = string_replace(draw_download_time, "Z", "");
						/* Write date of upload */ scr_draw_text_outlined(510, 96 + 32 * (i - 1), string(draw_download_time), global.default_text_size * 0.5, c_menu_outline, selected_download_c_menu_fill, 1);
					}
				}
			}
			
			#region /* Online download List Menu Navigation */
			if (menu == "download_online_back")
			{
				if (key_up)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_" + string(array_length(_names) * 0.5);
				}
				else
				if (key_down)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_1";
				}
			}
			if (menu == "download_online_1")
			{
				if (key_up)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_back";
				}
				else
				if (key_down)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					if (array_length(_names) >= 4)
					{
						menu = "download_online_2";
					}
					else
					{
						menu = "download_online_back";
					}
				}
			}
			if (menu == "download_online_" + string(selected_online_download_index))
			{
				if (key_up)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_" + string(selected_online_download_index - 1);
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (selected_online_download_index < array_length(_names) * 0.5)
				{
					menu_delay = 3;
					menu = "download_online_" + string(selected_online_download_index + 1);
				}
				else
				if (key_down)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_back";
				}
			}
			#endregion /* Online download List Menu Navigation END */
			
		}
		#endregion /* If there is data, then show a online downloads menu END */
		
	}
}