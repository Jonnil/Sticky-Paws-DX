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

	//if (GM_build_type == "run"
	//&& keyboard_check_pressed(vk_f4))
	//{
	//    global.intentionally_crash = intentionally_crash; /* Will intentionally crash the game */
	//}
}

/// @function scr_debug_get_settings_overlay_target()
/* Returns the active menu instance that owns the settings state for the debug overlay. */
function scr_debug_get_settings_overlay_target()
{
	if (instance_exists(obj_pause))
	{
		var pause_instance = instance_find(obj_pause, 0);
		if (variable_instance_exists(pause_instance, "in_settings")
		&& pause_instance.in_settings)
		{
			return pause_instance;
		}
	}

	if (instance_exists(obj_title))
	{
		var title_instance = instance_find(obj_title, 0);
		if (variable_instance_exists(title_instance, "in_settings")
		&& title_instance.in_settings)
		{
			return title_instance;
		}
	}

	return noone;
}

/// @function scr_debug_should_use_compact_overlay()
/* Returns true when the full debug overlay should collapse into a menu-safe panel. */
function scr_debug_should_use_compact_overlay()
{
	return global.debug_screen
		&& (scr_debug_get_settings_overlay_target() != noone);
}

/// @function scr_debug_format_compact_overlay_label(raw_text, trim_settings_suffix)
/* Converts internal menu ids into shorter, more readable labels for the compact overlay. */
function scr_debug_format_compact_overlay_label(raw_text, trim_settings_suffix = false)
{
	var formatted_text = string(raw_text);

	if (formatted_text == "")
	{
		return "None";
	}

	if (formatted_text == "settings_back")
	{
		return "Back";
	}

	if (!global.debug_detailed_mode)
	{
		if (trim_settings_suffix
		&& string_length(formatted_text) > 9)
		{
			var suffix_start = string_length(formatted_text) - 8;
			if (string_copy(formatted_text, suffix_start, 9) == "_settings")
			{
				formatted_text = string_delete(formatted_text, suffix_start, 9);
			}
		}

		formatted_text = string_replace_all(formatted_text, "_", " ");

		if (string_length(formatted_text) > 0)
		{
			formatted_text = string_upper(string_copy(formatted_text, 1, 1))
				+ string_delete(formatted_text, 1, 1);
		}
	}

	return formatted_text;
}

/// @function scr_debug_ellipsize_compact_overlay_text(raw_text, max_width, text_scale)
/* Trims long compact-overlay lines so the panel width stays stable. */
function scr_debug_ellipsize_compact_overlay_text(raw_text, max_width, text_scale)
{
	var trimmed_text = string(raw_text);
	var ellipsis = "...";

	if ((max_width <= 0)
	|| (string_width(trimmed_text) * text_scale <= max_width))
	{
		return trimmed_text;
	}

	while (string_length(trimmed_text) > 0
	&& (string_width(trimmed_text + ellipsis) * text_scale > max_width))
	{
		trimmed_text = string_delete(trimmed_text, string_length(trimmed_text), 1);
	}

	if (trimmed_text == "")
	{
		return ellipsis;
	}

	return trimmed_text + ellipsis;
}

