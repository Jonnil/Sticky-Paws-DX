///////////////////////////////////////////////////////////////
// Debug Toggle
///////////////////////////////////////////////////////////////

/// @function scr_debug_toggle_screen()
/* Toggles the debug screen visibility based on keyboard/gamepad input */
function scr_debug_toggle_screen()
{
	/* Use parentheses to group conditions for clarity */
	if (keyboard_check_pressed(vk_f3))
	|| (GM_build_type == "run"
	&& gamepad_button_check(global.player_slot[1], gp_stickl)
	&& gamepad_button_check_pressed(global.player_slot[1], gp_stickr))
	{
		global.debug_screen = !global.debug_screen;
		show_debug_message("[scr_debug_toggle_screen] 'debug screen' is set to: " + string(global.debug_screen));
	}
	
	if (GM_build_type == "run"
	&& keyboard_check_pressed(vk_f4))
	{
		global.intentionally_crash = intentionally_crash; /* Will intentionally crash the game */
	}
}

///////////////////////////////////////////////////////////////
// FPS Display
///////////////////////////////////////////////////////////////

/// @function scr_debug_draw_fps()
/* Draws the FPS and "real" FPS information on screen */
function scr_debug_draw_fps()
{
	if (global.show_fps
	|| global.debug_screen)
	{
		var fps_y = 64;
		
		/* If both options are active, show an icon next to the FPS display */
		if (global.show_fps
		&& global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, fps_y, 1, 1, 0, c_white, 1);
		}
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		/* Choose a green color if the FPS meets or exceeds the max. Otherwise, compute a hue */
		var fps_color = (fps >= global.max_fps)
						? c_lime
						: make_color_hsv(50 / global.max_fps * fps, 255, 255);
		scr_draw_text_outlined(32, fps_y, "FPS: " + string(fps) + "/" + string(global.max_fps), , , fps_color);
		
		/* Adjust target based on OS. On Switch, target a lower FPS */
		var fps_real_target = (os_type == os_switch) ? 60 : 600;
		var fps_real_color = (fps_real >= fps_real_target)
							 ? c_lime
							 : make_color_hsv(50 / fps_real_target * fps_real, 255, 255);
		scr_draw_text_outlined(200, fps_y, "FPS Real: " + string(fps_real), , , fps_real_color);
	}
}


///////////////////////////////////////////////////////////////
// Instance Count Display
///////////////////////////////////////////////////////////////

/// @function scr_debug_draw_instance_count()
/* Draws a simple instance count on screen */
function scr_debug_draw_instance_count()
{
	if (global.show_instance_count
	|| global.debug_screen)
	{
		var instance_count_y = 96;
		
		if (global.show_instance_count
		&& global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, instance_count_y, 1, 1, 0, c_white, 1);
		}
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(32, instance_count_y, "Instance Count: " + string(instance_count), global.default_text_size, c_black, c_white, 1);
	}
}

/// @function scr_debug_draw_all_instance_count()
/* Draws detailed instance counts for each object type. Iterates through a fixed range */
function scr_debug_draw_all_instance_count()
{
	if (global.show_all_instance_count)
	{
		var all_instance_count_y = 128;
		
		if (global.show_all_instance_count
		&& global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, all_instance_count_y, 1, 1, 0, c_white, 1);
		}
		
		/* NOTE: Looping over a fixed range (0-99) assumes your object IDs fall within this range */
		for (var i = 0; i < 100; ++i)
		{
			if (instance_number(i) >= 1)
			{
				var all_instance_count_color = make_color_hsv(instance_number(i), 255, 255);
				scr_draw_text_outlined(32, all_instance_count_y + (8 * i), string(object_get_name(i)) + ": " + string(instance_number(i)), , , all_instance_count_color);
			}
		}
	}
}


///////////////////////////////////////////////////////////////
// Controller Ports Handling
///////////////////////////////////////////////////////////////

