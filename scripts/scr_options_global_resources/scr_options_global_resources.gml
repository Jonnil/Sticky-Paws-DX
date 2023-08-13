function scr_options_global_resources()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	if (global.settings_sidebar_menu == "global_resources_settings")
	{
		if (sprite_exists(global.title_logo_index))
		{
			draw_sprite_ext(global.title_logo_index, image_index, display_get_gui_width() - 350, display_get_gui_height() - 250, (402 / sprite_get_height(global.title_logo_index)), (402 / sprite_get_height(global.title_logo_index)), 0, c_white, 1);
		}
		
		if (ds_list_size(global.all_loaded_resource_pack) >= 2)
		&& (global.enable_options_for_pc == false)
		|| (global.enable_options_for_pc)
		{
			var resource_pack_y = 40 * 1; /* 1 */
			var open_resource_pack_y = 40 * 3; /* 3 */
			var custom_title_background_y = 40 * 5; /* 5 */
			var custom_title_background_scale_y = 40 * 7; /* 6 */
			var background_layer_x_scroll_y = 40 * 8; /* 7 */
			var background_layer_y_scroll_y = 40 * 9; /* 8 */
			var custom_title_background_open_y = 40 * 10; /* 10 */
			var custom_title_logo_y = 40 * 12; /* 12 */
			var custom_title_logo_open_y = 40 * 14; /* 14 */
		}
		else
		{
			var resource_pack_y = -999;
			var open_resource_pack_y = -999;
			var custom_title_background_y = 40 * 1;
			var custom_title_background_scale_y = 40 * 3;
			var background_layer_x_scroll_y = 40 * 4;
			var background_layer_y_scroll_y = 40 * 5;
			var custom_title_background_open_y = 40 * 6;
			var custom_title_logo_y = 40 * 8;
			var custom_title_logo_open_y = 40 * 10;
		}
		
		if (key_up)
		&& (can_navigate_settings_sidebar == false)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "resource_pack")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_title_logo_folder";
				}
				else
				{
					menu = "title_logos";
				}
			}
			else
			if (menu == "open_resource_pack_folder")
			{
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				&& (global.enable_options_for_pc == false)
				|| (global.enable_options_for_pc)
				{
					menu = "resource_pack";
				}
				else
				if (global.enable_open_custom_folder)
				{
					menu = "open_title_logo_folder";
				}
				else
				{
					menu = "title_logos";
				}
			}
			else
			if (menu == "title_background")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_resource_pack_folder";
				}
				else
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				&& (global.enable_options_for_pc == false)
				|| (global.enable_options_for_pc)
				{
					menu = "resource_pack";
				}
				else
				if (global.enable_open_custom_folder)
				{
					menu = "open_title_logo_folder";
				}
				else
				{
					menu = "title_logos";
				}
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
			if (menu == "title_logos")
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
				menu = "title_logos";
			}
		}
		else
		if (key_down)
		&& (can_navigate_settings_sidebar == false)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
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
					menu = "title_background";
				}
			}
			else
			if (menu == "open_resource_pack_folder")
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
					menu = "title_logos";
				}
			}
			else
			if (menu == "open_title_background_folder")
			{
				menu = "title_logos";
			}
			else
			if (menu == "title_logos")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_title_logo_folder";
				}
				else
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				&& (global.enable_options_for_pc == false)
				|| (global.enable_options_for_pc)
				{
					menu = "resource_pack";
				}
				else
				{
					menu = "title_background";
				}
			}
			else
			if (menu == "open_title_logo_folder")
			{
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				&& (global.enable_options_for_pc == false)
				|| (global.enable_options_for_pc)
				{
					menu = "resource_pack";
				}
				else
				{
					menu = "title_background";
				}
			}
		}
		
		#region /* Custom Resource Packs */
		var resource_pack_x = 450;
		var resource_pack_right_arrow_x = 450;
		
		if (ds_list_size(global.all_loaded_resource_pack) >= 2)
		&& (global.enable_options_for_pc == false)
		|| (global.enable_options_for_pc)
		{
			if (global.selected_resource_pack > ds_list_size(global.all_loaded_resource_pack) - 1)
			{
				global.selected_resource_pack = ds_list_size(global.all_loaded_resource_pack) - 1;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "selected_resource_pack", global.selected_resource_pack);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			
			scr_draw_text_outlined(resource_pack_x, 20 + (resource_pack_y), l10n_text("Resource Pack") + ": " + string(global.selected_resource_pack + 1) + "/" + string(ds_list_size(global.all_loaded_resource_pack)), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			/* Draw text of what the file is called */ scr_draw_text_outlined(resource_pack_x, 20 + (resource_pack_y + 40), string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)), global.default_text_size * 1.1, c_menu_outline, c_dkgray, 1);
			
			if (global.selected_resource_pack > 0)
			&& (global.pause_room != rm_leveleditor)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (resource_pack_y), 0.5, 0.5, 0, c_white, 1);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (resource_pack_y) - 16, resource_pack_x - 32 + 16, 20 + (resource_pack_y) + 16))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "resource_pack";
					can_navigate_settings_sidebar = false;
					draw_set_alpha(0.5);
					draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (resource_pack_y) - 16, resource_pack_x - 32 + 16, 20 + (resource_pack_y) + 16, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
			}
			
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack + 1)) + "/data/sprite_origin_point.ini"))
			&& (global.pause_room != rm_leveleditor)
			|| (file_exists(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack + 1)) + "/data/sprite_origin_point.ini"))
			&& (global.pause_room != rm_leveleditor)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (resource_pack_y), 0.5, 0.5, 0, c_white, 1);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (resource_pack_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (resource_pack_y) + 16))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "resource_pack";
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
			&& (can_navigate_settings_sidebar == false)
			&& (menu == "resource_pack")
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (resource_pack_y) - 16, resource_pack_x - 32 + 16, 20 + (resource_pack_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				menu = "resource_pack";
				if (menu_delay == 0 && menu_joystick_delay == 0)
				&& (can_navigate_settings_sidebar == false)
				&& (global.selected_resource_pack > 0)
				&& (global.pause_room != rm_leveleditor)
				{
					menu_delay = 3;
					global.selected_resource_pack --;
					ini_open(working_directory + "config.ini");
					ini_write_real("config", "selected_resource_pack", global.selected_resource_pack);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
			}
			else
			if (key_right)
			&& (can_navigate_settings_sidebar == false)
			&& (menu == "resource_pack")
			|| (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (resource_pack_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (resource_pack_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				menu = "resource_pack";
				if (menu_delay == 0 && menu_joystick_delay == 0)
				&& (can_navigate_settings_sidebar == false)
				&& (file_exists(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack + 1)) + "/data/sprite_origin_point.ini"))
				&& (global.pause_room != rm_leveleditor)
				{
					menu_delay = 3;
					global.selected_resource_pack ++;
					ini_open(working_directory + "config.ini");
					ini_write_real("config", "selected_resource_pack", global.selected_resource_pack);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
			}
		}
		#endregion /* Custom Resource Packs END */
		
		if (global.enable_open_custom_folder)
		{
			draw_menu_button(resource_pack_x, 20 + (open_resource_pack_y), l10n_text("Open Resource Pack Folder"), "open_resource_pack_folder", "open_resource_pack_folder");
			draw_sprite_ext(spr_icons_folder, 0, resource_pack_x + 16, 20 + (open_resource_pack_y) + 21, 1, 1, 0, c_white, 1);
		}
		
		#region /* Custom Title Background */
		
		if (global.selected_title_background > ds_list_size(global.all_loaded_title_backgrounds) - 1)
		{
			global.selected_title_background = ds_list_size(global.all_loaded_title_backgrounds) - 1;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "selected_title_background", global.selected_title_background);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_background_y), l10n_text("Title Background") + ": " + string(global.selected_title_background + 1) + "/" + string(ds_list_size(global.all_loaded_title_backgrounds)), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		/* Draw text of what the file is called */ scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_background_y + 40), string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), global.default_text_size * 1.1, c_menu_outline, c_dkgray, 1);
		
		if (global.selected_title_background > 0)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (custom_title_background_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_background_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_background_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				menu = "title_background";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (custom_title_background_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_background_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		if (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1))))
		&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != undefined)
		&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != "")
		|| (file_exists(working_directory + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1))))
		&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != undefined)
		&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != "")
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (custom_title_background_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
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
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "title_background";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (global.selected_title_background > 0)
			{
				menu_delay = 3;
				if (keyboard_check(vk_control))
				{
					global.selected_title_background -= 10;
					if (global.selected_title_background <= 0)
					{
						global.selected_title_background = 0;
					}
				}
				else
				{
					global.selected_title_background --;
					if (global.selected_title_background <= 0)
					{
						global.selected_title_background = 0;
					}
				}
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "selected_title_background", global.selected_title_background);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				if (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
				{
					if (variable_instance_exists(self, "title_screen_background"))
					{
						scr_delete_sprite_properly(title_screen_background);
						title_screen_background = sprite_add("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 0, false, false, 0, 0);
					}
				}
				else
				if (file_exists(working_directory + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
				{
					if (variable_instance_exists(self, "title_screen_background"))
					{
						scr_delete_sprite_properly(title_screen_background);
						title_screen_background = sprite_add(working_directory + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 0, false, false, 0, 0);
					}
				}
				else
				if (variable_instance_exists(self, "title_screen_background"))
				{
					title_screen_background = noone;
				}
			}
			if (variable_instance_exists(self, "title_screen_background"))
			{
				if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
				&& (room == rm_title)
				{
					layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
				}
			}
		}
		if (key_right)
		&& (menu == "title_background")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_y) + 16))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "title_background";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1))))
			&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != undefined)
			&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != "")
			|| (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (file_exists(working_directory + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1))))
			&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != undefined)
			&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background + 1) != "")
			{
				menu_delay = 3;
				if (keyboard_check(vk_control))
				{
					global.selected_title_background += 10;
					if (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background) = undefined)
					&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background) = "")
					{
						global.selected_title_background --;
					}
				}
				else
				{
					global.selected_title_background ++;
					if (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background) = undefined)
					&& (ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background) = "")
					{
						global.selected_title_background --;
					}
				}
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "selected_title_background", global.selected_title_background);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				if (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
				{
					if (variable_instance_exists(self, "title_screen_background"))
					{
						scr_delete_sprite_properly(title_screen_background);
						title_screen_background = sprite_add("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 0, false, false, 0, 0);
					}
				}
				else
				if (file_exists(working_directory + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
				{
					if (variable_instance_exists(self, "title_screen_background"))
					{
						scr_delete_sprite_properly(title_screen_background);
						title_screen_background = sprite_add(working_directory + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 0, false, false, 0, 0);
					}
				}
				else
				if (variable_instance_exists(self, "title_screen_background"))
				{
					title_screen_background = noone;
				}
			}
			if (variable_instance_exists(self, "title_screen_background"))
			{
				if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
				&& (room == rm_title)
				{
					layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
				}
			}
		}
		
		#region /* Other Custom Title Background Options */
		
		#region /* Custom Title Background Scale */
		var scale_increment = 0.01;
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_background_scale_y), l10n_text("Background Scale") + ": " + string(global.title_background_scale), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (global.title_background_scale > scale_increment)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (custom_title_background_scale_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_background_scale_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
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
		&& (global.controls_used_for_menu_navigation == "mouse")
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
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "title_background_scale";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (global.title_background_scale > scale_increment)
			{
				menu_delay = 3;
				if (keyboard_check(vk_control))
				{
					global.title_background_scale -= (scale_increment * 10);
				}
				else
				{
					global.title_background_scale -= scale_increment;
				}
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "title_background_scale", global.title_background_scale);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
		}
		if (key_right)
		&& (menu == "title_background_scale")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_background_scale_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_background_scale_y) + 16))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "title_background_scale";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			{
				menu_delay = 3;
				if (keyboard_check(vk_control))
				{
					global.title_background_scale += (scale_increment * 10);
				}
				else
				{
					global.title_background_scale += scale_increment;
				}
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "title_background_scale", global.title_background_scale);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
		}
		if (global.title_background_scale <= 0)
		{
			global.title_background_scale = 0.01;
		}
		#endregion /* Custom Title Background Scale END */
		
		#region /* Background Layer X Scroll */
		var scale_increment = 0.05;
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(resource_pack_x, 20 + (background_layer_x_scroll_y), l10n_text("Background Scroll X") + ": " + string(global.background_layer_x_scroll), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
		if (global.background_layer_x_scroll > - 10)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (background_layer_x_scroll_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x - 32 + 16, 20 + (background_layer_x_scroll_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				menu = "background_layer_x_scroll";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x - 32 + 16, 20 + (background_layer_x_scroll_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (global.background_layer_x_scroll < + 10)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (background_layer_x_scroll_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_x_scroll_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
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
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "background_layer_x_scroll";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (global.background_layer_x_scroll > - 10)
			{
				menu_delay = 3;
				if (keyboard_check(vk_control))
				{
					global.background_layer_x_scroll -= (scale_increment * 10);
				}
				else
				{
					global.background_layer_x_scroll -= scale_increment;
				}
			}
		}
		if (key_right)
		&& (menu == "background_layer_x_scroll")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_x_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_x_scroll_y) + 16))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "background_layer_x_scroll";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (global.background_layer_x_scroll < + 10)
			{
				menu_delay = 3;
				if (keyboard_check(vk_control))
				{
					global.background_layer_x_scroll += (scale_increment * 10);
				}
				else
				{
					global.background_layer_x_scroll += scale_increment;
				}
			}
		}
		#endregion /* Background Layer X Scroll END */
		
		#region /* Background Layer Y Scroll */
		var scale_increment = 0.05;
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(resource_pack_x, 20 + (background_layer_y_scroll_y), l10n_text("Background Scroll Y") + ": " + string(global.background_layer_y_scroll), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
		if (global.background_layer_y_scroll > - 10)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (background_layer_y_scroll_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x - 32 + 16, 20 + (background_layer_y_scroll_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				menu = "background_layer_y_scroll";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x - 32 + 16, 20 + (background_layer_y_scroll_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (global.background_layer_y_scroll < + 10)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (background_layer_y_scroll_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_y_scroll_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
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
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "background_layer_y_scroll";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (global.background_layer_y_scroll > - 10)
			{
				menu_delay = 3;
				if (keyboard_check(vk_control))
				{
					global.background_layer_y_scroll -= (scale_increment * 10);
				}
				else
				{
					global.background_layer_y_scroll -= scale_increment;
				}
			}
		}
		if (key_right)
		&& (menu == "background_layer_y_scroll")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (background_layer_y_scroll_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (background_layer_y_scroll_y) + 16))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "background_layer_y_scroll";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (global.background_layer_y_scroll < + 10)
			{
				menu_delay = 3;
				if (keyboard_check(vk_control))
				{
					global.background_layer_y_scroll += (scale_increment * 10);
				}
				else
				{
					global.background_layer_y_scroll += scale_increment;
				}
			}
		}
		#endregion /* Background Layer Y Scroll END */
		
		if (global.background_layer_x_scroll > + 10)
		{
			global.background_layer_x_scroll = + 10;
		}
		if (global.background_layer_x_scroll < - 10)
		{
			global.background_layer_x_scroll = - 10;
		}
		if (global.background_layer_y_scroll > + 10)
		{
			global.background_layer_y_scroll = + 10;
		}
		if (global.background_layer_y_scroll < - 10)
		{
			global.background_layer_y_scroll = - 10;
		}
		
		if (global.enable_open_custom_folder)
		{
			draw_menu_button(resource_pack_x, 20 + (custom_title_background_open_y), l10n_text("Open Background Folder"), "open_title_background_folder", "open_title_background_folder");
			draw_sprite_ext(spr_icons_folder, 0, resource_pack_x + 16, 20 + (custom_title_background_open_y) + 21, 1, 1, 0, c_white, 1);
		}
		#endregion /* Other Custom Title Background Options END */
		
		#endregion /* Custom Title Background END */
		
		#region /* Custom Title Logo */
		if (global.selected_title_logo > ds_list_size(global.all_loaded_title_logos) - 1)
		{
			global.selected_title_logo = ds_list_size(global.all_loaded_title_logos) - 1;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "selected_title_logo", global.selected_title_logo);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		if (global.selected_title_logo >= 0)
		{
			scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_logo_y), l10n_text("Title Logo") + ": " + string(global.selected_title_logo + 1) + "/" + string(ds_list_size(global.all_loaded_title_logos)), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			/* Draw text of what the file is called */ scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_logo_y + 40), string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), global.default_text_size * 1.1, c_menu_outline, c_dkgray, 1);
		}
		else
		{
			scr_draw_text_outlined(resource_pack_x, 20 + (custom_title_logo_y), l10n_text("Title Logo") + ": " + l10n_text("None"), global.default_text_size * 1.05, c_menu_outline, c_menu_fill, 1);
		}
		if (global.selected_title_logo > -1)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, resource_pack_x - 32, 20 + (custom_title_logo_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_logo_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				menu = "title_logos";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x - 32 - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_logo_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		if (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1))))
		&& (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != undefined)
		&& (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != "")
		|| (file_exists(working_directory + "custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1))))
		&& (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != undefined)
		&& (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != "")
		|| (global.selected_title_logo <= -1)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, resource_pack_x +resource_pack_right_arrow_x, 20 + (custom_title_logo_y), 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_logo_y) + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				menu = "title_logos";
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_logo_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		if (menu == "title_logos")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, resource_pack_x - 32 - 32, 20 + (custom_title_logo_y));
		}
		if (key_left)
		&& (menu == "title_logos")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x - 32 - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x - 32 + 16, 20 + (custom_title_logo_y) + 16))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "title_logos";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (global.selected_title_logo > -1)
			{
				menu_delay = 3;
				global.selected_title_logo --;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "selected_title_logo", global.selected_title_logo);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				if (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
				&& (global.selected_title_logo >= 0)
				{
					scr_delete_sprite_properly(global.title_logo_index);
					global.title_logo_index = sprite_add("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
					sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) * 0.5, sprite_get_height(global.title_logo_index) * 0.5);
				}
				else
				if (file_exists(working_directory + "custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
				&& (global.selected_title_logo >= 0)
				{
					scr_delete_sprite_properly(global.title_logo_index);
					global.title_logo_index = sprite_add(working_directory + "custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
					sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) * 0.5, sprite_get_height(global.title_logo_index) * 0.5);
				}
				else
				{
					global.title_logo_index = spr_noone;
				}
			}
		}
		if (key_right)
		&& (menu == "title_logos")
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x +resource_pack_right_arrow_x - 16, 20 + (custom_title_logo_y) - 16, resource_pack_x +resource_pack_right_arrow_x + 16, 20 + (custom_title_logo_y) + 16))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "title_logos";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1))))
			&& (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != undefined)
			&& (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != "")
			|| (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			&& (file_exists(working_directory + "custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1))))
			&& (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != undefined)
			&& (ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo + 1) != "")
			|| (global.selected_title_logo <= -1)
			{
				menu_delay = 3;
				global.selected_title_logo ++;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "selected_title_logo", global.selected_title_logo);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				if (file_exists("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
				&& (global.selected_title_logo >= 0)
				{
					scr_delete_sprite_properly(global.title_logo_index);
					global.title_logo_index = sprite_add("title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
					sprite_set_offset(global.title_logo_index, sprite_get_width(global.title_logo_index) * 0.5, sprite_get_height(global.title_logo_index) * 0.5);
				}
				else
				if (file_exists(working_directory + "custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo))))
				&& (global.selected_title_logo >= 0)
				{
					scr_delete_sprite_properly(global.title_logo_index);
					global.title_logo_index = sprite_add(working_directory + "custom_title_logos/" + string(ds_list_find_value(global.all_loaded_title_logos, global.selected_title_logo)), 1, false, false, 0, 0);
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
			draw_sprite_ext(spr_icons_folder, 0, resource_pack_x + 16, 20 + (custom_title_logo_open_y) + 21, 1, 1, 0, c_white, 1);
		}
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x, 20 + (open_resource_pack_y) + 2, resource_pack_x + 371, 20 + (open_resource_pack_y) + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "open_resource_pack_folder")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			scr_open_folder(game_save_id + "\custom_resource_pack")
		}
		else
		if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x, 20 + (custom_title_background_open_y) + 2, resource_pack_x + 371, 20 + (custom_title_background_open_y) + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "open_title_background_folder")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			scr_open_folder(game_save_id + "\custom_title_background")
		}
		else
		if (point_in_rectangle(mouse_get_x, mouse_get_y, resource_pack_x, 20 + (custom_title_logo_open_y) + 2, resource_pack_x + 371, 20 + (custom_title_logo_open_y) + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "open_title_logo_folder")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			scr_open_folder(game_save_id + "\custom_title_logos")
		}
		
	}
}