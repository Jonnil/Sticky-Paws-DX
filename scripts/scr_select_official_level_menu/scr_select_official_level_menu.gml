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
					ini_write_string("info", "default_music_overworld", take_from_official_level);
					ini_write_string("info", "default_music_underwater", take_from_official_level);
					ini_write_string("info", "default_ambience_overworld", take_from_official_level);
					ini_write_string("info", "default_ambience_underwater", take_from_official_level);
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
					ini_write_string("info", "default_music_overworld", take_from_official_level);
					ini_write_string("info", "default_music_underwater", take_from_official_level);
					ini_write_string("info", "default_ambience_overworld", take_from_official_level);
					ini_write_string("info", "default_ambience_underwater", take_from_official_level);
					ini_write_string("info", "default_clear_melody", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_music_overworld")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_music_overworld", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_music_underwater")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_music_underwater", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_ambience_overworld")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "default_ambience_music", take_from_official_level);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (level_editor_options_back_to_menu == "change_ambience_underwater")
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
				
				var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function(){
				
					#region /* Set Backgrounds */
					layer_background_sprite(layer_background_get_id(layer_get_id("Background")), global.custom_background1);
					layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
					layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
					layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
					#endregion /* Set Backgrounds END */
					
					scr_make_background_visible();
				}, [], 1);
				time_source_start(time_source);
				
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
	
	if (room == rm_title)
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
		if (level_editor_options_back_to_menu == "change_music_overworld")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What Overworld Music should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_music_underwater")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What Underwater Music should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_ambience_overworld")
		{
			scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("What Overworld Ambience should this level use?"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (level_editor_options_back_to_menu == "change_ambience_underwater")
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
		if (room == rm_title)
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
		|| (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, input_name_y + 54, display_get_gui_width() * 0.5 - 185 + 370, input_name_y + 54 + 42))
		&& (mouse_check_button_released(mb_left))
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]))
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.accept]))
		{
			scr_switch_expand_save_data(); /* Expand the save data before making new template level */
			if (global.save_data_size_is_sufficient)
			{
				show_debug_message("There is sufficient save data");
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				global.create_level_from_template = true;
				can_navigate = false;
				menu_delay = 9999;
				
				var time_source_period = 1; /* Limit Concurrent Processes */
				
				#region /* Create directories */
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (!directory_exists(working_directory + "custom_levels/" + string(global.level_name)))
					{
						directory_create(working_directory + "custom_levels/" + string(global.level_name));
					}
					show_debug_message("Create template level directory");
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (!directory_exists(working_directory + "custom_levels/" + string(global.level_name) + "/background"))
					{
						directory_create(working_directory + "custom_levels/" + string(global.level_name) + "/background");
					}
					show_debug_message("Create template level background directory");
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (!directory_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data"))
					{
						directory_create(working_directory + "custom_levels/" + string(global.level_name) + "/data");
					}
					show_debug_message("Create template level data directory");
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (!directory_exists(working_directory + "custom_levels/" + string(global.level_name) + "/sound"))
					{
						directory_create(working_directory + "custom_levels/" + string(global.level_name) + "/sound");
					}
					show_debug_message("Create template level sound directory");
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (!directory_exists(working_directory + "custom_levels/" + string(global.level_name) + "/tilesets"))
					{
						directory_create(working_directory + "custom_levels/" + string(global.level_name) + "/tilesets");
					}
					show_debug_message("Create template level tilesets directory");
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				#endregion /* Create directories END */
				
				#region /* Copy files from official levels to level editor */
				/* Don't copy over background and sound files, as they will be set in "level information.ini" with the "default backgground" and "default sound" variables */
				/* Where it will use the backgrounds and sounds from official levels but not copy over the actual files */
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png"))
					{
						file_copy("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png",
						working_directory + "custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png");
						show_debug_message("Copy tileset_default.png from official level");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))
					{
						/* Copy over the "level information.ini" first, before writing to the file */
						file_copy("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini",
						working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						show_debug_message("Copy level_information.ini from official level");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement_all.json"))
					{
						file_copy("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement_all.json",
						working_directory + "custom_levels/" + string(global.level_name) + "/data/object_placement_all.json");
						show_debug_message("Copy object_placement_all.json from official level");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/automatic_thumbnail.png"))
					{
						file_copy("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/automatic_thumbnail.png",
						working_directory + "custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
						show_debug_message("Copy automatic_thumbnail.png from official level");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/thumbnail.png"))
					{
						file_copy("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/thumbnail.png",
						working_directory + "custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png"); /* Make any normal thumbnail into automatic thumbnail, so it can be automatically replaced later */
						show_debug_message("Copy thumbnail.png from official level");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				#endregion /* Copy files from official levels to level editor END */
				
				/* After "level information.ini" has been copied, write new information to it */
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					show_debug_message("ini_open(" + string(working_directory) + "custom_levels/" + string(global.level_name) + "/data/level_information.ini);")
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				/* Update all default background and default sound so it's taken from official level */
				/* Some official levels already use default background and default sound feature */
				/* If the official level doesn't have any files in background and sound folders */
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/background1.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/background1.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_background1")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_background1", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)); /* Then set default */
						show_debug_message("Set default_background1");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/background2.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/background2.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_background2")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_background2", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_background2");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/background3.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/background3.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_background3")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_background3", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_background3");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/background4.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/background4.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_background4")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_background4", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_background4");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/foreground1.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/foreground1.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_foreground1")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_foreground1", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_foreground1");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/foreground1_5.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/foreground1_5.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_foreground1_5")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_foreground1_5", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_foreground1_5");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/foreground2.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/foreground2.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_foreground2")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_foreground2", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_foreground2");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/foreground_secret.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/foreground_secret.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_foreground_secret")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_foreground_secret", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_foreground_secret");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_music_overworld")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_music_overworld", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_music_overworld");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music_underwater.ogg")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music_underwater.ogg")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_music_underwater")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_music_underwater", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_music_underwater");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_ambience_overworld")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_ambience_overworld", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_ambience_overworld");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience_underwater.ogg")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience_underwater.ogg")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_ambience_underwater")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_ambience_underwater", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_ambience_underwater");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/clear_melody.ogg")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/clear_melody.ogg")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_clear_melody")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_clear_melody", ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						show_debug_message("Set default_clear_melody");
					}
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				/* Update the "first created on version" so it's the version when you create the template level */
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					ini_write_string("info", "first_created_on_version", "v" + string(scr_get_build_date()));
					show_debug_message("Set first_created_on_version to v" + string(scr_get_build_date()));
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					allowed_to_load_template_level = true;
					show_debug_message("ini_close();")
				}, [], 1);
				time_source_start(time_source); time_source_period += 1;
				
				can_input_level_name = false;
			}
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
	|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
	|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.back]))
	|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.back]))
	|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.back]))
	|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.back]))
	|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.back]))
	|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.back]))
	|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.back]))
	{
		if (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (instance_exists(obj_camera))
			{
				obj_camera.iris_zoom = 0;
			}
			can_input_level_name = false;
			menu = "level_editor_play";
		}
	}
	#endregion /* Press Escape to back out from name input menu END */
	
	#endregion /* Input Level Name END */
	
}