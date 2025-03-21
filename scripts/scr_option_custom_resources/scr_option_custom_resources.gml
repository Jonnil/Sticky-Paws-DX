function scr_option_custom_resources()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var title_bg_layer_max = 3;
	
	if (global.settings_sidebar_menu == "custom_resources_settings")
	{
		if (sprite_exists(global.title_logo_index))
		{
			draw_sprite_ext(
			global.title_logo_index,
			image_index,
			display_get_gui_width() - 200,
			display_get_gui_height() - 150,
			(202 / sprite_get_height(global.title_logo_index)),
			(202 / sprite_get_height(global.title_logo_index)),
			0,
			c_white,
			1);
		}
		
		if (ds_list_size(global.all_loaded_resource_pack) >= 2)
		&& (!global.enable_option_for_pc)
		|| (global.enable_option_for_pc)
		{
			var resource_pack_y = 40 + menu_y_offset;
			var open_resource_pack_y = 40 * 3 + menu_y_offset;
			var custom_title_layer_y = 40 * 5 + menu_y_offset;
			var custom_title_background_y = 40 * 6 + menu_y_offset;
			var custom_title_background_scale_y = 40 * 8 + menu_y_offset;
			var background_layer_x_scroll_y = 40 * 9 + menu_y_offset;
			var background_layer_y_scroll_y = 40 * 10 + menu_y_offset;
			var custom_title_background_open_y = 40 * 11 + menu_y_offset;
			var custom_title_logo_y = 40 * 13 + menu_y_offset;
			var custom_title_logo_open_y = 40 * 15 + menu_y_offset;
			var can_load_custom_level_assets_y = 40 * 16 + 32 + menu_y_offset;
			menu_cursor_y_position_end = 40 * 16 + 32;
		}
		else
		{
			var resource_pack_y = -999;
			var open_resource_pack_y = -999;
			var custom_title_layer_y = 40 + menu_y_offset;
			var custom_title_background_y = 40 * 2 + menu_y_offset;
			var custom_title_background_scale_y = 40 * 4 + menu_y_offset;
			var background_layer_x_scroll_y = 40 * 5 + menu_y_offset;
			var background_layer_y_scroll_y = 40 * 6 + menu_y_offset;
			var custom_title_background_open_y = 40 * 7 + menu_y_offset;
			var custom_title_logo_y = 40 * 9 + menu_y_offset;
			var custom_title_logo_open_y = 40 * 11 + menu_y_offset;
			var can_load_custom_level_assets_y = 40 * 12 + 32 + menu_y_offset;
			menu_cursor_y_position_end = 40 * 12 + 32;
		}
		
		if (key_up)
		&& (!can_navigate_settings_sidebar)
		&& (menu_delay == 0
		&& menu_joystick_delay == 0)
		{
			menu_delay = 3;
			
			if (menu == "resource_pack")
			{
				menu = "can_load_custom_level_assets";
			}
			else
			if (menu == "open_resource_pack_folder")
			{
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				&& (!global.enable_option_for_pc)
				|| (global.enable_option_for_pc)
				{
					menu = "resource_pack";
					menu_cursor_y_position = 0;
				}
				else
				{
					menu = "can_load_custom_level_assets";
				}
			}
			else
			if (menu == "title_background_layer")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_resource_pack_folder";
				}
				else
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				&& (!global.enable_option_for_pc)
				|| (global.enable_option_for_pc)
				{
					menu = "resource_pack";
					menu_cursor_y_position = 0;
				}
				else
				{
					menu = "can_load_custom_level_assets";
				}
			}
			else
			if (menu == "title_background")
			{
				menu = "title_background_layer";
				menu_cursor_y_position = custom_title_layer_y;
			}
			else
			if (menu == "title_background_scale")
			{
				menu = "title_background";
			}
			else
			if (menu == "background_layer_x_scroll")
			{
				menu = "title_background_scale";
			}
			else
			if (menu == "background_layer_y_scroll")
			{
				menu = "background_layer_x_scroll";
			}
			else
			if (menu == "open_title_background_folder")
			{
				menu = "background_layer_y_scroll";
			}
			else
			if (menu == "title_logo")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_title_background_folder";
				}
				else
				{
					menu = "background_layer_y_scroll";
				}
			}
			else
			if (menu == "open_title_logo_folder")
			{
				menu = "title_logo";
			}
			else
			if (menu == "can_load_custom_level_assets")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_title_logo_folder";
				}
				else
				{
					menu = "title_logo";
				}
			}
		}
		else
		if (key_down)
		&& (!can_navigate_settings_sidebar)
		&& (menu_delay == 0
		&& menu_joystick_delay == 0)
		{
			menu_delay = 3;
			
			if (menu == "resource_pack")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_resource_pack_folder";
				}
				else
				{
					menu = "title_background_layer";
					menu_cursor_y_position = custom_title_layer_y;
				}
			}
			else
			if (menu == "open_resource_pack_folder")
			{
				menu = "title_background_layer";
				menu_cursor_y_position = custom_title_layer_y;
			}
			else
			if (menu == "title_background_layer")
			{
				menu = "title_background";
			}
			else
			if (menu == "title_background")
			{
				menu = "title_background_scale";
			}
			else
			if (menu == "title_background_scale")
			{
				menu = "background_layer_x_scroll";
			}
			else
			if (menu == "background_layer_x_scroll")
			{
				menu = "background_layer_y_scroll";
			}
			else
			if (menu == "background_layer_y_scroll")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_title_background_folder";
				}
				else
				{
					menu = "title_logo";
				}
			}
			else
			if (menu == "open_title_background_folder")
			{
				menu = "title_logo";
			}
			else
			if (menu == "title_logo")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_title_logo_folder";
				}
				else
				{
					menu = "can_load_custom_level_assets";
				}
			}
			else
			if (menu == "open_title_logo_folder")
			{
				menu = "can_load_custom_level_assets";
			}
			else
			if (menu == "can_load_custom_level_assets")
			{
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				&& (!global.enable_option_for_pc)
				|| (global.enable_option_for_pc)
				{
					menu = "resource_pack";
					menu_cursor_y_position = 0;
				}
				else
				{
					menu = "title_background_layer";
					menu_cursor_y_position = custom_title_layer_y;
				}
			}
		}
		
		#region /* Custom Resource Packs */
		var resource_pack_x = 450;
		var resource_pack_right_arrow_x = 450;
		
		if (ds_list_size(global.all_loaded_resource_pack) >= 2)
		&& (!global.enable_option_for_pc)
		|| (global.enable_option_for_pc)
		{
			if (global.selected_resource_pack > ds_list_size(global.all_loaded_resource_pack) - 1)
			{
				global.selected_resource_pack = ds_list_size(global.all_loaded_resource_pack) - 1;
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "select_resource_pack", global.selected_resource_pack);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
			
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			
			scr_draw_text_outlined(resource_pack_x, 20 + (resource_pack_y), l10n_text("Resource Pack") + ": " + string(global.selected_resource_pack + 1) + "/" + string(ds_list_size(global.all_loaded_resource_pack)), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			/* Draw text of what the file is called */
			scr_draw_text_outlined(resource_pack_x, 20 + (resource_pack_y + 40), string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)), global.default_text_size * 1.1, c_menu_outline, c_dkgray, 1);
			
			if (global.selected_resource_pack > 0)
			&& (global.pause_room != rm_leveleditor)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (resource_pack_y), 0.5, 0.5, 0, c_white, 1);
				
				if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (resource_pack_y) - 16, resource_pack_x - 32 + 16, 20 + (resource_pack_y) + 16))
				&& (global.controls_used_for_navigation == "mouse")
				{
					menu = "resource_pack";
					menu_cursor_y_position = 0;
					can_navigate_settings_sidebar = false;
					draw_set_alpha(0.5);
					draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (resource_pack_y) - 16, resource_pack_x - 32 + 16, 20 + (resource_pack_y) + 16, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
			}
			
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack + 1)) + "/data/sprite_origin_point.ini"))
			&& (global.pause_room != rm_leveleditor)
			|| (file_exists(game_save_id + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack + 1)) + "/data/sprite_origin_point.ini"))
			&& (global.pause_room != rm_leveleditor)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (resource_pack_y), 0.5, 0.5, 0, c_white, 1);
				
				if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (resource_pack_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (resource_pack_y) + 16))
				&& (global.controls_used_for_navigation == "mouse")
				{
					menu = "resource_pack";
					menu_cursor_y_position = 0;
					can_navigate_settings_sidebar = false;
					draw_set_alpha(0.5);
					draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (resource_pack_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (resource_pack_y) + 16, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
			}
			
			if (menu == "resource_pack")
			{
				draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x - 32 - 32, 20 + (resource_pack_y));
			}
			
			if (key_left)
			&& (!can_navigate_settings_sidebar)
			&& (menu == "resource_pack")
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (resource_pack_y) - 16, resource_pack_x - 32 + 16, 20 + (resource_pack_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "resource_pack";
				menu_cursor_y_position = 0;
				
				if (menu_delay == 0
				&& menu_joystick_delay == 0)
				&& (!can_navigate_settings_sidebar)
				&& (global.selected_resource_pack > 0)
				&& (global.pause_room != rm_leveleditor)
				{
					menu_delay = 3;
					global.selected_resource_pack --;
					ini_open(game_save_id + "save_file/config.ini");
					ini_write_real("config", "select_resource_pack", global.selected_resource_pack);
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				}
			}
			else
			if (key_right)
			&& (!can_navigate_settings_sidebar)
			&& (menu == "resource_pack")
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (resource_pack_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (resource_pack_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "resource_pack";
				menu_cursor_y_position = 0;
				
				if (menu_delay == 0
				&& menu_joystick_delay == 0)
				&& (!can_navigate_settings_sidebar)
				&& (file_exists(game_save_id + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack + 1)) + "/data/sprite_origin_point.ini"))
				&& (global.pause_room != rm_leveleditor)
				{
					menu_delay = 3;
					global.selected_resource_pack ++;
					ini_open(game_save_id + "save_file/config.ini");
					ini_write_real("config", "select_resource_pack", global.selected_resource_pack);
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				}
			}
		}
		#endregion /* Custom Resource Packs END */
		
		if (global.enable_open_custom_folder)
		{
			draw_menu_button(resource_pack_x, 20 + (open_resource_pack_y), l10n_text("Open Resource Pack Folder"), "open_resource_pack_folder", "open_resource_pack_folder");
			draw_sprite_ext(spr_icon_folder, 0, resource_pack_x + 16, 20 + (open_resource_pack_y) + 21, 1, 1, 0, c_white, 1);
		}
		
		if (os_type == os_macosx)
		{
			var add_number = -1; /* For some reason I need to do this for Mac to make the numbers correct on both Mac and PC */
		}
		else
		{
			var add_number = 0;
		}
		
		#region /* Custom Title Background */
		
		#region /* Make the layer blink so you can see easier which layer is actually selected */
		if (menu == "title_background_layer")
		|| (menu == "title_background")
		{
			if (title_bg_layer == 1)
			{
				title_background_blink[1] = 1;
				title_background_blink[2] = 0;
				title_background_blink[3] = 0;
			}
			else
			if (title_bg_layer == 2)
			{
				title_background_blink[1] = 1;
				title_background_blink[2] = scr_wave(0.5, 5, 2);
				title_background_blink[3] = 0;
			}
			else
			if (title_bg_layer == 3)
			{
				title_background_blink[1] = 1;
				title_background_blink[2] = 1;
				title_background_blink[3] = scr_wave(0.5, 5, 2);
			}
		}
		else
		{
			title_background_blink[1] = 1;
			title_background_blink[2] = 1;
			title_background_blink[3] = 1;
		}
		#endregion /* Make the layer blink so you can see easier which layer is actually selected END */
		
		#region /* Custom Title Background Layer */
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_layer_y), l10n_text("Background Layer") + ": " + string(title_bg_layer), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		
		if (title_bg_layer > 1)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (custom_title_layer_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_layer_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_layer_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "title_background_layer";
				menu_cursor_y_position = custom_title_layer_y;
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (custom_title_layer_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_layer_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (title_bg_layer < title_bg_layer_max)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (custom_title_layer_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_layer_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_layer_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "title_background_layer";
				menu_cursor_y_position = custom_title_layer_y;
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_layer_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_layer_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (menu == "title_background_layer")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x - 32 - 32, 20 + (custom_title_layer_y));
		}
		
		if (key_left)
		&& (menu == "title_background_layer")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_layer_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_layer_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "title_background_layer";
			menu_cursor_y_position = custom_title_layer_y;
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (title_bg_layer > 1)
			{
				menu_delay = 3;
				
				if (keyboard_check(vk_control))
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				{
					title_bg_layer -= 10;
				}
				else
				{
					title_bg_layer -= 1;
				}
			}
		}
		
		if (key_right)
		&& (menu == "title_background_layer")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_layer_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_layer_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "title_background_layer";
			menu_cursor_y_position = custom_title_layer_y;
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (title_bg_layer < title_bg_layer_max)
			{
				menu_delay = 3;
				
				if (keyboard_check(vk_control))
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				{
					title_bg_layer += 10;
				}
				else
				{
					title_bg_layer += 1;
				}
			}
		}
		title_bg_layer = clamp(title_bg_layer, 1, 3); /* Only allow 3 Title Background Layers */
		#endregion /* Custom Title Background Layer END */
		
		
		
		
		
		#region /* Select Custom Title Background */
		if (global.selected_title_background[title_bg_layer] > ds_list_size(global.all_loaded_title_backgrounds) - 1)
		{
			global.selected_title_background[title_bg_layer] = ds_list_size(global.all_loaded_title_backgrounds) - 1;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("config", "select_title_background" + string(title_bg_layer), global.selected_title_background[title_bg_layer]);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_background_y), l10n_text("Title Background") + " " + string(title_bg_layer) + ": " + string(global.selected_title_background[title_bg_layer] + 1) + "/" + string(ds_list_size(global.all_loaded_title_backgrounds) + add_number), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		/* Draw text of what the file is called */ scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_background_y + 40), string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer])), global.default_text_size * 1.1, c_menu_outline, c_dkgray, 1);
		
		if (global.selected_title_background[title_bg_layer] > -1)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (custom_title_background_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_background_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_background_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "title_background";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (custom_title_background_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_background_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1))))
		&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1) != undefined)
		&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1) != "")
		|| (file_exists(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1))))
		&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1) != undefined)
		&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1) != "")
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (custom_title_background_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "title_background";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (menu == "title_background")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x - 32 - 32, 20 + (custom_title_background_y));
		}
		
		if (key_left)
		&& (menu == "title_background")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_background_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_background_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "title_background";
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (global.selected_title_background[title_bg_layer] > -1)
			{
				menu_delay = 3;
				
				if (keyboard_check(vk_control))
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				{
					global.selected_title_background[title_bg_layer] -= 10;
				}
				else
				{
					global.selected_title_background[title_bg_layer] --;
				}
				if (global.selected_title_background[title_bg_layer] <= -1)
				{
					global.selected_title_background[title_bg_layer] = -1;
				}
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "select_title_background" + string(title_bg_layer), global.selected_title_background[title_bg_layer]);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				
				if (variable_instance_exists(self, "title_screen_background"))
				&& (variable_instance_exists(self, "title_bg_layer"))
				{
					if (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer]))))
					{
						scr_delete_sprite_properly(title_screen_background[title_bg_layer]);
						title_screen_background[title_bg_layer] = sprite_add("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer])), 0, false, false, 0, 0);
						layer_background_visible(layer_background_get_id(layer_get_id("Background" + string(title_bg_layer))), true);
					}
					else
					if (file_exists(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer]))))
					{
						scr_delete_sprite_properly(title_screen_background[title_bg_layer]);
						title_screen_background[title_bg_layer] = sprite_add(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer])), 0, false, false, 0, 0);
						layer_background_visible(layer_background_get_id(layer_get_id("Background" + string(title_bg_layer))), true);
					}
					else
					{
						title_screen_background[title_bg_layer] = spr_noone;
						layer_background_visible(layer_background_get_id(layer_get_id("Background" + string(title_bg_layer))), false);
					}
				}
			}
			
			if (room == rm_title)
			&& (variable_instance_exists(self, "title_screen_background"))
			&& (variable_instance_exists(self, "title_bg_layer"))
			&& (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background" + string(title_bg_layer)))) != title_screen_background[title_bg_layer])
			{
				layer_background_sprite(layer_background_get_id(layer_get_id("Background" + string(title_bg_layer))), title_screen_background[title_bg_layer]);
			}
		}
		if (key_right)
		&& (menu == "title_background")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "title_background";
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1))))
			&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1) != undefined)
			&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1) != "")
			|| (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (file_exists(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1))))
			&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1) != undefined)
			&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer] + 1) != "")
			{
				menu_delay = 3;
				if (keyboard_check(vk_control))
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				{
					global.selected_title_background[title_bg_layer] += 10;
					if (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer]) = undefined)
					&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer]) = "")
					{
						global.selected_title_background[title_bg_layer] --;
					}
				}
				else
				{
					global.selected_title_background[title_bg_layer] ++;
					if (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer]) = undefined)
					&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer]) = "")
					{
						global.selected_title_background[title_bg_layer] --;
					}
				}
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "select_title_background" + string(title_bg_layer), global.selected_title_background[title_bg_layer]);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				
				if (variable_instance_exists(self, "title_screen_background"))
				&& (variable_instance_exists(self, "title_bg_layer"))
				{
					if (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer]))))
					{
						scr_delete_sprite_properly(title_screen_background[title_bg_layer]);
						title_screen_background[title_bg_layer] = sprite_add("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer])), 0, false, false, 0, 0);
						layer_background_visible(layer_background_get_id(layer_get_id("Background" + string(title_bg_layer))), true);
					}
					else
					if (file_exists(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer]))))
					{
						scr_delete_sprite_properly(title_screen_background[title_bg_layer]);
						title_screen_background[title_bg_layer] = sprite_add(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[title_bg_layer])), 0, false, false, 0, 0);
						layer_background_visible(layer_background_get_id(layer_get_id("Background" + string(title_bg_layer))), true);
					}
					else
					{
						title_screen_background[title_bg_layer] = spr_noone;
						layer_background_visible(layer_background_get_id(layer_get_id("Background" + string(title_bg_layer))), false);
					}
				}
			}
			
			if (room == rm_title)
			&& (variable_instance_exists(self, "title_screen_background"))
			&& (variable_instance_exists(self, "title_bg_layer"))
			&& (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background" + string(title_bg_layer)))) != title_screen_background[title_bg_layer])
			{
				layer_background_sprite(layer_background_get_id(layer_get_id("Background" + string(title_bg_layer))), title_screen_background[title_bg_layer]);
			}
		}
		#endregion /* Select Custom Title Background END */
		
		#region /* Other Custom Title Background Options */
		
		#region /* Custom Title Background Scale */
		var scale_increment = 0.01;
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_background_scale_y), l10n_text("Background Scale") + ": " + string(global.title_background_scale[title_bg_layer]), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
		if (global.title_background_scale[title_bg_layer] > scale_increment)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (custom_title_background_scale_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_background_scale_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "title_background_scale";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_background_scale_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (custom_title_background_scale_y), 0.5, 0.5, 0, c_white, 1);
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_scale_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "title_background_scale";
			can_navigate_settings_sidebar = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_scale_y) + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		
		if (menu == "title_background_scale")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x - 32 - 32, 20 + (custom_title_background_scale_y));
		}
		
		if (key_left)
		&& (menu == "title_background_scale")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_background_scale_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "title_background_scale";
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (global.title_background_scale[title_bg_layer] > scale_increment)
			{
				menu_delay = 3;
				
				if (keyboard_check(vk_control))
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				{
					global.title_background_scale[title_bg_layer] -= (scale_increment * 10);
				}
				else
				{
					global.title_background_scale[title_bg_layer] -= scale_increment;
				}
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "title_background_scale", global.title_background_scale[title_bg_layer]);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
		}
		
		if (key_right)
		&& (menu == "title_background_scale")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_scale_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "title_background_scale";
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			{
				menu_delay = 3;
				
				if (keyboard_check(vk_control))
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				{
					global.title_background_scale[title_bg_layer] += (scale_increment * 10);
				}
				else
				{
					global.title_background_scale[title_bg_layer] += scale_increment;
				}
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "title_background_scale", global.title_background_scale[title_bg_layer]);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
		}
		
		if (global.title_background_scale[title_bg_layer] <= 0)
		{
			global.title_background_scale[title_bg_layer] = 0.01;
		}
		#endregion /* Custom Title Background Scale END */
		
		#region /* Background Layer X Scroll */
		var scale_increment = 0.05;
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(resource_pack_x, 20 + (background_layer_x_scroll_y), l10n_text("Background Scroll X") + ": " + string(global.background_layer_x_scroll[title_bg_layer]), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
		if (global.background_layer_x_scroll[title_bg_layer] > - 10)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (background_layer_x_scroll_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x - 32 + 16, 20 + (background_layer_x_scroll_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "background_layer_x_scroll";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x - 32 + 16, 20 + (background_layer_x_scroll_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (global.background_layer_x_scroll[title_bg_layer] < + 10)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (background_layer_x_scroll_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_x_scroll_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "background_layer_x_scroll";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_x_scroll_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (menu == "background_layer_x_scroll")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x - 32 - 32, 20 + (background_layer_x_scroll_y));
		}
		
		if (key_left)
		&& (menu == "background_layer_x_scroll")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x - 32 + 16, 20 + (background_layer_x_scroll_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "background_layer_x_scroll";
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (global.background_layer_x_scroll[title_bg_layer] > - 10)
			{
				menu_delay = 3;
				
				if (keyboard_check(vk_control))
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				{
					global.background_layer_x_scroll[title_bg_layer] -= (scale_increment * 10);
				}
				else
				{
					global.background_layer_x_scroll[title_bg_layer] -= scale_increment;
				}
			}
		}
		
		if (key_right)
		&& (menu == "background_layer_x_scroll")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_x_scroll_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "background_layer_x_scroll";
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (global.background_layer_x_scroll[title_bg_layer] < + 10)
			{
				menu_delay = 3;
				
				if (keyboard_check(vk_control))
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				{
					global.background_layer_x_scroll[title_bg_layer] += (scale_increment * 10);
				}
				else
				{
					global.background_layer_x_scroll[title_bg_layer] += scale_increment;
				}
			}
		}
		#endregion /* Background Layer X Scroll END */
		
		#region /* Background Layer Y Scroll */
		var scale_increment = 0.05;
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(resource_pack_x, 20 + (background_layer_y_scroll_y), l10n_text("Background Scroll Y") + ": " + string(global.background_layer_y_scroll[title_bg_layer]), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
		if (global.background_layer_y_scroll[title_bg_layer] > - 10)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (background_layer_y_scroll_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x - 32 + 16, 20 + (background_layer_y_scroll_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "background_layer_y_scroll";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x - 32 + 16, 20 + (background_layer_y_scroll_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (global.background_layer_y_scroll[title_bg_layer] < + 10)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (background_layer_y_scroll_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_y_scroll_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "background_layer_y_scroll";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_y_scroll_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (menu == "background_layer_y_scroll")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x - 32 - 32, 20 + (background_layer_y_scroll_y));
		}
		
		if (key_left)
		&& (menu == "background_layer_y_scroll")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x - 32 + 16, 20 + (background_layer_y_scroll_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "background_layer_y_scroll";
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (global.background_layer_y_scroll[title_bg_layer] > - 10)
			{
				menu_delay = 3;
				
				if (keyboard_check(vk_control))
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				{
					global.background_layer_y_scroll[title_bg_layer] -= (scale_increment * 10);
				}
				else
				{
					global.background_layer_y_scroll[title_bg_layer] -= scale_increment;
				}
			}
		}
		
		if (key_right)
		&& (menu == "background_layer_y_scroll")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_y_scroll_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "background_layer_y_scroll";
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (global.background_layer_y_scroll[title_bg_layer] < + 10)
			{
				menu_delay = 3;
				
				if (keyboard_check(vk_control))
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				{
					global.background_layer_y_scroll[title_bg_layer] += (scale_increment * 10);
				}
				else
				{
					global.background_layer_y_scroll[title_bg_layer] += scale_increment;
				}
			}
		}
		#endregion /* Background Layer Y Scroll END */
		
		if (global.background_layer_x_scroll[title_bg_layer] > + 10)
		{
			global.background_layer_x_scroll[title_bg_layer] = + 10;
		}
		
		if (global.background_layer_x_scroll[title_bg_layer] < - 10)
		{
			global.background_layer_x_scroll[title_bg_layer] = - 10;
		}
		
		if (global.background_layer_y_scroll[title_bg_layer] > + 10)
		{
			global.background_layer_y_scroll[title_bg_layer] = + 10;
		}
		
		if (global.background_layer_y_scroll[title_bg_layer] < - 10)
		{
			global.background_layer_y_scroll[title_bg_layer] = - 10;
		}
		
		if (global.enable_open_custom_folder)
		{
			draw_menu_button(resource_pack_x, 20 + (custom_title_background_open_y), l10n_text("Open Background Folder"), "open_title_background_folder", "open_title_background_folder");
			draw_sprite_ext(spr_icon_folder, 0, resource_pack_x + 16, 20 + (custom_title_background_open_y) + 21, 1, 1, 0, c_white, 1);
		}
		#endregion /* Other Custom Title Background Options END */
		
		#endregion /* Custom Title Background END */
		
		#region /* Custom Title Logo */
		if (global.selected_title_logo > ds_list_size(global.all_loaded_title_logo) - 1)
		{
			global.selected_title_logo = ds_list_size(global.all_loaded_title_logo) - 1;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("config", "select_title_logo", global.selected_title_logo);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		if (global.selected_title_logo >= 0)
		{
			scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_logo_y), l10n_text("Title Logo") + ": " + string(global.selected_title_logo + 1) + "/" + string(ds_list_size(global.all_loaded_title_logo) + add_number), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			/* Draw text of what the file is called */
			scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_logo_y + 40), string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo)), global.default_text_size * 1.1, c_menu_outline, c_dkgray, 1);
		}
		else
		{
			scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_logo_y), l10n_text("Title Logo") + ": " + l10n_text("None"), global.default_text_size * 1.05, c_menu_outline, c_menu_fill, 1);
		}
		
		if (global.selected_title_logo > -1)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (custom_title_logo_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_logo_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "title_logo";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_logo_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (file_exists("title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1))))
		&& (ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1) != undefined)
		&& (ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1) != "")
		|| (file_exists(game_save_id + "custom_title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1))))
		&& (ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1) != undefined)
		&& (ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1) != "")
		|| (global.selected_title_logo <= -1)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (custom_title_logo_y), 0.5, 0.5, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_logo_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "title_logo";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_logo_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (menu == "title_logo")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x - 32 - 32, 20 + (custom_title_logo_y));
		}
		
		if (key_left)
		&& (menu == "title_logo")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_logo_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "title_logo";
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (global.selected_title_logo > -1)
			{
				menu_delay = 3;
				global.selected_title_logo --;
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "select_title_logo", global.selected_title_logo);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				
				if (file_exists("title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo))))
				&& (global.selected_title_logo >= 0)
				{
					scr_delete_sprite_properly(global.title_logo_index);
					global.title_logo_index = sprite_add("title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo)), 1, false, false, 0, 0);
					sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) * 0.5, sprite_get_height(global.title_logo_index) * 0.5);
				}
				else
				if (file_exists(game_save_id + "custom_title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo))))
				&& (global.selected_title_logo >= 0)
				{
					scr_delete_sprite_properly(global.title_logo_index);
					global.title_logo_index = sprite_add(game_save_id + "custom_title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo)), 1, false, false, 0, 0);
					sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) * 0.5, sprite_get_height(global.title_logo_index) * 0.5);
				}
				else
				{
					global.title_logo_index = spr_noone;
				}
			}
		}
		
		if (key_right)
		&& (menu == "title_logo")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_logo_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		{
			menu = "title_logo";
			
			if (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (file_exists("title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1))))
			&& (ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1) != undefined)
			&& (ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1) != "")
			|| (menu_delay == 0
			&& menu_joystick_delay == 0)
			&& (!can_navigate_settings_sidebar)
			&& (file_exists(game_save_id + "custom_title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1))))
			&& (ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1) != undefined)
			&& (ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo + 1) != "")
			|| (global.selected_title_logo <= -1)
			{
				menu_delay = 3;
				global.selected_title_logo ++;
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "select_title_logo", global.selected_title_logo);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				
				if (file_exists("title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo))))
				&& (global.selected_title_logo >= 0)
				{
					scr_delete_sprite_properly(global.title_logo_index);
					global.title_logo_index = sprite_add("title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo)), 1, false, false, 0, 0);
					sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) * 0.5, sprite_get_height(global.title_logo_index) * 0.5);
				}
				else
				if (file_exists(game_save_id + "custom_title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo))))
				&& (global.selected_title_logo >= 0)
				{
					scr_delete_sprite_properly(global.title_logo_index);
					global.title_logo_index = sprite_add(game_save_id + "custom_title_logo/" + string(ds_list_find_value(global.all_loaded_title_logo, global.selected_title_logo)), 1, false, false, 0, 0);
					sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) * 0.5, sprite_get_height(global.title_logo_index) * 0.5);
				}
				else
				{
					global.title_logo_index = spr_noone;
				}
			}
		}
		#endregion /* Custom Title Logo END */
		
		if (global.enable_open_custom_folder)
		{
			draw_menu_button(resource_pack_x, 20 + (custom_title_logo_open_y), l10n_text("Open Title Logo Folder"), "open_title_logo_folder", "open_title_logo_folder");
			draw_sprite_ext(spr_icon_folder, 0, resource_pack_x + 16, 20 + (custom_title_logo_open_y) + 21, 1, 1, 0, c_white, 1);
		}
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x, 20 + (open_resource_pack_y) + 2, resource_pack_x + 371, 20 + (open_resource_pack_y) + 41))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0
		&& menu_joystick_delay == 0)
		|| (menu == "open_resource_pack_folder")
		&& (key_a_pressed)
		&& (menu_delay == 0
		&& menu_joystick_delay == 0)
		{
			menu_delay = 3;
			scr_open_folder(game_save_id + "\custom_resource_pack")
		}
		else
		if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x, 20 + (custom_title_background_open_y) + 2, resource_pack_x + 371, 20 + (custom_title_background_open_y) + 41))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0
		&& menu_joystick_delay == 0)
		|| (menu == "open_title_background_folder")
		&& (key_a_pressed)
		&& (menu_delay == 0
		&& menu_joystick_delay == 0)
		{
			menu_delay = 3;
			scr_open_folder(game_save_id + "\custom_title_background")
		}
		else
		if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x, 20 + (custom_title_logo_open_y) + 2, resource_pack_x + 371, 20 + (custom_title_logo_open_y) + 41))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0
		&& menu_joystick_delay == 0)
		|| (menu == "open_title_logo_folder")
		&& (key_a_pressed)
		&& (menu_delay == 0
		&& menu_joystick_delay == 0)
		{
			menu_delay = 3;
			scr_open_folder(game_save_id + "\custom_title_logo")
		}
		
		draw_menu_checkmark(resource_pack_x - 64, can_load_custom_level_assets_y, l10n_text("Load Custom Level Assets"), "can_load_custom_level_assets", global.can_load_custom_level_assets, true);
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 64, can_load_custom_level_assets_y - 6, resource_pack_x - 64 + 646, can_load_custom_level_assets_y + 38))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0
		&& menu_joystick_delay == 0)
		|| (menu == "can_load_custom_level_assets")
		&& (key_a_pressed)
		&& (menu_delay == 0
		&& menu_joystick_delay == 0)
		{
			global.can_load_custom_level_assets = !global.can_load_custom_level_assets;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("config", "can_load_custom_level_assets", global.can_load_custom_level_assets);
			ini_close();
		}
	}
	else
	if (!in_settings)
	|| (global.settings_sidebar_menu != "custom_resources_settings")
	{
		title_background_blink[1] = 1;
		title_background_blink[2] = 1;
		title_background_blink[3] = 1;
	}
}