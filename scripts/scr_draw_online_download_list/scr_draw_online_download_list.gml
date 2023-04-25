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
			
			#region /* Draw loading screen when loading download list */
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			global.loading_spinning_angle -= 10;
			draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 1, 1, global.loading_spinning_angle, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42, l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
			draw_set_halign(fa_left);
			scr_draw_text_outlined(32, display_get_gui_height() * 0.5 + (42 * 2), string(global.online_download_list), global.default_text_size, c_white, c_black, 1);
			draw_set_halign(fa_right);
			scr_draw_text_outlined(display_get_gui_width() - 32, display_get_gui_height() * 0.5 + (42 * 3), string(global.online_download_list), global.default_text_size, c_white, c_black, 1);
			#endregion /* Draw loading screen when loading download list END */
			
			#region /* If there is an online download list loaded, interpret that as a struct using "json parse" */
			if (global.online_download_list != "")
			{
				data = json_parse(global.online_download_list); /* When there is data here, then go to the online downloads menu */
			}
			#endregion /* If there is an online download list loaded, interpret that as a struct using "json parse" END */
			
		}
		#endregion /* If there is no data, then apply the retrieved download data to it END */
		
		#region /* If there is data, then show an online downloads menu */
		if (data != noone)
		and (menu != "search_id_ok")
		{
			
			scr_scroll_menu();
			
			/* Check if it's an array */
			if (is_array(data))
			{
				/* Get the number of items in the JSON array */
				var num_items = array_length(data);
				var online_download_index = 0;
				var selected_online_download_index = 0;
				for (var i = 0; i < num_items; i++;)
				{
					online_download_index += 1;
					var download_online_x = 100;
					var download_online_y = (44 * i);
					draw_menu_button(download_online_x, 64 + download_online_y + menu_y_offset, "Download", "download_online_" + string(online_download_index), "download_online_" + string(online_download_index));
					draw_set_halign(fa_left);
					
					/* Fetch the "name" and "time_created" properties from the JSON object */
					var item = data[i];
					var draw_download_id = item.name;
					draw_download_id = string_replace(draw_download_id, string(content_type) + "s/", "");
					draw_download_id = string_replace(draw_download_id, ".zip", "");
					var draw_download_time = string_replace(item.time_created, "T", " ");
					draw_download_time = string_replace(draw_download_time, "Z", "");
					
					if (menu == "download_online_" + string(online_download_index))
					{
						menu_cursor_y_position = 64 + download_online_y;
						var selected_download_c_menu_fill = c_lime;
						/* Highlight the text in lime green so the player knows they are selecting this download */
						var selected_online_download_index = online_download_index;
						
						#region /* Download selected file when pressing A */
						if (key_a_pressed)
						or (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), download_online_x, 64 + download_online_y + menu_y_offset, download_online_x + 370, 64 + download_online_y + menu_y_offset + 41))
						and (mouse_check_button_released(mb_left))
						{
							if (menu_delay == 0)
							{
								
								#region /* Go to download menu */
								global.search_id = string_upper(draw_download_id);
								keyboard_string = string_upper(draw_download_id);
								search_id = string_upper(draw_download_id); /* Then need to set search ID */
								automatically_search_id = true; /* Don't set this variable to false yet, it's used in "scr_draw_menu_search_id" to automatically enter the search ID. We need to do the HTTP Request in that script */
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
					
					/* Write the list index to the left of download button */
					scr_draw_text_outlined(32, 86 + download_online_y + menu_y_offset, string(online_download_index), global.default_text_size, c_menu_outline, selected_download_c_menu_fill, 1);
					
					/* Write the ID */
					scr_draw_text_outlined(510, 76 + download_online_y + menu_y_offset, string_upper(content_type) + " " + l10n_text("ID") + ": " + string(draw_download_id), global.default_text_size, c_menu_outline, selected_download_c_menu_fill, 1);
					
					/* Write date of upload */
					scr_draw_text_outlined(510, 96 + download_online_y + menu_y_offset, string(draw_download_time), global.default_text_size * 0.5, c_menu_outline, selected_download_c_menu_fill, 1);
					
				}
			}
			
			#region /* Online download List Menu Navigation */
			if (menu == "download_online_back")
			{
				if (key_up)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "download_online_" + string(num_items);
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
				and (selected_online_download_index < num_items)
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
		#endregion /* If there is data, then show an online downloads menu END */
		
	}
}