/* Stop an invalid request once and leave normal title navigation available */
function scr_startup_parameters_fail(request, message)
{
	request.error = string(message);
	request.stage = "failed";
	request.applied = true;
	show_debug_message("[Startup] " + request.error);
	return false;
}

/* Read process settings once so returning to the title never repeats a shortcut */
function scr_startup_parameters_read()
{
	if (variable_global_exists("startup_parameters"))
	{
		return global.startup_parameters;
	}

	var request =
	{
		destination: "",
		level: "",
		character: "",
		options_page: "",
		players: 1,
		editor_grid: "",
		editor_options_applied: false,
		requested: false,
		applied: false,
		stage: "pending",
		error: ""
	};
	global.startup_parameters = request;
	var players_text = "1";
	var input_error = "";

	/* Desktop environment defaults are optional and command-line values replace them */
	if (os_browser == browser_not_a_browser
	&& (os_type == os_windows || os_type == os_macosx || os_type == os_linux))
	{
		request.destination = string_trim(environment_get_variable("STICKY_PAWS_STARTUP_MODE"));
		request.level = string_trim(environment_get_variable("STICKY_PAWS_STARTUP_LEVEL"));
		request.character = string_trim(environment_get_variable("STICKY_PAWS_STARTUP_CHARACTER"));
		request.options_page = string_trim(environment_get_variable("STICKY_PAWS_STARTUP_OPTIONS_PAGE"));
		request.editor_grid = string_trim(environment_get_variable("STICKY_PAWS_STARTUP_EDITOR_GRID"));
		var environment_players = string_trim(environment_get_variable("STICKY_PAWS_STARTUP_PLAYERS"));
		if (environment_players != "") players_text = environment_players;
	}

	for (var argument_index = 1; argument_index <= parameter_count(); argument_index++)
	{
		var argument_text = string_trim(parameter_string(argument_index));
		var equal_position = string_pos("=", argument_text);
		var inline_value = equal_position > 0;
		var option_name = string_lower(inline_value
			? string_copy(argument_text, 1, equal_position - 1) : argument_text);
		var value_text = inline_value
			? string_trim(string_delete(argument_text, 1, equal_position)) : "";
		if (string_pos("--", option_name) == 1) option_name = string_delete(option_name, 1, 1);

		var takes_value = option_name == "-startup" || option_name == "-start"
			|| option_name == "-edit-level" || option_name == "-play-level"
			|| option_name == "-official-level" || option_name == "-level"
			|| option_name == "-character" || option_name == "-options-page"
			|| option_name == "-players" || option_name == "-editor-grid";

		if (takes_value && !inline_value)
		{
			if (argument_index >= parameter_count())
			{
				input_error = "Missing value for " + option_name;
				break;
			}
			value_text = string_trim(parameter_string(argument_index + 1));
			if (value_text == "" || string_pos("-", value_text) == 1)
			{
				input_error = "Missing value for " + option_name + ". Use the equals form for a value beginning with a dash.";
				break;
			}
			argument_index++;
		}

		if (takes_value && value_text == "")
		{
			input_error = "Missing value for " + option_name;
			break;
		}

		switch (option_name)
		{
			case "-startup":
			case "-start":
				request.destination = value_text;
				break;
			case "-edit-level":
			case "-play-level":
			case "-official-level":
				request.destination = string_delete(option_name, 1, 1);
				request.level = value_text;
				break;
			case "-level":
				request.level = value_text;
				break;
			case "-character":
				request.character = value_text;
				break;
			case "-options-page":
				request.options_page = value_text;
				break;
			case "-players":
				players_text = value_text;
				break;
			case "-editor-grid":
				request.editor_grid = value_text;
				break;
			case "-title":
			case "-main-game":
			case "-world-map":
			case "-level-editor":
			case "-online-levels":
			case "-options":
			case "-characters":
			case "-character-manager":
			case "-character-editor":
				if (inline_value)
				{
					input_error = option_name + " doesn't take a value. Use -options-page, -character, or -level as appropriate.";
				}
				request.destination = string_delete(option_name, 1, 1);
				break;
			case "-grid":
				if (inline_value) input_error = "Use -grid without a value, or -editor-grid=show.";
				request.editor_grid = "show";
				break;
			case "-no-grid":
				if (inline_value) input_error = "Use -no-grid without a value, or -editor-grid=hide.";
				request.editor_grid = "hide";
				break;
			case "-startup-help":
				show_debug_message("[Startup] Destinations: title, main-game, world-map, level-editor, online-levels, options, characters, character-manager, character-editor, edit-level, play-level, official-level.");
				show_debug_message("[Startup] Use -startup=DESTINATION or a destination flag. -edit-level=FOLDER, -play-level=FOLDER, -official-level=ID. Modifiers: -options-page=PAGE, -character=FOLDER, -players=1..4, -editor-grid=show|hide. Both single and double dashes are accepted.");
				break;
		}
		if (input_error != "") break;
	}

	request.destination = string_replace_all(string_lower(string_trim(request.destination)), "_", "-");
	request.options_page = string_lower(string_trim(request.options_page));
	request.editor_grid = string_lower(string_trim(request.editor_grid));
	request.requested = request.destination != "";
	var has_modifiers = request.level != "" || request.character != ""
		|| request.options_page != "" || request.editor_grid != "" || players_text != "1";

	if (input_error != "")
	{
		scr_startup_parameters_fail(request, input_error);
		return request;
	}
	if (!request.requested && !has_modifiers) return request;

	var destinations = ["title", "main-game", "world-map", "level-editor", "online-levels",
		"options", "characters", "character-manager", "character-editor", "edit-level", "play-level", "official-level"];
	var recognized = false;
	for (var destination_index = 0; destination_index < array_length(destinations); destination_index++)
	{
		if (request.destination == destinations[destination_index]) recognized = true;
	}
	if (!recognized)
	{
		scr_startup_parameters_fail(request, "Choose a supported destination with -startup. Use -startup-help for the list.");
		return request;
	}
	if (players_text != "1" && players_text != "2" && players_text != "3" && players_text != "4")
	{
		scr_startup_parameters_fail(request, "-players must be a whole number from 1 to 4.");
		return request;
	}
	request.players = real(players_text);

	var uses_level = request.destination == "edit-level" || request.destination == "play-level"
		|| request.destination == "official-level";
	if ((uses_level && request.level == "") || (!uses_level && request.level != ""))
	{
		scr_startup_parameters_fail(request, "A level value is required only for edit-level, play-level, or official-level.");
		return request;
	}
	if (request.options_page != "" && request.destination != "options")
	{
		scr_startup_parameters_fail(request, "-options-page requires the options destination.");
		return request;
	}
	if (request.editor_grid != ""
	&& (request.destination != "edit-level"
		|| (request.editor_grid != "show" && request.editor_grid != "hide")))
	{
		scr_startup_parameters_fail(request, "-editor-grid requires edit-level and a value of show or hide.");
		return request;
	}
	show_debug_message("[Startup] Requested destination: " + request.destination);
	return request;
}

/* Apply the optional overlay only after the normal editor has initialized it */
function scr_startup_editor_options()
{
	if (!variable_global_exists("startup_parameters")) return;
	var request = global.startup_parameters;
	if (!request.applied || request.stage != "complete" || request.destination != "edit-level"
	|| request.editor_options_applied) return;
	if (request.editor_grid == "show") show_grid = true;
	if (request.editor_grid == "hide") show_grid = false;
	request.editor_options_applied = true;
}