/// @function scr_debug_handle_controller_ports()
/* Assigns gamepad indices to players based on platform and input */
function scr_debug_handle_controller_ports()
{
	/* Count how many players are active based on the "player_can_play" flags */
	global.playergame = 0;
	
	for (var i = 1; i <= global.max_players; i += 1)
	{
		if (global.player_can_play[i])
		{
			global.playergame += 1;
		}
	}
	
	/* Platform-specific handling for Switch */
	if (os_type == os_switch)
	{
		/* If gamepad 0 is "Handheld", then assign gamepad 0 as player 1 */
		if (gamepad_get_description(0) == "Handheld")
		{
			global.player_slot[0] = 1;
			
			/* Check which gamepad is active and assign it to player 1 */
			if (global.player_slot[1] != 0)
			{
				if (gamepad_button_check(0, gp_face1)
				|| gamepad_button_check(0, gp_face2)
				|| gamepad_button_check(0, gp_face3)
				|| gamepad_button_check(0, gp_face4)
				|| gamepad_button_check(0, gp_padd)
				|| gamepad_button_check(0, gp_padl)
				|| gamepad_button_check(0, gp_padr)
				|| gamepad_button_check(0, gp_padu)
				|| gamepad_button_check(0, gp_select)
				|| gamepad_button_check(0, gp_shoulderl)
				|| gamepad_button_check(0, gp_shoulderlb)
				|| gamepad_button_check(0, gp_shoulderr)
				|| gamepad_button_check(0, gp_shoulderrb)
				|| gamepad_button_check(0, gp_start)
				|| gamepad_button_check(0, gp_stickl)
				|| gamepad_button_check(0, gp_stickr)
				|| (gamepad_axis_value(0, gp_axislh) < -0.3)
				|| (gamepad_axis_value(0, gp_axislv) < -0.3)
				|| (gamepad_axis_value(0, gp_axisrh) < -0.3)
				|| (gamepad_axis_value(0, gp_axisrv) < -0.3)
				|| (gamepad_axis_value(0, gp_axislh) > 0.3)
				|| (gamepad_axis_value(0, gp_axislv) > 0.3)
				|| (gamepad_axis_value(0, gp_axisrh) > 0.3)
				|| (gamepad_axis_value(0, gp_axisrv) > 0.3))
				{
					global.player_slot[1] = 0;
				}
			}
			else
			if (global.player_slot[1] != 1)
			{
				if (gamepad_button_check(1, gp_face1)
				|| gamepad_button_check(1, gp_face2)
				|| gamepad_button_check(1, gp_face3)
				|| gamepad_button_check(1, gp_face4)
				|| gamepad_button_check(1, gp_padd)
				|| gamepad_button_check(1, gp_padl)
				|| gamepad_button_check(1, gp_padr)
				|| gamepad_button_check(1, gp_padu)
				|| gamepad_button_check(1, gp_select)
				|| gamepad_button_check(1, gp_shoulderl)
				|| gamepad_button_check(1, gp_shoulderlb)
				|| gamepad_button_check(1, gp_shoulderr)
				|| gamepad_button_check(1, gp_shoulderrb)
				|| gamepad_button_check(1, gp_start)
				|| gamepad_button_check(1, gp_stickl)
				|| gamepad_button_check(1, gp_stickr)
				|| (gamepad_axis_value(1, gp_axislh) < -0.3)
				|| (gamepad_axis_value(1, gp_axislv) < -0.3)
				|| (gamepad_axis_value(1, gp_axisrh) < -0.3)
				|| (gamepad_axis_value(1, gp_axisrv) < -0.3)
				|| (gamepad_axis_value(1, gp_axislh) > 0.3)
				|| (gamepad_axis_value(1, gp_axislv) > 0.3)
				|| (gamepad_axis_value(1, gp_axisrh) > 0.3)
				|| (gamepad_axis_value(1, gp_axisrv) > 0.3))
				{
					global.player_slot[1] = 1;
				}
			}
		}
	}
	else
	{
		/* For non-Switch platforms, assign gamepad indices sequentially */
		for (var i = 1; i <= global.max_players; i += 1)
		{
			global.player_slot[i] = i - 1;
		}
	}
}


