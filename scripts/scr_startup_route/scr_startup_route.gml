/* Restore normal title navigation when a startup destination cannot be opened */
function scr_startup_route_restore_title()
{
	menu = "main_game";
	menu_delay = 3;
	can_navigate = true;
	in_settings = false;
	in_character_select_menu = false;
	in_edit_character_menu = false;
	select_custom_level_menu_open = false;
	level_editor_template_select = false;
	loading_assets = false;
	global.character_select_in_this_menu = "main_game";
	global.create_level_from_template = false;
	global.doing_clear_check_level = false;
	global.actually_play_edited_level = false;
	global.play_edited_level = false;
	global.startup_world_map_requested = false;
	for (var p = 1; p <= global.max_players; p++)
	{
		global.player_can_play[p] = false;
		player_accept_selection[p] = -1;
		player_automatically_join[p] = false;
	}
}

/* Open only known Options pages and respect their normal availability checks */
function scr_startup_route_options(request)
{
	var page = string_lower(string_trim(request.options_page));
	var sidebar = "";
	var first_item = "";
	var available = true;

	switch (page)
	{
		case "":
		case "accessibility":
		case "accessibility_settings":
			sidebar = "accessibility_settings";
			first_item = "assist_enable";
			break;
		case "game":
		case "game_settings":
			sidebar = "game_settings";
			first_item = "difficulty_settings";
			break;
		case "controls":
		case "keyboard":
		case "keyboard-and-mouse":
		case "keyboard_and_mouse_settings":
			sidebar = "keyboard_and_mouse_settings";
			first_item = "remap_select_player";
			available = global.enable_keyboard_and_mouse_settings;
			break;
		case "controller":
		case "controller_settings":
			sidebar = "controller_settings";
			first_item = "remap_select_player";
			available = global.enable_controller_settings;
			break;
		case "account":
		case "profile":
		case "account_settings":
			sidebar = "account_settings";
			first_item = "change_username";
			available = global.enable_account_settings;
			break;
		case "video":
		case "graphics":
		case "video_settings":
			sidebar = "video_settings";
			first_item = window_get_fullscreen() ? "gui_scale_modifier" : "resolution_setting";
			break;
		case "audio":
		case "audio_settings":
			sidebar = "audio_settings";
			first_item = "volume_main";
			break;
		case "resources":
		case "custom-resources":
		case "custom_resources_settings":
			sidebar = "custom_resources_settings";
			first_item = global.enable_option_for_pc || ds_list_size(global.all_loaded_resource_pack) >= 2 ? "resource_pack" : "title_background";
			available = global.enable_custom_resources_settings;
			break;
		case "storage":
		case "storage_settings":
			sidebar = "storage_settings";
			first_item = "file_select";
			available = global.enable_storage_settings;
			break;
		case "language":
		case "language_settings":
			sidebar = "language_settings";
			first_item = "Language" + string(global.current_language_menu_position);
			break;
		case "debug":
		case "debug_settings":
			sidebar = "debug_settings";
			first_item = "debug_screen";
			available = scr_debug_is_hidden_debug_tab_visible();
			break;
		case "capture":
		case "capture-mode":
			sidebar = "video_settings";
			first_item = "capture_mode_back";
			available = os_type != os_switch;
			break;
		case "capture-obs":
			sidebar = "video_settings";
			first_item = "capture_mode_obs_setup_back";
			available = scr_capture_mode_obs_setup_available();
			break;
		default:
			scr_startup_parameters_fail(request, "Unknown Options page: " + page);
			return false;
	}

	if (!available)
	{
		scr_startup_parameters_fail(request, "Options page is unavailable or still locked: " + page);
		return false;
	}

	menu_cursor_y_position = 0;
	menu_cursor_y_position_end = 0;
	if (sidebar == "language_settings")
	{
		menu_cursor_y_position = global.current_language_menu_position * 50;
	}
	global.settings_sidebar_menu = sidebar;
	in_settings = true;
	can_navigate_settings_sidebar = false;
	menu = first_item;
	menu_delay = 3;
	scr_load_storage_variables();
	return true;
}

