function scr_select_official_level_menu()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
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
	or (mouse_wheel_up())
	{
		if (can_input_level_name == false)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (menu != "back_from_level_editor")
		{
			if (global.select_level_index - row < 0)
			and (global.controls_used_for_menu_navigation != "mouse")
			and (show_level_editor_corner_menu == true)
			{
				menu_delay = 3;
				menu = "back_from_level_editor";
			}
			else
			if (global.select_level_index - row > - 1)
			{
				global.select_level_index -= clamp(row, 0, ds_list_size(global.all_loaded_main_levels - 2 / row));
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
	or (mouse_wheel_down())
	{
		if (can_input_level_name == false)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (menu != "back_from_level_editor")
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
				global.select_level_index += clamp(row, 0, ds_list_size(global.all_loaded_main_levels - 2 / row));
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
	and (menu != "back_from_level_editor")
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
	and (menu != "back_from_level_editor")
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
	
	#region /* Key A */
	if (key_a_released)
	or (mouse_check_button_released(mb_left))
	{
		if (menu == "level_editor_play")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			scroll_to = floor(global.select_level_index / row);
			lerp_on = true;
			menu_delay = 3;
			global.level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
			keyboard_string = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
			can_input_level_name = true;
		}
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
	
	if (window_get_width() <= 1350)
	{
		scr_draw_text_outlined(window_get_width() * 0.5 + 128, 50, l10n_text("Select Template Level"), global.default_text_size * 2, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(window_get_width() * 0.5, 50, l10n_text("Select Template Level"), global.default_text_size * 2, c_black, c_white, 1);
	}
	
	scr_draw_text_outlined(window_get_width() * 0.5, 100, l10n_text("These are official levels from the game. Learn how these levels were made!"), global.default_text_size, c_black, c_white, 1);
	
	#region /* Back Button */
	draw_menu_button(0, 0, l10n_text("Back"), "back_from_level_editor", "back_from_level_editor");
	draw_sprite_ext(spr_icons_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
	
	if (menu == "back_from_level_editor")
	and (key_a_released)
	and (menu_delay == 0)
	and (can_input_level_name == false)
	or (key_b_pressed)
	and (menu_delay == 0)
	and (can_input_level_name == false)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 320, 42))
	and (mouse_check_button_released(mb_left))
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
		menu = "load_custom_level";
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
	{
		menu_delay = 3;
		can_navigate = true;
		select_custom_level_menu_open = true;
		menu = "level_editor_play";
		global.select_level_index = 0;
		scroll_to = floor(global.select_level_index / row);
		lerp_on = true;
	}
	#endregion /* Back Button END */
	
	#region /* Input Level Name */
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	
	#region /* INPUT LEVEL NAME NOW */
	var input_name_y = 226 * (column - scroll) + 569 - 3 - 16
	if (can_input_level_name == true)
	{
		global.level_name = scr_draw_name_input_screen(global.level_name, 32, c_black, 1, false, display_get_gui_width() * 0.5, input_name_y, "level_editor_enter_name_ok", "level_editor_enter_name_cancel");
	}
	#endregion /* INPUT LEVEL NAME NOW END */
	
	#region /* Press Enter to make new level from template */
	if (can_input_level_name == true)
	and (menu_delay == 0)
	and (keyboard_string != "")
	and (global.level_name != undefined)
	{
		if (keyboard_check_released(vk_enter))
		and (menu != "level_editor_enter_name_ok")
		and (menu != "level_editor_enter_name_cancel")
		or (keyboard_check_released(vk_enter))
		and (menu == "level_editor_enter_name_ok")
		or (point_in_rectangle(mouse_get_x, mouse_get_y,
		display_get_gui_width() * 0.5 - 185,
		input_name_y + 54,
		display_get_gui_width() * 0.5 - 185 + 370,
		input_name_y + 54 + 42))
		and (mouse_check_button_released(mb_left))
		or (gamepad_button_check_released(0, gp_face1))
		or (gamepad_button_check_released(1, gp_face1))
		or (gamepad_button_check_released(2, gp_face1))
		or (gamepad_button_check_released(3, gp_face1))
		{
			
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			global.create_level_from_template = true;
			can_navigate = false;
			menu_delay = 9999;
			
			#region /* Create directories */
			if (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name)))
			{
				directory_create(working_directory + "/custom_levels/" + string(global.level_name));
			}
			if (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds"))
			{
				directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds");
			}
			if (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data"))
			{
				directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/data");
			}
			if (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/sound"))
			{
				directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/sound");
			}
			if (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets"))
			{
				directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets");
			}
			#endregion /* Create directories END */
		
			#region /* Copy files from official levels to level editor */
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.png"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background1.png",
				working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/background1.png");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.png"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background2.png",
				working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/background2.png");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.png"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background3.png",
				working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/background3.png");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.png"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/background4.png",
				working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/background4.png");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.png"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground1.png",
				working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/foreground1.png");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png",
				working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/foreground_above_static_objects.png");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.png"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground2.png",
				working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/foreground2.png");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png",
				working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/foreground_secret.png");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg",
				working_directory + "/custom_levels/" + string(global.level_name) + "/sound/ambience.ogg");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/clear_jingle.ogg"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/clear_jingle.ogg",
				working_directory + "/custom_levels/" + string(global.level_name) + "/sound/clear_jingle.ogg");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg",
				working_directory + "/custom_levels/" + string(global.level_name) + "/sound/music.ogg");
			}
			if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png"))
			{
				file_copy(
				"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png",
				working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png");
			}
			#endregion /* Copy files from official levels to level editor END */
		
			if (asset_get_type("obj_camera") == asset_object)
			and (instance_exists(obj_camera))
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
	if (keyboard_check_released(vk_enter))
	and (menu == "level_editor_enter_name_cancel")
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (keyboard_check_released(vk_escape))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (point_in_rectangle(mouse_get_x, mouse_get_y,
	display_get_gui_width() * 0.5 - 185,
	input_name_y + 54 + 42,
	display_get_gui_width() * 0.5 - 185 + 370,
	input_name_y + 54 + 42 + 42))
	and (mouse_check_button_released(mb_left))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (mouse_check_button_released(mb_right))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (gamepad_button_check_released(0, gp_face2))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (gamepad_button_check_released(1, gp_face2))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (gamepad_button_check_released(2, gp_face2))
	and (can_input_level_name == true)
	and (menu_delay == 0)
	or (gamepad_button_check_released(3, gp_face2))
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
		menu = "level_editor_play";
	}
	#endregion /* Press Escape to back out from name input menu END */
	
	#endregion /* Input Level Name END */
	
	#region /* Enter Template Level */
	if (iris_xscale <= 0.001)
	and (global.character_select_in_this_menu == "level_editor")
	{
		if (asset_get_type("room_leveleditor") == asset_room)
		{
			sprite_delete(title_screen_background);
			
			scr_update_all_backgrounds();
			
			room_goto(room_leveleditor);
		}
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
	}
	#endregion /* Enter Template Level END */
	
}