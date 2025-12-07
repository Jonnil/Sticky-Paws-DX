/// @function scr_draw_online_download_list_thumbnail()
/// @description Draws a single download thumbnail along with its overlay information only if within the view.
function scr_draw_online_download_list_thumbnail(thumbnail_index, number_of_thumbnails)
{
	if (in_online_download_list_menu)
	{
		/* Ensure list data exists and index is sane before any array access */
		var _list_data = variable_global_get("online_content_data_" + string(content_type));
		if (!is_array(_list_data))
		{
			return;
		}
		
		var _total_items = array_length(_list_data);
		if (_total_items <= 0
		|| thumbnail_index < 0
		|| thumbnail_index >= _total_items)
		{
			return;
		}
		
		/* PAGINATION SLICE */
		var perPage        = global.download_items_per_page;
		var page        = clamp(global.download_current_page, 0, global.download_total_pages - 1);
		var start_idx    = page * perPage;
		var total        = _total_items;
		
		var end_idx        = min(start_idx + perPage - 1, total - 1);
		var page_count    = end_idx - start_idx + 1;
		
		/* Skip any thumbnail not on this page */
		if (thumbnail_index < start_idx
		|| thumbnail_index > end_idx)
		{
			return;
		}
		
		/* Convert global index into a local "slot" (0...page_count-1) */
		var slot = thumbnail_index - start_idx;
		
		/* Pre-calculate common GUI and offset values */
		var guiWidth = display_get_gui_width();
		var halfWidth = guiWidth * 0.5;
		var download_online_x = halfWidth - 300;
		var download_online_y = 80 + (300 * slot); /* Use 'slot' here instead of thumbnail_index */
		var offsetY = menu_y_offset; /* Cache menu_y_offset */
		var baseY = offsetY + download_online_y;
		var can_thumbnail = true;
		var draw_thumbnail = spr_thumbnail_missing; /* Fallback: use your "missing" sprite */
		
		if (global.debug_screen)
		{
			draw_set_halign(fa_right);
			scr_draw_text_outlined(download_online_x, baseY + 100, "baseY = " + string(baseY) + "\n" +
			"draw_thumbnail = global.spr_download_list_thumbnail[" + string(thumbnail_index) + "]\n(" + string(global.spr_download_list_thumbnail[thumbnail_index]) + ")", 0.5)
		}
		
		/* Only draw if the thumbnail is within the visible GUI view */
		/* Assuming the thumbnail area height is 300 */
		if ((baseY + 300 < 0)
		|| (baseY > display_get_gui_height()))
		{
			can_thumbnail = false;
		}
		
		/* Determine if this thumbnail is currently selected */
		var thumbID = "download_online_" + string(thumbnail_index);
		var isSelected = (menu == thumbID);
		
		#region /* Draw Bottom Line for Last Thumbnail */
		if (slot == page_count - 1
		&& can_thumbnail)
		{
			draw_line_width_color(30, baseY + 300, guiWidth - 30, baseY + 300, 7, c_black, c_black);
			draw_line_width_color(32, baseY + 300, guiWidth - 32, baseY + 300, 3, c_white, c_white);
		}
		#endregion /* Draw Bottom Line for Last Thumbnail END */
		
		var content_bottom_y_at_offset0 = 80 + (300 * page_count)
		menu_y_offset_real = clamp(menu_y_offset_real, display_get_gui_height() -abs(content_bottom_y_at_offset0) - 80, 0); /* Online Download List Menu Offset Stopper */
		
		#region /* Draw Selection Overlay if Selected */
		if (isSelected)
		&& (can_thumbnail)
		{
			/* Cache wave values to reduce function calls */
			var waveArrow = scr_wave(10, 0, 1, 0);
			var waveBlink = scr_wave(1, 0, 2, 0);

			/* Calculate thumbnail boundaries */
			var topLeftX = download_online_x + 96;  /* (download_online_x + 100 - 4) */
			var topLeftY = download_online_y - 4;
			var bottomRightX = download_online_x + 488; /* (download_online_x + 484 + 4) */
			var bottomRightY = download_online_y + offsetY + 220; /* (download_online_y + menu_y_offset + 216 + 4) */

			/* Pre-calculate offsets for triangles */
			var topLeftXOffset = topLeftX - waveArrow;
			var topLeftYOffset = topLeftY + offsetY - waveArrow;
			var bottomRightXOffset = bottomRightX + waveArrow;
			var bottomRightYOffset = bottomRightY + waveArrow;
			var triangleSize = 32 - waveArrow;

			/* Draw a translucent rounded rectangle outline */
			var alphaWave = scr_wave(0.1, 0.2, 3, 0);
			draw_set_alpha(alphaWave);
			draw_roundrect_color_ext(topLeftX - 16, topLeftY + offsetY - 16, bottomRightX + 16, bottomRightY + 64, 50, 50, c_white, c_white, false);

			/* Reset alpha and draw selection rectangles */
			draw_set_alpha(1);
			draw_rectangle_color(topLeftX, topLeftY + offsetY, bottomRightX, bottomRightY, c_red, c_red, c_red, c_red, false);
			draw_set_alpha(waveBlink);
			draw_rectangle_color(topLeftX, topLeftY + offsetY, bottomRightX, bottomRightY, c_yellow, c_yellow, c_yellow, c_yellow, false);
			draw_set_alpha(1);
		}
		#endregion /* Draw Selection Overlay if Selected END */

		#region /* Draw Thumbnail Sprite */
		/* Only try to pull from it if it really is an array, and index is in range */
		if (is_array(global.spr_download_list_thumbnail)
		&& thumbnail_index >= 0
		&& thumbnail_index < array_length(global.spr_download_list_thumbnail))
		{
			draw_thumbnail = global.spr_download_list_thumbnail[thumbnail_index];
		}

		if (sprite_exists(draw_thumbnail))
		&& (can_thumbnail)
		{
			var scaleX = 384 / sprite_get_width(draw_thumbnail);
			var scaleY = 216 / sprite_get_height(draw_thumbnail);
			draw_sprite_ext(draw_thumbnail, 0, download_online_x + 100, download_online_y + offsetY, scaleX, scaleY, 0, c_white, 1);
		}
		#endregion /* Draw Thumbnail Sprite END */

		#region /* Draw Download Name */
		if (is_array(global.draw_download_name)
		&& thumbnail_index >= 0
		&& thumbnail_index < array_length(global.draw_download_name)
		&& can_thumbnail)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			var nameWidth = string_width(global.draw_download_name[thumbnail_index]);
			var draw_level_name_scale;

			if (nameWidth > 640)
			{
				draw_level_name_scale = global.default_text_size * 0.6;
			}
			else
			if (nameWidth > 320)
			{
				draw_level_name_scale = global.default_text_size * 0.8;
			}
			else
			{
				draw_level_name_scale = global.default_text_size;
			}

			scr_draw_text_outlined(download_online_x + 300, download_online_y + offsetY + 240, string(global.draw_download_name[thumbnail_index]), draw_level_name_scale, c_menu_outline, c_menu_fill, 1);

			/* Loading Indicator for Missing Thumbnail */
			if (draw_thumbnail == spr_thumbnail_missing
			&& global.draw_download_name[thumbnail_index] == "")
			{
				scr_draw_loading(1, download_online_x + 300, download_online_y + offsetY + 100);
			}
		}
		#endregion /* Draw Download Name END */

		#region /* Draw Selection Triangles */
		if (isSelected)
		&& (can_thumbnail)
		{
			draw_triangle_color(topLeftXOffset, topLeftYOffset, topLeftXOffset + triangleSize, topLeftYOffset,
				topLeftXOffset, topLeftYOffset + triangleSize, c_red, c_red, c_red, false);
			draw_triangle_color(bottomRightXOffset, bottomRightYOffset, bottomRightXOffset - triangleSize, bottomRightYOffset,
				bottomRightXOffset, bottomRightYOffset - triangleSize, c_red, c_red, c_red, false);
			draw_triangle_color(bottomRightXOffset, topLeftYOffset, bottomRightXOffset - triangleSize, topLeftYOffset,
				bottomRightXOffset, topLeftYOffset + triangleSize, c_red, c_red, c_red, false);
			draw_triangle_color(topLeftXOffset, bottomRightYOffset, topLeftXOffset + triangleSize, bottomRightYOffset,
				topLeftXOffset, bottomRightYOffset - triangleSize, c_red, c_red, c_red, false);

			draw_set_alpha(waveBlink);
			draw_triangle_color(topLeftXOffset, topLeftYOffset, topLeftXOffset + triangleSize, topLeftYOffset,
				topLeftXOffset, topLeftYOffset + triangleSize, c_yellow, c_yellow, c_yellow, false);
			draw_triangle_color(bottomRightXOffset, bottomRightYOffset, bottomRightXOffset - triangleSize, bottomRightYOffset,
				bottomRightXOffset, bottomRightYOffset - triangleSize, c_yellow, c_yellow, c_yellow, false);
			draw_triangle_color(bottomRightXOffset, topLeftYOffset, bottomRightXOffset - triangleSize, topLeftYOffset,
				bottomRightXOffset, topLeftYOffset + triangleSize, c_yellow, c_yellow, c_yellow, false);
			draw_triangle_color(topLeftXOffset, bottomRightYOffset, topLeftXOffset + triangleSize, bottomRightYOffset,
				topLeftXOffset, bottomRightYOffset - triangleSize, c_yellow, c_yellow, c_yellow, false);
			draw_set_alpha(1);
		}
		#endregion /* Draw Selection Triangles END */

		#region /* Mouse Navigation */
		if (global.controls_used_for_navigation == "mouse"
			&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
				download_online_x + 100 - 16, download_online_y + offsetY - 16,
				download_online_x + 484 + 16, download_online_y + offsetY + 216 + 62)
			&& (_total_items > 0))
		{
			if (!isSelected)
			{
				menu = thumbID;
			}
		}
		#endregion /* Mouse Navigation END */
		
		#region /* Process Download ID and Time */
		var item = _list_data[thumbnail_index];
		var draw_download_id = item.name;
		draw_download_id = string_replace(draw_download_id, string(content_type) + "s/", "");
		draw_download_id = string_replace(draw_download_id, ".zip", "");
		var draw_download_time = string_replace(item.time_created, "T", " ");
		draw_download_time = string_replace(draw_download_time, "Z", "");

		if (is_array(all_download_id)
		&& thumbnail_index >= 0
		&& thumbnail_index < array_length(all_download_id))
		{
			if (all_download_id[thumbnail_index] == "")
			{
				all_download_id[thumbnail_index] = draw_download_id;
				show_debug_message("[scr_draw_online_download_list_thumbnail] all_download_id[" + string(thumbnail_index) + "] = " + string(draw_download_id) + ";");
			}
		}
		#endregion /* Process Download ID and Time END */

		#region /* Handle Thumbnail Hover and Download on Selection */
		if (isSelected)
		{
			currently_selected_id = draw_download_id;

			if (global.controls_used_for_navigation != "mouse")
			{
				menu_cursor_y_position = 64 + download_online_y;
			}

			var selected_download_c_menu_fill = c_lime;
			global.selected_online_download_index = thumbnail_index;

			if (key_a_pressed
			|| (mouse_check_button_released(mb_left)
				&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
					download_online_x + 100, download_online_y + offsetY,
					download_online_x + 484, download_online_y + offsetY + 216)))
			{
				if (menu_delay == 0
				&& menu_joystick_delay == 0)
				{
					global.automatically_play_downloaded_level = false;
					global.use_temp_or_working = game_save_id;
					global.search_id = string_upper(draw_download_id);
					keyboard_string = string_upper(draw_download_id);
					search_id = string_upper(draw_download_id);
					automatically_search_for_id = true;
					in_online_download_list_menu = false; show_debug_message("[scr_draw_online_download_list_thumbnail] 'In online download list menu' is set to false");

					#region /* Set Thumbnail for Download Menu */
					/* Before you do the 'sprite exists' check, compute your index */
					var idx = global.selected_online_download_index;

					/* Make sure the thumbnail array exists and idx is valid */
					if (is_array(global.spr_download_list_thumbnail)
					&& idx >= 0
					&& idx < array_length(global.spr_download_list_thumbnail)
					&& sprite_exists(global.spr_download_list_thumbnail[idx])
					&& global.spr_download_list_thumbnail[idx] != spr_thumbnail_missing)
					{
						downloaded_thumbnail_sprite = global.spr_download_list_thumbnail[idx];
					}
					else
					{
						downloaded_thumbnail_sprite = noone;
					}
					#endregion /* Set Thumbnail for Download Menu END */

					menu = "search_id_ok";
				}
			}
		}
		else
		{
			var selected_download_c_menu_fill = c_gray;
		}
		#endregion /* Handle Thumbnail Hover and Download on Selection END */

		#region /* Display Index and Download ID */
		if (can_thumbnail)
		{
			draw_set_halign(fa_right);
			scr_draw_text_outlined(
				download_online_x + 70,
				110 + download_online_y + offsetY,
				string(thumbnail_index + 1),
				global.default_text_size * 0.75,
				c_menu_outline,
				selected_download_c_menu_fill,
				0.5
			);

			draw_set_halign(fa_left);
			scr_draw_text_outlined(
				download_online_x + 108,
				20 + download_online_y + offsetY,
				string(draw_download_id),
				global.default_text_size * 0.75,
				c_menu_outline,
				selected_download_c_menu_fill,
				1
			);
		}
		#endregion /* Display Index and Download ID END */

		#region /* Display Finished Level Status */
		if (content_type == "level")
		&& (can_thumbnail)
		{
			if (variable_instance_exists(self, "finished_level") && is_array(finished_level))
			{
				if (finished_level[thumbnail_index] == undefined)
				{
					if (file_exists(game_save_id + "save_file/custom_level_save.ini"))
					{
						ini_open(game_save_id + "save_file/custom_level_save.ini");
						finished_level[thumbnail_index] = (ini_key_exists("finished_downloaded_level", draw_download_id)) ?
							ini_read_real("finished_downloaded_level", draw_download_id, 0) : 0;
						zero_defeats_level[thumbnail_index] = (ini_key_exists("zero_defeats_downloaded_level", draw_download_id)) ?
							ini_read_real("zero_defeats_downloaded_level", draw_download_id, 0) : 0;
						ini_close();
					}
					else
					{
						finished_level[thumbnail_index] = 0;
						zero_defeats_level[thumbnail_index] = 0;
					}
				}
			}

			#region /* Display Finished Icon */
			if (variable_instance_exists(self, "finished_level") && is_array(finished_level))
			{
				var played_level_text, played_level_icon, played_level_color;

				if (finished_level[thumbnail_index] == 1)
				{
					played_level_text = "Played";
					played_level_icon = spr_icon_played;
					played_level_color = c_yellow;
				}
				else
				if (finished_level[thumbnail_index] == 2)
				{
					played_level_text = "Finished";
					played_level_icon = spr_icon_finished;
					played_level_color = c_green;
				}
				else
				if (finished_level[thumbnail_index] == 3)
				{
					played_level_text = "Completed";
					played_level_icon = spr_icon_finished;
					played_level_color = c_lime;
				}
				else
				{
					played_level_text = "Unplayed";
					played_level_icon = spr_icon_unplayed;
					played_level_color = c_red;
				}

				if (sprite_exists(played_level_icon))
				{
					draw_sprite_ext(played_level_icon, 0, download_online_x + 524, 32 + download_online_y + offsetY, 1, 1, 0, c_white, 1);
				}

				scr_draw_text_outlined(download_online_x + 548, 32 + download_online_y + offsetY, l10n_text(played_level_text), global.default_text_size, c_menu_outline, played_level_color, 1);
			}
			#endregion /* Display Finished Icon END */

			#region /* Display Zero Defeats Icon */
			if (variable_instance_exists(self, "zero_defeats_level") && is_array(zero_defeats_level))
			{
				var zero_defeats_level_text, zero_defeats_level_icon, zero_defeats_level_color;

				if (zero_defeats_level[thumbnail_index] == 1)
				{
					zero_defeats_level_text = "Zero Defeats";
					zero_defeats_level_icon = spr_icon_zero_defeats;
					zero_defeats_level_color = c_red;
				}
				else
				if (zero_defeats_level[thumbnail_index] == 2)
				{
					zero_defeats_level_text = "Zero Hits";
					zero_defeats_level_icon = spr_icon_zero_hits;
					zero_defeats_level_color = c_lime;
				}
				else
				{
					zero_defeats_level_text = "";
					zero_defeats_level_icon = spr_noone;
					zero_defeats_level_color = c_red;
				}

				if (zero_defeats_level_text != "")
				{
					if (sprite_exists(zero_defeats_level_icon))
					{
						draw_sprite_ext(zero_defeats_level_icon, 0, download_online_x + 524, 64 + download_online_y + offsetY, 1, 1, 0, c_white, 1);
					}

					scr_draw_text_outlined(
						download_online_x + 548, 64 + download_online_y + offsetY,
						l10n_text(zero_defeats_level_text),
						global.default_text_size,
						c_menu_outline,
						zero_defeats_level_color,
						1
					);
				}
			}
			#endregion /* Display Zero Defeats Icon END */

		}
		#endregion /* Display Finished Level Status END */

		#region /* Display Like/Dislike Status */
		if (variable_instance_exists(self, "liked_content") && is_array(liked_content))
		{
			if (liked_content[thumbnail_index] == undefined)
			{
				if (file_exists(game_save_id + "save_file/custom_" + string(content_type) + "_save.ini"))
				{
					ini_open(game_save_id + "save_file/custom_" + string(content_type) + "_save.ini");
					liked_content[thumbnail_index] = (ini_key_exists("liked_downloaded_" + string(content_type), draw_download_id)) ?
						ini_read_real("liked_downloaded_" + string(content_type), draw_download_id, 0) : 0;
					ini_close();
				}
				else
				{
					liked_content[thumbnail_index] = 0;
				}
			}
		}

		if (variable_instance_exists(self, "liked_content") && is_array(liked_content))
		&& (can_thumbnail)
		{
			var liked_content_text, liked_content_icon, liked_content_color;

			if (liked_content[thumbnail_index] == +1)
			{
				liked_content_text = "Liked";
				liked_content_icon = spr_icon_liked;
				liked_content_color = c_aqua;
			}
			else
			if (liked_content[thumbnail_index] == -1)
			{
				liked_content_text = "Disliked";
				liked_content_icon = spr_icon_disliked;
				liked_content_color = c_red;
			}
			else
			{
				liked_content_text = "";
				liked_content_icon = spr_noone;
				liked_content_color = c_white;
			}

			if (liked_content_text != "")
			{
				if (sprite_exists(liked_content_icon))
				{
					draw_sprite_ext(liked_content_icon, 0, download_online_x + 524, 32 + download_online_y + offsetY, 1, 1, 0, c_white, 1);
				}

				scr_draw_text_outlined(download_online_x + 548, 32 + download_online_y + offsetY, l10n_text(liked_content_text), global.default_text_size, c_menu_outline, liked_content_color, 1);
			}
		}
		#endregion /* Display Like/Dislike Status END */

		if (can_thumbnail)
		{
			scr_draw_text_outlined(
				download_online_x + 100,
				270 + download_online_y + offsetY,
				string(scr_get_relative_timezone(draw_download_time)),
				global.default_text_size * 0.75,
				c_menu_outline,
				selected_download_c_menu_fill,
				1
			);
			draw_set_halign(fa_right);
			scr_draw_text_outlined(
				download_online_x + 490,
				270 + download_online_y + offsetY,
				string(draw_download_time),
				global.default_text_size * 0.6,
				c_menu_outline,
				selected_download_c_menu_fill,
				0.9
			);
		}
	}
}