/* Start a known Included Files level through the same play room as the world map */
function scr_startup_route_official_level(request)
{
	var level_id = string(request.level);
	var level_index = ds_list_find_index(global.all_loaded_main_levels, level_id);
	if (level_index < 0)
	{
		scr_startup_parameters_fail(request, "Unknown official level ID: " + level_id);
		return false;
	}
	if (global.demo_enable && level_index > global.demo_number_of_levels)
	{
		scr_startup_parameters_fail(request, "This official level is unavailable in the demo");
		return false;
	}
	if (!file_exists(scr_get_official_level_file_path(level_id, "data", "level_information.ini"))
		|| !file_exists(scr_get_official_level_file_path(level_id, "data", "object_placement_all.json")))
	{
		scr_startup_parameters_fail(request, "Official level files are missing: " + level_id);
		return false;
	}

	global.select_level_index = level_index;
	global.character_select_in_this_menu = "main_game";
	scr_prepare_official_level_load(level_id);
	global.use_temp_or_working = game_save_id;
	global.create_level_from_template = false;
	global.doing_clear_check_level = false;
	global.doing_clear_check_character = false;
	global.automatically_play_downloaded_level = false;
	global.go_to_menu_when_going_back_to_title = "";
	global.pause = false;
	global.quit_level = false;
	global.quit_to_world = false;
	global.goal_active = false;
	global.current_level_clear_rate = "enter";
	global.increase_number_of_levels_cleared = level_id != "intro";
	global.lives_until_assist = 0;
	global.player_lives = 5;
	global.level_score = 0;
	global.spikes_emerge_time = 0;
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
	global.checkpoint_realmillisecond = 0;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.timeattack_realmillisecond = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;
	global.max_big_collectible = 5;
	for (var b = 1; b <= global.max_big_collectible; b++)
	{
		global.big_collectible[b] = false;
	}
	var save_path = game_save_id + "save_file/file" + string(global.file) + ".ini";
	if (file_exists(save_path))
	{
		ini_open(save_path);
		global.player_lives = ini_read_real("Player", "lives", 5);
		global.current_level_clear_rate = ini_read_string(level_id, "clear_rate", "enter");
		global.lives_until_assist = ini_read_real(level_id, "lives_until_assist", 0);
		for (var b = 1; b <= global.max_big_collectible; b++)
		{
			global.big_collectible[b] = ini_read_real(level_id, "big_collectible" + string(b), false);
		}
		ini_close();
		if (global.current_level_clear_rate == "closed") global.current_level_clear_rate = "enter";
	}
	if (global.player_lives <= 0) global.player_lives = 5 * max(1, request.players);

	audio_stop_all();
	if (global.loading_music > 0)
	{
		scr_audio_play(global.loading_music, volume_source.music);
	}
	scr_update_all_backgrounds();
	global.actually_play_edited_level = true;
	global.play_edited_level = true;
	global.part_limit = 0;
	global.part_limit_entity = 0;
	in_character_select_menu = false;
	select_custom_level_menu_open = false;
	can_navigate = false;
	menu = "startup_official_level";
	menu_delay = 9999;
	loading_assets = true;
	var load_timer = time_source_create(time_source_game, 10, time_source_units_frames, function()
	{
		room_goto(rm_leveleditor);
	}, [], 1);
	time_source_start(load_timer);
	return true;
}

