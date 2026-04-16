/// @function scr_debug_initialize_visibility_registry()
/* Initializes the registry and persisted mode store for curated debug items. */
function scr_debug_initialize_visibility_registry()
{
	if (variable_global_exists("debug_visibility_registry_initialized")
	&& global.debug_visibility_registry_initialized
	&& variable_global_exists("debug_visibility_registry")
	&& is_struct(global.debug_visibility_registry)
	&& variable_global_exists("debug_visibility_modes")
	&& is_struct(global.debug_visibility_modes)
	&& variable_global_exists("debug_visibility_item_keys")
	&& is_array(global.debug_visibility_item_keys))
	{
		return;
	}

	if (!variable_global_exists("debug_visibility_config_section")
	|| string(global.debug_visibility_config_section) == "")
	{
		global.debug_visibility_config_section = "debug_screen_text";
	}

	if (!variable_global_exists("debug_visibility_modes")
	|| !is_struct(global.debug_visibility_modes))
	{
		global.debug_visibility_modes = {};
	}

	global.debug_visibility_registry = {};

	var registry_items = [
		{
			item_key: "game_version",
			label: "Game Version",
			description: "Displays the game name and current build version",
			default_mode: DEBUG_VISIBILITY_MODE.IN_OVERLAY,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 10
		},
		{
			item_key: "fps",
			label: "FPS",
			description: "Displays the frame rate and real frame rate on screen",
			default_mode: DEBUG_VISIBILITY_MODE.IN_OVERLAY,
			performance_mode: DEBUG_VISIBILITY_MODE.ALWAYS,
			allow_always: true,
			legacy_public_toggle: "show_fps",
			always_anchor: "top_left",
			always_order: 20
		},
		{
			item_key: "instance_count",
			label: "Instance Count",
			description: "Displays the total number of live instances",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.IN_OVERLAY,
			allow_always: true,
			legacy_public_toggle: "show_instance_count",
			always_anchor: "top_left",
			always_order: 30
		},
		{
			item_key: "current_menu",
			label: "Current Menu",
			description: "Displays the currently selected menu or submenu",
			default_mode: DEBUG_VISIBILITY_MODE.IN_OVERLAY,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 40
		},
		{
			item_key: "controller_slot",
			label: "Controller Slot",
			description: "Displays the primary controller slot assignment",
			default_mode: DEBUG_VISIBILITY_MODE.IN_OVERLAY,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 50
		},
		{
			item_key: "player_slots",
			label: "Player Slots",
			description: "Displays the current player slot assignments",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 60
		},
		{
			item_key: "player_position",
			label: "Player Position",
			description: "Displays the current player position coordinates",
			default_mode: DEBUG_VISIBILITY_MODE.IN_OVERLAY,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 70
		},
		{
			item_key: "player_speed",
			label: "Player Speed",
			description: "Displays the current player movement speed",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 80
		},
		{
			item_key: "current_datetime",
			label: "Current Date/Time",
			description: "Displays the current local date and time",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 90
		},
		{
			item_key: "current_level_clear_rate",
			label: "Current Level Clear Rate",
			description: "Displays the current clear rate for the active level",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 100
		},
		{
			item_key: "doing_clear_check_character",
			label: "Doing Clear Check Character",
			description: "Displays whether the game is running a character clear check",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 110
		},
		{
			item_key: "doing_clear_check_level",
			label: "Doing Clear Check Level",
			description: "Displays whether the game is running a level clear check",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 120
		},
		{
			item_key: "player_image_index",
			label: "Player Image Index",
			description: "Displays each active player's current image index",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 130
		},
		{
			item_key: "player_image_speed",
			label: "Player Image Speed",
			description: "Displays each active player's current image speed",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 140
		},
		{
			item_key: "player_on_ground",
			label: "Player On Ground",
			description: "Displays whether each active player is currently on the ground",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 150
		},
		{
			item_key: "player_cutscene_time",
			label: "Player Cutscene Time",
			description: "Displays each active player's current cutscene timer",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 160
		},
		{
			item_key: "player_can_play",
			label: "Player Can Play",
			description: "Displays which player slots are currently allowed to play",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 170
		},
		{
			item_key: "level_editor_menu",
			label: "Level Editor Menu",
			description: "Displays the current level editor menu state",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 180
		},
		{
			item_key: "in_character_select_menu",
			label: "In Character Select Menu",
			description: "Displays whether the current menu instance is in character select",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 190
		},
		{
			item_key: "in_settings_menu",
			label: "In Settings Menu",
			description: "Displays whether the current menu instance is in settings",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 200
		},
		{
			item_key: "in_online_download_list_menu",
			label: "In Online Download List Menu",
			description: "Displays whether the current menu instance is in the online download list",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 210
		},
		{
			item_key: "can_navigate_settings_sidebar",
			label: "Can Navigate Settings Sidebar",
			description: "Displays whether sidebar navigation is currently allowed",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 220
		},
		{
			item_key: "controls_used_for_navigation",
			label: "Controls Used For Navigation",
			description: "Displays the current navigation input source",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 230
		},
		{
			item_key: "scrolling_menu_with_mousewheel",
			label: "Scrolling Menu With Mousewheel",
			description: "Displays whether the settings menu is currently being scrolled with the mouse wheel",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 240
		},
		{
			item_key: "menu_navigation_speed",
			label: "Menu Navigation Speed",
			description: "Displays the current menu navigation speed value",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 250
		},
		{
			item_key: "menu_cursor_y_position",
			label: "Menu Cursor Y Position",
			description: "Displays the current menu cursor Y position",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 260
		},
		{
			item_key: "menu_y_offset",
			label: "Menu Y Offset",
			description: "Displays the current smoothed menu Y offset",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 270
		},
		{
			item_key: "menu_y_offset_real",
			label: "Menu Y Offset (Real)",
			description: "Displays the current raw menu Y offset target",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 280
		},
		{
			item_key: "menu_delay",
			label: "Menu Delay",
			description: "Displays the current menu input delay timer",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 290
		},
		{
			item_key: "menu_joystick_delay",
			label: "Menu Joystick Delay",
			description: "Displays the current joystick navigation delay timer",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 300
		},
		{
			item_key: "thumbnail_sprite",
			label: "Thumbnail Sprite",
			description: "Displays the thumbnail sprite assigned to the online download menu",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 310
		},
		{
			item_key: "info_queue_index",
			label: "Info Queue Index",
			description: "Displays the current online info queue index",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 320
		},
		{
			item_key: "content_type",
			label: "Content Type",
			description: "Displays the current online content type being inspected",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 330
		},
		{
			item_key: "online_content_data_level",
			label: "Online Content Data Level",
			description: "Displays the current online level data payload",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 340
		},
		{
			item_key: "online_content_data_character",
			label: "Online Content Data Character",
			description: "Displays the current online character data payload",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 350
		},
		{
			item_key: "selected_online_download_index",
			label: "Selected Online Download Index",
			description: "Displays the currently selected online download index",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 360
		},
		{
			item_key: "automatically_play_downloaded_level",
			label: "Automatically Play Downloaded Level",
			description: "Displays whether downloaded levels will automatically start after download",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 370
		},
		{
			item_key: "switch_account_status",
			label: "Switch Account Status",
			description: "Displays console account and login state information",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			allow_mouse_quick_lock: false,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 380
		},
		{
			item_key: "online_token_status",
			label: "Online Token Status",
			description: "Displays online token validation and error state information",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			allow_mouse_quick_lock: false,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 390
		},
		{
			item_key: "level_loading_summary",
			label: "Level Loading Summary",
			description: "Displays the level loading diagnostics section",
			default_mode: DEBUG_VISIBILITY_MODE.IN_OVERLAY,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			allow_mouse_quick_lock: false,
			legacy_public_toggle: "",
			always_anchor: "top_left",
			always_order: 400
		},
		{
			item_key: "display_info",
			label: "Display",
			description: "Displays the current game resolution",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.IN_OVERLAY,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_right",
			always_order: 10
		},
		{
			item_key: "video_adapter",
			label: "Video Adapter",
			description: "Displays the active video adapter description",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.IN_OVERLAY,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "top_right",
			always_order: 20
		},
		{
			item_key: "room_info",
			label: "Room Info",
			description: "Displays the current room name and dimensions",
			default_mode: DEBUG_VISIBILITY_MODE.IN_OVERLAY,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: true,
			legacy_public_toggle: "",
			always_anchor: "bottom_center",
			always_order: 10
		},
		{
			item_key: "all_instance_count",
			label: "All Instance Count",
			description: "Displays per-object instance counts for the current room",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: false,
			legacy_public_toggle: "",
			always_anchor: "overlay_only",
			always_order: 10
		},
		{
			item_key: "gamepad_descriptions",
			label: "Gamepad Descriptions",
			description: "Displays the descriptions of currently connected gamepads",
			default_mode: DEBUG_VISIBILITY_MODE.OFF,
			performance_mode: DEBUG_VISIBILITY_MODE.OFF,
			allow_always: false,
			legacy_public_toggle: "",
			always_anchor: "overlay_only",
			always_order: 20
		}
	];

	global.debug_visibility_item_keys = [];

	for (var i = 0; i < array_length(registry_items); i++)
	{
		var registry_item = registry_items[i];

		if (!variable_struct_exists(registry_item, "allow_mouse_quick_lock"))
		{
			variable_struct_set(registry_item, "allow_mouse_quick_lock", true);
		}

		array_push(global.debug_visibility_item_keys, registry_item.item_key);
		variable_struct_set(global.debug_visibility_registry, registry_item.item_key, registry_item);

		if (!variable_struct_exists(global.debug_visibility_modes, registry_item.item_key))
		{
			variable_struct_set(global.debug_visibility_modes, registry_item.item_key, registry_item.default_mode);
		}
	}

	global.debug_visibility_registry_initialized = true;
	scr_debug_rebuild_visibility_runtime_cache();
}

