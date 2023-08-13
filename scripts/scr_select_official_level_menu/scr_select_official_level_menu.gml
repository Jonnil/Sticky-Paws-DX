function scr_select_official_level_menu()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var take_from_official_level = ds_list_find_value(global.all_loaded_main_levels, global.select_level_index);
	
	if (window_get_width() >= 1670)
	{
		row = 4;
	}
	else
	if (window_get_width() >= 1276)
	{
		row = 3;
	}
	else
	if (window_get_width() >= 882)
	{
		row = 2;
	}
	else
	if (window_get_width() >= 488)
	{
		row = 1;
	}
	column = clamp(floor(global.select_level_index / row), 0, floor(ds_list_size(global.all_loaded_main_levels)))
	
	#region /* Navigate Menu */
	
	#region /* Key Up */
	if (key_up)
	|| (mouse_wheel_up())
	{
		if (can_input_level_name == false)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu != "back_from_level_editor")
		{
			if (global.select_level_index - row < 0)
			&& (global.controls_used_for_menu_navigation != "mouse")
			&& (show_level_editor_corner_menu)
			{
				menu_delay = 3;
				menu = "back_from_level_editor";
			}
			else
			if (global.select_level_index - row > - 1)
			&& (ds_exists(global.all_loaded_main_levels, ds_type_list))
			{
				global.select_level_index -= clamp(row, 0, ds_list_size(global.all_loaded_main_levels));
				menu_delay = 3;
				if (mouse_wheel_up())
				{
					scroll_to = scroll - 1;
				}
				else
				{
					scroll_to = floor(global.select_level_index / row);
				}
				lerp_on = true;
			}
		}
	}
	#endregion /* Key Up END */
	
	else
	
	#region /* Key Down */
	if (key_down)
	|| (mouse_wheel_down())
	{
		if (can_input_level_name == false)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu != "back_from_level_editor")
		{
			if (global.select_level_index + row > ds_list_size(global.thumbnail_sprite) - 1)
			&& (global.controls_used_for_menu_navigation != "mouse")
			&& (show_level_editor_corner_menu)
			{
				menu_delay = 3;
				menu = "back_from_level_editor";
			}
			else
			if (global.select_level_index + row < ds_list_size(global.thumbnail_sprite))
			&& (ds_exists(global.all_loaded_main_levels, ds_type_list))
			{
				global.select_level_index += clamp(row, 0, ds_list_size(global.all_loaded_main_levels));
				menu_delay = 3;
				if (mouse_wheel_down())
				{
					scroll_to = scroll + 1
				}
				else
				{
					scroll_to = floor(global.select_level_index / row);
				}
				lerp_on = true;
			}
		}
	}
	#endregion /* Key Down END */
	
	else
	
	#region /* Key Left */
	if (key_left)
	&& (can_input_level_name == false)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (menu != "back_from_level_editor")
	{
		menu_delay = 3;
		if (global.select_level_index - 1 < 0)
		{
			global.select_level_index = ds_list_size(global.thumbnail_sprite) - 1;
		}
		else
		{
			global.select_level_index --;
		}
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	#endregion /* Key Left END */
	
	else
	
	#region /* Key Right */
	if (key_right)
	&& (can_input_level_name == false)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (menu != "back_from_level_editor")
	{
		menu_delay = 3;
		if (global.select_level_index + 1 > ds_list_size(global.thumbnail_sprite) - 1)
		{
			global.select_level_index = 0;
		}
		else
		{
			global.select_level_index ++;
		}
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	#endregion /* Key Right END */
	
	#region /* Key A */
	if (key_a_pressed)
	|| (mouse_check_button_released(mb_left))
	{
		
		#region /* If pressing accept in title screen */
		if (menu == "level_editor_play")
		&& (can_input_level_name == false)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			scroll_to = floor(global.select_level_index / row);
			lerp_on = true;
			menu_delay = 3;
			
			if (take_from_official_level != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
			{
				global.level_name = string(take_from_official_level); /* Set the "level name" to the selected level, so when you exit the level editor, the cursor will remember to appear on the level you selected */
				keyboard_string = string(take_from_official_level);
			}
			can_input_level_name = true;
		}
		#endregion /* If pressing accept in title screen END */
		
		else
		
		#region /* If pressing accept in level editor options */
		if (menu == "choose_official_level_to_take_from")
		&& (can_input_level_name == false)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			scroll_to = floor(global.select_level_index / row);
			lerp_on = true;
			menu_delay = 3;
			
			if (take_from_official_level != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
			&& (global.level_name != undefined)
			&& (variable_instance_exists(self, "level_editor_options_back_to_menu"))
			{
				if (level_editor_options_back_to_menu == "change_entire_theme")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_background1", take_from_official_level);
					ini_write_string("info", "default_background2", take_from_official_level);
					ini_write_string("info", "default_background3", take_from_official_level);
					ini_write_string("info", "default_background4", take_from_official_level);
					ini_write_string("info", "default_foreground1", take_from_official_level);
					ini_write_string("info", "default_foreground1_5", take_from_official_level);
					ini_write_string("info", "default_foreground2", take_from_official_level);
					ini_write_string("info", "default_foreground_secret", take_from_official_level);
					ini_write_string("info", "default_overworld_music", take_from_official_level);
					ini_write_string("info", "default_underwater_music", take_from_official_level);
					ini_write_string("info", "default_overworld_ambience", take_from_official_level);
					ini_write_string("info", "default_underwater_ambience", take_from_official_level);
					ini_write_string("info", "default_clear_melody", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_all_background")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_background1", take_from_official_level);
					ini_write_string("info", "default_background2", take_from_official_level);
					ini_write_string("info", "default_background3", take_from_official_level);
					ini_write_string("info", "default_background4", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_all_foreground")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_foreground1", take_from_official_level);
					ini_write_string("info", "default_foreground1_5", take_from_official_level);
					ini_write_string("info", "default_foreground2", take_from_official_level);
					ini_write_string("info", "default_foreground_secret", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_background1")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_background1", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_background2")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_background2", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_background3")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_background3", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_background4")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_background4", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_foreground1")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_foreground1", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_foreground1_5")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_foreground1_5", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_foreground2")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_foreground2", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_foreground_secret")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_foreground_secret", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_all_music")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_overworld_music", take_from_official_level);
					ini_write_string("info", "default_underwater_music", take_from_official_level);
					ini_write_string("info", "default_overworld_ambience", take_from_official_level);
					ini_write_string("info", "default_underwater_ambience", take_from_official_level);
					ini_write_string("info", "default_clear_melody", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_overworld_music")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_overworld_music", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_underwater_music")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_underwater_music", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_overworld_ambience")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_ambience_music", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_underwater_ambience")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_ambience_music", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_clear_melody")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_clear_melody", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				global.select_level_index = level_editor_options_select_level_index; /* Return "select level index" to what it was before */
				scr_update_all_backgrounds(); /* After setting "select level index" back to what it was before, then update all backgrounds */
				menu = level_editor_options_back_to_menu; /* Lastly, go back to previous menu */
			}
		}
		#endregion /* If pressing accept in level editor options END */
		
	}
	#endregion /* Key A END */
	
	#endregion /* Navigate Menu END */
	
	scr_draw_level_editor_thumbnail(global.all_loaded_main_levels, true);
	
	column = floor(global.select_level_index / row); /* Do this code again here so the sub menu doesn't get misaligned */
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, window_get_width(), 116, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	if (room = rm_title)
	{
		if (window_get_width() <= 1350)
		{
			scr_draw_text_outlined(window_get_width() * 0.5 + 128, 50, l10n_text("Select Template Level"), global.default_text_size * 2, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 50, l10n_text("Select Template Level"), global.default_text_size * 2, c_black, c_white, 1);
		}
		
		scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("These are official levels from the game. Learn how these levels were made!"), global.default_text_size, c_black, c_white, 1);
	}
	else
	if (variable_instance_exists(self, "level_editor_options_back_to_menu"))
	{
		if (window_get_width() <= 1350)
		{
			scr_draw_text_outlined(window_get_width() * 0.5 + 128, 50, l10n_text("Select Official Level"), global.default_text_size * 2, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 50, l10n_text("Select Official Level"), global.default_text_size * 2, c_black, c_white, 1);
		}
		
		if (level_editor_options_back_to_menu == "change_entire_theme")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What theme should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_all_background")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What backgrounds should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_all_foreground")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What foregrounds should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_background1")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What background should Background 1 use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_background2")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What background should Background 2 use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_background3")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What background should Background 3 use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_background4")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What background should Background 4 use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_foreground1")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What foreground should Foreground 1 use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_foreground1_5")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What foreground should Foreground 1.5 use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_foreground2")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What foreground should Foreground 2 use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_foreground_secret")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What foreground should Foreground Secret use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_all_music")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What sounds should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_overworld_music")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What Overworld Music should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_underwater_music")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What Underwater Music should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_overworld_ambience")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What Overworld Ambience should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_underwater_ambience")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What Underwater Ambience should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_clear_melody")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What Clear Melody should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
	}
	
	#region /* Back Button */
	draw_menu_button(0, 0, l10n_text("Back"), "back_from_level_editor", "back_from_level_editor");
	draw_sprite_ext(spr_icons_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
	
	if (menu == "back_from_level_editor")
	&& (key_a_pressed)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (can_input_level_name == false)
	|| (key_b_pressed)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (can_input_level_name == false)
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 320, 42))
	&& (mouse_check_button_released(mb_left))
	{
		can_input_level_name = false;
		menu_delay = 3;
		open_sub_menu = false;
		can_navigate = true;
		select_custom_level_menu_open = false;
		level_editor_template_select = false;
		scr_load_custom_level_initializing();
		global.select_level_index = 0;
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
		if (room == rm_title)
		{
			menu = "load_custom_level";
		}
		else
		if (variable_instance_exists(self, "level_editor_options_back_to_menu"))
		{
			global.select_level_index = level_editor_options_select_level_index; /* Return "select level index" to what it was before */
			menu = level_editor_options_back_to_menu;
		}
	}
	if (menu == "back_from_level_editor")
	&& (key_up)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu_delay = 3;
		can_navigate = true;
		select_custom_level_menu_open = true;
		if (room == rm_title)
		{
			menu = "level_editor_play";
		}
		else
		{
			menu = "choose_official_level_to_take_from";
		}
		if (global.select_level_index - row < 0)
		{
			global.select_level_index = ds_list_size(global.thumbnail_sprite) - 1;
		}
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	if (menu == "back_from_level_editor")
	&& (key_down)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu_delay = 3;
		can_navigate = true;
		select_custom_level_menu_open = true;
		if (room = rm_title)
		{
			menu = "level_editor_play";
		}
		else
		{
			menu = "choose_official_level_to_take_from";
		}
		global.select_level_index = 0;
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	#endregion /* Back Button END */
	
	#region /* Input Level Name */
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	
	#region /* INPUT LEVEL NAME NOW */
	if (keyboard_virtual_status())
	&& (keyboard_virtual_height() != 0)
	{
		var input_name_y = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	{
		var input_name_y = 226 * (column - scroll) + 569 - 3 - 16
	}
	if (can_input_level_name)
	{
		global.level_name = scr_draw_name_input_screen(global.level_name, 32, c_black, 1, false, display_get_gui_width() * 0.5, input_name_y, "level_editor_enter_name_ok", "level_editor_enter_name_cancel");
	}
	#endregion /* INPUT LEVEL NAME NOW END */
	
	#region /* Press Enter to make new level from template */
	if (can_input_level_name)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (keyboard_string != "")
	&& (global.level_name != undefined)
	&& (room == rm_title)
	{
		if (keyboard_check_pressed(vk_enter))
		&& (menu != "level_editor_enter_name_ok")
		&& (menu != "level_editor_enter_name_cancel")
		|| (keyboard_check_pressed(vk_enter))
		&& (menu == "level_editor_enter_name_ok")
		|| (point_in_rectangle(mouse_get_x, mouse_get_y,
		display_get_gui_width() * 0.5 - 185,
		input_name_y + 54,
		display_get_gui_width() * 0.5 - 185 + 370,
		input_name_y + 54 + 42))
		&& (mouse_check_button_released(mb_left))
		|| (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.accept]))
		|| (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][2][action.accept]))
		|| (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][2][action.accept]))
		|| (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][2][action.accept]))
		{
			
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			global.create_level_from_template = true;
			can_navigate = false;
			menu_delay = 9999;
			
			#region /* Create directories */
			if (!directory_exists(working_directory + "custom_levels/" + string(global.level_name)))
			{
				directory_create(working_directory + "custom_levels/" + string(global.level_name));
			}
			if (!directory_exists(working_directory + "custom_levels/" + string(global.level_name) + "/background"))
			{
				directory_create(working_directory + "custom_levels/" + string(global.level_name) + "/background");
			}
			if (!directory_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data"))
			{
				directory_create(working_directory + "custom_levels/" + string(global.level_name) + "/data");
			}
			if (!directory_exists(working_directory + "custom_levels/" + string(global.level_name) + "/sound"))
			{
				directory_create(working_directory + "custom_levels/" + string(global.level_name) + "/sound");
			}
			if (!directory_exists(working_directory + "custom_levels/" + string(global.level_name) + "/tilesets"))
			{
				directory_create(working_directory + "custom_levels/" + string(global.level_name) + "/tilesets");
			}
			#endregion /* Create directories END */
			
			#region /* Copy files from official levels to level editor */
			if (file_exists("levels/" + string(take_from_official_level) + "/tilesets/tileset_default.png"))
			{
				file_copy("levels/" + string(take_from_official_level) + "/tilesets/tileset_default.png",
				working_directory + "custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png");
			}
			if (file_exists("levels/" + string(take_from_official_level) + "/data/level_information.ini"))
			{
				file_copy("levels/" + string(take_from_official_level) + "/data/level_information.ini",
				working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			}
			if (file_exists("levels/" + string(take_from_official_level) + "/data/object_placement_all.json"))
			{
				file_copy("levels/" + string(take_from_official_level) + "/data/object_placement_all.json",
				working_directory + "custom_levels/" + string(global.level_name) + "/data/object_placement_all.json");
			}
			if (file_exists("levels/" + string(take_from_official_level) + "/automatic_thumbnail.png"))
			{
				file_copy("levels/" + string(take_from_official_level) + "/automatic_thumbnail.png",
				working_directory + "custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
			}
			if (file_exists("levels/" + string(take_from_official_level) + "/thumbnail.png"))
			{
				file_copy("levels/" + string(take_from_official_level) + "/thumbnail.png",
				working_directory + "custom_levels/" + string(global.level_name) + "/thumbnail.png");
			}
			#endregion /* Copy files from official levels to level editor END */
			
			if (instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					iris_zoom = 0;
				}
			}
			can_input_level_name = false;
		}
	}
	#endregion /* Press Enter to make new level from template END */
	
	#region /* Press Escape to back out from name input menu */
	if (keyboard_check_pressed(vk_enter))
	&& (menu == "level_editor_enter_name_cancel")
	|| (keyboard_check_pressed(vk_escape))
	|| (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 - 185,
	input_name_y + 54 + 42,
	display_get_gui_width() * 0.5 - 185 + 370,
	input_name_y + 54 + 42 + 42))
	&& (mouse_check_button_released(mb_left))
	|| (mouse_check_button_released(mb_right))
	|| (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.back]))
	|| (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.back]))
	|| (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.back]))
	|| (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][2][action.back]))
	|| (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.back]))
	|| (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][2][action.back]))
	|| (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.back]))
	|| (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][2][action.back]))
	{
		if (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					iris_zoom = 0;
				}
			}
			can_input_level_name = false;
			menu = "level_editor_play";
		}
	}
	#endregion /* Press Escape to back out from name input menu END */
	
	#endregion /* Input Level Name END */
	
}