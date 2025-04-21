function scr_load_storage_variables()
{
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	storage_year = ini_read_real("Player", "current_year", 0);
	storage_month = ini_read_real("Player", "current_month", 0);
	storage_day = ini_read_real("Player", "current_day", 0);
	storage_hour = ini_read_real("Player", "current_hour", 0);
	storage_minute = ini_read_real("Player", "current_minute", 0);
	storage_second = ini_read_real("Player", "current_second", 0);
	storage_last_played_level_name = ini_read_string("Player", "last_played_level_name", "");
	storage_lives = ini_read_real("Player", "lives", 0);
	storage_total_big_collectibles = ini_read_real("Player", "total_big_collectibles", 0);
	storage_number_of_levels_cleared = ini_read_real("Player", "number_of_levels_cleared", 0);
	if (variable_instance_exists(self, "placable_object_unlock_notify"))
	{
		placable_object_unlock_notify = ini_read_real("Player", "placable_object_unlock_notify", 0);
	}
	ini_close();
}

function scr_option_storage()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	
	#region /* Storage Settings */
	if (global.settings_sidebar_menu == "storage_settings")
	{
		
		#region /* Storage variables */
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		
		var file_select_x = 400;
		var file_select_right_arrow_x = 400;
		var file_y = 20 + (40 * 1);
		var delete_file_y = 20 + (40 * 2);
		var open_save_file_folder_y = 20 + (40 * 3);
		/* New Line */
		var file_path_y = 20 + (40 * 5);
		var date_modified_y = 20 + (40 * 6);
		/* New Line */
		var last_played_level_name_y = 20 + (40 * 8);
		var lives_y = 20 + (40 * 9);
		var total_big_collectibles_y = 20 + (40 * 10);
		var number_of_levels_passed_y = 20 + (40 * 11);
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(file_select_x + 50, file_y, l10n_text("File") + ": " + string(global.file), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		#endregion /* Storage variables END */
		
		#region /* Display save file data */
		if (file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini"))
		{
			
			#region /* File path */
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			if (global.enable_option_for_pc)
			{
				var file_path_text = string_replace_all(string_replace_all(game_save_id, environment_get_variable("USERNAME"), "*") + "save_file\\file" + string(global.file) + ".ini", "\\", "/")
				scr_draw_text_outlined(file_select_x, file_path_y, string(file_path_text), global.default_text_size, c_menu_outline, c_dkgray, 1);
			}
			#endregion /* File path END */
			
			#region /* File date */
			if (storage_year != 0)
			{
				scr_draw_text_outlined(file_select_x, date_modified_y,
				l10n_text("Date modified") + ": " +
				string(storage_year) + "-" +
				string(storage_month) + "-" +
				string(storage_day) + " " +
				string(string_replace_all(string_format(storage_hour, 2, 0), " ", "0")) + ":" +
				string(string_replace_all(string_format(storage_minute, 2, 0), " ", "0")) + ":" +
				string(string_replace_all(string_format(storage_second, 2, 0), " ", "0"))
				,global.default_text_size, c_menu_outline, c_menu_fill, 1);
				
				if (storage_month == current_month)
				&& (storage_day == current_day)
				&& (storage_year == current_year)
				{
					scr_draw_text_outlined(file_select_x + 500, date_modified_y, l10n_text("Last played today!"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				}
			}
			#endregion /* File date END */
			
			if (storage_last_played_level_name != "")
			{
				scr_draw_text_outlined(file_select_x, last_played_level_name_y, l10n_text("Last played level") + ": " + string(storage_last_played_level_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			
			scr_draw_text_outlined(file_select_x, lives_y, l10n_text("Lives") + ": " + string(storage_lives), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, file_select_x + 16, total_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
			scr_draw_text_outlined(file_select_x + 48, total_big_collectibles_y, string(storage_total_big_collectibles) + "/" + "50", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(file_select_x, number_of_levels_passed_y, l10n_text("Number of levels passed") + ": " + string(storage_number_of_levels_cleared), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Display save file data END */
		
		if (menu != "file_delete_yes")
		&& (menu != "file_delete_no")
		{
			if (file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini"))
			{
				draw_menu_button(file_select_x, delete_file_y, l10n_text("Delete File"), "file_delete", "file_delete_no", c_red);
				draw_sprite_ext(spr_icon_delete, 0, file_select_x + 16, delete_file_y + 21, 1, 1, 0, c_white, 1);
			}
			
			if (global.enable_open_custom_folder)
			{
				draw_menu_button(file_select_x, open_save_file_folder_y, l10n_text("Open Save File Folder"), "open_save_file_folder", "open_save_file_folder");
				draw_sprite_ext(spr_icon_folder, 0, file_select_x + 16, open_save_file_folder_y + 21, 1, 1, 0, c_white, 1);
			}
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x, open_save_file_folder_y + 2, file_select_x + 371, open_save_file_folder_y + 41))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (menu == "open_save_file_folder")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				scr_open_folder(game_save_id + "save_file");
			}
		}
		else
		if (menu == "file_delete_yes")
		|| (menu == "file_delete_no")
		{
			can_navigate_settings_sidebar = false;
			draw_set_alpha(0.75);
			draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(0.1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 100, l10n_text("Are you sure you want to delete file") + " " + string(global.file) + "?", global.default_text_size, c_black, c_red, 1);
			draw_menu_button(get_window_width * 0.5 - 370 - 32, get_window_height * 0.5, l10n_text("Yes"), "file_delete_yes", "file_delete_yes", c_red);
			draw_sprite_ext(spr_icon_delete, 0, get_window_width * 0.5 - 370 - 32 + 16, get_window_height * 0.5 + 21, 1, 1, 0, c_white, 1);
			draw_menu_button(get_window_width * 0.5 + 32, get_window_height * 0.5, l10n_text("No"), "file_delete_no", "file_delete");
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 + 32 + 16, get_window_height * 0.5 + 21, 1, 1, 0, c_white, 1);
			
			if (key_left)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_right)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (menu == "file_delete_no")
				{
					menu = "file_delete_yes";
				}
				else
				if (menu == "file_delete_yes")
				{
					menu = "file_delete_no";
				}
			}
		}
		
		if (global.file < 1)
		{
			global.file = 1; /* Don't let file go less than 1 */
		}
		
		if (global.file > 1)
		&& (menu != "file_delete_no")
		&& (menu != "file_delete_yes")
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, file_select_x - 32 + 50, file_y, 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x - 32 - 16 + 50, file_y - 16, file_select_x - 32 + 16 + 50, file_y + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "file_delete";
				draw_set_alpha(0.5);
				draw_rectangle_color(file_select_x - 32 - 16 + 50, file_y - 16, file_select_x - 32 + 16 + 50, file_y + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (menu != "file_delete_no")
		&& (menu != "file_delete_yes")
		&& (file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini")
		|| file_exists(game_save_id + "save_file/file" + string(global.file + 1) + ".ini"))
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, file_select_x + file_select_right_arrow_x, file_y, 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x + file_select_right_arrow_x - 16, file_y - 16, file_select_x + file_select_right_arrow_x + 16, file_y + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = "file_delete";
				draw_set_alpha(0.5);
				draw_rectangle_color(file_select_x + file_select_right_arrow_x - 16, file_y - 16, file_select_x + file_select_right_arrow_x + 16, file_y + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		
		if (menu == "file_delete")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			can_navigate_settings_sidebar = false;
			menu = "file_delete_no";
			menu_delay = 3;
		}
		
		if (menu == "file_delete_no")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "file_delete_no")
		&& (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "file_delete_yes")
		&& (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			can_navigate_settings_sidebar = false;
			menu = "file_delete";
			menu_delay = 3;
			
		}
		
		if (menu == "file_delete_yes")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "file_delete_yes")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370 - 32, get_window_height * 0.5 - 21, get_window_width * 0.5 - 370 - 32 + 370, get_window_height * 0.5 + 42))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			can_navigate_settings_sidebar = false;
			menu = "file_select";
			file_delete(game_save_id + "save_file/file" + string(global.file) + ".ini");
			menu_delay = 3;
		}
		
		if (key_up)
		&& (menu != "file_delete_yes")
		&& (menu != "file_delete_no")
		&& (!can_navigate_settings_sidebar)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "file_select")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_save_file_folder";
				}
				else
				{
					menu = "file_delete";
				}
			}
			else
			if (menu == "file_delete")
			{
				menu = "file_select";
			}
			else
			if (menu == "open_save_file_folder")
			{
				if (file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini"))
				{
					menu = "file_delete";
				}
				else
				{
					menu = "file_select";
				}
			}
		}
		else
		if (key_down)
		&& (menu != "file_delete_yes")
		&& (menu != "file_delete_no")
		&& (!can_navigate_settings_sidebar)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "file_select")
			{
				if (file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini"))
				{
					menu = "file_delete";
				}
				else
				{
					if (global.enable_open_custom_folder)
					{
						menu = "open_save_file_folder";
					}
					else
					{
						menu = "file_select";
					}
				}
			}
			else
			if (menu == "file_delete")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "open_save_file_folder";
				}
				else
				{
					menu = "file_select";
				}
			}
			else
			if (menu == "open_save_file_folder")
			{
				menu = "file_select";
			}
		}
		
		if (menu == "file_select")
		{
			draw_sprite(spr_menu_cursor, menu_cursor_index, file_select_x - 32 - 32 + 50, file_y);
		}
		
		if (key_left)
		&& (menu == "file_select")
		&& (!can_navigate_settings_sidebar)
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x - 32 - 16 + 50, file_y - 16, file_select_x - 32 + 16 + 50, file_y + 16))
		&& (global.controls_used_for_navigation == "mouse")
		&& (menu != "file_delete_no")
		&& (menu != "file_delete_yes")
		{
			can_navigate_settings_sidebar = false;
			menu = "file_select";
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (global.file > 1)
			{
				global.file --;
				menu_delay = 3;
				scr_load_storage_variables();
			}
		}
		else
		if (key_right)
		&& (menu == "file_select")
		&& (!can_navigate_settings_sidebar)
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x + file_select_right_arrow_x - 16, file_y - 16, file_select_x + file_select_right_arrow_x + 16, file_y + 16))
		&& (global.controls_used_for_navigation == "mouse")
		&& (menu != "file_delete_no")
		&& (menu != "file_delete_yes")
		{
			if (file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini"))
			|| (file_exists(game_save_id + "save_file/file" + string(global.file + 1) + ".ini"))
			{
				can_navigate_settings_sidebar = false;
				menu = "file_select";
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					global.file ++;
					menu_delay = 3;
					scr_load_storage_variables();
				}
			}
		}
	}
	#endregion /* Storage Settings END */
	
}