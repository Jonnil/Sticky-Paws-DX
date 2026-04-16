///////////////////////////////////////////////////////////////
// Debug Toggle
///////////////////////////////////////////////////////////////

enum DEBUG_VISIBILITY_MODE
{
	OFF = 0,
	IN_OVERLAY = 1,
	ALWAYS = 2
}

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

///////////////////////////////////////////////////////////////
// FPS Display
///////////////////////////////////////////////////////////////

/// @function scr_debug_draw_fps()
/* Draws the FPS and "real" FPS information on screen */
function scr_debug_draw_fps()
{
	if (scr_debug_should_draw_registry_item("fps")
	&& !scr_debug_should_use_compact_overlay())
	{
		scr_debug_draw_registry_item_lines("fps", 32, 64, fa_left, fa_middle);
	}
}


///////////////////////////////////////////////////////////////
// Instance Count Display
///////////////////////////////////////////////////////////////

/// @function scr_debug_draw_instance_count()
/* Draws a simple instance count on screen */
function scr_debug_draw_instance_count()
{
	if (scr_debug_should_draw_registry_item("instance_count")
	&& !scr_debug_should_use_compact_overlay())
	{
		scr_debug_draw_registry_item_lines("instance_count", 32, 96, fa_left, fa_middle);
	}
}

