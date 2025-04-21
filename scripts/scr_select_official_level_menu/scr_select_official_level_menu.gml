function scr_select_official_level_menu()
{
	if (!in_online_download_list_menu)
	&& (!in_online_search_id)
	{
	
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		var take_from_official_level = ds_list_find_value(global.all_loaded_main_levels, global.select_level_index);
	
		scroll = lerp(scroll, scroll_to, 0.15)
	
		if (window_get_width() >= 1670 - 100)
		{
			row = 4;
		}
		else
		if (window_get_width() >= 1276 - 100)
		{
			row = 3;
		}
		else
		if (window_get_width() >= 882 - 100)
		{
			row = 2;
		}
		else
		if (window_get_width() >= 488 - 100)
		{
			row = 1;
		}
		column = clamp(floor(global.select_level_index / row), 0, floor(ds_list_size(global.all_loaded_main_levels)))
	
		#region /* Navigate Menu */
	
		#region /* Key Up */
		if (key_up)
		|| (mouse_wheel_up())
		{
			if (!can_input_level_name)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (menu != "back_from_level_editor")
			{
				if (global.select_level_index - row < 0)
				&& (global.controls_used_for_navigation != "mouse")
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
				}
			}
		}
		#endregion /* Key Up END */
	
		else
	
		#region /* Key Down */
		if (key_down)
		|| (mouse_wheel_down())
		{
			if (!can_input_level_name)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (menu != "back_from_level_editor")
			{
				if (global.select_level_index + row > ds_list_size(global.thumbnail_sprite) - 1)
				&& (global.controls_used_for_navigation != "mouse")
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
				}
			}
		}
		#endregion /* Key Down END */
	
		else
	
		#region /* Key Left */
		if (key_left)
		&& (!can_input_level_name)
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
		}
		#endregion /* Key Left END */
	
		else
	
		#region /* Key Right */
		if (key_right)
		&& (!can_input_level_name)
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
		}
		#endregion /* Key Right END */
	
		#region /* Key A */
		if (key_a_pressed)
		|| (mouse_check_button_released(mb_left))
		{
		
			#region /* If pressing accept in title screen */
			if (menu == "level_editor_play")
			&& (!can_input_level_name)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				scroll_to = floor(global.select_level_index / row);
				menu_delay = 3;
			
				if (take_from_official_level != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
				{
					global.level_name = string(take_from_official_level); /* Set the "level name" to the selected level, so when you exit the level editor, the cursor will remember to appear on the level you selected */
					keyboard_string = string(take_from_official_level);
				}
				menu = "level_editor_enter_name_ok";
				can_input_level_name = true;
			}
			#endregion /* If pressing accept in title screen END */
		
			else
		
			#region /* If pressing accept in level editor options */
			if (menu == "choose_official_level_to_take_from")
			&& (!can_input_level_name)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				scroll_to = floor(global.select_level_index / row);
				menu_delay = 3;
			
				if (take_from_official_level != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
				&& (global.level_name != undefined)
				&& (variable_instance_exists(self, "level_editor_option_back_to_menu"))
				{
					if (level_editor_option_back_to_menu == "change_entire_theme")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_background1", take_from_official_level);
						ini_write_string("info", "default_background2", take_from_official_level);
						ini_write_string("info", "default_background3", take_from_official_level);
						ini_write_string("info", "default_background4", take_from_official_level);
						ini_write_string("info", "default_foreground1", take_from_official_level);
						ini_write_string("info", "default_foreground1_5", take_from_official_level);
						ini_write_string("info", "default_foreground2", take_from_official_level);
						ini_write_string("info", "default_foreground_secret", take_from_official_level);
						ini_write_string("info", "default_music_overworld", take_from_official_level);global.default_music_overworld = string(take_from_official_level);
						ini_write_string("info", "default_music_underwater", take_from_official_level);global.default_music_underwater = string(take_from_official_level);
						ini_write_string("info", "default_ambience_overworld", take_from_official_level);global.default_ambience_overworld = string(take_from_official_level);
						ini_write_string("info", "default_ambience_underwater", take_from_official_level);global.default_ambience_underwater = string(take_from_official_level);
						ini_write_string("info", "default_clear_melody", take_from_official_level);global.default_clear_melody = string(take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_all_background")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_background1", take_from_official_level);
						ini_write_string("info", "default_background2", take_from_official_level);
						ini_write_string("info", "default_background3", take_from_official_level);
						ini_write_string("info", "default_background4", take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_all_foreground")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_foreground1", take_from_official_level);
						ini_write_string("info", "default_foreground1_5", take_from_official_level);
						ini_write_string("info", "default_foreground2", take_from_official_level);
						ini_write_string("info", "default_foreground_secret", take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_background1")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_background1", take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_background2")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_background2", take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_background3")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_background3", take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_background4")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_background4", take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_foreground1")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_foreground1", take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_foreground1_5")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_foreground1_5", take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_foreground2")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_foreground2", take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_foreground_secret")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_foreground_secret", take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_all_music")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_music_overworld", take_from_official_level);global.default_music_overworld = string(take_from_official_level);
						ini_write_string("info", "default_music_underwater", take_from_official_level);global.default_music_underwater = string(take_from_official_level);
						ini_write_string("info", "default_ambience_overworld", take_from_official_level);global.default_ambience_overworld = string(take_from_official_level);
						ini_write_string("info", "default_ambience_underwater", take_from_official_level);global.default_ambience_underwater = string(take_from_official_level);
						ini_write_string("info", "default_clear_melody", take_from_official_level);global.default_clear_melody = string(take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_music_overworld")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_music_overworld", take_from_official_level);global.default_music_overworld = string(take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_music_underwater")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_music_underwater", take_from_official_level);global.default_music_underwater = string(take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_ambience_overworld")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_ambience_overworld", take_from_official_level);global.default_ambience_overworld = string(take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_ambience_underwater")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_ambience_underwater", take_from_official_level);global.default_ambience_underwater = string(take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					else
					if (level_editor_option_back_to_menu == "change_clear_melody")
					{
						ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "default_clear_melody", take_from_official_level);global.default_clear_melody = string(take_from_official_level);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
					global.select_level_index = level_editor_option_select_level_index; /* Return "select level index" to what it was before */
				
					if (level_editor_option_back_to_menu != "change_all_music") /* Don't reload all backgrounds if you are only changing sound related options */
					&& (level_editor_option_back_to_menu != "change_music_overworld")
					&& (level_editor_option_back_to_menu != "change_music_underwater")
					&& (level_editor_option_back_to_menu != "change_ambience_overworld")
					&& (level_editor_option_back_to_menu != "change_ambience_underwater")
					&& (level_editor_option_back_to_menu != "change_clear_melody")
					{
						scr_update_all_backgrounds(); /* After setting "select level index" back to what it was before, then update all backgrounds */
					}
					scr_update_all_music();
				
					var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function(){
				
						#region /* Set Backgrounds */
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_1")), global.custom_background1);
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
						#endregion /* Set Backgrounds END */
					
						scr_make_background_visible();
					}, [], 1);
					time_source_start(time_source);
				
					menu = level_editor_option_back_to_menu; /* Lastly, go back to previous menu */
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
		draw_roundrect_color_ext(0, 0, display_get_gui_width(), 116, 50, 50, c_black, c_black, false);
		draw_set_alpha(1);
	
		if (room == rm_title)
		{
			if (window_get_width() <= 1350)
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5 + 128, 50, l10n_text("Select Template Level"), global.default_text_size * 2, c_black, c_white, 1);
			}
			else
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 50, l10n_text("Select Template Level"), global.default_text_size * 2, c_black, c_white, 1);
			}
		
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("These are official levels from the game. Learn how these levels were made!"), global.default_text_size, c_black, c_white, 1);
		}
		else
		if (variable_instance_exists(self, "level_editor_option_back_to_menu"))
		{
			if (window_get_width() <= 1350)
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5 + 128, 50, l10n_text("Select Official Level"), global.default_text_size * 2, c_black, c_white, 1);
			}
			else
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 50, l10n_text("Select Official Level"), global.default_text_size * 2, c_black, c_white, 1);
			}
		
			if (level_editor_option_back_to_menu == "change_entire_theme")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What theme should this level use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_all_background")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What backgrounds should this level use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_all_foreground")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What foregrounds should this level use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_background1")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What background should Background 1 use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_background2")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What background should Background 2 use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_background3")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What background should Background 3 use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_background4")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What background should Background 4 use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_foreground1")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What foreground should Foreground 1 use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_foreground1_5")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What foreground should Foreground 1.5 use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_foreground2")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What foreground should Foreground 2 use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_foreground_secret")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What foreground should Foreground Secret use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_all_music")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What sounds should this level use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_music_overworld")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What Overworld Music should this level use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_music_underwater")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What Underwater Music should this level use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_ambience_overworld")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What Overworld Ambience should this level use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_ambience_underwater")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What Underwater Ambience should this level use?"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (level_editor_option_back_to_menu == "change_clear_melody")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, l10n_text("What Clear Melody should this level use?"), global.default_text_size, c_black, c_white, 1);
			}
		}
	
		#region /* Back Button */
		draw_menu_button(0, 0, l10n_text("Back"), "back_from_level_editor", "back_from_level_editor");
		draw_sprite_ext(spr_icon_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
	
		if (menu == "back_from_level_editor")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!can_input_level_name)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!can_input_level_name)
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
			if (room == rm_title)
			{
				menu = "load_custom_level";
			}
			else
			if (variable_instance_exists(self, "level_editor_option_back_to_menu"))
			{
				global.select_level_index = level_editor_option_select_level_index; /* Return "select level index" to what it was before */
				menu = level_editor_option_back_to_menu;
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
		}
		#endregion /* Back Button END */
	
		#region /* Input Level Name */
	
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
	
		#region /* INPUT LEVEL NAME NOW */
		if (keyboard_virtual_status()
		&& keyboard_virtual_height() != 0
		&& keyboard_virtual_height() != undefined)
		{
			var input_name_y = display_get_gui_height() - keyboard_virtual_height() - 160;
		}
		else
		{
			var input_name_y = 226 * (column - scroll) + 569 - 3 - 16
		}
		if (can_input_level_name)
		{
			global.level_name = scr_draw_name_input_screen(global.level_name, 32, c_black, 1, false, display_get_gui_width() * 0.5, input_name_y, "level_editor_enter_name_ok", "level_editor_enter_name_cancel", false, true, false);
		}
		#endregion /* INPUT LEVEL NAME NOW END */
	
		#region /* Press Enter to make new level from template */
		if (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (keyboard_string != "")
		&& (global.level_name != undefined)
		&& (room == rm_title)
		{
			if (global.clicking_ok_input_screen)
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
				
					/* For actual folder name, replace illegal characters with underscore only for naming folder */
					var folder_name = scr_get_unique_folder_name(game_save_id + "custom_levels/", global.level_name);
					
					#region /* Create directories */
					directory_create(game_save_id + "custom_levels/" + string(folder_name));
					show_debug_message("Create template level directory");
					
					directory_create(game_save_id + "custom_levels/" + string(folder_name) + "/background");
					show_debug_message("Create template level background directory");
					
					directory_create(game_save_id + "custom_levels/" + string(folder_name) + "/data");
					show_debug_message("Create template level data directory");
					
					directory_create(game_save_id + "custom_levels/" + string(folder_name) + "/sound");
					show_debug_message("Create template level sound directory");
					
					directory_create(game_save_id + "custom_levels/" + string(folder_name) + "/tilesets");
					show_debug_message("Create template level tilesets directory");
					#endregion /* Create directories END */
					
					#region /* Copy files from official levels to level editor */
					/* Don't copy over background and sound files, as they will be set in "level information.ini" with the "default backgground" and "default sound" variables */
					/* Where it will use the backgrounds and sounds from official levels but not copy over the actual files */
					
					if (file_exists("levels/" + string(take_from_official_level) + "/tilesets/tileset_default.png"))
					{
						file_copy("levels/" + string(take_from_official_level) + "/tilesets/tileset_default.png",
						game_save_id + "custom_levels/" + folder_name + "/tilesets/tileset_default.png");
						show_debug_message("Copy tileset_default.png from official level");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/data/level_information.ini"))
					{
						/* Copy over the "level information.ini" first, before writing to the file */
						file_copy("levels/" + string(take_from_official_level) + "/data/level_information.ini",
						game_save_id + "custom_levels/" + folder_name + "/data/level_information.ini");
						show_debug_message("Copy level_information.ini from official level");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/data/object_placement_all.json"))
					{
						file_copy("levels/" + string(take_from_official_level) + "/data/object_placement_all.json",
						game_save_id + "custom_levels/" + folder_name + "/data/object_placement_all.json");
						show_debug_message("Copy object_placement_all.json from official level");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/automatic_thumbnail.png"))
					{
						file_copy("levels/" + string(take_from_official_level) + "/automatic_thumbnail.png",
						game_save_id + "custom_levels/" + folder_name + "/automatic_thumbnail.png");
						show_debug_message("Copy automatic_thumbnail.png from official level");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/thumbnail.png"))
					{
						file_copy("levels/" + string(take_from_official_level) + "/thumbnail.png",
						game_save_id + "custom_levels/" + folder_name + "/automatic_thumbnail.png"); /* Make any normal thumbnail into automatic thumbnail, so it can be automatically replaced later */
						show_debug_message("Copy thumbnail.png from official level");
					}
					#endregion /* Copy files from official levels to level editor END */
					
					/* After "level information.ini" has been copied, write new information to it */
					ini_open(game_save_id + "custom_levels/" + folder_name + "/data/level_information.ini");
					
					/* Update all default background and default sound so it's taken from official level */
					/* Some official levels already use default background and default sound feature */
					/* If the official level doesn't have any files in background and sound folders */
					if (file_exists("levels/" + string(take_from_official_level) + "/background/background1.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/background/background1.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_background1")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_background1", take_from_official_level); /* Then set default */
						global.default_background1 = string(take_from_official_level);
						show_debug_message("Set default_background1");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/background/background2.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/background/background2.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_background2")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_background2", take_from_official_level);
						global.default_background2 = string(take_from_official_level);
						show_debug_message("Set default_background2");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/background/background3.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/background/background3.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_background3")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_background3", take_from_official_level);
						global.default_background3 = string(take_from_official_level);
						show_debug_message("Set default_background3");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/background/background4.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/background/background4.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_background4")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_background4", take_from_official_level);
						global.default_background4 = string(take_from_official_level);
						show_debug_message("Set default_background4");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/background/foreground1.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/background/foreground1.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_foreground1")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_foreground1", take_from_official_level);
						global.default_foreground1 = string(take_from_official_level);
						show_debug_message("Set default_foreground1");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/background/foreground1_5.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/background/foreground1_5.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_foreground1_5")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_foreground1_5", take_from_official_level);
						global.default_foreground1_5 = string(take_from_official_level);
						show_debug_message("Set default_foreground1_5");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/background/foreground2.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/background/foreground2.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_foreground2")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_foreground2", take_from_official_level);
						global.default_foreground2 = string(take_from_official_level);
						show_debug_message("Set default_foreground2");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/background/foreground_secret.png")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/background/foreground_secret.png")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_foreground_secret")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_foreground_secret", take_from_official_level);
						global.default_foreground_secret = string(take_from_official_level);
						show_debug_message("Set default_foreground_secret");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/sound/music.ogg")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/sound/music.ogg")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_music_overworld")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_music_overworld", take_from_official_level);
						global.default_music_overworld = string(take_from_official_level);
						show_debug_message("Set default_music_overworld");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/sound/music_underwater.ogg")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/sound/music_underwater.ogg")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_music_underwater")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_music_underwater", take_from_official_level);
						global.default_music_underwater = string(take_from_official_level);
						show_debug_message("Set default_music_underwater");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/sound/ambience.ogg")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/sound/ambience.ogg")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_ambience_overworld")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_ambience_overworld", take_from_official_level);
						global.default_ambience_overworld = string(take_from_official_level);
						show_debug_message("Set default_ambience_overworld");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/sound/ambience_underwater.ogg")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/sound/ambience_underwater.ogg")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_ambience_underwater")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_ambience_underwater", take_from_official_level);
						global.default_ambience_underwater = string(take_from_official_level);
						show_debug_message("Set default_ambience_underwater");
					}
					
					if (file_exists("levels/" + string(take_from_official_level) + "/sound/clear_melody.ogg")) /* If file exists, then set default to official level */
					|| (!file_exists("levels/" + string(take_from_official_level) + "/sound/clear_melody.ogg")) /* If file doesn't exist... */
					&& (!ini_key_exists("info", "default_clear_melody")) /* ...and there isn't a default set already */
					{
						ini_write_string("info", "default_clear_melody", take_from_official_level);
						global.default_clear_melody = string(take_from_official_level);
						show_debug_message("Set default_clear_melody");
					}
					
					/* Update the "first created on version" so it's the version when you create the template level */
					ini_write_string("info", "first_created_on_version", "v" + scr_get_build_date());
					ini_write_string("info", "first_created_on_os_type", os_type);
					show_debug_message("[scr_select_official_level_menu] Save level name to custom level as: " + string(global.level_name));
					ini_write_string("info", "level_name", string(global.level_name));
					ini_write_string("info", "level_description", ""); /* Save a blank level description */
					show_debug_message("Set first_created_on_version to v" + scr_get_build_date());
					
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					
					global.level_name = string(folder_name); /* Set the global level name to the filtered level name, because it will be reading filtered folder names */
					
					allowed_to_load_template_level = true;
					
					can_input_level_name = false;
				}
				else
				{
					menu_delay = 3;
					can_input_level_name = false;
					global.clicking_ok_input_screen = false;
				}
			}
		}
		#endregion /* Press Enter to make new level from template END */
		
		#region /* Press Escape to back out from name input menu */
		if (global.clicking_cancel_input_screen)
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
}