///////////////////////////////////////////////////////////////
// Controller Connection/Disconnection Detection
///////////////////////////////////////////////////////////////

/// @function scr_debug_detect_controller_disconnections()
/* Checks for changes in gamepad connection status and updates debug info accordingly */
function scr_debug_detect_controller_disconnections()
{
	for (var i = 0; i < gamepad_get_device_count(); i++)
	{
		var connected = gamepad_is_connected(i);
		
		/* If a gamepad that was not connected is now connected... */
		if (!global.initial_gamepad_status[i]
		&& connected)
		{
			show_debug_message("Gamepad " + string(i) + " connected!");
			global.initial_gamepad_status[i] = true;
			
			if (!gamepad_is_connected(0) || (gamepad_get_description(0) == "Handheld"))
			{
				for (var j = 1; j <= global.max_players; j += 1)
				{
					global.player_slot[j] = j;
				}
			}
			else
			{
				for (var j = 1; j <= global.max_players; j += 1)
				{
					global.player_slot[j] = j - 1;
				}
			}
		}
		/* If a gamepad that was connected is now disconnected... */
		else
		if (global.initial_gamepad_status[i]
		&& !connected)
		{
			show_debug_message("Gamepad " + string(i) + " disconnected!");
			global.initial_gamepad_status[i] = false;
			
			if (os_type == os_switch)
			{
				switch_controller_support_show();
			}
			
			var time_source = time_source_create(time_source_game, 2, time_source_units_frames, function()
			{
				set_controller_sprites_to_use();
			}, [], 1);
			time_source_start(time_source);
			
			if (!gamepad_is_connected(0)
			|| (gamepad_get_description(0) == "Handheld"))
			{
				for (var j = 1; j <= global.max_players; j += 1)
				{
					global.player_slot[j] = j;
				}
			}
			else
			{
				for (var j = 1; j <= global.max_players; j += 1)
				{
					global.player_slot[j] = j - 1;
				}
			}
		}
	}
}


///////////////////////////////////////////////////////////////
// Debug Screen Logic & Additional Debug Info
///////////////////////////////////////////////////////////////