/// @function scr_debug_draw_compact_overlay()
/* Draws a small debug panel that stays readable while the settings menu is open. */
function scr_debug_draw_compact_overlay()
{
	var target = scr_debug_get_settings_overlay_target();
	if (target == noone)
	{
		return;
	}

	var text_scale = global.default_text_size * 0.72;
	var padding = 16;
	var header_spacing = 28;
	var line_spacing = 22;
	var panel_width = min(clamp(display_get_gui_width() * 0.24, 288, 360), display_get_gui_width() - 40);
	var panel_right = display_get_gui_width() - 20;
	var panel_left = panel_right - panel_width;
	var panel_top = 20;
	var content_width = panel_width - (padding * 2);
	var selected_menu = "None";

	if (variable_instance_exists(target, "menu"))
	{
		selected_menu = scr_debug_format_compact_overlay_label(target.menu, true);
	}

	var lines = [];
	lines[array_length(lines)] =
	{
		text: scr_debug_ellipsize_compact_overlay_text("Tab: " + scr_debug_format_compact_overlay_label(global.settings_sidebar_menu, true), content_width, text_scale),
		color: c_white
	};
	lines[array_length(lines)] =
	{
		text: scr_debug_ellipsize_compact_overlay_text("Selected: " + selected_menu, content_width, text_scale),
		color: c_lime
	};
	lines[array_length(lines)] =
	{
		text: scr_debug_ellipsize_compact_overlay_text("Room: " + string(room_get_name(room)), content_width, text_scale),
		color: c_white
	};
	lines[array_length(lines)] =
	{
		text: scr_debug_ellipsize_compact_overlay_text("P1 Controller Slot: " + string(global.player_slot[1]), content_width, text_scale),
		color: c_white
	};

	var panel_bottom = panel_top + padding + header_spacing + 6 + (array_length(lines) * line_spacing) + 10;

	draw_set_alpha(0.82);
	draw_roundrect_color_ext(panel_left, panel_top, panel_right, panel_bottom, 18, 18, c_black, c_black, false);
	draw_set_alpha(1);

	draw_line_width_color(panel_left + padding, panel_top + padding + 22, panel_right - padding, panel_top + padding + 22, 2, c_yellow, c_yellow);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	scr_draw_text_outlined(panel_left + padding, panel_top + padding, "Debug Overlay", text_scale, c_black, c_yellow, 1);

	for (var line_index = 0; line_index < array_length(lines); line_index++)
	{
		var line_y = panel_top + padding + header_spacing + (line_index * line_spacing);
		scr_draw_text_outlined(panel_left + padding, line_y, lines[line_index].text, text_scale, c_black, lines[line_index].color, 1);
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
}

///////////////////////////////////////////////////////////////
// FPS Display
///////////////////////////////////////////////////////////////

/// @function scr_debug_draw_fps()
/* Draws the FPS and "real" FPS information on screen */
function scr_debug_draw_fps()
{
	if ((global.show_fps
	|| global.debug_screen)
	&& !scr_debug_should_use_compact_overlay())
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
	if ((global.show_instance_count
	|| global.debug_screen)
	&& !scr_debug_should_use_compact_overlay())
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
	if (global.show_all_instance_count
	&& !scr_debug_should_use_compact_overlay())
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

		if (global.enable_option_for_pc
		&& keyboard_check_pressed(vk_f6))
		{
			scr_debug_unlock_debug_menu();
		}

		if (scr_debug_should_use_compact_overlay())
		{
			scr_debug_draw_compact_overlay();
			return;
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
				var _inst_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Instructions") ? variable_struct_get(global.debug_collapsed_sections, "Instructions") : false;
				if (!_inst_collapsed)
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

				if (!global.debug_menu_unlocked)
				{
					scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
						"Press the F6 key to unlock the hidden Debug tab in Options",
						instr_text_size, c_black, c_yellow, 1);
					instructions_y += 25;
				}
				else
				{
					scr_draw_text_outlined(display_get_gui_width() * 0.5, instructions_y,
						"Debug tab unlocked in Options for this session",
						instr_text_size, c_black, c_lime, 1);
					instructions_y += 25;
				}

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

			/* Support both ds_map and struct for os_get_info across GM versions */
			var _adapter_desc = undefined;
			if (is_struct(global.os_info))
			{
				if (variable_struct_exists(global.os_info, "video_adapter_description"))
				{
					_adapter_desc = variable_struct_get(global.os_info, "video_adapter_description");
				}
			}
			else if (ds_exists(global.os_info, ds_type_map))
			{
				if (ds_map_exists(global.os_info, "video_adapter_description"))
				{
					_adapter_desc = global.os_info[? "video_adapter_description"];
				}
			}

			if (_adapter_desc != undefined)
			{
				scr_draw_text_outlined(display_get_gui_width() - 32, d3d11_y, string(_adapter_desc), global.default_text_size, c_black, c_white, 1);
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

/// @function scr_get_debug_level_loading_mode()
/* Returns a readable label for the current level-loading mode. */
function scr_get_debug_level_loading_mode()
{
	if (variable_global_exists("create_level_from_template")
	&& global.create_level_from_template)
	{
		return "template_official";
	}

	if (scr_is_loading_official_level())
	{
		return "official";
	}

	return "custom";
}

/// @function scr_debug_reset_level_load_snapshot()
/* Reset the stored load-time snapshot so each level load starts from a clean state. */
function scr_debug_reset_level_load_snapshot()
{
	global.debug_level_load_snapshot =
	{
		capture_reason: "uninitialized",
		load_mode: "",
		select_level_index: "",
		level_name: "",
		selected_official_level_id: "",
		active_official_level_id: "",
		object_placement_path: "",
		object_placement_exists: false,
		json_entry_count: 0,
		loaded_placed_object_count: 0,
		loaded_player1_start_count: 0,
		loaded_level_end_count: 0,
		room_name: "",
		timestamp: ""
	};

	scr_debug_reset_level_load_monitor();

	return global.debug_level_load_snapshot;
}

/// @function scr_debug_should_monitor_level_load()
/* Returns true only for gameplay entries that should auto-validate level loading. */
function scr_debug_should_monitor_level_load()
{
	return room == rm_leveleditor
		&& ((variable_global_exists("character_select_in_this_menu")
		&& global.character_select_in_this_menu == "main_game")
		|| (variable_global_exists("actually_play_edited_level")
		&& global.actually_play_edited_level));
}

/// @function scr_debug_reset_level_load_monitor()
/* Reset per-load validation state while preserving the short-term duplicate suppression window. */
function scr_debug_reset_level_load_monitor()
{
	var previous_signature = "";
	var previous_time = -30000;

	if (variable_global_exists("debug_level_load_monitor")
	&& is_struct(global.debug_level_load_monitor))
	{
		if (variable_struct_exists(global.debug_level_load_monitor, "last_error_signature"))
		{
			previous_signature = string(global.debug_level_load_monitor.last_error_signature);
		}

		if (variable_struct_exists(global.debug_level_load_monitor, "last_error_time"))
		{
			previous_time = real(global.debug_level_load_monitor.last_error_time);
		}
	}

	var validation_active = scr_debug_should_monitor_level_load();

	global.debug_level_load_monitor =
	{
		session_id: scr_format_timestamp(date_current_datetime()) + "_" + string(current_time),
		validation_pending: validation_active,
		validated: false,
		auto_log_saved: false,
		runtime_spawn_calls: 0,
		runtime_instances_created_total: 0,
		last_error_signature: previous_signature,
		last_error_time: previous_time,
		validation_result: validation_active ? "PENDING" : "INACTIVE",
		validation_delay_frames: 10,
		failure_reason: "",
		failure_signature: "",
		warning_reason: ""
	};

	if (validation_active)
	{
		scr_log("INFO", "LEVEL.LOAD", "load_begin",
			"session_id=" + string(global.debug_level_load_monitor.session_id)
			+ ", mode=" + scr_get_debug_level_loading_mode()
			+ ", level_name=" + (variable_global_exists("level_name") ? string(global.level_name) : ""));
	}

	return global.debug_level_load_monitor;
}

/// @function scr_debug_get_level_load_monitor()
/* Return the current level-load validation monitor, creating it on demand. */
function scr_debug_get_level_load_monitor()
{
	if (!variable_global_exists("debug_level_load_monitor")
	|| !is_struct(global.debug_level_load_monitor))
	{
		return scr_debug_reset_level_load_monitor();
	}

	return global.debug_level_load_monitor;
}

/// @function scr_debug_record_runtime_spawn_pass(created_instance_count)
/* Record how many gameplay instances a single placeholder spawn pass created. */
function scr_debug_record_runtime_spawn_pass(created_instance_count)
{
	var monitor = scr_debug_get_level_load_monitor();

	if (!scr_debug_should_monitor_level_load())
	{
		return monitor;
	}

	monitor.runtime_spawn_calls += 1;
	monitor.runtime_instances_created_total += max(0, floor(real(created_instance_count)));
	global.debug_level_load_monitor = monitor;

	return monitor;
}

/// @function scr_debug_join_string_array(string_array)
/* Join a flat array of strings with "; " for compact debug output. */
function scr_debug_join_string_array(string_array)
{
	var output = "";

	for (var i = 0; i < array_length(string_array); i++)
	{
		if (i > 0)
		{
			output += "; ";
		}

		output += string(string_array[i]);
	}

	return output;
}

/// @function scr_debug_build_level_load_failure_signature(level_loading_debug, failure_reason)
/* Build a stable signature so rapid retries suppress duplicate auto-log files. */
function scr_debug_build_level_load_failure_signature(level_loading_debug, failure_reason)
{
	var level_identifier = string(level_loading_debug.active_official_level_id);

	if (level_identifier == "")
	{
		level_identifier = string(level_loading_debug.level_name);
	}

	if (level_identifier == "")
	{
		level_identifier = string(level_loading_debug.custom_folder_name);
	}

	return string(level_loading_debug.load_mode)
		+ "|"
		+ level_identifier
		+ "|"
		+ string(level_loading_debug.selected_official_level_id)
		+ "|"
		+ string(level_loading_debug.active_official_level_id)
		+ "|"
		+ string(failure_reason);
}

/// @function scr_debug_save_level_load_error_log(failure_reason, failure_signature)
/* Save a one-shot automatic level-load error dump without affecting normal gameplay flow. */
function scr_debug_save_level_load_error_log(failure_reason, failure_signature)
{
	var monitor = scr_debug_get_level_load_monitor();
	var level_loading_debug = scr_get_level_loading_debug_data();
	var logs_root = game_save_id + "debug_logs/";
	var logs_folder = logs_root + "level_load_error/";
	var level_identifier = string(level_loading_debug.active_official_level_id);

	if (!directory_exists(logs_root))
	{
		directory_create(logs_root);
	}

	if (!directory_exists(logs_folder))
	{
		directory_create(logs_folder);
	}

	if (level_identifier == "")
	{
		level_identifier = string(level_loading_debug.level_name);
	}

	if (level_identifier == "")
	{
		level_identifier = string(level_loading_debug.custom_folder_name);
	}

	if (level_identifier == "")
	{
		level_identifier = "unknown_level";
	}

	var log_file_path = logs_folder
		+ "level_load_error_"
		+ scr_format_timestamp(date_current_datetime())
		+ "_"
		+ scr_sanitize_filename(level_loading_debug.load_mode, 32)
		+ "_"
		+ scr_sanitize_filename(level_identifier, 64)
		+ ".ini";

	global.debug_auto_level_load_log_context =
	{
		auto_generated: true,
		session_id: monitor.session_id,
		failure_reason: string(failure_reason),
		failure_signature: string(failure_signature),
		validation_delay_frames: monitor.validation_delay_frames
	};

	ini_open(log_file_path);
	scr_write_debug_info();
	ini_close();

	global.debug_auto_level_load_log_context = undefined;

	scr_log("ERROR", "LEVEL.LOAD", "auto_log_saved",
		"session_id=" + string(monitor.session_id)
		+ ", path="
		+ scr_censor_game_save_id_for_display(log_file_path));

	return log_file_path;
}

/// @function scr_debug_validate_level_load_after_stabilization(validation_delay_frames)
/* Run a one-shot conservative validation pass after gameplay objects have had time to spawn. */
function scr_debug_validate_level_load_after_stabilization(validation_delay_frames = 10)
{
	var monitor = scr_debug_get_level_load_monitor();

	monitor.validation_delay_frames = max(0, floor(real(validation_delay_frames)));

	if (!scr_debug_should_monitor_level_load())
	{
		monitor.validation_pending = false;
		monitor.validation_result = "INACTIVE";
		global.debug_level_load_monitor = monitor;
		return false;
	}

	if (monitor.validated)
	{
		global.debug_level_load_monitor = monitor;
		return string_pos(string(monitor.validation_result), "FAILED") == 1;
	}

	monitor.validation_pending = false;
	monitor.validated = true;

	var level_loading_debug = scr_get_level_loading_debug_data();
	var failure_messages = [];
	var warning_messages = [];

	if (level_loading_debug.expect_level_files
	&& !level_loading_debug.level_information_exists)
	{
		failure_messages[array_length(failure_messages)] = "missing level_information.ini";
	}

	if (level_loading_debug.expect_level_files
	&& !level_loading_debug.object_placement_exists)
	{
		failure_messages[array_length(failure_messages)] = "missing object_placement_all.json";
	}

	if (level_loading_debug.expect_level_files
	&& !level_loading_debug.background_path_exists)
	{
		failure_messages[array_length(failure_messages)] = "missing background directory";
	}

	if (level_loading_debug.expect_level_files
	&& level_loading_debug.object_placement_exists
	&& level_loading_debug.loaded_placed_object_count <= 0)
	{
		failure_messages[array_length(failure_messages)] = "0 objects loaded from object_placement_all.json";
	}

	if (level_loading_debug.expect_level_files
	&& level_loading_debug.loaded_player1_start_count <= 0)
	{
		failure_messages[array_length(failure_messages)] = "missing player1 start placeholder at load time";
	}

	if (level_loading_debug.expect_level_files
	&& level_loading_debug.loaded_level_end_count <= 0)
	{
		failure_messages[array_length(failure_messages)] = "missing level end placeholder at load time";
	}

	if (instance_number(obj_player) <= 0)
	{
		failure_messages[array_length(failure_messages)] = "no player instance after stabilization";
	}

	if (level_loading_debug.loaded_placed_object_count >= 25
	&& monitor.runtime_instances_created_total <= 0)
	{
		failure_messages[array_length(failure_messages)] = "25+ placed objects loaded but runtime spawn count stayed at 0";
	}

	if (string(level_loading_debug.selected_official_level_id) != ""
	&& string(level_loading_debug.active_official_level_id) != ""
	&& string(level_loading_debug.selected_official_level_id) != string(level_loading_debug.active_official_level_id))
	{
		warning_messages[array_length(warning_messages)] = "selected official ID and active official ID differ after stabilization";
	}

	if (level_loading_debug.loaded_placed_object_count >= 1
	&& level_loading_debug.loaded_placed_object_count <= 24
	&& monitor.runtime_instances_created_total <= 0)
	{
		warning_messages[array_length(warning_messages)] = "1-24 placed objects loaded but runtime spawn count stayed at 0";
	}

	var failure_reason = scr_debug_join_string_array(failure_messages);
	var warning_reason = scr_debug_join_string_array(warning_messages);

	monitor.failure_reason = failure_reason;
	monitor.warning_reason = warning_reason;
	monitor.failure_signature = "";

	var log_prefix = "session_id=" + string(monitor.session_id)
		+ ", selected_official_level_id=" + string(level_loading_debug.selected_official_level_id)
		+ ", active_official_level_id=" + string(level_loading_debug.active_official_level_id)
		+ ", loaded_placed_object_count=" + string(level_loading_debug.loaded_placed_object_count)
		+ ", runtime_spawn_calls=" + string(monitor.runtime_spawn_calls)
		+ ", runtime_instances_created_total=" + string(monitor.runtime_instances_created_total);

	if (array_length(failure_messages) > 0)
	{
		var failure_signature = scr_debug_build_level_load_failure_signature(level_loading_debug, failure_reason);
		var duplicate_error = false;

		monitor.failure_signature = failure_signature;
		monitor.validation_result = "FAILED: " + failure_reason;

		scr_log("ERROR", "LEVEL.LOAD", "validation_failed",
			log_prefix + ", reason=" + failure_reason);

		if (string(monitor.last_error_signature) == failure_signature
		&& (current_time - real(monitor.last_error_time)) < 30000)
		{
			duplicate_error = true;
		}

		if (duplicate_error)
		{
			scr_log("WARN", "LEVEL.LOAD", "duplicate_error_suppressed",
				"session_id=" + string(monitor.session_id)
				+ ", failure_signature="
				+ failure_signature);
		}
		else
		if (!monitor.auto_log_saved)
		{
			scr_debug_save_level_load_error_log(failure_reason, failure_signature);
			monitor.auto_log_saved = true;
			monitor.last_error_signature = failure_signature;
			monitor.last_error_time = current_time;
		}
	}
	else
	if (array_length(warning_messages) > 0)
	{
		monitor.validation_result = "WARNING: " + warning_reason;

		scr_log("WARN", "LEVEL.LOAD", "validation_warning",
			log_prefix + ", reason=" + warning_reason);
	}
	else
	{
		monitor.validation_result = "OK";

		scr_log("INFO", "LEVEL.LOAD", "validation_ok",
			log_prefix + ", result=OK");
	}

	global.debug_level_load_monitor = monitor;

	return array_length(failure_messages) > 0;
}

/// @function scr_debug_get_level_load_snapshot()
/* Return the current snapshot, lazily creating it when needed. */
function scr_debug_get_level_load_snapshot()
{
	if (!variable_global_exists("debug_level_load_snapshot")
	|| !is_struct(global.debug_level_load_snapshot))
	{
		return scr_debug_reset_level_load_snapshot();
	}

	return global.debug_level_load_snapshot;
}

/// @function scr_debug_refresh_level_load_snapshot()
/* Refresh marker counts after room instances finish creating, without losing the earlier JSON snapshot. */
function scr_debug_refresh_level_load_snapshot()
{
	var snapshot = scr_debug_get_level_load_snapshot();

	snapshot.load_mode = scr_get_debug_level_loading_mode();
	snapshot.select_level_index = variable_global_exists("select_level_index") ? string(global.select_level_index) : "";
	snapshot.level_name = variable_global_exists("level_name") ? string(global.level_name) : "";
	snapshot.selected_official_level_id = scr_get_selected_official_level_id();
	snapshot.active_official_level_id = scr_get_active_official_level_id();
	snapshot.loaded_player1_start_count = instance_number(obj_level_player1_start);
	snapshot.loaded_level_end_count = instance_number(obj_level_end);
	snapshot.room_name = room_get_name(room);
	snapshot.timestamp = scr_format_timestamp(date_current_datetime());

	global.debug_level_load_snapshot = snapshot;

	return snapshot;
}

/// @function scr_debug_capture_level_load_snapshot(capture_reason, object_placement_path, object_placement_exists, json_entry_count, loaded_placed_object_count)
/* Capture the load-time object counts before gameplay cleanup or deactivation changes what is live on screen. */
function scr_debug_capture_level_load_snapshot(capture_reason = "", object_placement_path = undefined, object_placement_exists = undefined, json_entry_count = undefined, loaded_placed_object_count = undefined)
{
	var snapshot = scr_debug_get_level_load_snapshot();
	var monitor = scr_debug_get_level_load_monitor();

	if (string(capture_reason) != "")
	{
		snapshot.capture_reason = string(capture_reason);
	}

	if (!is_undefined(object_placement_path))
	{
		snapshot.object_placement_path = string(object_placement_path);
	}

	if (!is_undefined(object_placement_exists))
	{
		snapshot.object_placement_exists = object_placement_exists;
	}

	if (!is_undefined(json_entry_count))
	{
		snapshot.json_entry_count = max(0, floor(real(json_entry_count)));
	}

	if (!is_undefined(loaded_placed_object_count))
	{
		snapshot.loaded_placed_object_count = max(0, floor(real(loaded_placed_object_count)));
	}

	global.debug_level_load_snapshot = snapshot;

	if (scr_debug_should_monitor_level_load())
	{
		var capture_details = "session_id=" + string(monitor.session_id)
			+ ", object_placement_exists=" + string(snapshot.object_placement_exists)
			+ ", json_entry_count=" + string(snapshot.json_entry_count)
			+ ", loaded_placed_object_count=" + string(snapshot.loaded_placed_object_count)
			+ ", object_placement_path="
			+ scr_censor_game_save_id_for_display(snapshot.object_placement_path);

		switch (string(snapshot.capture_reason))
		{
			case "json_loaded":
				scr_log("INFO", "LEVEL.LOAD", "json_loaded", capture_details);
				break;

			case "json_missing":
				scr_log("ERROR", "LEVEL.LOAD", "json_missing", capture_details);
				break;
		}
	}

	return scr_debug_refresh_level_load_snapshot();
}

/// @function scr_get_level_loading_debug_data()
/* Collects the current level-loading state and resolved file paths for the debug screen/logs. */
function scr_get_level_loading_debug_data()
{
	var is_official_level = scr_is_loading_official_level();
	var custom_folder_name = scr_get_custom_level_folder_name();
	var level_information_path = "";
	var object_placement_path = "";
	var background_path = "";
	var load_snapshot = scr_debug_get_level_load_snapshot();
	var load_monitor = scr_debug_get_level_load_monitor();
	var expect_level_files = instance_exists(obj_camera);

	if (is_official_level)
	{
		level_information_path = scr_get_official_level_file_path("", "data", "level_information.ini");
		object_placement_path = scr_get_official_level_file_path("", "data", "object_placement_all.json");
		background_path = scr_get_official_level_directory("", "background");
	}
	else
	{
		level_information_path = global.use_temp_or_working + "custom_levels/" + custom_folder_name + "/data/level_information.ini";
		object_placement_path = global.use_temp_or_working + "custom_levels/" + custom_folder_name + "/data/object_placement_all.json";
		background_path = global.use_temp_or_working + "custom_levels/" + custom_folder_name + "/background/";
	}

	var after_goal_value = "n/a";
	var level_information_exists = file_exists(level_information_path);
	var object_placement_exists = file_exists(object_placement_path);
	var background_path_exists = directory_exists(background_path);
	var load_snapshot_status = "OK";

	if (instance_exists(obj_camera)
	&& variable_instance_exists(obj_camera, "after_goal_go_to_this_level"))
	{
		after_goal_value = string(obj_camera.after_goal_go_to_this_level);
	}

	if (expect_level_files
	&& (!level_information_exists
	|| !object_placement_exists
	|| !background_path_exists))
	{
		load_snapshot_status = "FAILED: missing files";
	}
	else
	if (expect_level_files
	&& object_placement_exists
	&& load_snapshot.loaded_placed_object_count <= 0)
	{
		load_snapshot_status = "FAILED: 0 objects loaded";
	}

	return {
		load_mode: scr_get_debug_level_loading_mode(),
		character_select_menu: variable_global_exists("character_select_in_this_menu") ? string(global.character_select_in_this_menu) : "",
		create_level_from_template: variable_global_exists("create_level_from_template") ? string(global.create_level_from_template) : "",
		select_level_index: variable_global_exists("select_level_index") ? string(global.select_level_index) : "",
		level_name: variable_global_exists("level_name") ? string(global.level_name) : "",
		level_folder_name: variable_global_exists("level_folder_name") ? string(global.level_folder_name) : "",
		level_description: variable_global_exists("level_description") ? string(global.level_description) : "",
		selected_official_level_id: scr_get_selected_official_level_id(),
		active_official_level_id: scr_get_active_official_level_id(),
		custom_folder_name: custom_folder_name,
		level_information_path: level_information_path,
		level_information_exists: level_information_exists,
		object_placement_path: object_placement_path,
		object_placement_exists: object_placement_exists,
		background_path: background_path,
		background_path_exists: background_path_exists,
		path_to_use: variable_global_exists("path_to_use") ? string(global.path_to_use) : "",
		load_snapshot_reason: load_snapshot.capture_reason,
		load_snapshot_status: load_snapshot_status,
		load_snapshot_timestamp: load_snapshot.timestamp,
		load_snapshot_json_entry_count: load_snapshot.json_entry_count,
		monitor_session_id: load_monitor.session_id,
		monitor_active: scr_debug_should_monitor_level_load(),
		validation_pending: load_monitor.validation_pending,
		validation_result: load_monitor.validation_result,
		validation_delay_frames: load_monitor.validation_delay_frames,
		auto_log_saved: load_monitor.auto_log_saved,
		runtime_spawn_calls: load_monitor.runtime_spawn_calls,
		runtime_instances_created_total: load_monitor.runtime_instances_created_total,
		failure_reason: load_monitor.failure_reason,
		failure_signature: load_monitor.failure_signature,
		warning_reason: load_monitor.warning_reason,
		loaded_player1_start_count: load_snapshot.loaded_player1_start_count,
		current_live_player1_start_count: instance_number(obj_level_player1_start),
		loaded_level_end_count: load_snapshot.loaded_level_end_count,
		current_live_level_end_count: instance_number(obj_level_end),
		loaded_placed_object_count: load_snapshot.loaded_placed_object_count,
		current_live_placed_object_count: instance_number(obj_leveleditor_placed_object),
		player1_start_count: instance_number(obj_level_player1_start),
		level_end_count: instance_number(obj_level_end),
		placed_object_count: instance_number(obj_leveleditor_placed_object),
		after_goal_go_to_this_level: after_goal_value,
		expect_level_files: expect_level_files
	};
}

/// @function scr_debug_format_resolved_path_summary(resolved_path, path_exists)
/* Formats a resolved path as a concise "found/missing" summary for on-screen debug text. */
function scr_debug_format_resolved_path_summary(resolved_path, path_exists)
{
	var display_path = scr_censor_game_save_id_for_display(string(resolved_path));

	if (display_path == "")
	{
		return "n/a";
	}

	if (path_exists)
	{
		return "found - " + display_path;
	}

	return "missing - expected at " + display_path;
}

/// @function scr_debug_format_snapshot_summary(load_snapshot_status, load_snapshot_reason)
/* Combines the high-level snapshot status and capture reason into one readable line. */
function scr_debug_format_snapshot_summary(load_snapshot_status, load_snapshot_reason)
{
	var snapshot_status = string(load_snapshot_status);
	var snapshot_reason = string(load_snapshot_reason);

	if (snapshot_reason == "")
	{
		return snapshot_status;
	}

	return snapshot_status + " - " + snapshot_reason;
}

/// @function scr_debug_format_validation_summary(validation_result)
/* Convert internal validation states into direct, human-readable on-screen wording. */
function scr_debug_format_validation_summary(validation_result)
{
	var summary = string(validation_result);

	if (summary == "OK")
	{
		return "PASS";
	}

	if (summary == "PENDING")
	{
		return "WAITING FOR POST-LOAD CHECK";
	}

	if (summary == "INACTIVE")
	{
		return "NOT ACTIVE IN THIS MODE";
	}

	if (string_pos(summary, "FAILED: ") == 1)
	{
		return "FAIL: " + string_delete(summary, 1, string_length("FAILED: "));
	}

	return summary;
}

/// @function scr_debug_format_loaded_live_summary(loaded_count, live_count)
/* Shows the load-time snapshot and the current live count in one compact string. */
function scr_debug_format_loaded_live_summary(loaded_count, live_count)
{
	return "loaded " + string(loaded_count) + ", still present now " + string(live_count);
}

/// @function scr_debug_format_runtime_spawn_pass_summary(spawn_pass_count)
/* Describe how many placed-object placeholders finished their spawn pass. */
function scr_debug_format_runtime_spawn_pass_summary(spawn_pass_count)
{
	return string(spawn_pass_count) + " placed-object placeholders processed";
}

/// @function scr_debug_format_runtime_instances_created_summary(created_count)
/* Describe how many gameplay instances were created from placed-object placeholders. */
function scr_debug_format_runtime_instances_created_summary(created_count)
{
	return string(created_count) + " created from placed-object placeholders";
}

/// @function scr_debug_is_integer_string(value_to_check)
/* Returns true when the supplied string is a signed integer. */
function scr_debug_is_integer_string(value_to_check)
{
	var value_string = string(value_to_check);
	var string_length_value = string_length(value_string);

	if (string_length_value <= 0)
	{
		return false;
	}

	var first_index = 1;

	if (string_copy(value_string, 1, 1) == "-")
	{
		if (string_length_value == 1)
		{
			return false;
		}

		first_index = 2;
	}

	for (var i = first_index; i <= string_length_value; i++)
	{
		var character = string_copy(value_string, i, 1);

		if (character < "0"
		|| character > "9")
		{
			return false;
		}
	}

	return true;
}

/// @function scr_debug_format_level_folder_display(is_official_level, tracked_level_folder_name, custom_folder_name)
/* Formats the folder line so official loads do not look like missing custom-folder data. */
function scr_debug_format_level_folder_display(is_official_level, tracked_level_folder_name, custom_folder_name)
{
	var tracked_folder_name = string(tracked_level_folder_name);

	if (tracked_folder_name != "")
	{
		return tracked_folder_name;
	}

	if (!is_official_level)
	{
		var active_custom_folder_name = string(custom_folder_name);

		if (active_custom_folder_name != "")
		{
			return active_custom_folder_name;
		}
	}

	return "n/a";
}

/// @function scr_debug_format_after_goal_display(after_goal_value)
/* Converts sentinel after-goal values into readable text for screenshots and reports. */
function scr_debug_format_after_goal_display(after_goal_value)
{
	var display_value = string(after_goal_value);

	if (display_value == ""
	|| display_value == "n/a")
	{
		return "n/a";
	}

	if (!scr_debug_is_integer_string(display_value))
	{
		return display_value;
	}

	var numeric_value = real(display_value);

	if (numeric_value == noone)
	{
		return "none (" + display_value + ")";
	}

	if (numeric_value >= 0)
	{
		return "level index " + display_value;
	}

	return "sentinel (" + display_value + ")";
}

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

	var _sys_collapsed = variable_struct_exists(global.debug_collapsed_sections, "System Information") ? variable_struct_get(global.debug_collapsed_sections, "System Information") : false;
	if (!_sys_collapsed)
	{
		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"current_datetime", string(scr_format_timestamp(date_current_datetime())),
							"Current Date/Time", c_white, c_red, false);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"current_level_clear_rate", string(global.current_level_clear_rate),
							"Current Level Clear Rate", c_white, c_red, false);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"doing_clear_check_character", string(global.doing_clear_check_character),
							"Doing Clear Check Character", c_white, c_red, false);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"doing_clear_check_level", string(global.doing_clear_check_level),
							"Doing Clear Check Level", c_white, c_red, false);
	}
	#endregion /* Section 1: System Information END */

	debug_text_y += section_spacing;

	#region /* Section 2: Level Loading */
	var level_loading_debug = scr_get_level_loading_debug_data();

	debug_text_y = scr_draw_debug_header("Level Loading", 32, debug_text_y);

	var _level_loading_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Level Loading") ? variable_struct_get(global.debug_collapsed_sections, "Level Loading") : false;
	if (!_level_loading_collapsed)
	{
		var missing_level_info = level_loading_debug.expect_level_files
			&& !level_loading_debug.level_information_exists;
		var missing_object_json = level_loading_debug.expect_level_files
			&& !level_loading_debug.object_placement_exists;
		var missing_background_directory = level_loading_debug.expect_level_files
			&& !level_loading_debug.background_path_exists;
		var failed_loaded_object_snapshot = level_loading_debug.expect_level_files
			&& level_loading_debug.object_placement_exists
			&& level_loading_debug.loaded_placed_object_count <= 0;
		var level_info_summary = scr_debug_format_resolved_path_summary(level_loading_debug.level_information_path, level_loading_debug.level_information_exists);
		var object_json_summary = scr_debug_format_resolved_path_summary(level_loading_debug.object_placement_path, level_loading_debug.object_placement_exists);
		var background_summary = scr_debug_format_resolved_path_summary(level_loading_debug.background_path, level_loading_debug.background_path_exists);
		var snapshot_summary = scr_debug_format_snapshot_summary(level_loading_debug.load_snapshot_status, level_loading_debug.load_snapshot_reason);
		var level_folder_display = scr_debug_format_level_folder_display(scr_is_loading_official_level(), level_loading_debug.level_folder_name, level_loading_debug.custom_folder_name);
		var after_goal_display = scr_debug_format_after_goal_display(level_loading_debug.after_goal_go_to_this_level);
		var validation_failed = string_pos(level_loading_debug.validation_result, "FAILED") == 1;
		var validation_display = scr_debug_format_validation_summary(level_loading_debug.validation_result);
		var show_custom_folder = level_loading_debug.load_mode == "custom";
		var show_path_to_use = string(level_loading_debug.path_to_use) != ""
			&& string(level_loading_debug.path_to_use) != string(level_loading_debug.background_path);
		var placeholder_cleanup_note = level_loading_debug.monitor_active
			? "expected: 'still present now 0' is normal after placeholder objects spawn gameplay objects"
			: "edit mode keeps placeholder objects alive instead of deleting them after spawn";

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"load_mode", level_loading_debug.load_mode,
							"Load Mode", c_white, c_red, missing_level_info || missing_object_json);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"character_select_in_this_menu", level_loading_debug.character_select_menu,
							"Character Menu", c_white, c_red, false);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"create_level_from_template", level_loading_debug.create_level_from_template,
							"From Template", c_white, c_red, false);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"select_level_index", level_loading_debug.select_level_index,
							"Level Index", c_white, c_red, false);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"global.level_name", level_loading_debug.level_name,
							"Level Name", c_white, c_red, false);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"display_level_folder", level_folder_display,
							"Level Folder", c_white, c_red, false);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"scr_get_selected_official_level_id()", level_loading_debug.selected_official_level_id,
							"Selected Official ID", c_white, c_red, false);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"scr_get_active_official_level_id()", level_loading_debug.active_official_level_id,
							"Active Official ID", c_white, c_red, false);

		if (show_custom_folder)
		{
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
								"scr_get_custom_level_folder_name()", level_loading_debug.custom_folder_name,
								"Custom Folder", c_white, c_red, false);
		}

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"level_information_path + level_information_exists", level_info_summary,
							"Level Info", c_white, c_red, missing_level_info);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"object_placement_path + object_placement_exists", object_json_summary,
							"Object JSON", c_white, c_red, missing_object_json);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"background_path + background_path_exists", background_summary,
							"Background", c_white, c_red, missing_background_directory);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"load_snapshot_status + load_snapshot_reason", snapshot_summary,
							"Load Snapshot", c_white, c_red, level_loading_debug.load_snapshot_status != "OK");

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"load_snapshot_json_entry_count", string(level_loading_debug.load_snapshot_json_entry_count),
							"JSON Entries", c_white, c_red, false);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"validation_result", validation_display,
							"Automatic Load Check", c_white, c_red, validation_failed);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"placeholder_cleanup_note", placeholder_cleanup_note,
							"Placeholder Object Rule", c_white, c_red, false);

		if (show_path_to_use)
		{
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
								"global.path_to_use", scr_censor_game_save_id_for_display(level_loading_debug.path_to_use),
								"Path To Use", c_white, c_red, false);
		}

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"loaded/current obj_level_player1_start count", scr_debug_format_loaded_live_summary(level_loading_debug.loaded_player1_start_count, level_loading_debug.current_live_player1_start_count),
							"P1 Start Placeholder", c_white, c_red, level_loading_debug.expect_level_files && level_loading_debug.loaded_player1_start_count <= 0);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"loaded/current obj_level_end count", scr_debug_format_loaded_live_summary(level_loading_debug.loaded_level_end_count, level_loading_debug.current_live_level_end_count),
							"Level End Placeholder", c_white, c_red, level_loading_debug.expect_level_files && level_loading_debug.loaded_level_end_count <= 0);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"loaded/current obj_leveleditor_placed_object count", scr_debug_format_loaded_live_summary(level_loading_debug.loaded_placed_object_count, level_loading_debug.current_live_placed_object_count),
							"Placed-Object Placeholder", c_white, c_red, failed_loaded_object_snapshot);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"runtime_spawn_calls", scr_debug_format_runtime_spawn_pass_summary(level_loading_debug.runtime_spawn_calls),
							"Placed-Object Spawn Passes", c_white, c_red, validation_failed);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"runtime_instances_created_total", scr_debug_format_runtime_instances_created_summary(level_loading_debug.runtime_instances_created_total),
							"Gameplay Instances Created", c_white, c_red, validation_failed);

		debug_text_y = scr_draw_highlighted_text(32, debug_text_y,
							"display_after_goal_go_to_this_level", after_goal_display,
							"After Goal Level", c_white, c_red, false);
	}
	#endregion /* Section 2: Level Loading END */

	debug_text_y += section_spacing;

	#region /* Section 3: Player Information */
	if (instance_exists(obj_camera))
	{
		debug_text_y = scr_draw_debug_header("Player Information", 32, debug_text_y);

		var _player_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Player Information") ? variable_struct_get(global.debug_collapsed_sections, "Player Information") : false;
		if (!_player_collapsed)
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

				debug_text_y = scr_draw_highlighted_text(32, debug_text_y, player_variable_name + " image_index",
									string(player_info.player_image_index),
									player_label_simplified + " Image Index", c_white, c_red, false);

				debug_text_y = scr_draw_highlighted_text(32, debug_text_y, player_variable_name + " image_speed",
									string(player_info.player_image_speed),
									player_label_simplified + " Image Speed", c_white, c_red, false);

				debug_text_y = scr_draw_highlighted_text(32, debug_text_y, player_variable_name + " on_ground",
									string(player_info.player_on_ground),
									player_label_simplified + " On Ground", c_white, c_red, false);

				//if (player_info.player_cutscene_time != 0)
				//{
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, player_variable_name + " cutscene_time",
									string(player_info.player_cutscene_time),
									player_label_simplified + " Cutscene Time", c_white, c_red, false);
				//}
			}
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "player_can_play", string(global.player_can_play), "Player Can Play", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "player_slot", string(global.player_slot), "Player Slots", c_white, c_red, false);
		}
	}
	#endregion /* Section 3: Player Information END */

	debug_text_y += section_spacing;

	#region /* Section 4: Menu Information */
	/* If a debug target was found, we can use a "with" block on it */
	if (debug_target != noone)
	{
		with (debug_target)
		{
			debug_text_y = scr_draw_debug_header("Menu Information", 32, debug_text_y);

			var _menu_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Menu Information") ? variable_struct_get(global.debug_collapsed_sections, "Menu Information") : false;
			if (!_menu_collapsed)
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
	#endregion /* Section 4: Menu Information END */

	debug_text_y += section_spacing;

	#region /* Section 5: Gamepad Information */
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

		var _gamepad_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Gamepad Information") ? variable_struct_get(global.debug_collapsed_sections, "Gamepad Information") : false;
		if (!_gamepad_collapsed)
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
	#endregion /* Section 5: Gamepad Information END */

	debug_text_y += section_spacing;

	#region /* Section 6: Switch Information (only for Switch) */
	if (os_type == os_switch)
	{
		debug_text_y = scr_draw_debug_header("Switch Information", 32, debug_text_y);

		var _switch_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Switch Information") ? variable_struct_get(global.debug_collapsed_sections, "Switch Information") : false;

		if (!_switch_collapsed)
		{
			var _switch_probe_index = global.switch_accounts_probe_user_index;
			var _switch_probe_valid = _switch_probe_index >= 0
				&& _switch_probe_index < global.switch_accounts_get_accounts_result;
			var _switch_is_user_open_label = _switch_probe_valid
				? "switch_accounts_is_user_open(" + string(_switch_probe_index) + ")"
				: "switch_accounts_is_user_open(accountId)";
			var _switch_is_user_open_value = _switch_probe_valid
				? (global.switch_accounts_is_user_open_result ? "open" : "closed")
				: "n/a";

			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_account_name", string(global.switch_account_name), "Switch Account Name", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_account_handle", string(global.switch_account_handle), "Switch Account Handle", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_accounts_get_accounts()", string(global.switch_accounts_get_accounts_result), "switch_accounts_get_accounts()", c_white, c_red, global.switch_accounts_get_accounts_result <= 0);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_accounts_open_preselected_user()", string(global.switch_accounts_open_preselected_user_result), "switch_accounts_open_preselected_user()", c_white, c_red, global.switch_accounts_open_preselected_user_result < 0);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, _switch_is_user_open_label, _switch_is_user_open_value, _switch_is_user_open_label, c_white, c_red, !_switch_probe_valid || !global.switch_accounts_is_user_open_result);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_accounts_open_states", string(global.switch_accounts_open_states), "Switch Account Open States", c_white, c_red, global.switch_accounts_open_states == "");
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "online_token_validated", string(global.online_token_validated), "Online Token Validated", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "online_token_error_message", string(global.online_token_error_message), "Online Token Error Message", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_account_netid", string(global.switch_account_netid), "Switch Account NetID", c_white, c_red, false);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_account_network_service_available", string(global.switch_account_network_service_available), "Switch Network Service Available", c_white, c_red, !global.switch_account_network_service_available);
			debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "switch_logged_in", string(global.switch_logged_in), "Switch Logged In", c_white, c_red, !global.switch_logged_in);
		}
	}
	#endregion /* Section 6: Switch Information (only for Switch) END */

	debug_text_y += section_spacing;

	#region /* Section 7: Online Download Info */
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

				var _odl_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Online Download Info") ? variable_struct_get(global.debug_collapsed_sections, "Online Download Info") : false;
				if (!_odl_collapsed)
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
					
					if (variable_instance_exists(self, "content_type"))
					{
						debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "content_type", string(content_type), "Content Type", c_white, c_red, false);
					}
					
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "online_content_data_level", string(global.online_content_data_level), "Online Content Data Level", c_white, c_red, false);
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "online_content_data_character", string(global.online_content_data_character), "Online Content Data Character", c_white, c_red, false);
					
					/* Download Menu Info */
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "selected_online_download_index", string(global.selected_online_download_index), "Selected Online Download Index", c_white, c_red, false);
					debug_text_y = scr_draw_highlighted_text(32, debug_text_y, "automatically_play_downloaded_level", string(global.automatically_play_downloaded_level), "Automatically Play Downloaded Level", c_white, c_red, false);
				}
			//}
		}
	}
	#endregion /* Section 7: Online Download Info END */

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
				/* Toggle collapse state for this section using struct accessors */
				var _prev = variable_struct_exists(global.debug_collapsed_sections, section_name) ? variable_struct_get(global.debug_collapsed_sections, section_name) : false;
				var _cur = !_prev;
				variable_struct_set(global.debug_collapsed_sections, section_name, _cur);

				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("debug_collapsed_sections", string(section_name), _cur);
				ini_close();
			}
		}

		var _isCollapsed = variable_struct_exists(global.debug_collapsed_sections, string(section_name)) ? variable_struct_get(global.debug_collapsed_sections, string(section_name)) : false;
		var debug_header_icon = (!_isCollapsed) ? "[+]" : "[-]";
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
					player_image_index: obj_camera.player[i].image_index,
					player_image_speed: obj_camera.player[i].image_speed,
					player_on_ground: obj_camera.player[i].on_ground,
					player_cutscene_time: obj_camera.player[i].cutscene_time
				});
			}
		}
	}

	return positions;
}