/// @function scr_debug_rebuild_visibility_runtime_cache()
/* Rebuilds ordered lists of active overlay and always-visible registry items. */
function scr_debug_rebuild_visibility_runtime_cache()
{
	if (!variable_global_exists("debug_visibility_registry_initialized")
	|| !global.debug_visibility_registry_initialized)
	{
		return;
	}

	global.debug_visibility_overlay_item_keys = [];
	global.debug_visibility_always_item_keys = [];
	global.debug_visibility_has_any_always = false;

	for (var item_index = 0; item_index < array_length(global.debug_visibility_item_keys); item_index++)
	{
		var item_key = global.debug_visibility_item_keys[item_index];
		var definition = variable_struct_exists(global.debug_visibility_registry, item_key)
			? variable_struct_get(global.debug_visibility_registry, item_key)
			: undefined;

		if (definition == undefined)
		{
			continue;
		}

		var visibility_mode = variable_struct_exists(global.debug_visibility_modes, item_key)
			? variable_struct_get(global.debug_visibility_modes, item_key)
			: definition.default_mode;
		visibility_mode = scr_debug_sanitize_visibility_mode(item_key, visibility_mode);

		if (visibility_mode != DEBUG_VISIBILITY_MODE.OFF)
		{
			array_push(global.debug_visibility_overlay_item_keys, item_key);
		}

		if (definition.allow_always
		&& visibility_mode == DEBUG_VISIBILITY_MODE.ALWAYS)
		{
			array_push(global.debug_visibility_always_item_keys, item_key);
			global.debug_visibility_has_any_always = true;
		}
	}
}