/* Apply one explicit startup destination after normal title initialization */
function scr_startup_route(request)
{
	if (!is_struct(request) || !request.requested || request.applied || room != rm_title)
	{
		return;
	}

	if (request.stage == "pending")
	{
		if (request.destination == "title")
		{
			request.stage = "complete";
			request.applied = true;
			return;
		}
		if (request.destination == "options")
		{
			if (scr_startup_route_options(request))
			{
				request.stage = "complete";
				request.applied = true;
			}
			else
			{
				scr_startup_route_restore_title();
			}
			return;
		}

		var known_destination = request.destination == "main-game"
			|| request.destination == "world-map"
			|| request.destination == "official-level"
			|| request.destination == "level-editor"
			|| request.destination == "online-levels"
			|| request.destination == "characters"
			|| request.destination == "character-manager"
			|| request.destination == "character-editor"
			|| request.destination == "edit-level"
			|| request.destination == "play-level";
		if (!known_destination)
		{
			scr_startup_parameters_fail(request, "Unknown startup destination: " + string(request.destination));
			scr_startup_route_restore_title();
			return;
		}
		if (global.demo_enable && request.destination != "main-game" && request.destination != "characters"
			&& request.destination != "world-map" && request.destination != "official-level")
		{
			scr_startup_parameters_fail(request, "This startup destination is unavailable in the demo");
			scr_startup_route_restore_title();
			return;
		}
		if (request.destination == "online-levels" && !global.free_communication_available)
		{
			scr_startup_parameters_fail(request, "Online levels are unavailable on this account");
			scr_startup_route_restore_title();
			return;
		}

		/* Reuse characters already enumerated by the splash when their files still exist */
		var characters_ready = ds_exists(global.all_loaded_characters, ds_type_list)
			&& ds_list_size(global.all_loaded_characters) >= 2;
		if (characters_ready)
		{
			for (var c = 0; c < ds_list_size(global.all_loaded_characters); c++)
			{
				var folder = string(ds_list_find_value(global.all_loaded_characters, c));
				if (!file_exists("characters/" + folder + "/data/character_config.ini")
					&& !file_exists(game_save_id + "custom_characters/" + folder + "/data/character_config.ini"))
				{
					characters_ready = false;
					break;
				}
			}
		}

		global.character_select_in_this_menu = "main_game";
		in_settings = false;
		in_edit_character_menu = false;
		global.level_folder_name = "";
		global.create_level_from_template = false;
		allowed_to_load_template_level = false;
		global.doing_clear_check_level = false;
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
		menu_delay = 3;
		if (!characters_ready)
		{
			file_load_timer = 0;
			scr_load_character_initializing();
			menu = "load_characters";
			request.stage = "loading-characters";
			return;
		}
		request.stage = "characters-ready";
	}

	if (request.stage == "loading-characters")
	{
		if (menu != "select_character" || !in_character_select_menu)
		{
			return;
		}
		request.stage = "characters-ready";
	}
	if (request.stage != "characters-ready")
	{
		return;
	}

	var character_count = ds_list_size(global.all_loaded_characters);
	var requested_character_index = -1;
	if (request.character != "")
	{
		requested_character_index = ds_list_find_index(global.all_loaded_characters, request.character);
		if (requested_character_index < 0)
		{
			scr_startup_parameters_fail(request, "Character folder was not found: " + request.character);
			scr_startup_route_restore_title();
			return;
		}
	}
	var first_character_index = requested_character_index >= 0
		? requested_character_index : clamp(global.character_index[0], 0, character_count - 1);
	var first_character = string(ds_list_find_value(global.all_loaded_characters, first_character_index));
	if (request.destination == "character-editor")
	{
		if (file_exists("characters/" + first_character + "/data/character_config.ini")
			|| !file_exists(game_save_id + "custom_characters/" + first_character + "/data/character_config.ini"))
		{
			scr_startup_parameters_fail(request, "Character Editor requires an existing custom character folder");
			scr_startup_route_restore_title();
			return;
		}
	}

	var players_to_join = clamp(floor(request.players), 1, global.max_players);
	var confirm_players = request.destination == "main-game"
		|| request.destination == "world-map"
		|| request.destination == "official-level"
		|| request.destination == "level-editor"
		|| request.destination == "online-levels"
		|| request.destination == "edit-level"
		|| request.destination == "play-level";
	for (var p = 1; p <= global.max_players; p++)
	{
		global.character_index[p - 1] = p == 1 ? first_character_index
			: clamp(global.character_index[p - 1], 0, character_count - 1);
		global.character_for_player[p] = string(ds_list_find_value(global.all_loaded_characters, global.character_index[p - 1]));
		global.skin_for_player[p] = global.actual_skin_for_player[p];
		global.player_can_play[p] = confirm_players && p <= players_to_join;
		player_accept_selection[p] = p <= players_to_join ? (confirm_players ? 1 : 0) : -1;
		player_automatically_join[p] = false;
		player_menu[p] = "select_character";
		can_input_player_name[p] = false;
	}
	scr_change_character_portrait();
	arrow_offset = 125;
	menu = "select_character";
	in_character_select_menu = true;
	menu_delay = 3;
	can_navigate = true;

	switch (request.destination)
	{
		case "world-map":
			global.startup_world_map_requested = true;
			can_navigate = false;
			menu_delay = 9999;
			break;
		case "main-game":
			can_navigate = false;
			menu_delay = 9999;
			break;
		case "official-level":
			if (!scr_startup_route_official_level(request))
			{
				scr_startup_route_restore_title();
				return;
			}
			break;
		case "level-editor":
			global.character_select_in_this_menu = "level_editor";
			global.level_editor_level = 1;
			global.select_level_index = 0;
			scr_load_custom_level_initializing();
			open_sub_menu = false;
			menu = "load_custom_level";
			in_character_select_menu = false;
			break;
		case "online-levels":
			global.character_select_in_this_menu = "online_level_list_title";
			global.online_level_list_back = "online_level_list_title";
			global.level_editor_level = 1;
			if (scr_begin_user_online_flow("online_download_list_load", "online_level_list_title", "level", "scr_startup_route"))
			{
				if (global.switch_logged_in && global.switch_account_network_service_available && scr_online_token_is_valid())
				{
					global.selected_online_download_index = 0;
					global.download_current_page = 0;
					content_type = "level";
					menu = "online_download_list_load";
				}
				else
				{
					menu = "caution_online_network_error";
				}
			}
			in_character_select_menu = menu == "select_character" || menu == "online_level_list_title";
			break;
		case "character-manager":
			menu = "click_copy_character";
			player_menu[1] = "click_copy_character";
			break;
		case "character-editor":
			in_edit_character_menu = true;
			menu = "edit_character_load";
			menu_delay = 20;
			break;
		case "edit-level":
		case "play-level":
			scr_startup_level(request);
			if (request.stage == "failed")
			{
				scr_startup_route_restore_title();
			}
			return;
	}

	request.stage = "complete";
	request.applied = true;
	show_debug_message("[Startup] Opened destination: " + request.destination);
}