/// @function scr_debug_draw_debug_logic()
/* Handles additional debug screen logic such as debug logging, mode toggling, */
/* mouse-based toggles, player info, and drawing extra debug sections */
function scr_debug_draw_debug_logic()
{
	if (global.debug_screen)
	{
		/* Hide on-screen controls when debug info is displayed */
		if (variable_instance_exists(self, "player_show_controls_alpha"))
		{
			for (var i = 1; i <= global.max_players; i += 1)
			{
				player_show_controls_alpha[i] = -10;
			}
		}
		
		#region /* Save debug info when F2 is pressed */
		if (keyboard_check_pressed(vk_f2))
		{
			var logs_folder = game_save_id + "debug_logs/";
			if (!directory_exists(logs_folder))
			{
				directory_create(logs_folder);
			}
			
			var log_file_path = logs_folder + "debug_info-" + string(global.game_name) + "_v" + string(scr_get_build_date()) + "_" + scr_format_timestamp(date_current_datetime()) + "_" + string(scr_os_type_to_string(true, true)) + ".ini";
			
			ini_open(log_file_path);
			scr_write_debug_info();
			ini_close();
			
			show_debug_message("Debug information saved to: " + log_file_path);
		}
		#endregion /* Save debug info when F2 is pressed END */
		
		/* Toggle detailed/simplified debug mode when F4 is pressed */
		if (keyboard_check_pressed(vk_f4))
		{
			global.debug_detailed_mode = !global.debug_detailed_mode;
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("config", "debug_detailed_mode", global.debug_detailed_mode);
			ini_close();
		}
		
		var version_y = 32;
		var display_y = 32;
		var d3d11_y = 64;
		
		/* --- Mouse Toggle Areas --- */
		/* Define header positions for the toggles */
		var fps_y = 64;
		scr_debug_handle_mouse_toggle(fps_y, "show_fps");
		scr_debug_handle_mouse_toggle(96, "show_instance_count");
		scr_debug_handle_mouse_toggle(128, "show_all_instance_count");
		
		#region /* --- On-Screen Instructions (for PC) --- */
		if (global.enable_option_for_pc
		&& global.controls_used_for_navigation != "gamepad")
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			
			/* Determine the starting Y position for instructions */
			var instructions_y = 8;
			
			/* Draw the header for the Instructions section */
			instructions_y = scr_draw_debug_header("Instructions", display_get_gui_width() * 0.5 - 100, instructions_y);
			
			/* Only display the instructions if the section is expanded */
			if (!global.debug_collapsed_sections[? "Instructions"])
			{
				/* Set larger text size if you prefer, multiply your default size */
				var instr_text_size = global.default_text_size * 1.0; /* Adjust as needed */
				draw_set_halign(fa_center);
				
				scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
					"Press the F2 key to save debug information",
					instr_text_size, c_black, c_white, 1);
				instructions_y += 25;
				
				scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
					"Press the F3 key to toggle debug screen",
					instr_text_size, c_black, c_white, 1);
				instructions_y += 25;
				
				scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
					"Press the F4 key to toggle debug detailed mode",
					instr_text_size, c_black, c_white, 1);
				instructions_y += 25;
				
				scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
					"Click on the debug headers to collapse sections",
					instr_text_size, c_black, c_white, 1);
			}
		}
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(32, version_y, string(global.game_name) + " v" + scr_get_build_date(), global.default_text_size, c_black, c_white, 1);
		#endregion /* --- On-Screen Instructions (for PC) --- END */
		
		/* --- Top-right Display Info --- */
		draw_set_halign(fa_right);
		scr_draw_text_outlined(display_get_gui_width() - 32, display_y, "Display: " + string(window_get_width()) + "x" + string(window_get_height()), global.default_text_size, c_black, c_white, 1);
		
		if (ds_exists(global.os_info, ds_type_map))
		{
			if (ds_map_exists(global.os_info, "video_adapter_description"))
			{
				if (global.os_info[? "video_adapter_description"] != undefined)
				{
					scr_draw_text_outlined(display_get_gui_width() - 32, d3d11_y, string(global.os_info[? "video_adapter_description"]), global.default_text_size, c_black, c_white, 1);
				}
			}
		}
		
		/* --- Current Room Info at Bottom --- */
		draw_set_halign(fa_center);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, 
			"current room: '" + string(global.level_name) + "' " + string(global.select_level_index) + " " + string(room_get_name(room)) + " " + string(room_width) + "x" + string(room_height),
			global.default_text_size, c_black, c_white);
		
		/* --- Optimized Debug Text Sections --- */
		scr_debug_draw_optimized_text();
	}
}


///////////////////////////////////////////////////////////////
// Mouse Toggle Helper
///////////////////////////////////////////////////////////////

/// @function scr_debug_handle_mouse_toggle(mouse_x, mouse_y, header_y, config_name)
/* Checks if the mouse is over a toggle area for FPS, Instance Count, etc. and toggles the option on click */
function scr_debug_handle_mouse_toggle(header_y, config_name)
{
	if (global.controls_used_for_navigation == "mouse"
	&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, header_y - 15, 370, header_y + 15))
	{
		draw_set_alpha(0.5);
		draw_roundrect_color_ext(0, header_y - 16, 370, header_y + 16, 50, 50, c_white, c_white, false);
		draw_set_alpha(1);
		
		if (mouse_check_button_released(mb_left))
		{
			/* Toggle the appropriate global variable and update the ini. Except for "show_all_instance_count" */
			if (config_name == "show_fps")
			{
				global.show_fps = !global.show_fps;
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "show_fps", global.show_fps);
				ini_close();
			}
			else
			if (config_name == "show_instance_count")
			{
				global.show_instance_count = !global.show_instance_count;
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "show_instance_count", global.show_instance_count);
				ini_close();
			}
			else
			if (config_name == "show_all_instance_count")
			{
				global.show_all_instance_count = !global.show_all_instance_count;
			}
		}
	}
}