/// @function scr_debug_get_visibility_definition(item_key)
/* Returns the registry definition for a debug item, if it exists. */
function scr_debug_get_visibility_definition(item_key)
{
	if (variable_global_exists("debug_visibility_registry")
	&& is_struct(global.debug_visibility_registry)
	&& variable_struct_exists(global.debug_visibility_registry, item_key))
	{
		return variable_struct_get(global.debug_visibility_registry, item_key);
	}

	return undefined;
}

/// @function scr_debug_sanitize_visibility_mode(item_key, visibility_mode)
/* Ensures a visibility mode is valid for the given debug item. */
function scr_debug_sanitize_visibility_mode(item_key, visibility_mode)
{
	var definition = scr_debug_get_visibility_definition(item_key);
	if (definition == undefined)
	{
		return DEBUG_VISIBILITY_MODE.OFF;
	}

	var sanitized_mode = visibility_mode;
	if (sanitized_mode != DEBUG_VISIBILITY_MODE.OFF
	&& sanitized_mode != DEBUG_VISIBILITY_MODE.IN_OVERLAY
	&& sanitized_mode != DEBUG_VISIBILITY_MODE.ALWAYS)
	{
		sanitized_mode = definition.default_mode;
	}

	if (!definition.allow_always
	&& sanitized_mode == DEBUG_VISIBILITY_MODE.ALWAYS)
	{
		sanitized_mode = DEBUG_VISIBILITY_MODE.IN_OVERLAY;
	}

	return sanitized_mode;
}

