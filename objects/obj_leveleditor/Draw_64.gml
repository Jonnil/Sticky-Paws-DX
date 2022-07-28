if (quit_level_editor = false)
{
	scr_set_screen_size();
	
	#region /*Pause Menu*/
	if (pause = false)
	{
		if (keyboard_check_pressed(vk_escape))
		or(gamepad_button_check_pressed(0, gp_start))
		{
			scr_save_custom_level(); /*Save level before going to the pause menu*/
			
			global.pause_room = room_leveleditor;
			quit_level_editor = false;
			can_input_level_name = false;
			pause = true;
			input_key = false;
			menu = "continue";
		}
	}
	else
	if (pause = true)
	and (quit_level_editor <= 0)
	{
		
		#region /*Make Background Darker*/
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /*Make Background Darker END*/
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		if (keyboard_check_pressed(vk_escape))
		and (input_key = false)
		or(gamepad_button_check_pressed(0, gp_start))
		and (input_key = false)
		{
			quit_level_editor = false;
			can_input_level_name = false;
			pause = false;
			can_navigate = false;
		}
	
		#region /*Make the menu invisible when entering the options menu*/
		if (menu = "continue")
		or(menu = "options")
		or(menu = "level_editor_options")
		or(menu = "generate_level_map")
		or(menu = "open_custom_levels_folder")
		or(menu = "quit")
		{
			
			#region /*Show what version of the game the level was first created in*/
			/*This should make it easier to port old levels to new game versions*/
			/*Showing the original version number makes it easier to pinpoint what changes happened from one version to another*/
			if (global.select_level_index >= 1)
			and (global.create_level_from_template = false)
			{
				ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
			}
			else
			if (global.level_name != "")
			{
				ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			}
			if (ini_key_exists("info", "first_created_on_version"))
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_center);
				draw_text_outlined(window_get_width() / 2, window_get_height() - 32, Text("First created on version") + ": " + ini_read_string("info", "first_created_on_version", "v" + GM_version), global.default_text_size, c_black, c_white, 1);
			}
			ini_close();
			#endregion /*Show what version of the game the level was first created in END*/
			
			if (key_b_pressed)
			and (menu_delay = 0)
			{
				menu_delay = 10;
				quit_level_editor = false;
				can_input_level_name = false;
				pause = false;
				can_navigate = false;
			}
			
			in_settings = false;
			
			#region /*If menu is on continue*/
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 - 126, Text("Continue"), "continue", noone);
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 - 126 + 21, 1, 1, 0, c_white, 1);
			
			if (point_in_rectangle(cursor_x, cursor_y, window_get_width() / 2 - 185, window_get_height() / 2 - 126, window_get_width() / 2 + 185, window_get_height() / 2 -84))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			{
				menu_delay = 10;
				quit_level_editor = false;
				can_input_level_name = false;
				pause = false;
			}
			if (menu = "continue")
			and (can_input_level_name = false)
			{
				if (key_up)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "quit";
				}
				else
				if (key_down)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "options";
				}
				if (key_a_pressed)
				or(keyboard_check_pressed(vk_enter))
				{
					if (menu_delay = 0)
					{
						menu_delay = 10;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = false;
					}
				}
			}
			#endregion /*If menu is on continue END*/
			
			#region /*If menu is on options*/
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 -84, Text("Options"), "options", noone);
			draw_sprite_ext(spr_icons_cogwheel, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 -84 + 21, 1, 1, 0, c_white, 1);
			
			if (point_in_rectangle(cursor_x, cursor_y, window_get_width() / 2 - 185, window_get_height() / 2 -84, window_get_width() / 2 + 185, window_get_height() / 2 - 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			{
				quit_level_editor = false;
				can_input_level_name = false;
				pause = true;
				can_navigate = true;
				in_settings = true;
				can_navigate_settings_sidebar = true;
				menu = noone;
				menu_delay = 10;
			}
			
			if (menu = "options")
			and (can_input_level_name = false)
			{
				if (key_up)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "continue";
				}
				else
				if (key_down)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "level_editor_options";
				}
				if (key_a_pressed)
				or (keyboard_check_pressed(vk_enter))
				{
					if (menu_delay = 0)
					{
						quit_level_editor = false;
						can_input_level_name = false;
						pause = true;
						can_navigate = true;
						in_settings = true;
						can_navigate_settings_sidebar = true;
						menu = noone;
						menu_delay = 10;
					}
				}
				if (key_b_pressed)
				and (menu_delay = 0)
				{
					menu_delay = 10;
					quit_level_editor = false;
					can_input_level_name = false;
					pause = false;
					can_navigate = false;
				}
			}
			#endregion /*If menu is on options END*/
			
			#region /*If menu is on level editor options*/
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 -42, Text("Level Editor Options"), "level_editor_options", "custom_background_1_x_offset");
			
			if (point_in_rectangle(cursor_x, cursor_y, window_get_width() / 2 - 185, window_get_height() / 2 -42, window_get_width() / 2 + 185, window_get_height() / 2))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			{
				quit_level_editor = false;
				can_input_level_name = false;
				pause = true;
				can_navigate = true;
				in_settings = false;
				can_navigate_settings_sidebar = false;
				menu = "back_level_editor_options";
				menu_delay = 10;
			}
			
			if (menu = "level_editor_options")
			and (can_input_level_name = false)
			{
				if (key_up)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "options";
				}
				else
				if (key_down)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "generate_level_map";
				}
				if (key_a_pressed)
				or (keyboard_check_pressed(vk_enter))
				{
					if (menu_delay = 0)
					{
						quit_level_editor = false;
						can_input_level_name = false;
						pause = true;
						can_navigate = true;
						in_settings = false;
						can_navigate_settings_sidebar = false;
						menu = "back_level_editor_options";
						menu_delay = 10;
					}
				}
				if (key_b_pressed)
				and (menu_delay = 0)
				{
					menu_delay = 10;
					quit_level_editor = false;
					can_input_level_name = false;
					pause = false;
					can_navigate = false;
				}
			}
			#endregion /*If menu is on level editor options END*/
			
			#region /*If menu is on generate level map*/
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2, Text("Generate Level Map"), "generate_level_map", "generate_level_map_yes");
			
			if (point_in_rectangle(cursor_x, cursor_y, window_get_width() / 2 - 185, window_get_height() / 2, window_get_width() / 2 + 185, window_get_height() / 2 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			{
				menu_delay = 10;
				quit_level_editor = false;
				can_input_level_name = false;
				pause = true;
				menu = "generate_level_map_yes";
			}
			if (menu = "generate_level_map")
			and (can_input_level_name = false)
			{
				if (key_up)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "level_editor_options";
				}
				else
				if (key_down)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "open_custom_levels_folder";
				}
				if (key_a_pressed)
				or (keyboard_check_pressed(vk_enter))
				{
					if (menu_delay = 0)
					{
						menu_delay = 10;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = true;
						menu = "generate_level_map_yes";
					}
				}
				if (key_b_pressed)
				and (menu_delay = 0)
				{
					menu_delay = 10;
					quit_level_editor = false;
					can_input_level_name = false;
					pause = false;
					can_navigate = false;
				}
			}
			#endregion /*If menu is on generate level map END*/
			
			#region /*Open Custom Levels Folder*/
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, Text("Open Custom Levels Folder"), "open_custom_levels_folder", "open_custom_levels_folder");
			if (point_in_rectangle(cursor_x, cursor_y, window_get_width() / 2 - 185, window_get_height() / 2 + 42, window_get_width() / 2 - 185 + 371, window_get_height() / 2 + 42 + 41))
			and (global.controls_used_for_menu_navigation = "mouse")
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			or (menu = "open_custom_levels_folder")
			and (key_a_pressed)
			and (menu_delay = 0)
			{
				
				if (global.select_level_index >= 1)
				and (global.create_level_from_template = false)
				{
					scr_open_folder(game_save_id + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)))
				}
				else
				if (global.level_name != "")
				{
					scr_open_folder(game_save_id + "\custom_levels\\" + string(global.level_name))
				}
			}
			if (menu = "open_custom_levels_folder")
			and (key_up)
			and (menu_delay = 0)
			and (menu_joystick_delay <= 0)
			{
				menu_delay = 3;
				can_navigate = true;
				menu = "generate_level_map";
			}
			if (menu = "open_custom_levels_folder")
			and (key_down)
			and (menu_delay = 0)
			and (menu_joystick_delay <= 0)
			{
				menu_delay = 3;
				can_navigate = true;
				menu = "quit";
			}
			#endregion /*Open Custom Levels Folder END*/
			
			#region /*If menu is on quit*/
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, Text("Save and Quit"), "quit", noone);
			if (point_in_rectangle(cursor_x, cursor_y, window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, window_get_width() / 2 + 185, window_get_height() / 2 + 42 + 42 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			{
				menu_delay = 10;
				quit_level_editor = true;
				can_input_level_name = false;
				pause = false;
			}
			
			if (menu = "quit")
			and (can_input_level_name = false)
			{
				if (key_up)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "open_custom_levels_folder";
				}
				else
				if (key_down)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "continue";
				}
				if (key_a_pressed)
				or(keyboard_check_pressed(vk_enter))
				{
					if (menu_delay = 0)
					{
						menu_delay = 10;
						quit_level_editor = true;
						can_input_level_name = false;
						pause = false;
					}
				}
				if (key_b_pressed)
				and (menu_delay = 0)
				{
					menu_delay = 10;
					quit_level_editor = false;
					can_input_level_name = false;
					pause = false;
					can_navigate = false;
				}
			}
			#endregion /*If menu is on quit END*/
			
		}
		else
		if (menu = "generate_level_map_yes")
		or (menu = "generate_level_map_no")
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 192, Text("A map of the whole level will be generated and saved in"), global.default_text_size, c_black, c_white, 1);
			
			#region /*Draw the path for saving full level map*/
			if (global.character_select_in_this_menu = "level_editor")
			and (global.select_level_index <= 0)
			or(global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template >= 2)
			{
				if (window_get_width() <= 1350)
				{
					draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 192 + 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(global.level_name) + "\\full_level_map.png", "\\", "/"), global.default_text_size * 0.75, c_black, c_white, 1);
				}
				else
				{
					draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 192 + 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(global.level_name) + "\\full_level_map.png", "\\", "/"), global.default_text_size, c_black, c_white, 1);
				}
			}
			else
			if (global.character_select_in_this_menu = "level_editor")
			{
				if (window_get_width() <= 1350)
				{
					draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 192 + 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "\\full_level_map.png", "\\", "/"), global.default_text_size * 0.75, c_black, c_white, 1);
				}
				else
				{
					draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 192 + 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "\\full_level_map.png", "\\", "/"), global.default_text_size, c_black, c_white, 1);
				}
			}
			#endregion /*Draw the path for saving full level map END*/
			
			draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 192 + 64, Text("With this map, you can then use it in a drawing program,"), global.default_text_size, c_black, c_white, 1);
			draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 192 + 96, Text("as the base to make the background and foreground layers."), global.default_text_size, c_black, c_white, 1);
			draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 192 + 160, Text("Do you want to generate a level map?"), global.default_text_size, c_black, c_white, 1);
			
			#region /*If menu is on generate level map yes*/
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2, Text("Yes"), "generate_level_map_yes", "generate_level_map_yes");
			
			if (point_in_rectangle(cursor_x, cursor_y, window_get_width() / 2 - 185, window_get_height() / 2, window_get_width() / 2 + 185, window_get_height() / 2 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			{
				menu_delay = 10;
				quit_level_editor = false;
				can_input_level_name = false;
				pause = false;
				global.full_level_map_screenshot = true;
			}
			if (menu = "generate_level_map_yes")
			and (can_input_level_name = false)
			{
				if (key_up)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "generate_level_map_no";
				}
				else
				if (key_down)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "generate_level_map_no";
				}
				if (key_a_pressed)
				or(keyboard_check_pressed(vk_enter))
				{
					if (menu_delay = 0)
					{
						menu_delay = 10;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = false;
						global.full_level_map_screenshot = true;
					}
				}
				if (key_b_pressed)
				and (menu_delay = 0)
				{
					menu_delay = 10;
					quit_level_editor = false;
					can_input_level_name = false;
					pause = true;
					menu = "generate_level_map";
				}
			}
			#endregion /*If menu is on generate level map yes END*/
			
			#region /*If menu is on generate level map no*/
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, Text("No"), "generate_level_map_no", "generate_level_map");
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() / 2 + 42 + 21, 1, 1, 0, c_white, 1);
			
			if (point_in_rectangle(cursor_x, cursor_y, window_get_width() / 2 - 185, window_get_height() / 2, window_get_width() / 2 + 185, window_get_height() / 2 + 42 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			{
				menu_delay = 10;
				quit_level_editor = false;
				can_input_level_name = false;
				pause = true;
				menu = "generate_level_map";
			}
			if (menu = "generate_level_map_no")
			and (can_input_level_name = false)
			{
				if (key_up)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "generate_level_map_yes";
				}
				else
				if (key_down)
				and (menu_joystick_delay = 0)
				and (menu_delay = 0)
				{
					menu_delay = 1;
					menu = "generate_level_map_yes";
				}
				if (key_a_pressed)
				or(keyboard_check_pressed(vk_enter))
				{
					if (menu_delay = 0)
					{
						menu_delay = 10;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = true;
						menu = "generate_level_map";
					}
				}
				if (key_b_pressed)
				and (menu_delay = 0)
				{
					menu_delay = 10;
					quit_level_editor = false;
					can_input_level_name = false;
					pause = true;
					menu = "generate_level_map";
				}
			}
			#endregion /*If menu is on generate level map no END*/
			
		}
		#endregion /*Make the menu invisible when entering the options menu END*/
	
	#region /*PLAYER 1 INPUT LEVEL NAME NOW*/
	if (menu = "input_level_name")
	and (can_input_level_name = true)
	{
		
		#region /*Press enter when done typing*/
		if (keyboard_check_pressed(vk_enter))
		or(gamepad_button_check_pressed(0, gp_start))
		{
			if (menu_delay = 0)
			{
				menu_delay = 10;
				can_input_level_name = false;
				quit_level_editor = false;
				pause = true;
				menu = "enter_level_name";
			}
		}
		#endregion /*Press enter when done typing END*/
		
		#region /*Make Background Darker*/
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /*Make Background Darker END*/
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		#region /*Inputed Name Text*/
		if (name_enter_blink< 1)
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 -400 - 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2, "Type a name on the keyboard for level name\nPress Enter when done typing\n \nLevel Name: " + string(level_name) + "|", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 -400 - 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2, "Type a name on the keyboard for level name\nPress Enter when done typing\n \nLevel Name: " + string(level_name), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Inputed Name Text END*/
		
		#region /*Limit Name Input Length for Level Name*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 - 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 100, "Limit: " + string(string_length(level_name)) + "/32", global.default_text_size, c_black, c_white, 1);
		level_name = keyboard_string;
		if (string_length(level_name) > 32)
		{
			keyboard_string = string_copy(level_name, 1, 32);
		}
		#endregion /*Limit Name Input Length for Level Name END*/
		
		name_enter_blink+= 0.05;
		if (name_enter_blink > 1.5)
		{
			name_enter_blink= 0;
		}
	}
	#endregion /*PLAYER 1 INPUT LEVEL NAME NOW END*/
	
	}
	#endregion /*Pause Menu END*/
	
	scr_options_menu(); /*Options*/
	scr_options_level_editor(); /*Level Editor Options*/
	
	#region /*Hover over icons reveals the icons*/
	
	#region /*Make bottom row of icons appear if mouse is hovering at bottom screen*/
	if (drag_object = false)
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (instance_exists(obj_level_player_1_start))
	and (obj_level_player_1_start.drag_object = false)
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (instance_exists(obj_level_player_2_start))
	and (obj_level_player_2_start.drag_object = false)
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (instance_exists(obj_level_player_3_start))
	and (obj_level_player_3_start.drag_object = false)
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (instance_exists(obj_level_player_4_start))
	and (obj_level_player_4_start.drag_object = false)
	and (asset_get_type("obj_level_end") == asset_object)
	and (instance_exists(obj_level_end))
	and (obj_level_end.drag_object = false)
	{
		if (point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, display_get_gui_height()))
		or (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), display_get_gui_height()))
		or(global.always_show_level_editor_buttons = true)
		{
			if (show_icons_at_bottom = false)
			{
				show_icons_at_bottom = true;
			}
		}
		else
		if (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, display_get_gui_height()))
		and (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), display_get_gui_height()))
		and (global.always_show_level_editor_buttons = false)
		{
			if (show_icons_at_bottom = true)
			{
				show_icons_at_bottom = false;
			}
		}
	}
	#endregion /*Make bottom row of icons appear if mouse is hovering at bottom screen END*/
	
	#region /*Make undo and redo icons appear if mouse is hovering at right screen*/
	if (undo_and_redo_buttons_enabled = true)
	and (drag_object = false)
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (instance_exists(obj_level_player_1_start))
	and (obj_level_player_1_start.drag_object = false)
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (instance_exists(obj_level_player_2_start))
	and (obj_level_player_2_start.drag_object = false)
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (instance_exists(obj_level_player_3_start))
	and (obj_level_player_3_start.drag_object = false)
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (instance_exists(obj_level_player_4_start))
	and (obj_level_player_4_start.drag_object = false)
	and (asset_get_type("obj_level_end") == asset_object)
	and (instance_exists(obj_level_end))
	and (obj_level_end.drag_object = false)
	{
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 8, 0, room_width * 2, display_get_gui_height()))
		{
			if (show_undo_redo_icons = false)
			{
				show_undo_redo_icons = true;
			}
		}
		else
		if (point_in_rectangle(cursor_x, cursor_y, 0, 0, display_get_gui_width() - 128, display_get_gui_height()))
		{
			if (show_undo_redo_icons = true)
			{
				show_undo_redo_icons = false;
			}
		}
	}
	#endregion /*Make undo and redo icons appear if mouse is hovering at right screen END*/
	
	#region /*Make top row of icons appear if mouse is hovering at top screen*/
	if (drag_object = false)
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (instance_exists(obj_level_player_1_start))
	and (obj_level_player_1_start.drag_object = false)
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (instance_exists(obj_level_player_2_start))
	and (obj_level_player_2_start.drag_object = false)
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (instance_exists(obj_level_player_3_start))
	and (obj_level_player_3_start.drag_object = false)
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (instance_exists(obj_level_player_4_start))
	and (obj_level_player_4_start.drag_object = false)
	and (asset_get_type("obj_level_end") == asset_object)
	and (instance_exists(obj_level_end))
	and (obj_level_end.drag_object = false)
	{
		if (point_in_rectangle(cursor_x, cursor_y, - 32, - 32, display_get_gui_width() + 32, +8))
		or(global.always_show_level_editor_buttons = true)
		{
			if (show_icons_at_top = false)
			{
				show_icons_at_top = true;
			}
		}
		else
		if (point_in_rectangle(cursor_x, cursor_y, - 32, + 64, display_get_gui_width() + 32, display_get_gui_height() + 32))
		{
			if (show_icons_at_top = true)
			{
				show_icons_at_top = false;
			}
		}
	}
	#endregion /*Make top row of icons appear if mouse is hovering at top screen END*/
	
	#endregion /*Hover over icons reveals the icons END*/
	
	#region /*Show icons at bottom of screen*/
	if (show_icons_at_bottom = true)
	and (drag_object = false)
	and (pause = false)
	or(global.always_show_level_editor_buttons = true)
	and (drag_object = false)
	and (pause = false)
	{
		icons_at_bottom_y = lerp(icons_at_bottom_y, 0, 0.1);
	}
	else
	{
		icons_at_bottom_y = lerp(icons_at_bottom_y, + 100, 0.1);
	}
	#endregion /*Show icons at bottom of screen END*/
	
	#region /*Show undo and redo icons to the right of screen*/
	if (show_undo_redo_icons = true)
	{
		undo_redo_icons_y = lerp(undo_redo_icons_y, 0, 0.1);
	}
	else
	{
		undo_redo_icons_y = lerp(undo_redo_icons_y, + 200, 0.1);
	}
	#endregion /*Show undo and redo icons to the right of screen END*/
	
	#region /*Level Editor Icons*/
	
	#region /*Play Level Button*/
	draw_sprite_ext(spr_menu_button_play, 0, play_level_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
	if (global.controls_used_for_menu_navigation != "controller")
	{
		draw_sprite_ext(spr_keyboard_keys, vk_enter, play_level_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
	}
	if (point_in_rectangle(cursor_x, cursor_y, play_level_icon_x - 32 + 1, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64 - 1))
	and (show_icons_at_bottom = true)
	and (pause = false)
	{
		tooltip = Text("Play level");
		show_tooltip += 2;
		draw_set_alpha(0.5);
		draw_rectangle_color(play_level_icon_x - 32 + 1, display_get_gui_height() - 64 + icons_at_bottom_y, play_level_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	#endregion /*Play Level Button END*/
	
	if (asset_get_type("spr_leveleditor_icons") == asset_sprite)
	{
		
		#region /*Place brush icons*/
		if (place_brush_size <= 0)
		{
			draw_sprite_ext(spr_leveleditor_icons, 0, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (place_brush_size = 1)
		{
			draw_sprite_ext(spr_leveleditor_icons, 1, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (place_brush_size = 2)
		{
			draw_sprite_ext(spr_leveleditor_icons, 2, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (place_brush_size = 3)
		{
			draw_sprite_ext(spr_leveleditor_icons, 3, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (place_brush_size = 4)
		{
			draw_sprite_ext(spr_leveleditor_icons, 4, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (place_brush_size >= 5)
		{
			draw_sprite_ext(spr_leveleditor_icons, 5, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (place_brush_size = 0)
		and (erase_mode = false)
		and (fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 0, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size = 1)
		and (erase_mode = false)
		and (fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 1, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size = 2)
		and (erase_mode = false)
		and (fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 2, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size = 3)
		and (erase_mode = false)
		and (fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 3, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size = 4)
		and (erase_mode = false)
		and (fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 4, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size = 5)
		and (erase_mode = false)
		and (fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 5, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		
		if (global.controls_used_for_menu_navigation != "controller")
		{
			draw_sprite_ext(spr_keyboard_keys, ord("D"), place_brush_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
		
		#region /*Click Pen*/
		if (point_in_rectangle(cursor_x, cursor_y, place_brush_icon_x - 32 + 1, display_get_gui_height() - 64, place_brush_icon_x + 32, display_get_gui_height() + 64 - 1))
		and (show_icons_at_bottom = true)
		and (pause = false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(place_brush_icon_x - 32 + 1, display_get_gui_height() - 64 + icons_at_bottom_y, place_brush_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			tooltip = Text("Paintbrush tool");
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				if (place_brush_size = 0)
				and (fill_mode = false)
				and (erase_mode = false)
				{
					place_brush_size = 1;
				}
				else
				if (place_brush_size = 1)
				and (fill_mode = false)
				and (erase_mode = false)
				{
					place_brush_size = 2;
				}
				else
				if (place_brush_size = 2)
				and (fill_mode = false)
				and (erase_mode = false)
				{
					place_brush_size = 3;
				}
				else
				if (place_brush_size = 3)
				and (fill_mode = false)
				and (erase_mode = false)
				{
					place_brush_size = 4;
				}
				else
				if (place_brush_size = 4)
				and (fill_mode = false)
				and (erase_mode = false)
				{
					place_brush_size = 5;
				}
				else
				if (place_brush_size = 5)
				and (fill_mode = false)
				and (erase_mode = false)
				{
					place_brush_size = 0;
				}
				else
				if (place_brush_size = 0)
				{
					place_brush_size = 0;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size = 1)
				{
					place_brush_size = 1;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size = 2)
				{
					place_brush_size = 2;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size = 3)
				{
					place_brush_size = 3;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size = 4)
				{
					place_brush_size = 4;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size = 5)
				{
					place_brush_size = 5;
					fill_mode = false;
					erase_mode = false;
				}
				else
				{
					place_brush_size = 0;
					fill_mode = false;
					erase_mode = false;
				}
			}
		}
		#endregion /*Click Pen END*/
		
		#endregion /*Place brush icons END*/
		
		#region /*Erase icons*/
		if (erase_brush_size <= 0)
		{
			draw_sprite_ext(spr_leveleditor_icons, 6, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size = 1)
		{
			draw_sprite_ext(spr_leveleditor_icons, 7, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size = 2)
		{
			draw_sprite_ext(spr_leveleditor_icons, 8, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size = 3)
		{
			draw_sprite_ext(spr_leveleditor_icons, 9, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size = 4)
		{
			draw_sprite_ext(spr_leveleditor_icons, 10, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size = 5)
		{
			draw_sprite_ext(spr_leveleditor_icons, 11, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (erase_brush_size = 0)
		and (erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 6, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size = 1)
		and (erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 7, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size = 2)
		and (erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 8, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size = 3)
		and (erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 9, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size = 4)
		and (erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 10, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size = 5)
		and (erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 11, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		
		if (global.controls_used_for_menu_navigation != "controller")
		{
			draw_sprite_ext(spr_keyboard_keys, ord("E"), erase_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
		
		#region /*Click Erase*/
		if (point_in_rectangle(cursor_x, cursor_y, erase_icon_x - 32 + 1, display_get_gui_height() - 64, erase_icon_x + 32, display_get_gui_height() + 64 - 1))
		and (show_icons_at_bottom = true)
		and (pause = false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(erase_icon_x - 32 + 1, display_get_gui_height() - 64 + icons_at_bottom_y, erase_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			tooltip = Text("Erase tool");
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				if (erase_mode = false)
				{
					erase_mode = true;
					fill_mode = false;
				}
				else
				if (erase_brush_size = 0)
				{
					erase_brush_size = 1;
					fill_mode = false;
					erase_mode = true;
				}
				else
				if (erase_brush_size = 1)
				{
					erase_brush_size = 2;
					fill_mode = false;
					erase_mode = true;
				}
				else
				if (erase_brush_size = 2)
				{
					erase_brush_size = 3;
					fill_mode = false;
					erase_mode = true;
				}
				else
				if (erase_brush_size = 3)
				{
					erase_brush_size = 4;
					fill_mode = false;
					erase_mode = true;
				}
				else
				if (erase_brush_size = 4)
				{
					erase_brush_size = 5;
					fill_mode = false;
					erase_mode = true;
				}
				else
				if (erase_brush_size = 5)
				{
					erase_brush_size = 0;
					fill_mode = false;
					erase_mode = true;
				}
			}
		}
		#endregion /*Click Erase END*/
		
		#endregion /*Erase icons END*/
		
		#region /*Fill icon*/
		if (fill_mode = true)
		and (erase_mode = false)
		and (difficulty_layer = 0)
		{
			if (fill_mode_type = "fill")
			{
				draw_sprite_ext(spr_leveleditor_icon_fill, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			if (fill_mode_type = "horizontal")
			{
				draw_sprite_ext(spr_leveleditor_icons, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			if (fill_mode_type = "vertical")
			{
				draw_sprite_ext(spr_leveleditor_icons, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 90, c_white, 1);
			}
		}
		else
		{
			if (fill_mode_type = "fill")
			{
				draw_sprite_ext(spr_leveleditor_icon_fill, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			else
			if (fill_mode_type = "horizontal")
			{
				draw_sprite_ext(spr_leveleditor_icons, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			else
			if (fill_mode_type = "vertical")
			{
				draw_sprite_ext(spr_leveleditor_icons, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 90, c_dkgray, 1);
			}
		}
		if (global.controls_used_for_menu_navigation != "controller")
		{
			draw_sprite_ext(spr_keyboard_keys, ord("F"), fill_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
		
		#region /*Click Fill*/
		if (point_in_rectangle(cursor_x, cursor_y, fill_icon_x - 32 + 1, display_get_gui_height() - 64, fill_icon_x + 32, display_get_gui_height() + 64 - 1))
		and (show_icons_at_bottom = true)
		and (pause = false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(fill_icon_x - 32 + 1, display_get_gui_height() - 64 + icons_at_bottom_y, fill_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			tooltip = Text("Fill tool");
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				if (fill_mode = false)
				{
					erase_mode = false;
					fill_mode = true;
				}
				else
				if (fill_mode_type = "fill")
				{
					erase_mode = false;
					fill_mode_type = "horizontal";
					fill_mode = true;
				}
				else
				if (fill_mode_type = "horizontal")
				{
					erase_mode = false;
					fill_mode_type = "vertical";
					fill_mode = true;
				}
				else
				if (fill_mode_type = "vertical")
				{
					erase_mode = false;
					fill_mode_type = "fill";
					fill_mode = true;
				}
			}
		}
		#endregion /*Click Fill END*/
		
		#endregion /*Fill icon END*/
		
		#region /*Always show level editor buttons toggle*/
		if (global.always_show_level_editor_buttons = false)
		{
			draw_sprite_ext(spr_menu_cursor, 0, always_show_level_editor_buttons_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 270, c_white, 1);
		}
		else
		if (global.always_show_level_editor_buttons = true)
		{
			draw_sprite_ext(spr_menu_cursor, 0, always_show_level_editor_buttons_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 90, c_white, 1);
		}
		if (point_in_rectangle(cursor_x, cursor_y, always_show_level_editor_buttons_x - 32 + 1, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64 - 1))
		and (show_icons_at_bottom = true)
		and (pause = false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(always_show_level_editor_buttons_x - 32 + 1, display_get_gui_height() - 64 + icons_at_bottom_y, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (global.always_show_level_editor_buttons = true)
			{
				tooltip = Text("Hide buttons");
			}
			else
			if (global.always_show_level_editor_buttons = false)
			{
				tooltip = Text("Lock buttons");
			}
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			and (global.always_show_level_editor_buttons = false)
			{
				global.always_show_level_editor_buttons = true;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "always_show_level_editor_buttons", true);
				ini_close();
			}
			else
			if (mouse_check_button_pressed(mb_left))
			and (global.always_show_level_editor_buttons = true)
			{
				global.always_show_level_editor_buttons = false;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "always_show_level_editor_buttons", false);
				ini_close();
			}
		}
		#endregion /*Always show level editor buttons toggle END*/
		
		#region /*Show Undo icon*/
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, display_get_gui_height() - 128, display_get_gui_width() - 64, display_get_gui_height() - 64))
		and (mouse_check_button(mb_left))
		{
			draw_sprite_ext(spr_leveleditor_icons, 17, display_get_gui_width() - 96 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 17, display_get_gui_width() - 96 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /*Show Undo icon END*/
		
		#region /*Show Redo icon*/
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 128, display_get_gui_width(), display_get_gui_height() - 64))
		and (mouse_check_button(mb_left))
		{
			draw_sprite_ext(spr_leveleditor_icons, 18, display_get_gui_width() - 32 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 18, display_get_gui_width() - 32 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /*Show Redo icon*/
		
		#region /*Set difficulty layer*/
		if (set_difficulty_mode = true)
		{
			#region /*Easy*/
			if (difficulty_layer = 1)
			{
				draw_sprite_ext(spr_leveleditor_icons, 20, display_get_gui_width() - 224, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 20, display_get_gui_width() - 224, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Easy END*/
		
			#region /*Normal*/
			if (difficulty_layer = 2)
			{
				draw_sprite_ext(spr_leveleditor_icons, 21, display_get_gui_width() - 160, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 21, display_get_gui_width() - 160, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Normal END*/
		
			#region /*Hard*/
			if (difficulty_layer = 3)
			{
				draw_sprite_ext(spr_leveleditor_icons, 22, display_get_gui_width() - 96, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 22, display_get_gui_width() - 96, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Hard END*/
		
			#region /*Set Difficulty Mode / Back*/
			draw_sprite_ext(spr_leveleditor_icons, 24, display_get_gui_width() - 32, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			#endregion /*Set Difficulty Mode / Back END*/
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 19, display_get_gui_width() - 32, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Set difficulty layer END*/
		
		#region /*Show icons at top of screen*/
		if (show_icons_at_top = true)
		{
			icons_at_top_y = lerp(icons_at_top_y, - 1, 0.1);
		}
		else
		{
			icons_at_top_y = lerp(icons_at_top_y, - 100, 0.1);
		}
		
		if (pause = false)
		{
			
			if (can_put_objects_above_other_objects = true)
			{
				draw_set_halign(fa_left);
				draw_set_valign(fa_center);
				draw_text_outlined(200, 100, Text("Can put objects above other objects: True"), global.default_text_size, c_black, c_white, 1);
			}
			
			#region /*Show Grid*/
			if (show_grid = true)
			{
				draw_sprite_ext(spr_leveleditor_icons, 13, grid_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
				draw_set_halign(fa_right);
				draw_set_valign(fa_center);
				draw_text_outlined(display_get_gui_width() - 80, 80 + icons_at_top_y, Text("Grid X") + " : " + string(global.grid_hsnap), global.default_text_size, c_black, c_white, 1);
				draw_text_outlined(display_get_gui_width() - 80, 110 + icons_at_top_y, Text("Grid Y") + " : " + string(global.grid_vsnap), global.default_text_size, c_black, c_white, 1);
				if (global.grid_hsnap = 32)
				and (global.grid_hsnap = 32)
				{
					draw_text_outlined(display_get_gui_width() - 80, 135 + icons_at_top_y, Text("Default grid size!"), global.default_text_size * 0.5, c_black, c_white, 1);
				}
				draw_sprite_ext(spr_menu_button_up_down, 0, display_get_gui_width() - 32, 80 + icons_at_top_y + 16, 1, 1, 0, c_white, 1);
				if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 32, 80 + icons_at_top_y + 16 - 32 + 2, display_get_gui_width() + 64, 80 + icons_at_top_y + 16))
				and (mouse_check_button_pressed(mb_left))
				{
					global.grid_hsnap += 1;
					global.grid_vsnap += 1;
				}
				else
				if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 32, 80 + icons_at_top_y + 16, display_get_gui_width() + 64, 80 + icons_at_top_y + 16 + 32))
				and (mouse_check_button_pressed(mb_left))
				{
					if (global.grid_hsnap > 1)
					or(global.grid_vsnap > 1)
					{
						global.grid_hsnap -= 1;
						global.grid_vsnap -= 1;
					}
				}
				draw_text_outlined(display_get_gui_width() - 16, 32 + 140 + icons_at_top_y, Text("X") + " : " + string(x) + " " + Text("Y") + " : " + string(y), global.default_text_size, c_black, c_white, 1);
				draw_text_outlined(display_get_gui_width() - 16, 32 + 170 + icons_at_top_y, Text("View X") + " : " + string(camera_get_view_x(view_camera[0])) + " " + Text("View Y") + " : " + string(camera_get_view_y(view_camera[0])), global.default_text_size * 0.5, c_black, c_white, 1);
				draw_text_outlined(display_get_gui_width() - 16, 32 + 190 + icons_at_top_y, Text("View width") + " : " + string(camera_get_view_width(view_camera[0])) + " " + Text("View height") + " : " + string(camera_get_view_height(view_camera[0])), global.default_text_size * 0.5, c_black, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 13, grid_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Show Grid END*/
			
			#region /*Zoom Out*/
			if (zoom_out = true)
			{
				draw_sprite_ext(spr_leveleditor_icons, 14, display_get_gui_width() - 160, + 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 14, display_get_gui_width() - 160, + 32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Zoom Out END*/
			
			#region /*Zoom Reset*/
			if (zoom_reset = true)
			{
				draw_sprite_ext(spr_leveleditor_icons, 15, display_get_gui_width() - 96, + 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 15, display_get_gui_width() - 96, + 32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Zoom Reset END*/
			
			#region /*Zoom In*/
			if (zoom_in = true)
			{
				draw_sprite_ext(spr_leveleditor_icons, 16, display_get_gui_width() - 32, + 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 16, display_get_gui_width() - 32, + 32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Zoom In END*/
			
		}
		
		#endregion /*Show icons at top of screen END*/
		
	}
	#endregion /*Level Editor Icons*/
	
	#region /*Show Tooltip when hovering over icon, this code needs to be after the show icons code so it appears above the icons*/
	if (show_tooltip >= 100)
	{
		draw_rectangle_color(cursor_x + 16, cursor_y - 16, cursor_x + 240, cursor_y + 16, c_white, c_white, c_white, c_white, false);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(cursor_x + 24, cursor_y, string(tooltip), global.default_text_size, c_white, c_black, 1);
	}
	if (show_tooltip > 100)
	{
		show_tooltip = 100;
	}
	if (show_icons_at_bottom = false)
	or(mouse_check_button(mb_any))
	or(keyboard_check(vk_anykey))
	{
		show_tooltip = 0;
	}
	#endregion /*Show Tooltip when hovering over icon, this code needs to be after the show icons code so it appears above the icons END*/

	#region /*Undo and Redo icons*/
	if (show_undo_redo_icons = true)
	{
		
		#region /*Click Undo icon*/
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, display_get_gui_height() - 128, display_get_gui_width() - 64, display_get_gui_height() - 64))
		{
			tooltip = "Undo (CTRl +Z)";
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				current_undo_value -= 1;
			}
		}
		#endregion /*Click Undo icon END*/
	
		#region /*Click Redo icon*/
		else
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 128, display_get_gui_width(), display_get_gui_height() - 64))
		{
			tooltip = "Redo (CTRl +Y)";
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				current_undo_value += 1;
			}
		}
		#endregion /*Click Redo icon END*/
		
	}
	#endregion /*Undo and Redo icons END*/
	
	if (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	{
		show_tooltip = 0;
	}
	
	#region /*Click icons at bottom of screen*/
	if (show_icons_at_bottom = true)
	and (pause = false)
	{
		
		#region /*Difficulty settings, 0 = All, 1 = Easy, 2 = Normal, 3 = Hard*/
	
	#region /*Easy*/
	if (set_difficulty_mode = true)
	and (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width() - 192, display_get_gui_height() + 64))
	{
		tooltip = "Show only objects in easy";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			difficulty_layer = 1;
			fill_mode = false;
			erase_mode = false;
			set_difficulty_mode = true;
		}
	}
	#endregion /*Easy END*/
	
	#region /*Normal*/
	if (set_difficulty_mode = true)
	and (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 192, display_get_gui_height() - 64, display_get_gui_width() - 128, display_get_gui_height() + 64))
	{
		tooltip = "Show only objects in normal";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			difficulty_layer = 2;
			fill_mode = false;
			erase_mode = false;
			set_difficulty_mode = true;
		}
	}
	#endregion /*Normal END*/
	
	#region /*Hard*/
	if (set_difficulty_mode = true)
	and (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, display_get_gui_height() - 64, display_get_gui_width() - 64, display_get_gui_height() + 64))
	{
		tooltip = "Show only objects in hard";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			difficulty_layer = 3;
			fill_mode = false;
			erase_mode = false;
			set_difficulty_mode = true;
		}
	}
	#endregion /*Hard END*/
	
	#region /*Set Difficulty Mode / Back*/
	if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), display_get_gui_height() + 64))
	{
		tooltip = "Set what objects should appear on what difficulty";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			fill_mode = false;
			erase_mode = false;
			if (set_difficulty_mode = true)
			{
				set_difficulty_mode = false;
				difficulty_layer = 0;
			}
			else
			{
				set_difficulty_mode = true;
			}
		}
	}
	#endregion /*Set Difficulty Mode / Back*/

	#endregion /*Difficulty settings, 0 = All, 1 = Easy, 2 = Normal, 3 = Hard END*/
		
	}
	#endregion /*Click icons at bottom of screen END*/

	#region /*Click icons at top of screen*/
	
	#region /*Toggle Grid*/
	if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 256, - 64, display_get_gui_width() - 192, + 64))
	and (show_icons_at_top = true)
	and (pause = false)
	{
		tooltip = "Toggle Grid (G)";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			if (show_grid = false)
			{
				show_grid = true;
			}
			else
			{
				show_grid = false;
			}
		}
	}
	#endregion /*Toggle Grid END*/

	#region /*Zoom Out*/
	if (keyboard_check(global.player1_key_zoom_out))
	and (!keyboard_check(global.player1_key_zoom_in))
	or (keyboard_check(global.player2_key_zoom_out))
	and (!keyboard_check(global.player2_key_zoom_in))
	or (keyboard_check(global.player3_key_zoom_out))
	and (!keyboard_check(global.player3_key_zoom_in))
	or (keyboard_check(global.player4_key_zoom_out))
	and (!keyboard_check(global.player4_key_zoom_in))
	or (keyboard_check(global.player1_key2_zoom_out))
	and (!keyboard_check(global.player1_key2_zoom_in))
	or (keyboard_check(global.player2_key2_zoom_out))
	and (!keyboard_check(global.player2_key2_zoom_in))
	or (keyboard_check(global.player3_key2_zoom_out))
	and (!keyboard_check(global.player3_key2_zoom_in))
	or (keyboard_check(global.player4_key2_zoom_out))
	and (!keyboard_check(global.player4_key2_zoom_in))
	or(point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 192, - 64, display_get_gui_width() - 128, + 64))
	and (show_icons_at_top = true)
	and (mouse_check_button(mb_left))
	{
		tooltip = "Zoom Out";
		show_tooltip += 2;
		zoom_out = true;
	}
	else
	{
		zoom_out = false;
	}
	#endregion /*Zoom Out END*/

	#region /*Reset Zoom*/
	if (keyboard_check(vk_control))
	and (keyboard_check(vk_enter))
	and (!keyboard_check(187))
	and (!keyboard_check(189))
	or(point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, - 64, display_get_gui_width() - 64, + 64))
	and (show_icons_at_top = true)
	and (mouse_check_button(mb_left))
	{
		tooltip = "Reset Zoom";
		show_tooltip += 2;
		zoom_reset = true
	}
	else
	{
		zoom_reset = false;
	}
	#endregion /*Reset Zoom END*/

	#region /*Zoom In*/
	if (keyboard_check(global.player1_key_zoom_in))
	and (!keyboard_check(global.player1_key_zoom_out))
	or (keyboard_check(global.player2_key_zoom_in))
	and (!keyboard_check(global.player2_key_zoom_out))
	or (keyboard_check(global.player3_key_zoom_in))
	and (!keyboard_check(global.player3_key_zoom_out))
	or (keyboard_check(global.player4_key_zoom_in))
	and (!keyboard_check(global.player4_key_zoom_out))
	or (keyboard_check(global.player1_key2_zoom_in))
	and (!keyboard_check(global.player1_key2_zoom_out))
	or (keyboard_check(global.player2_key2_zoom_in))
	and (!keyboard_check(global.player2_key2_zoom_out))
	or (keyboard_check(global.player3_key2_zoom_in))
	and (!keyboard_check(global.player3_key2_zoom_out))
	or (keyboard_check(global.player4_key2_zoom_in))
	and (!keyboard_check(global.player4_key2_zoom_out))
	or(point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, - 64, display_get_gui_width(), + 64))
	and (show_icons_at_top = true)
	and (mouse_check_button(mb_left))
	{
		tooltip = "Zoom In";
		show_tooltip += 2;
		zoom_in = true;
	}
	else
	{
		zoom_in = false;
	}
	#endregion /*Zoom In END*/

	#endregion /*Click icons at top of screen END*/
	
	scr_show_fps();
	
	scr_menu_navigation_with_joystick_delay();
	
	#region /*Change mouse cursor. Draw mouse cursor for menu navigation*/
	if (global.controls_used_for_menu_navigation != "controller")
	{
		
		#region /*Scroll mouse cursor*/
		if (scroll_view = true)
		and (pause = false)
		and (asset_get_type("spr_cursor_scroll") == asset_sprite)
		{
			draw_sprite_ext(spr_cursor_scroll, 1, cursor_x, cursor_y, 1, 1, 0, c_red, 1);
		}
		else
		if (asset_get_type("spr_cursor_scroll") == asset_sprite)
		and (keyboard_check(vk_space))
		and (pause = false)
		{
			draw_sprite_ext(spr_cursor_scroll, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Scroll mouse cursor END*/
		
		else
		
		#region /*Grab mouse cursor*/
		if (asset_get_type("spr_cursor_grab") == asset_sprite)
		and (position_meeting(mouse_x, mouse_y, obj_leveleditor_placed_object))
		and (!mouse_check_button(mb_left))
		and (!mouse_check_button(mb_right))
		and (drag_object = false)
		and (asset_get_type("obj_level_player_1_start") == asset_object)
		and (instance_exists(obj_level_player_1_start))
		and (obj_level_player_1_start.drag_object = false)
		and (asset_get_type("obj_level_player_2_start") == asset_object)
		and (instance_exists(obj_level_player_2_start))
		and (obj_level_player_2_start.drag_object = false)
		and (asset_get_type("obj_level_player_3_start") == asset_object)
		and (instance_exists(obj_level_player_3_start))
		and (obj_level_player_3_start.drag_object = false)
		and (asset_get_type("obj_level_player_4_start") == asset_object)
		and (instance_exists(obj_level_player_4_start))
		and (obj_level_player_4_start.drag_object = false)
		and (asset_get_type("obj_level_end") == asset_object)
		and (instance_exists(obj_level_end))
		and (obj_level_end.drag_object = false)
		and (erase_mode = false)
		and (set_difficulty_mode = false)
		and (pause = false)
		and (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
		and (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		and (!point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
		{
			draw_sprite_ext(spr_cursor_grab, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
		}
		else
		if (position_meeting(mouse_x, mouse_y, obj_leveleditor_placed_object))
		and (drag_object = true)
		and (set_difficulty_mode = false)
		and (pause = false)
		and (asset_get_type("obj_level_player_1_start") == asset_object)
		and (instance_exists(obj_level_player_1_start))
		and (obj_level_player_1_start.drag_object = false)
		and (asset_get_type("obj_level_player_2_start") == asset_object)
		and (instance_exists(obj_level_player_2_start))
		and (obj_level_player_2_start.drag_object = false)
		and (asset_get_type("obj_level_player_3_start") == asset_object)
		and (instance_exists(obj_level_player_3_start))
		and (obj_level_player_3_start.drag_object = false)
		and (asset_get_type("obj_level_player_4_start") == asset_object)
		and (instance_exists(obj_level_player_4_start))
		and (obj_level_player_4_start.drag_object = false)
		and (pause = false)
		or(asset_get_type("obj_level_end") == asset_object)
		and (instance_exists(obj_level_end))
		and (obj_level_end.drag_object = true)
		and (pause = false)
		and (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
		and (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		and (!point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
		{
			draw_sprite_ext(spr_cursor_grab, 1, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Grab mouse cursor END*/
		
		else
		
		#region /*Default mouse cursor*/
		if (point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
		and (asset_get_type("spr_cursor") == asset_sprite)
		or (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		and (asset_get_type("spr_cursor") == asset_sprite)
		or (point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
		and (asset_get_type("spr_cursor") == asset_sprite)
		or(pause = true)
		and (asset_get_type("spr_cursor") == asset_sprite)
		{
			draw_sprite_ext(spr_cursor, erase_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Default mouse cursor END*/
		
		else
		
		#region /*Erase mouse cursor*/
		if (asset_get_type("spr_cursor_erase") == asset_sprite)
		and (erase_mode = true)
		and (pause = false)
		{
			draw_sprite_ext(spr_cursor_erase, erase_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Erase mouse cursor END*/
		
		else
		
		#region /*Fill mouse cursor*/
		if (asset_get_type("spr_cursor_fill") == asset_sprite)
		and (fill_mode = true)
		and (fill_mode_type = "fill")
		and (drag_object = false)
		and (erase_mode = false)
		and (set_difficulty_mode = false)
		and (pause = false)
		{
			draw_sprite_ext(spr_cursor_fill_full, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Fill mouse cursor END*/
		
		else
		
		#region /*Fill Horizontal mouse cursor*/
		if (asset_get_type("spr_cursor_fill") == asset_sprite)
		and (fill_mode = true)
		and (fill_mode_type = "horizontal")
		and (drag_object = false)
		and (erase_mode = false)
		and (set_difficulty_mode = false)
		and (pause = false)
		{
			draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Fill Horizontal mouse cursor END*/
		
		else
		
		#region /*Fill Vertical mouse cursor*/
		if (asset_get_type("spr_cursor_fill") == asset_sprite)
		and (fill_mode = true)
		and (fill_mode_type = "vertical")
		and (drag_object = false)
		and (erase_mode = false)
		and (set_difficulty_mode = false)
		and (pause = false)
		{
			draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 90, c_white, 1);
		}
		#endregion /*Fill Vertical mouse cursor END*/
		
		else
		
		#region /*Brush mouse cursor*/
		if (asset_get_type("spr_cursor_brush") == asset_sprite)
		and (pause = false)
		{
			draw_sprite_ext(spr_cursor_brush, place_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Brush mouse cursor END*/
	
	}
	#endregion /*Change mouse cursor. Draw mouse cursor for menu navigation END*/
	
}