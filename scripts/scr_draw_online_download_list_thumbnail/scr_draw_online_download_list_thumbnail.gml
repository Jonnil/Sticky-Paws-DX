function scr_draw_online_download_list_thumbnail(thumbnail_index, number_of_thumbnails)
{
	online_download_index ++;
	
	var download_online_x = display_get_gui_width() * 0.5 - 300;
	var download_online_y = 80 + (300 * thumbnail_index); /* The distance between each thumbnail */
	
	if (thumbnail_index == number_of_thumbnails - 1)
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
	var item = data[thumbnail_index];
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
			if (finished_level[thumbnail_index] == undefined)
			{
				if (file_exists(game_save_id + "save_file/custom_level_save.ini"))
				{
					ini_open(game_save_id + "save_file/custom_level_save.ini");
					
					/* See if the online level has already been beaten by you or not */
					if (ini_key_exists("finished_downloaded_level", draw_download_id))
					{
						finished_level[thumbnail_index] = ini_read_real("finished_downloaded_level", draw_download_id, 0);
					}
					else
					{
						finished_level[thumbnail_index] = 0; /* Overwrite so it's 0 instead of undefined, so you don't check this level ID again */
					}
					
					/* See if the online level has been completed with zero defeats or zero hits */
					if (ini_key_exists("zero_defeats_downloaded_level", draw_download_id))
					{
						zero_defeats_level[thumbnail_index] = ini_read_real("zero_defeats_downloaded_level", draw_download_id, 0);
					}
					else
					{
						zero_defeats_level[thumbnail_index] = 0; /* Overwrite so it's 0 instead of undefined, so you don't check this level ID again */
					}
					
					ini_close();
				}
				else
				{
					finished_level[thumbnail_index] = 0; /* Overwrite so it's 0 instead of undefined, so you don't check this level ID again */
					zero_defeats_level[thumbnail_index] = 0; /* Overwrite so it's 0 instead of undefined, so you don't check this level ID again */
				}
			}
		}
		
		#region /* Display finished icon */
		if (is_array(finished_level))
		{
			if (finished_level[thumbnail_index] == 1) /* Only Played */
			{
				/* Player haven't reached the goal */
				var played_level_text = "Played";
				var played_level_icon = spr_icon_played;
				var played_level_color = c_yellow;
			}
			else
			if (finished_level[thumbnail_index] == 2) /* Played and finished */
			{
				/* Player haven't collected all the big collectibles */
				var played_level_text = "Finished";
				var played_level_icon = spr_icon_finished;
				var played_level_color = c_lime;
			}
			else
			if (finished_level[thumbnail_index] == 3) /* Finished and collected every big collectible */
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
			if (zero_defeats_level[thumbnail_index] == 1) /* Zero Defeats */
			{
				var zero_defeats_level_text = "Zero Defeats";
				var zero_defeats_level_icon = spr_icon_zero_defeats;
				var zero_defeats_level_color = c_red;
			}
			else
			if (zero_defeats_level[thumbnail_index] == 2) /* Zero Hits */
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
		if (liked_content[thumbnail_index] == undefined)
		{
			if (file_exists(game_save_id + "save_file/custom_" + string(content_type) + "_save.ini"))
			{
				ini_open(game_save_id + "save_file/custom_" + string(content_type) + "_save.ini");
				
				/* See if the online content has already been liked or disliked by you or not */
				if (ini_key_exists("liked_downloaded_" + string(content_type), draw_download_id))
				{
					liked_content[thumbnail_index] = ini_read_real("liked_downloaded_" + string(content_type), draw_download_id, 0);
				}
				else
				{
					liked_content[thumbnail_index] = 0; /* Overwrite so it's false instead of undefined, so you don't check this variable again */
				}
				
				ini_close();
			}
			else
			{
				liked_content[thumbnail_index] = 0; /* Overwrite so it's false instead of undefined, so you don't check this variable again */
			}
		}
	}
	if (is_array(liked_content))
	{
		if (liked_content[thumbnail_index] == +1) /* You have liked the content */
		{
			var liked_content_text = "Liked";
			var liked_content_icon = spr_icon_liked;
			var liked_content_color = c_aqua;
		}
		else
		if (liked_content[thumbnail_index] == -1) /* You have disliked the content */
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