/// @function scr_debug_get_item_mode(item_key)
/* Returns the current visibility mode for a debug item. */
function scr_debug_get_item_mode(item_key)
{
	if (variable_global_exists("debug_visibility_modes")
	&& is_struct(global.debug_visibility_modes)
	&& variable_struct_exists(global.debug_visibility_modes, item_key))
	{
		return variable_struct_get(global.debug_visibility_modes, item_key);
	}

	var definition = scr_debug_get_visibility_definition(item_key);
	return (definition != undefined)
		? definition.default_mode
		: DEBUG_VISIBILITY_MODE.OFF;
}

/// @function scr_debug_sync_legacy_public_toggle(item_key)
/* Keeps legacy player-facing booleans aligned with the registry-backed item mode. */
function scr_debug_sync_legacy_public_toggle(item_key)
{
	var definition = scr_debug_get_visibility_definition(item_key);
	if (definition == undefined)
	{
		return;
	}

	var legacy_toggle = string(definition.legacy_public_toggle);
	if (legacy_toggle != "")
	{
		variable_global_set(legacy_toggle, scr_debug_get_item_mode(item_key) == DEBUG_VISIBILITY_MODE.ALWAYS);
	}
}

/// @function scr_debug_sync_legacy_public_toggles()
/* Synchronizes every migrated registry item back to its legacy public toggle, if any. */
function scr_debug_sync_legacy_public_toggles()
{
	scr_debug_initialize_visibility_registry();

	for (var i = 0; i < array_length(global.debug_visibility_item_keys); i++)
	{
		scr_debug_sync_legacy_public_toggle(global.debug_visibility_item_keys[i]);
	}
}

/// @function scr_debug_write_visibility_modes_to_ini()
/* Writes all curated debug item modes into the already-open config.ini handle. */
function scr_debug_write_visibility_modes_to_ini()
{
	scr_debug_initialize_visibility_registry();

	for (var i = 0; i < array_length(global.debug_visibility_item_keys); i++)
	{
		var item_key = global.debug_visibility_item_keys[i];
		var definition = scr_debug_get_visibility_definition(item_key);
		var visibility_mode = scr_debug_get_item_mode(item_key);

		ini_write_real(global.debug_visibility_config_section, item_key, visibility_mode);

		if (definition != undefined
		&& string(definition.legacy_public_toggle) != "")
		{
			ini_write_real("config", definition.legacy_public_toggle, visibility_mode == DEBUG_VISIBILITY_MODE.ALWAYS);
		}
	}
}

/// @function scr_debug_load_visibility_modes_from_ini()
/* Loads curated debug item modes from config.ini, falling back to legacy booleans when needed. */
function scr_debug_load_visibility_modes_from_ini()
{
	scr_debug_initialize_visibility_registry();

	for (var i = 0; i < array_length(global.debug_visibility_item_keys); i++)
	{
		var item_key = global.debug_visibility_item_keys[i];
		var definition = scr_debug_get_visibility_definition(item_key);
		var resolved_mode = definition.default_mode;
		var legacy_toggle = string(definition.legacy_public_toggle);

		if (ini_key_exists(global.debug_visibility_config_section, item_key))
		{
			resolved_mode = ini_read_real(global.debug_visibility_config_section, item_key, definition.default_mode);
		}
		else
		if (legacy_toggle != ""
		&& ini_key_exists("config", legacy_toggle))
		{
			resolved_mode = ini_read_real("config", legacy_toggle, false)
				? DEBUG_VISIBILITY_MODE.ALWAYS
				: DEBUG_VISIBILITY_MODE.OFF;
		}

		variable_struct_set(global.debug_visibility_modes, item_key,
			scr_debug_sanitize_visibility_mode(item_key, resolved_mode));
	}

	scr_debug_rebuild_visibility_runtime_cache();
	scr_debug_sync_legacy_public_toggles();
}

/// @function scr_debug_set_item_mode(item_key, visibility_mode, save_to_config)
/* Sets a curated debug item's visibility mode and optionally persists it immediately. */
function scr_debug_set_item_mode(item_key, visibility_mode, save_to_config = true)
{
	var definition = scr_debug_get_visibility_definition(item_key);
	if (definition == undefined)
	{
		return DEBUG_VISIBILITY_MODE.OFF;
	}

	var sanitized_mode = scr_debug_sanitize_visibility_mode(item_key, visibility_mode);
	variable_struct_set(global.debug_visibility_modes, item_key, sanitized_mode);
	scr_debug_rebuild_visibility_runtime_cache();
	scr_debug_sync_legacy_public_toggle(item_key);

	if (save_to_config)
	{
		ini_open(game_save_id + "save_file/config.ini");
		ini_write_real(global.debug_visibility_config_section, item_key, sanitized_mode);

		if (string(definition.legacy_public_toggle) != "")
		{
			ini_write_real("config", definition.legacy_public_toggle, sanitized_mode == DEBUG_VISIBILITY_MODE.ALWAYS);
		}

		ini_close();
	}

	return sanitized_mode;
}