///////////////////////////////////////////////////////////////
// Optimized Debug Text Sections
///////////////////////////////////////////////////////////////

/// @function scr_debug_draw_optimized_text()
/* Draws a series of collapsible debug text sections. System, Player, Menu, Gamepad, and Switch info */
function scr_debug_draw_optimized_text()
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var debug_text_y = 170; /* Starting Y position for debug text */
	var section_spacing = 30; /* Spacing between sections */
	
	#region /* Section 1: System Information */
	debug_text_y = scr_draw_debug_header("System Information", 32, debug_text_y);
	
	if (!global.debug_collapsed_sections[? "System Information"])
	{
		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"current_datetime", string(scr_format_timestamp(date_current_datetime())),
							"Current Date/Time", c_white, c_red, false);
		
		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"current_level_clear_rate", string(global.current_level_clear_rate),
							"Current Level Clear Rate", c_white, c_red, false);
	}
	#endregion /* Section 1: System Information END */
	
	debug_text_y += section_spacing;
	
	#region /* Section 2: Player Information */
	if (instance_exists(obj_camera))
	{
		debug_text_y = scr_draw_debug_header("Player Information", 32, debug_text_y);
		
		if (!global.debug_collapsed_sections[? "Player Information"])
		{
			var player_positions = scr_get_player_positions();
			for (var i = 0; i < array_length(player_positions); i++)
			{
				var player_info = player_positions[i];
				var player_variable_name = "player " + string(player_info.player_pos_id);
				var player_label_simplified = "Player " + string(player_info.player_pos_id);
				
				debug_text_y = scr_draw_highlighted_text(32, debug_text_y, player_variable_name + " xy",
									string(player_info.player_pos_x) + " / " + string(player_info.player_pos_y),
									player_label_simplified + " Position", c_white, c_red, false);
				
				debug_text_y = scr_draw_highlighted_text(32, debug_text_y, player_variable_name + " speed",
									string(player_info.player_speed),
									player_label_simplified + " Speed", c_white, c_red, false);
				
				debug_text_y = scr_draw_highlighted_text(32, debug_text_y, player_variable_name + " on_ground",
									string(player_info.player_on_ground),
									player_label_simplified + " On Ground", c_white, c_red, false);
			}
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "player_can_play", string(global.player_can_play), "Player Can Play", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "player_slot", string(global.player_slot), "Player Slots", c_white, c_red, false);
		}
	}
	#endregion /* Section 2: Player Information END */
	
	debug_text_y += section_spacing;
	
	#region /* Section 3: Menu Information */
	/* If a debug target was found, we can use a "with" block on it */
	if (debug_target != noone)
	{
		with (debug_target)
		{
			debug_text_y = scr_draw_debug_header("Menu Information", 32, debug_text_y);
			
			if (!global.debug_collapsed_sections[? "Menu Information"])
			{
				/* Debug output ordered by overall system state, control settings, then scroll values and delays */
				
				/* 1. Overall Menu States */
				if (variable_instance_exists(self, "menu"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "menu", string(menu), "Current Menu", c_white, c_red, menu == 0);
				}
				
				if (variable_instance_exists(self, "level_editor_menu"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "level_editor_menu", string(level_editor_menu), "Level Editor Menu", c_white, c_red, false);
				}
				
				if (variable_instance_exists(self, "in_character_select_menu"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "in_character_select_menu", string(in_character_select_menu), "In Character Select Menu", c_white, c_red, false);
				}
				
				if (variable_instance_exists(self, "in_settings"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "in_settings", string(in_settings), "In Settings Menu", c_white, c_red, false);
				}
				
				if (variable_instance_exists(self, "in_online_download_list_menu"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "in_online_download_list_menu", string(in_online_download_list_menu), "In Online Download List Menu", c_white, c_red, false);
				}
				
				if (variable_instance_exists(self, "can_navigate_settings_sidebar"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "can_navigate_settings_sidebar", string(can_navigate_settings_sidebar), "Can Navigate Settings Sidebar", c_white, c_red, false);
				}
				
				/* 2. Control Settings */
				debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "controls_used_for_navigation", string(global.controls_used_for_navigation), "Controls Used For Navigation", c_white, c_red, false);
				
				if (variable_instance_exists(self, "scrolling_menu_with_mousewheel"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "scrolling_menu_with_mousewheel", string(scrolling_menu_with_mousewheel), "Scrolling Menu With Mousewheel", c_white, c_red, scrolling_menu_with_mousewheel);
				}
				
				/* 3. Navigation & Scrolling Variables */
				debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "menu_navigation_speed", string(global.menu_navigation_speed), "Menu Navigation Speed", c_white, c_red, false);
				
				if (variable_instance_exists(self, "menu_cursor_y_position"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "menu_cursor_y_position", string(menu_cursor_y_position), "Menu Cursor Y Position", c_white, c_red, false);
				}
				
				if (variable_instance_exists(self, "menu_y_offset"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "menu_y_offset", string(menu_y_offset), "Menu Y Offset", c_white, c_red, false);
				}
				
				if (variable_instance_exists(self, "menu_y_offset_real"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "menu_y_offset_real", string(menu_y_offset_real), "Menu Y Offset (Real)", c_white, c_red, false);
				}
				
				/* 4. Delay Values */
				if (variable_instance_exists(self, "menu_delay"))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "menu_delay", string(menu_delay), "Menu Delay", c_white, c_red, menu_delay > 0);
				}
				
				if (variable_instance_exists(self, "menu_joystick_delay") && gamepad_is_connected(0))
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "menu_joystick_delay", string(menu_joystick_delay), "Menu Joystick Delay", c_white, c_red, menu_joystick_delay > 0);
				}
				
			}
		}
	}
	#endregion /* Section 3: Menu Information END */
	
	debug_text_y += section_spacing;
	
	#region /* Section 4: Gamepad Information */
	var gamepad_connected = false;
	
	for (var g = 0; g < 5; g++)
	{
		if (gamepad_get_description(g) != "")
		{
			gamepad_connected = true;
			break;
		}
	}
	
	if (gamepad_connected)
	{
		debug_text_y = scr_draw_debug_header("Gamepad Information", 32, debug_text_y);
		
		if (!global.debug_collapsed_sections[? "Gamepad Information"])
		{
			for (var g = 0; g < 5; g++)
			{
				if (gamepad_get_description(g) != "")
				{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "gamepad(" + string(g) + ")", gamepad_get_description(g), "Gamepad " + string(g) + " Description", c_white, c_red, false);
				}
			}
		}
	}
	#endregion /* Section 4: Gamepad Information END */
	
	debug_text_y += section_spacing;
	
	#region /* Section 5: Switch Information (only for Switch) */
	if (os_type == os_switch)
	{
		debug_text_y = scr_draw_debug_header("Switch Information", 32, debug_text_y);
		
		if (!global.debug_collapsed_sections[? "Switch Information"])
		{
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_account_name", string(global.switch_account_name), "Switch Account Name", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_account_open", string(global.switch_account_open), "Switch Account Open", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_account_handle", string(global.switch_account_handle), "Switch Account Handle", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "online_token_validated", string(global.online_token_validated), "Online Token Validated", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "online_token_error_message", string(global.online_token_error_message), "Online Token Error Message", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_account_netid", string(global.switch_account_netid), "Switch Account NetID", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_account_is_user_online", string(global.switch_account_is_user_online), "Switch User Online", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_account_network_service_available", string(global.switch_account_network_service_available), "Switch Network Service Available", c_white, c_red, !global.switch_account_network_service_available);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_logged_in", string(global.switch_logged_in), "Switch Logged In", c_white, c_red, !global.switch_logged_in);
		}
	}
	#endregion /* Section 5: Switch Information (only for Switch) END */
	
	debug_text_y += section_spacing;
	
	#region /* Section 6: Online Download Info */
	/* If a debug target was found, we can use a "with" block on it */
	if (debug_target != noone)
	{
		with (debug_target)
		{
			/* Only show online download info if these online download dependent variables are used */
			//if (variable_instance_exists(self, "data") && data != undefined)
			//&& (variable_instance_exists(self, "info_data") && info_data != undefined)
			//{
				debug_text_y = scr_draw_debug_header("Online Download Info", 32, debug_text_y);
				
				if (!global.debug_collapsed_sections[? "Online Download Info"])
				{
					/* Online System Status */
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "online_enabled", string(global.online_enabled), "Online Enabled", c_white, c_red, false);
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "online_token_validated", string(global.online_token_validated), "Online Token Validated", c_white, c_red, false);
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "online_token_error_message", string(global.online_token_error_message), "Online Token Error Message", c_white, c_red, false);
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "thumbnail_sprite", string(global.thumbnail_sprite), "Thumbnail Sprite", c_white, c_red, false);
					if (variable_instance_exists(self, "info_queue_index"))
					{
						debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "info_queue_index", string(info_queue_index), "Info Queue Index", c_white, c_red, false);
					}
					
					/* Download Menu Info */
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "selected_online_download_index", string(global.selected_online_download_index), "Selected Online Download Index", c_white, c_red, false);
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "automatically_play_downloaded_level", string(global.automatically_play_downloaded_level), "Automatically Play Downloaded Level", c_white, c_red, false);
				}
			//}
		}
	}
	#endregion /* Section 6: Online Download Info END */
	
}