/// @function scr_debug_draw_all_instance_count()
/* Draws detailed instance counts for each object type. Iterates through a fixed range */
function scr_debug_draw_all_instance_count()
{
	if (scr_debug_should_draw_registry_item("all_instance_count")
	&& !scr_debug_should_use_compact_overlay())
	{
		scr_debug_draw_registry_item_lines("all_instance_count", 32, 128, fa_left, fa_top, global.default_text_size, 8);
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
		scr_debug_draw_registry_item_lines("game_version", 32, version_y, fa_left, fa_middle);
		#endregion /* --- On-Screen Instructions (for PC) --- END */

		/* --- Top-right Display Info --- */
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_debug_draw_registry_item_lines("display_info", display_get_gui_width() - 32, display_y, fa_right, fa_middle, global.default_text_size, 25, max(280, floor(display_get_gui_width() * 0.42)));
		scr_debug_draw_registry_item_lines("video_adapter", display_get_gui_width() - 32, d3d11_y, fa_right, fa_middle, global.default_text_size, 25, max(280, floor(display_get_gui_width() * 0.42)));

		/* --- Current Room Info at Bottom --- */
		scr_debug_draw_registry_item_lines("room_info", display_get_gui_width() * 0.5, display_get_gui_height() - 32, fa_center, fa_middle, global.default_text_size, 25, display_get_gui_width() - 64);

		/* --- Optimized Debug Text Sections --- */
		scr_debug_draw_optimized_text();
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

	var debug_text_y = 170;
	var section_spacing = 30;
	var system_items = ["current_datetime", "current_level_clear_rate", "doing_clear_check_character", "doing_clear_check_level"];
	var player_items = ["player_position", "player_speed", "player_image_index", "player_image_speed", "player_on_ground", "player_cutscene_time", "player_can_play", "player_slots", "controller_slot"];
	var menu_items = ["current_menu", "level_editor_menu", "in_character_select_menu", "in_settings_menu", "in_online_download_list_menu", "can_navigate_settings_sidebar", "controls_used_for_navigation", "scrolling_menu_with_mousewheel", "menu_navigation_speed", "menu_cursor_y_position", "menu_y_offset", "menu_y_offset_real", "menu_delay", "menu_joystick_delay"];
	var online_items = ["online_token_status", "thumbnail_sprite", "info_queue_index", "content_type", "online_content_data_level", "online_content_data_character", "selected_online_download_index", "automatically_play_downloaded_level"];

	#region /* Section 1: System Information */
	if (scr_debug_any_visible_registry_lines(system_items))
	{
		debug_text_y = scr_draw_debug_header("System Information", 32, debug_text_y);

		var _sys_collapsed = variable_struct_exists(global.debug_collapsed_sections, "System Information") ? variable_struct_get(global.debug_collapsed_sections, "System Information") : false;
		if (!_sys_collapsed)
		{
			for (var system_index = 0; system_index < array_length(system_items); system_index++)
			{
				debug_text_y = scr_debug_draw_registry_item_lines(system_items[system_index], 32, debug_text_y);
			}
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 1: System Information END */

	#region /* Section 2: Level Loading */
	if (scr_debug_item_has_overlay_lines("level_loading_summary"))
	{
		debug_text_y = scr_draw_debug_header("Level Loading", 32, debug_text_y);

		var _level_loading_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Level Loading") ? variable_struct_get(global.debug_collapsed_sections, "Level Loading") : false;
		if (!_level_loading_collapsed)
		{
			debug_text_y = scr_debug_draw_registry_item_lines("level_loading_summary", 32, debug_text_y);
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 2: Level Loading END */

	#region /* Section 3: Player Information */
	if (instance_exists(obj_camera)
	&& scr_debug_any_visible_registry_lines(player_items))
	{
		debug_text_y = scr_draw_debug_header("Player Information", 32, debug_text_y);

		var _player_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Player Information") ? variable_struct_get(global.debug_collapsed_sections, "Player Information") : false;
		if (!_player_collapsed)
		{
			for (var player_item_index = 0; player_item_index < array_length(player_items); player_item_index++)
			{
				debug_text_y = scr_debug_draw_registry_item_lines(player_items[player_item_index], 32, debug_text_y);
			}
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 3: Player Information END */

	#region /* Section 4: Menu Information */
	if (scr_debug_any_visible_registry_lines(menu_items))
	{
		debug_text_y = scr_draw_debug_header("Menu Information", 32, debug_text_y);

		var _menu_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Menu Information") ? variable_struct_get(global.debug_collapsed_sections, "Menu Information") : false;
		if (!_menu_collapsed)
		{
			for (var menu_item_index = 0; menu_item_index < array_length(menu_items); menu_item_index++)
			{
				debug_text_y = scr_debug_draw_registry_item_lines(menu_items[menu_item_index], 32, debug_text_y);
			}
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 4: Menu Information END */

	#region /* Section 5: Gamepad Information */
	if (scr_debug_item_has_overlay_lines("gamepad_descriptions"))
	{
		debug_text_y = scr_draw_debug_header("Gamepad Information", 32, debug_text_y);

		var _gamepad_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Gamepad Information") ? variable_struct_get(global.debug_collapsed_sections, "Gamepad Information") : false;
		if (!_gamepad_collapsed)
		{
			debug_text_y = scr_debug_draw_registry_item_lines("gamepad_descriptions", 32, debug_text_y);
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 5: Gamepad Information END */

	#region /* Section 6: Switch Information (only for Switch) */
	if (os_type == os_switch
	&& scr_debug_item_has_overlay_lines("switch_account_status"))
	{
		debug_text_y = scr_draw_debug_header("Switch Information", 32, debug_text_y);

		var _switch_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Switch Information") ? variable_struct_get(global.debug_collapsed_sections, "Switch Information") : false;
		if (!_switch_collapsed)
		{
			debug_text_y = scr_debug_draw_registry_item_lines("switch_account_status", 32, debug_text_y);
		}

		debug_text_y += section_spacing;
	}
	#endregion /* Section 6: Switch Information (only for Switch) END */

	#region /* Section 7: Online Download Info */
	if (scr_debug_any_visible_registry_lines(online_items))
	{
		debug_text_y = scr_draw_debug_header("Online Download Info", 32, debug_text_y);

		var _odl_collapsed = variable_struct_exists(global.debug_collapsed_sections, "Online Download Info") ? variable_struct_get(global.debug_collapsed_sections, "Online Download Info") : false;
		if (!_odl_collapsed)
		{
			for (var online_item_index = 0; online_item_index < array_length(online_items); online_item_index++)
			{
				debug_text_y = scr_debug_draw_registry_item_lines(online_items[online_item_index], 32, debug_text_y);
			}
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
