/// @function scr_sanitize_filename(raw_name, max_length)
/// @description
///    Transform an arbitrary string into a filesystem‑safe filename or folder name by:
///     1. Mapping a set of common symbols to word tokens (e.g. "@" becomes "at", "#" becomes "hash").
///     2. Preserving only ASCII letters, digits, hyphens and underscores.
///     3. Replacing every other character (spaces, punctuation, emoji, etc.) with a single underscore.
///     4. Collapsing multiple underscores into one, and trimming any leading/trailing underscores.
///     5. Enforcing a configurable maximum length to avoid filesystem limits.
///     6. Guarding against Windows reserved names (CON, PRN, AUX, NUL, COM1...LPT9) by prefixing an underscore if needed.
///     7. Converting the final result to lowercase for consistency across platforms.
///
/// @param raw_name        String        — The untrusted, user‑provided name to sanitize.
/// @param max_length    Number        — (Optional, default = 255) Maximum length of the returned string.
/// @return                String        — A guaranteed non‑empty, normalized name that:
///                                    • contains only [a–z0–9_-],
///                                    • does not begin or end with "_",
///                                    • is at most max_length characters long,
///                                    • is never one of the forbidden Windows device names,
///                                    • and will be "_" if all other characters are stripped out.
function scr_sanitize_filename(raw_name, max_length = 255)
{
	/* Defensive: ensure max_length is numeric so bad call sites don't crash this script */
	var max_len = 255;
	if (is_real(max_length))
	{
		max_len = max(1, floor(max_length));
	}
	else
	{
		show_debug_message("[scr_sanitize_filename] Non-numeric max_length (" + string(max_length) + "), defaulting to 255");
	}

	/* Build a quick lookup of "symbol" to "text"
	We only convert a small set of high-value symbols into words because:
	These characters (&, @, #, %, +) are commonly used by players and carry clear meaning ("and", "at", "number/hash", "percent", "plus")
	Mapping them preserves readability in filenames (e.g. "rock & roll" becomes "rock_and_roll")
	All other punctuation or exotic characters are far less semantically important, so they simply become "_" in the fallback step
	Keeping the map small makes it fast to build (or even cache once) and easy to maintain */
	var symmap = ds_map_create();
	ds_map_add(symmap, "&",    "and");
	ds_map_add(symmap, "@",    "at");
	ds_map_add(symmap, "#",    "hash");
	ds_map_add(symmap, "%",    "percent");
	ds_map_add(symmap, "+",    "plus");
	/* Underscore and Hyphen/Minus are allowed directly in names without change */

	/* Walk the input string, building an output */
	var out = "";
	var len = string_length(raw_name);

	for (var i = 1; i <= len; i++)
	{
		var c = string_char_at(raw_name, i);

		/* If it's a mapped symbol, append the word */
		if (ds_map_exists(symmap, c))
		{
			out += ds_map_find_value(symmap, c);
		}
		/* Else if it's alphanumeric, keep as-is */
		else
		if ((c >= "0" && c <= "9")
		|| (c >= "A" && c <= "Z")
		|| (c >= "a" && c <= "z")
		|| c == "-" /* Allow Hyphens */
		|| c == "_") /* Allow Underscores */
		{
			out += c;
		}
		/* Otherwise (e.g. emoji, spaces, other punctuation), normalize it to underscore */
		else
		{
			out += "_";
		}
	}

	/* Clean up */
	ds_map_destroy(symmap);

	/* Collapse repeated underscores to single "_" */
	while (string_pos("__", out) > 0)
	{
		out = string_replace_all(out, "__", "_");
	}

	/* Yrim leading/trailing underscores */
	while (string_length(out) > 0
	&& string_char_at(out, 1) == "_")
	{
		out = string_delete(out, 1, 1);
	}

	while (string_length(out) > 0
	&& string_char_at(out, string_length(out)) == "_")
	{
		out = string_delete(out, string_length(out), 1);
	}

	/* Enforce max length */
	if (string_length(out) > max_len)
	{
		out = string_copy(out, 1, max_len);
	}

	/* Never return empty */
	if (out == "")
	{
		out = "_";
	}

	/* Avoid Windows reserved names (case-insensitive) */
	var upper = string_upper(out);
	var reserved = [ "CON","PRN","AUX","NUL"
					,"COM1","COM2","COM3","COM4","COM5","COM6","COM7","COM8","COM9"
					,"LPT1","LPT2","LPT3","LPT4","LPT5","LPT6","LPT7","LPT8","LPT9" ];
	for (var j = 0; j < array_length(reserved); j++)
	{
		if (upper == reserved[j])
		{
			out = "_" + out;
			break;
		}
	}

	/* Normalize case to make it more consistent */
	out = string_lower(out);

	return out;
}

