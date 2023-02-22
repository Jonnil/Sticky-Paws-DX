function scr_select_custom_level_menu()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	if (os_type == os_linux)
	{
		show_delete_button = false;
	}
	else
	{
		show_delete_button = true;
	}
	if (get_window_width >= 1670)
	{
		thumbnail_x_offset = 0;
		row = 4;
	}
	else
	if (get_window_width >= 1276)
	{
		thumbnail_x_offset = 0;
		row = 3;
	}
	else
	if (get_window_width >= 882)
	{
		thumbnail_x_offset = - 64;
		row = 3;
	}
	else
	if (get_window_width >= 488)
	{
		thumbnail_x_offset = - 64;
		row = 1;
	}
	column = clamp(floor(global.select_level_index / row), 0, floor(ds_list_size(global.all_loaded_custom_levels)))
	
	#region /* Navigate Menu */
	
	#region /* Key Up */
	if (key_up)
	and (menu_delay == 0)
	or (mouse_wheel_up())
	{
		if (can_input_level_name == false)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (open_sub_menu == false)
		and (menu != "back_from_level_editor")
		and (menu != "open_custom_levels_folder")
		{
			if (global.select_level_index - row < 0)
			and (global.controls_used_for_menu_navigation != "mouse")
			and (show_level_editor_corner_menu == true)
			{
				menu_delay = 3;
				menu = "open_custom_levels_folder";
			}
			else
			if (global.select_level_index - row > - 1)
			{
				global.select_level_index -= clamp(row, 0, ds_list_size(global.all_loaded_custom_levels - 2 / row));
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
	and (menu_delay == 0)
	or (mouse_wheel_down())
	{
		if (can_input_level_name == false)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (open_sub_menu == false)
		and (menu != "back_from_level_editor")
		and (menu != "open_custom_levels_folder")
		{
			if (global.select_level_index + row > ds_list_size(global.thumbnail_sprite) - 1)
			and (global.controls_used_for_menu_navigation != "mouse")
			and (show_level_editor_corner_menu == true)
			{
				menu_delay = 3;
				menu = "back_from_level_editor";
			}
			else
			if (global.select_level_index + row < ds_list_size(global.thumbnail_sprite))
			{
				global.select_level_index += clamp(row, 0, ds_list_size(global.all_loaded_custom_levels - 2 / row));
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
	and (can_input_level_name == false)
	and (menu_delay == 0)
	and (menu_joystick_delay <= 0)
	and (open_sub_menu == false)
	and (menu != "back_from_level_editor")
	and (menu != "open_custom_levels_folder")
	{
		if (global.select_level_index - 1 < 0)
		{
			global.select_level_index = ds_list_size(global.thumbnail_sprite) - 1;
		}
		else
		{
			global.select_level_index -= 1;
		}
		menu_delay = 3;
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	#endregion /* Key Left END */
	
	else
	
	#region /* Key Right */
	if (key_right)
	and (can_input_level_name == false)
	and (menu_delay == 0)
	and (menu_joystick_delay <= 0)
	and (open_sub_menu == false)
	and (menu != "back_from_level_editor")
	and (menu != "open_custom_levels_folder")
	{
		if (global.select_level_index + 1 > ds_list_size(global.thumbnail_sprite) - 1)
		{
			global.select_level_index = 0;
		}
		else
		{
			global.select_level_index += 1;
		}
		menu_delay = 3;
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	#endregion /* Key Right END */
	
	else
	
	#region /* Key A Pressed */
	if (key_a_pressed)
	or (mouse_check_button_pressed(mb_left))
	{
		if (can_input_level_name == false)
		and (open_sub_menu == false)
		and (menu_delay == 0)
		and (menu != "back_from_level_editor")
		and (menu != "open_custom_levels_folder")
		{
		
			#region /* Create New Level */
			if (global.select_level_index == 0)
			{
				scroll_to = floor(global.select_level_index / row);
				lerp_on = true;
				menu = "level_editor_create_from_scratch";
				menu_delay = 3;
				open_sub_menu = true;
			}
			#endregion /* Create New Level END */
		
			else
		
			#region /* Open sub menu for levels */
			if (global.select_level_index >= 1)
			{
				scroll_to = floor(global.select_level_index / row);
				lerp_on = true;
				menu = "level_editor_play";
				menu_delay = 3;
				open_sub_menu = true;
			}
			#endregion /* Open sub menu for levels END */
		
		}
	}
	#endregion /* Key A Pressed END */
	
	else
	
	#region /* Key B Pressed */
	if (key_b_pressed)
	and (can_input_level_name == false)
	and (menu_delay == 0)
	and (show_level_editor_corner_menu = true)
	{
		if (open_sub_menu == true)
		{
			menu_delay = 3;
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
			menu = "level_editor_play";
		}
	}
	#endregion /* Key B Pressed END */
	
	#endregion /* Navigate Menu END */
	
	scr_draw_level_editor_thumbnail(global.all_loaded_custom_levels, false);
	
	column = floor(global.select_level_index / row); /* Do this code again here so the sub menu doesn't get misaligned */
	
	scr_draw_level_editor_sub_menu(); /* Code must be here to be above everything else */
	
	if (menu != "load_custom_level")
	and (menu != "load_characters")
	and (menu != "load_official_level_template")
	and (show_level_editor_corner_menu == true)
	{
		
		#region /* Back Button */
		draw_menu_button(0, 0, l10n_text("Back"), "back_from_level_editor", "back_from_level_editor");
		draw_sprite_ext(spr_icons_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
		if (menu == "back_from_level_editor")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (open_sub_menu == false)
		and (can_input_level_name == false)
		or (key_b_pressed)
		and (menu_delay == 0)
		and (open_sub_menu == false)
		and (can_input_level_name == false)
		or (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 320, 42))
		and (mouse_check_button_pressed(mb_left))
		{
			can_input_level_name = false;
			menu_delay = 3;
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
			can_navigate = true;
			select_custom_level_menu_open = false;
			level_editor_template_select = false;
			global.select_level_index = 0;
			scroll_to = floor(global.select_level_index / row);
			lerp_on = true;
			menu = "leveleditor";
		}
		if (menu == "back_from_level_editor")
		and (key_up)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "level_editor_play";
			if (global.select_level_index - row < 0)
			{
				global.select_level_index = ds_list_size(global.thumbnail_sprite) - 1;
			}
			scroll_to = floor(global.select_level_index / row);
			lerp_on = true;
		}
		if (menu == "back_from_level_editor")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (show_level_editor_corner_menu == true)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "open_custom_levels_folder";
			lerp_on = true;
		}
		if (menu == "back_from_level_editor")
		{
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
		}
		#endregion /* Back Button END */
		
		#region /* Open Custom Levels Folder */
		draw_menu_button(0, 42, l10n_text("Open Custom Levels Folder"), "open_custom_levels_folder", "open_custom_levels_folder");
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 42 + 2, 371, 42 + 41))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		or (menu == "open_custom_levels_folder")
		and (key_a_pressed)
		and (menu_delay == 0)
		{
			scr_open_folder(game_save_id + "\custom_levels")
		}
		if (menu == "open_custom_levels_folder")
		and (key_up)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (show_level_editor_corner_menu == true)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "back_from_level_editor";
			lerp_on = true;
		}
		if (menu == "open_custom_levels_folder")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "level_editor_play";
			global.select_level_index = 0;
			scroll_to = floor(global.select_level_index / row);
			lerp_on = true;
		}
		if (menu == "open_custom_levels_folder")
		{
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
		}
		#endregion /* Open Custom Levels Folder END */
		
	}
	
	#region /* Enter Custom Level */
	if (iris_xscale <= 0.001)
	and (global.character_select_in_this_menu == "level_editor")
	{
		if (audio_is_playing(title_music))
		{
			audio_stop_sound(title_music);
		}
		if (asset_get_type("room_leveleditor") == asset_room)
		{
			sprite_delete(title_screen_background);
			
			scr_update_all_backgrounds();
			
			room_goto(room_leveleditor);
		}
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
	}
	#endregion /* Enter Custom Level END */
	
	#region /* Input Level Name */
	if (menu == "level_editor_enter_name_ok")
	or (menu == "level_editor_enter_name_cancel")
	{
		var draw_name_input_screen_y = 226 * (column - scroll) + 500;
		
		show_level_editor_corner_menu = false;
		if (can_input_level_name == true)
		{
			global.level_name = scr_draw_name_input_screen(global.level_name, 32, c_black, 1, false, 394 * (global.select_level_index - column * row) + 300 + thumbnail_x_offset, draw_name_input_screen_y, "level_editor_enter_name_ok", "level_editor_enter_name_cancel");
		}
		
		#region /* Press Enter to make new level from scratch */
		if (can_input_level_name == true)
		and (menu_delay == 0)
		and (keyboard_string != "")
		and (global.level_name != undefined)
		{
			if (keyboard_check_pressed(vk_enter))
			and (menu != "level_editor_enter_name_ok")
			and (menu != "level_editor_enter_name_cancel")
			or (keyboard_check_pressed(vk_enter))
			and (menu == "level_editor_enter_name_ok")
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			394 * (global.select_level_index - column * row) + 300 - 185 + thumbnail_x_offset,
			draw_name_input_screen_y + 54,
			394 * (global.select_level_index - column * row) + 300 - 185 + 370 + thumbnail_x_offset,
			draw_name_input_screen_y + 54 + 42))
			and (mouse_check_button_pressed(mb_left))
			or (gamepad_button_check_pressed(0, global.player1_gamepad_button_accept))
			or (gamepad_button_check_pressed(1, global.player2_gamepad_button_accept))
			or (gamepad_button_check_pressed(2, global.player3_gamepad_button_accept))
			or (gamepad_button_check_pressed(3, global.player4_gamepad_button_accept))
			{
				if (level_editor_edit_name == true)
				and (global.level_name != old_level_name)
				{
					can_navigate = true;
					menu_delay = 3;
					scr_copy_move_files(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), string(game_save_id) + "\custom_levels\\" + string(global.level_name), true);
					scr_load_custom_level_initializing();
					menu = "load_custom_level";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == true)
				and (global.level_name == old_level_name)
				{
					menu = "level_editor_edit_name";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == false)
				{
					can_navigate = false;
					menu_delay = 9999;
					if (asset_get_type("obj_camera") == asset_object)
					and (instance_exists(obj_camera))
					{
						with(obj_camera)
						{
							iris_zoom = 0;
						}
					}
				}
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_input_level_name = false;
			}
		}
		#endregion /* Press Enter to make new level from scratch END */
		
		#region /* Press Escape to back out from level from scratch menu */
		if (keyboard_check_pressed(vk_enter))
		and (menu == "level_editor_enter_name_cancel")
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (keyboard_check_pressed(vk_escape))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (point_in_rectangle(mouse_get_x, mouse_get_y,
		394 * (global.select_level_index - column * row) + 300 - 185 + thumbnail_x_offset,
		draw_name_input_screen_y + 54 + 42,
		394 * (global.select_level_index - column * row) + 300 - 185 + 370 + thumbnail_x_offset,
		draw_name_input_screen_y + 54 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (mouse_check_button_pressed(mb_right))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (gamepad_button_check_pressed(0, global.player1_gamepad_button_back))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (gamepad_button_check_pressed(1, global.player2_gamepad_button_back))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (gamepad_button_check_pressed(2, global.player3_gamepad_button_back))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (gamepad_button_check_pressed(3, global.player4_gamepad_button_back))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			if (asset_get_type("obj_camera") == asset_object)
			and (instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					iris_zoom = 0;
				}
			}
			can_input_level_name = false;
			if (level_editor_edit_name == true)
			{
				menu = "level_editor_edit_name";
				level_editor_edit_name = false;
			}
			else
			{
				menu = "level_editor_create_from_scratch";
				menu = "level_editor_create_from_scratch";
			}
		}
		#endregion /* Press Escape to back out from level from scratch menu END */
		
	}
	#endregion /* Input Level Name END */
	
	#region /* Edit level description */
	if (menu == "level_editor_enter_description_ok")
	or (menu == "level_editor_enter_description_cancel")
	{
		var draw_description_input_screen_y = get_window_height * 0.5;
		
		if (can_input_level_name == true)
		{
			global.level_description = scr_draw_name_input_screen(global.level_description, 75, c_black, 1, false, get_window_width * 0.5, draw_description_input_screen_y, "level_editor_enter_description_ok", "level_editor_enter_description_cancel");
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5, draw_description_input_screen_y - 32, l10n_text("Enter level description for") + " " + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), global.default_text_size, c_black, c_white, 1);
		}
		
		#region /* Input Level Description */
		
		#region /* Press Enter to make new level from scratch */
		if (can_input_level_name == true)
		and (menu_delay == 0)
		and (keyboard_string != "")
		and (global.level_description != undefined)
		{
			if (keyboard_check_pressed(vk_enter))
			and (menu != "level_editor_enter_description_ok")
			and (menu != "level_editor_enter_description_cancel")
			or (keyboard_check_pressed(vk_enter))
			and (menu == "level_editor_enter_description_ok")
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 - 185,
			draw_description_input_screen_y + 54,
			get_window_width * 0.5 - 185 + 370,
			draw_description_input_screen_y + 54 + 42))
			and (mouse_check_button_pressed(mb_left))
			or (gamepad_button_check_pressed(0, global.player1_gamepad_button_accept))
			or (gamepad_button_check_pressed(1, global.player2_gamepad_button_accept))
			or (gamepad_button_check_pressed(2, global.player3_gamepad_button_accept))
			or (gamepad_button_check_pressed(3, global.player4_gamepad_button_accept))
			{
				if (level_editor_edit_name == true)
				and (global.level_description != old_level_description)
				{
					can_navigate = true;
					menu_delay = 3;
					
					/* Save description to level_information.ini */
					ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
					ini_write_string("info", "level_description", string(global.level_description));
					ini_close();
					
					menu = "level_editor_enter_description";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == true)
				and (global.level_description == old_level_description)
				{
					menu = "level_editor_enter_description";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == false)
				{
					can_navigate = false;
					menu_delay = 9999;
					if (asset_get_type("obj_camera") == asset_object)
					and (instance_exists(obj_camera))
					{
						with(obj_camera)
						{
							iris_zoom = 0;
						}
					}
				}
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_input_level_name = false;
			}
		}
		#endregion /* Press Enter to make new level from scratch END */
		
		#region /* Press Escape to back out from level from scratch menu */
		if (keyboard_check_pressed(vk_enter))
		and (menu == "level_editor_enter_description_cancel")
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (keyboard_check_pressed(vk_escape))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 - 185,
		draw_description_input_screen_y + 54 + 42,
		get_window_width * 0.5 - 185 + 370,
		draw_description_input_screen_y + 54 + 42 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (mouse_check_button_pressed(mb_right))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (gamepad_button_check_pressed(0, global.player1_gamepad_button_back))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (gamepad_button_check_pressed(1, global.player2_gamepad_button_back))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (gamepad_button_check_pressed(2, global.player3_gamepad_button_back))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		or (gamepad_button_check_pressed(3, global.player4_gamepad_button_back))
		and (can_input_level_name == true)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			if (asset_get_type("obj_camera") == asset_object)
			and (instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					iris_zoom = 0;
				}
			}
			can_input_level_name = false;
			if (level_editor_edit_name == true)
			{
				menu = "level_editor_enter_description";
				level_editor_edit_name = false;
			}
			else
			{
				menu = "level_editor_enter_description";
			}
		}
		#endregion /* Press Escape to back out from level from scratch menu END */
	
		#endregion /* Input Level Description END */
		
	}
	#endregion /* Edit level description END */
	
	#region /* Draw Level Description */
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
	{
		ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
		if (ini_key_exists("info", "level_description"))
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 74, string(ini_read_string("info", "level_description", "")), global.default_text_size * 1.25, c_black, c_white, 1);
		}
		ini_close();
	}
	#endregion /* Draw Level Description END */
	
	#region /* Show the path of the custom level on the bottom of the screen */
	if (global.select_level_index >= 1)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (get_window_width <= 1350)
		{
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "\\", "/"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		}
		else
		{
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "\\", "/"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
	}
	#endregion /* Show the path of the custom level on the bottom of the screen END */
	
	scr_draw_upload_level_menu(); /* Draw upload level menu above everything */
	
}