/// @function scr_draw_debug_header(section_name, xx, yy)
/* Draws a clickable header for a debug section that can be collapsed/expanded */
function scr_draw_debug_header(section_name, xx, yy)
{
	var line_spacing = 25;
	var debug_header_outline_color = c_black;
	var debug_header_text_color = c_yellow;
	
	if (global.controls_used_for_navigation == "mouse"
	&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx, yy, xx + 400, yy + line_spacing + 10))
	{
		/* Highlight the header when the mouse is over it */
		debug_header_outline_color = c_yellow;
		debug_header_text_color = c_black;
		
		if (mouse_check_button_released(mb_left))
		{
			/* Toggle collapse state for this section */
			global.debug_collapsed_sections[? section_name] = !global.debug_collapsed_sections[? section_name];
			
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("debug_collapsed_sections", string(section_name), global.debug_collapsed_sections[? section_name]);
			ini_close();
		}
	}
	
	var debug_header_icon = (!global.debug_collapsed_sections[? string(section_name)]) ? "[+]" : "[-]";
	scr_draw_text_outlined(xx, yy, section_name + " " + string(debug_header_icon), global.default_text_size, debug_header_outline_color, debug_header_text_color);
	return yy + line_spacing;
}

/// @function scr_draw_highlighted_text(xx, yy, variable_name, value, label_simplified, color_normal, color_alert, alert_condition)
/* Draws a line of debug text with optional alert coloring */
function scr_draw_highlighted_text(xx, yy, variable_name, value, label_simplified, color_normal, color_alert, alert_condition)
{
	var display_label = (global.debug_detailed_mode) ? variable_name : label_simplified;
	var line_spacing = 25;
	var color = (alert_condition) ? color_alert : color_normal;
	scr_draw_text_outlined(xx, yy, display_label + ": " + string(value), global.default_text_size, c_black, color);
	return yy + line_spacing;
}

/// @function scr_get_player_positions()
/* Returns an array of player positions from obj_camera, if available */
function scr_get_player_positions()
{
	var positions = [];
	
	if (instance_exists(obj_camera)
	&& is_array(obj_camera.player))
	{
		for (var i = 1; i <= global.max_players; i++)
		{
			if (array_length(obj_camera.player) > i
			&& instance_exists(obj_camera.player[i])
			&& obj_camera.player[i] > 0)
			{
				array_push(positions,
				{
					player_pos_id: i,
					player_pos_x: obj_camera.player[i].x,
					player_pos_y: obj_camera.player[i].y,
					player_speed: obj_camera.player[i].speed,
					player_on_ground: obj_camera.player[i].on_ground
				});
			}
		}
	}
	return positions;
}