/* Only censor the OS username when a displayed string is actually showing a save-root path. */
function scr_censor_game_save_id_for_display(display_text)
{
	var text_to_display = is_string(display_text) ? display_text : string(display_text);
	var save_root_raw = string(game_save_id);

	if (text_to_display == ""
	|| save_root_raw == "")
	{
		return text_to_display;
	}

	var save_root_forward = string_replace_all(save_root_raw, "\\", "/");
	var username = environment_get_variable("USERNAME");
	var contains_save_root = string_pos(save_root_raw, text_to_display) > 0
		|| string_pos(save_root_forward, text_to_display) > 0;

	if (contains_save_root
	&& username != "")
	{
		text_to_display = string_replace(text_to_display, username, "*");
	}

	return text_to_display;
}

/* Convenience helper: always use the sanitized folder name for the active custom level */
function scr_get_custom_level_folder_name()
{
	if (variable_global_exists("level_folder_name")
	&& string(global.level_folder_name) != "")
	{
		return string(global.level_folder_name);
	}

	return scr_sanitize_filename(string(global.level_name));
}

/* Read the human-facing level name from level_information.ini, falling back to the folder name */
function scr_get_level_display_name(folder_name)
{
	var info_paths = [
		game_save_id + "custom_levels/" + string(folder_name) + "/data/level_information.ini",
		global.use_temp_or_working + "custom_levels/" + string(folder_name) + "/data/level_information.ini"
	];

	for (var i = 0; i < array_length(info_paths); i++)
	{
		if (file_exists(info_paths[i]))
		{
			ini_open(info_paths[i]);
			var display_name = ini_read_string("info", "level_name", string(folder_name));
			ini_close();
			return display_name;
		}
	}

	return string(folder_name);
}

/* Return the currently selected official level folder ID. */
function scr_get_selected_official_level_id()
{
	if (!variable_global_exists("all_loaded_main_levels")
	|| !ds_exists(global.all_loaded_main_levels, ds_type_list))
	{
		return "";
	}

	if (!variable_global_exists("select_level_index")
	|| !is_real(global.select_level_index))
	{
		return "";
	}

	var list_size = ds_list_size(global.all_loaded_main_levels);

	if (list_size <= 0)
	{
		return "";
	}

	var level_index = clamp(global.select_level_index, 0, list_size - 1);
	var official_level_id = ds_list_find_value(global.all_loaded_main_levels, level_index);

	if (official_level_id == undefined)
	{
		return "";
	}

	return string_lower(string(official_level_id));
}

/* Set the active official level state before loading read-only Included Files. */
function scr_prepare_official_level_load(level_ref = "")
{
	var official_level_id = "";

	if (is_real(level_ref)
	&& level_ref >= 0)
	{
		if (variable_global_exists("all_loaded_main_levels")
		&& ds_exists(global.all_loaded_main_levels, ds_type_list))
		{
			var list_size = ds_list_size(global.all_loaded_main_levels);

			if (list_size > 0)
			{
				var level_index = clamp(level_ref, 0, list_size - 1);
				var level_value = ds_list_find_value(global.all_loaded_main_levels, level_index);

				if (level_value != undefined)
				{
					official_level_id = string(level_value);
				}
			}
		}
	}
	else
	{
		official_level_id = string(level_ref);
	}

	if (official_level_id == "")
	{
		official_level_id = scr_get_selected_official_level_id();
	}

	official_level_id = scr_normalize_official_level_id(official_level_id);
	global.level_folder_name = "";
	global.level_name = official_level_id;
	global.level_description = "";

	return official_level_id;
}