/// @function scr_debug_get_profile_mode_for_item(definition, profile_name)
/* Resolves the target mode for a registry item within a named built-in profile. */
function scr_debug_get_profile_mode_for_item(definition, profile_name)
{
	if (definition == undefined)
	{
		return DEBUG_VISIBILITY_MODE.OFF;
	}

	var normalized_profile_name = string_lower(string(profile_name));

	switch (normalized_profile_name)
	{
		case "performance":
			return definition.performance_mode;

		case "level_loading":
			switch (string(definition.item_key))
			{
				case "game_version":
				case "fps":
				case "current_menu":
				case "room_info":
				case "level_loading_summary":
					return DEBUG_VISIBILITY_MODE.ALWAYS;
			}

			return DEBUG_VISIBILITY_MODE.OFF;
	}

	return definition.default_mode;
}

/// @function scr_debug_apply_profile(profile_name, save_to_config)
/* Applies a built-in visibility preset across every registered debug item. */
function scr_debug_apply_profile(profile_name, save_to_config = true)
{
	scr_debug_initialize_visibility_registry();

	for (var i = 0; i < array_length(global.debug_visibility_item_keys); i++)
	{
		var item_key = global.debug_visibility_item_keys[i];
		var definition = scr_debug_get_visibility_definition(item_key);
		var target_mode = scr_debug_get_profile_mode_for_item(definition, profile_name);

		variable_struct_set(global.debug_visibility_modes, item_key,
			scr_debug_sanitize_visibility_mode(item_key, target_mode));
	}

	scr_debug_rebuild_visibility_runtime_cache();
	scr_debug_sync_legacy_public_toggles();

	if (save_to_config)
	{
		ini_open(game_save_id + "save_file/config.ini");
		scr_debug_write_visibility_modes_to_ini();
		ini_close();
	}
}

/// @function scr_debug_item_is_visible_in_overlay(item_key)
/* Returns true when the item should appear while the debug overlay is open. */
function scr_debug_item_is_visible_in_overlay(item_key)
{
	return scr_debug_get_item_mode(item_key) != DEBUG_VISIBILITY_MODE.OFF;
}

/// @function scr_debug_item_is_visible_always(item_key)
/* Returns true when the item should remain visible without the debug overlay. */
function scr_debug_item_is_visible_always(item_key)
{
	return scr_debug_get_item_mode(item_key) == DEBUG_VISIBILITY_MODE.ALWAYS;
}

/// @function scr_debug_get_visibility_mode_label(visibility_mode, uppercase_off)
/* Returns a localized label for a debug visibility mode. */
function scr_debug_get_visibility_mode_label(visibility_mode, uppercase_off = false)
{
	if (visibility_mode == DEBUG_VISIBILITY_MODE.OFF)
	{
		return uppercase_off ? string_upper(l10n_text("Off")) : l10n_text("Off");
	}

	if (visibility_mode == DEBUG_VISIBILITY_MODE.IN_OVERLAY)
	{
		return l10n_text("In Overlay");
	}

	if (visibility_mode == DEBUG_VISIBILITY_MODE.ALWAYS)
	{
		return l10n_text("Always");
	}

	return l10n_text("Off");
}

/// @function scr_debug_is_visibility_mode_available_in_public_menu(item_key, visibility_mode)
/* Returns whether a visibility mode should be exposed in public-facing menus. */
function scr_debug_is_visibility_mode_available_in_public_menu(item_key, visibility_mode)
{
	var definition = scr_debug_get_visibility_definition(item_key);
	if (definition == undefined)
	{
		return false;
	}

	if (!definition.allow_always
	&& visibility_mode == DEBUG_VISIBILITY_MODE.ALWAYS)
	{
		return false;
	}

	if (visibility_mode == DEBUG_VISIBILITY_MODE.IN_OVERLAY
	&& os_type == os_switch
	&& !global.debug_menu_unlocked)
	{
		return false;
	}

	return visibility_mode == DEBUG_VISIBILITY_MODE.OFF
		|| visibility_mode == DEBUG_VISIBILITY_MODE.IN_OVERLAY
		|| visibility_mode == DEBUG_VISIBILITY_MODE.ALWAYS;
}

