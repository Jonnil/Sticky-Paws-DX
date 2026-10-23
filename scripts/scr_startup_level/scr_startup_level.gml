function scr_startup_level(request)
{
	/* A startup level is an existing local folder, never a path or a new level name */
	var folder_name = string(request.level);
	var forbidden_characters = ["/", "\\", ":", "*", "?", "\"", "<", ">", "|"];
	var invalid_folder = folder_name == "" || folder_name == "." || folder_name == "..";

	for (var character_index = 0; character_index < array_length(forbidden_characters); character_index++)
	{
		if (string_pos(forbidden_characters[character_index], folder_name) > 0)
		{
			invalid_folder = true;
			break;
		}
	}

	for (var character_index = 1; character_index <= string_length(folder_name); character_index++)
	{
		if (ord(string_char_at(folder_name, character_index)) < 32)
		{
			invalid_folder = true;
			break;
		}
	}

	var last_character = "";
	if (string_length(folder_name) > 0) last_character = string_char_at(folder_name, string_length(folder_name));
	if (last_character == "." || last_character == " "
	|| string_lower(folder_name) == "create_level"
	|| scr_is_reserved_official_level_folder_name(folder_name))
	{
		invalid_folder = true;
	}

	if (invalid_folder)
	{
		scr_startup_parameters_fail(request, "Use an existing custom level folder name without a path.");
		return false;
	}

	var level_directory = game_save_id + "custom_levels/" + folder_name + "/";
	var information_path = level_directory + "data/level_information.ini";
	var placement_path = level_directory + "data/object_placement_all.json";

	if (!directory_exists(level_directory)
	|| !file_exists(information_path)
	|| !file_exists(placement_path))
	{
		scr_startup_parameters_fail(request, "Custom level '" + folder_name + "' needs existing level information and object placement files.");
		return false;
	}

	/* Validate the same JSON line that the normal loader reads before changing menus */
	var placement_file = -1;
	var validation_error = "";

	try
	{
		placement_file = file_text_open_read(placement_path);
		if (placement_file < 0) throw "The object placement file could not be opened.";
		var placement_text = file_text_read_string(placement_file);
		file_text_close(placement_file);
		placement_file = -1;
		var placement_entries = json_parse(placement_text);

		if (!is_array(placement_entries)) throw "Object placement must be a JSON array.";
		var numeric_keys = ["X", "Y", "O", "E", "N", "H", "Q", "W", "L"];
		var expanded_object_count = 0;

		for (var entry_index = 0; entry_index < array_length(placement_entries); entry_index++)
		{
			var entry = placement_entries[entry_index];
			if (!is_struct(entry)) throw "Each placed object must be a JSON object.";
			if (!variable_struct_exists(entry, "X")
			|| !variable_struct_exists(entry, "Y")
			|| !variable_struct_exists(entry, "O"))
			{
				throw "Each placed object needs X, Y, and O values.";
			}

			for (var key_index = 0; key_index < array_length(numeric_keys); key_index++)
			{
				var key_name = numeric_keys[key_index];
				if (!variable_struct_exists(entry, key_name)) continue;
				var key_value = variable_struct_get(entry, key_name);
				if (!is_real(key_value) && !is_string(key_value) && !is_bool(key_value))
				{
					throw "Object placement values must contain numbers or numeric strings.";
				}
				/* Readable signs store their message in Q instead of a coordinate */
				if (key_name == "Q" && real(entry.O) == LEVEL_OBJECT_ID.ID_SIGN_READABLE)
				{
					if (!is_real(key_value) && !is_string(key_value)) throw "A readable sign message must be a number or a string.";
					continue;
				}
				if (is_string(key_value) && string_trim(key_value) == "")
				{
					throw "Object placement contains an empty numeric value.";
				}
				var numeric_value = real(key_value);
				if (is_nan(numeric_value) || is_infinity(numeric_value))
				{
					throw "Object placement values must contain finite numbers.";
				}
				if (key_name == "L"
				&& (numeric_value < 0 || numeric_value != floor(numeric_value)))
				{
					throw "Object repetition must be a nonnegative whole number.";
				}
			}

			/* Items may use either numeric IDs or the existing named item strings */
			if (variable_struct_exists(entry, "I")
			&& !is_real(entry.I) && !is_string(entry.I))
			{
				throw "An item inside an object must be a number or a string.";
			}

			expanded_object_count += variable_struct_exists(entry, "L") ? real(entry.L) + 1 : 1;
			if (expanded_object_count > 100000)
			{
				throw "Object placement exceeds the startup limit of 100000 objects.";
			}
		}
	}
	catch (placement_error)
	{
		if (placement_file >= 0) file_text_close(placement_file);
		validation_error = "Custom level '" + folder_name + "' has unreadable or invalid object placement data.";
		if (is_string(placement_error)) validation_error += " " + placement_error;
	}

	if (validation_error != "")
	{
		scr_startup_parameters_fail(request, validation_error);
		return false;
	}

	/* Keep the normal selected-level index without scanning or renaming any folders */
	if (ds_list_size(global.all_loaded_custom_levels) == 0)
	{
		ds_list_add(global.all_loaded_custom_levels, "Create_Level");
	}
	var custom_level_index = ds_list_find_index(global.all_loaded_custom_levels, folder_name);
	if (custom_level_index < 0)
	{
		ds_list_add(global.all_loaded_custom_levels, folder_name);
		custom_level_index = ds_list_size(global.all_loaded_custom_levels) - 1;
	}

	global.select_level_index = custom_level_index;
	global.level_folder_name = folder_name;
	global.level_name = scr_get_level_display_name(folder_name);
	global.character_select_in_this_menu = "level_editor";
	global.use_temp_or_working = game_save_id;
	global.world_editor = false;
	global.create_level_from_template = false;
	global.doing_clear_check_level = false;
	global.doing_clear_check_character = false;
	global.playing_level_from_beginning = false;
	global.automatically_play_downloaded_level = false;
	global.search_id = "";
	global.go_to_menu_when_going_back_to_title = "";
	global.actually_play_edited_level = request.destination == "play-level";
	global.play_edited_level = global.actually_play_edited_level;
	if (!global.actually_play_edited_level) global.first_time_opened_level_editor = false;

	in_character_select_menu = false;
	select_custom_level_menu_open = false;
	open_sub_menu = false;
	loading_assets = false;
	menu = global.actually_play_edited_level ? "level_editor_play" : "level_editor_make";
	can_navigate = false;
	menu_delay = 9999;
	request.stage = "complete";
	request.applied = true;
	show_debug_message("[Startup] Opening custom level '" + folder_name + "' in " + request.destination + ".");
	return true;
}