/* Prefer the level currently being played; fall back to the menu selection when needed. */
function scr_get_active_official_level_id()
{
	if (variable_global_exists("level_name"))
	{
		var current_level_id = scr_normalize_official_level_id(string(global.level_name));

		if (scr_is_reserved_official_level_folder_name(current_level_id))
		{
			return current_level_id;
		}
	}

	return scr_get_selected_official_level_id();
}

/* Convert arbitrary official-level references like "levelA" into the canonical included-files folder ID. */
function scr_normalize_official_level_id(level_name)
{
	var normalized_name = string_lower(scr_sanitize_filename(string(level_name)));

	if (!variable_global_exists("all_loaded_main_levels")
	|| !ds_exists(global.all_loaded_main_levels, ds_type_list))
	{
		return normalized_name;
	}

	for (var i = 0; i < ds_list_size(global.all_loaded_main_levels); i++)
	{
		var official_level_id = string(ds_list_find_value(global.all_loaded_main_levels, i));

		if (string_lower(official_level_id) == normalized_name)
		{
			return official_level_id;
		}
	}

	return normalized_name;
}

/* Official level IDs are reserved and must never be used as writable custom-level folders. */
function scr_is_reserved_official_level_folder_name(folder_name)
{
	var normalized_name = string_lower(scr_sanitize_filename(string(folder_name)));

	if (normalized_name == ""
	|| !variable_global_exists("all_loaded_main_levels")
	|| !ds_exists(global.all_loaded_main_levels, ds_type_list))
	{
		return false;
	}

	for (var i = 0; i < ds_list_size(global.all_loaded_main_levels); i++)
	{
		var official_level_id = string_lower(string(ds_list_find_value(global.all_loaded_main_levels, i)));

		if (official_level_id == normalized_name)
		{
			return true;
		}
	}

	return false;
}

/* When a player names a custom level after an official level, force the folder away from the reserved namespace. */
function scr_make_custom_level_folder_name_safe(raw_name)
{
	var safe_name = scr_sanitize_filename(string(raw_name));

	if (scr_is_reserved_official_level_folder_name(safe_name))
	{
		safe_name += "_custom";
	}

	return safe_name;
}

/* Resolve the included-files directory for an official level, accounting for mixed path casing in the project. */
function scr_get_official_level_directory(level_name = "", category = "")
{
	var requested_level_name = string(level_name);
	var official_level_id = requested_level_name;

	if (official_level_id == "")
	{
		official_level_id = scr_get_active_official_level_id();
	}

	official_level_id = scr_normalize_official_level_id(official_level_id);

	if (official_level_id == "")
	{
		return "";
	}

	var root_candidates = ["levels", "Levels"];
	var level_candidates = [official_level_id];
	var category_candidates = [string(category)];

	if (requested_level_name != ""
	&& requested_level_name != official_level_id)
	{
		level_candidates[array_length(level_candidates)] = requested_level_name;
	}

	if (string_length(official_level_id) == 6
	&& string_copy(official_level_id, 1, 5) == "level")
	{
		var last_character = string_copy(official_level_id, 6, 1);

		if (last_character >= "a"
		&& last_character <= "z")
		{
			level_candidates[array_length(level_candidates)] = "level" + string_upper(last_character);
		}
	}

	if (string(category) != "")
	{
		var capitalized_category = string_upper(string_copy(string(category), 1, 1)) + string_delete(string(category), 1, 1);

		if (capitalized_category != string(category))
		{
			category_candidates[array_length(category_candidates)] = capitalized_category;
		}
	}

	for (var root_index = 0; root_index < array_length(root_candidates); root_index++)
	{
		for (var level_candidate_index = 0; level_candidate_index < array_length(level_candidates); level_candidate_index++)
		{
			var level_candidate = string(level_candidates[level_candidate_index]);

			if (string(category) == "")
			{
				var level_path = root_candidates[root_index] + "/" + level_candidate;

				if (directory_exists(level_path))
				{
					return level_path + "/";
				}
			}
			else
			{
				for (var category_index = 0; category_index < array_length(category_candidates); category_index++)
				{
					var category_path = root_candidates[root_index] + "/" + level_candidate + "/" + category_candidates[category_index];

					if (directory_exists(category_path))
					{
						return category_path + "/";
					}
				}
			}
		}
	}

	if (string(category) == "")
	{
		return "levels/" + official_level_id + "/";
	}

	return "levels/" + official_level_id + "/" + string(category) + "/";
}