/// @function scr_debug_visibility_item_matches_search(item_key, search_query)
/* Returns whether a curated debug item matches the provided search text. */
function scr_debug_visibility_item_matches_search(item_key, search_query = "")
{
	var normalized_query = string_lower(string(search_query));
	normalized_query = string_replace_all(normalized_query, "_", "");
	normalized_query = string_replace_all(normalized_query, "-", "");
	normalized_query = string_replace_all(normalized_query, " ", "");

	if (normalized_query == "")
	{
		return true;
	}

	var definition = scr_debug_get_visibility_definition(item_key);
	if (definition == undefined)
	{
		return false;
	}

	var item_key_text = string_lower(string(definition.item_key));
	item_key_text = string_replace_all(item_key_text, "_", "");
	item_key_text = string_replace_all(item_key_text, "-", "");
	item_key_text = string_replace_all(item_key_text, " ", "");

	var label_text = string_lower(string(l10n_text(definition.label)));
	label_text = string_replace_all(label_text, "_", "");
	label_text = string_replace_all(label_text, "-", "");
	label_text = string_replace_all(label_text, " ", "");

	return string_pos(normalized_query, item_key_text) > 0
		|| string_pos(normalized_query, label_text) > 0;
}

/// @function scr_debug_get_filtered_visibility_ids(search_query)
/* Returns the registry item keys that match the provided search query. */
function scr_debug_get_filtered_visibility_ids(search_query = "")
{
	scr_debug_initialize_visibility_registry();

	var filtered_item_keys = [];

	for (var i = 0; i < array_length(global.debug_visibility_item_keys); i++)
	{
		var item_key = global.debug_visibility_item_keys[i];

		if (scr_debug_visibility_item_matches_search(item_key, search_query))
		{
			array_push(filtered_item_keys, item_key);
		}
	}

	return filtered_item_keys;
}

/// @function scr_debug_find_next_public_visibility_mode(item_key, start_mode, direction)
/* Finds the next available public-facing visibility mode in the given direction. */
function scr_debug_find_next_public_visibility_mode(item_key, start_mode, direction)
{
	var all_modes = [
		DEBUG_VISIBILITY_MODE.OFF,
		DEBUG_VISIBILITY_MODE.IN_OVERLAY,
		DEBUG_VISIBILITY_MODE.ALWAYS
	];
	var start_index = 0;

	for (var i = 0; i < array_length(all_modes); i++)
	{
		if (all_modes[i] == start_mode)
		{
			start_index = i;
			break;
		}
	}

	for (var step = 1; step <= array_length(all_modes); step++)
	{
		var next_index = (start_index + (direction * step) + array_length(all_modes)) mod array_length(all_modes);
		var next_mode = all_modes[next_index];

		if (scr_debug_is_visibility_mode_available_in_public_menu(item_key, next_mode))
		{
			return next_mode;
		}
	}

	return start_mode;
}

/// @function scr_debug_should_draw_registry_item(item_key)
/* Returns true when the item should be drawn in the main overlay pass. */
function scr_debug_should_draw_registry_item(item_key)
{
	return global.debug_screen && scr_debug_item_is_visible_in_overlay(item_key);
}

/// @function scr_debug_toggle_compact_item_lock(item_key)
/* Toggles a compact registry item between overlay-only and always-visible modes. */
function scr_debug_toggle_compact_item_lock(item_key)
{
	var definition = scr_debug_get_visibility_definition(item_key);
	if (definition == undefined
	|| !definition.allow_always)
	{
		return scr_debug_get_item_mode(item_key);
	}

	var current_mode = scr_debug_get_item_mode(item_key);

	if (current_mode == DEBUG_VISIBILITY_MODE.ALWAYS)
	{
		return scr_debug_set_item_mode(item_key, DEBUG_VISIBILITY_MODE.IN_OVERLAY);
	}

	if (current_mode == DEBUG_VISIBILITY_MODE.IN_OVERLAY)
	{
		return scr_debug_set_item_mode(item_key, DEBUG_VISIBILITY_MODE.ALWAYS);
	}

	return current_mode;
}

/// @function scr_debug_any_item_visible_in_overlay(item_keys)
/* Returns true when any item in the provided array is currently visible in the overlay. */
function scr_debug_any_item_visible_in_overlay(item_keys)
{
	for (var i = 0; i < array_length(item_keys); i++)
	{
		if (scr_debug_item_is_visible_in_overlay(item_keys[i]))
		{
			return true;
		}
	}

	return false;
}