/* Resolve a specific included file inside an official level directory, including legacy filename casing. */
function scr_get_official_level_file_path(level_name = "", category = "", filename = "")
{
	var base_directory = scr_get_official_level_directory(level_name, category);

	if (base_directory == ""
	|| string(filename) == "")
	{
		return base_directory;
	}

	var filename_candidates = [string(filename)];

	if (string(filename) == "automatic_thumbnail.png")
	{
		filename_candidates[array_length(filename_candidates)] = "Automatic_Thumbnail.png";
	}
	else
	if (string(filename) == "thumbnail.png")
	{
		filename_candidates[array_length(filename_candidates)] = "Thumbnail.png";
	}

	for (var file_index = 0; file_index < array_length(filename_candidates); file_index++)
	{
		var full_path = base_directory + filename_candidates[file_index];

		if (file_exists(full_path))
		{
			return full_path;
		}
	}

	return base_directory + string(filename);
}

function scr_get_official_level_display_name(level_name = "")
{
	var official_level_id = string(level_name);

	if (official_level_id == "")
	{
		official_level_id = scr_get_active_official_level_id();
	}

	official_level_id = scr_normalize_official_level_id(official_level_id);

	if (official_level_id == "")
	{
		return "";
	}

	var level_information_path = scr_get_official_level_file_path(official_level_id, "data", "level_information.ini");

	if (file_exists(level_information_path))
	{
		ini_open(level_information_path);
		var display_name = ini_read_string("info", "level_name", official_level_id);
		ini_close();
		return display_name;
	}

	return official_level_id;
}

function scr_get_official_level_thumbnail_path(level_name = "")
{
	var thumbnail_path = scr_get_official_level_file_path(level_name, "", "thumbnail.png");

	if (file_exists(thumbnail_path))
	{
		return thumbnail_path;
	}

	var automatic_thumbnail_path = scr_get_official_level_file_path(level_name, "", "automatic_thumbnail.png");

	if (file_exists(automatic_thumbnail_path))
	{
		return automatic_thumbnail_path;
	}

	return "";
}

/* Main-game levels and template levels must read from Included Files, never from custom storage. */
function scr_is_loading_official_level()
{
	return global.create_level_from_template
	|| global.character_select_in_this_menu == "main_game";
}

function scr_get_active_level_information_path()
{
	if (scr_is_loading_official_level())
	{
		return scr_get_official_level_file_path("", "data", "level_information.ini");
	}

	return global.use_temp_or_working + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini";
}

/* Rename any legacy custom level folders that shadow official included levels. */
function scr_quarantine_reserved_custom_level_folders()
{
	var custom_levels_root = game_save_id + "custom_levels/";

	if (!directory_exists(custom_levels_root))
	{
		return;
	}

	var reserved_folders = array_create(0);
	var file_found = string(file_find_first(custom_levels_root + "*", fa_directory));

	while (file_found != "")
	{
		var folder_name = string(file_found);

		if (folder_name != "."
		&& folder_name != ".."
		&& scr_is_reserved_official_level_folder_name(folder_name))
		{
			reserved_folders[array_length(reserved_folders)] = folder_name;
		}

		file_found = string(file_find_next());
	}

	file_find_close();

	for (var i = 0; i < array_length(reserved_folders); i++)
	{
		var old_folder_name = reserved_folders[i];
		var new_folder_name = scr_get_unique_folder_name(custom_levels_root, old_folder_name + "_custom");

		if (new_folder_name != old_folder_name)
		{
			show_debug_message("[scr_quarantine_reserved_custom_level_folders] Moving custom level folder '" + old_folder_name + "' to '" + new_folder_name + "' so it can no longer shadow an official level.");

			content_type = "level";
			scr_copy_move_files(custom_levels_root + old_folder_name, custom_levels_root + new_folder_name, true);

			if (variable_global_exists("level_folder_name")
			&& string(global.level_folder_name) == old_folder_name)
			{
				global.level_folder_name = new_folder_name;
			}
		}
	}
}
