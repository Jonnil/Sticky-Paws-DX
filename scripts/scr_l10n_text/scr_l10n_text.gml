/// @function l10n_text(key)
/// @description Returns a localized text string based on a keyword.
/// If translations aren’t loaded or the selected language index is invalid,
/// it will attempt to initialize the translations first.
function l10n_text(key = "")
{
	/* Toggle for debug messages in this function */
	var debug_enabled = false;

	if (debug_enabled)
	{
		show_debug_message("[l10n_text] Called with key: " + string(key));
	}

	var text = key;

	/* 1. Check if translation data is loaded */
	if (global.translations == 0
	|| global.language_local_data == 0)
	{
		/* Always show this debug message when translation date is not loaded */
		show_debug_message("[l10n_text] Translations data not loaded. Initializing translations... - global.translations = " + string(global.translations) + ", global.language_local_data = " + string(global.language_local_data));

		scr_initialize_translations();

		/* Check again after attempting to load */
		if (global.translations == 0
		|| global.language_local_data == 0)
		{
			/* Always show this debug message when translation data is still not available */
			show_debug_message("[l10n_text] ERROR: Translations data is still not available! Returning key as fallback. - global.translations = " + string(global.translations) + ", global.language_local_data = " + string(global.language_local_data));

			return key;
		}
	}

	/* 2. Look up the key in the translations DS map */
	if (global.translations[? key] != undefined)
	{
		if (debug_enabled)
		{
			show_debug_message("[l10n_text] Found translation entry for key: " + string(key));
		}

		var row = global.translations[? key];
		var col = global.selected_language_id;

		/* Guard against an invalid language index */
		if (col >= ds_grid_width(global.language_local_data)
		|| col < global.language_column_start)
		{
			/* Always show this debug message when selected_language_id out of bounds */
			show_debug_message("[l10n_text] Warning: selected_language_id out of bounds. Resetting to default column: " + string(global.language_column_start));

			col = global.language_column_start;
		}

		var localized_text = global.language_local_data[# col, row];

		if (debug_enabled)
		{
			show_debug_message("[l10n_text] localized_text from grid: " + string(localized_text));
		}

		/* 3. If localized_text is valid, replace placeholders */
		if (localized_text != "")
		{
			text = localized_text;
			var a = argument_count > 1 ? argument[1] : "";
			text = string_replace_all(text, "{a}", a);

			if (debug_enabled)
			{
				show_debug_message("[l10n_text] Replaced {a} with '" + string(a) + "'. Final text: " + text);
			}
		}
		/* 4. Fallback to default column text if the localized_text is empty */
		else
		if (global.language_local_data[# global.language_column_start, row] != "")
		{
			if (debug_enabled)
			{
				show_debug_message("[l10n_text] localized_text is empty for the current column, using default column.");
			}

			text = global.language_local_data[# global.language_column_start, row];
			var a = argument_count > 1 ? argument[1] : "";
			text = string_replace_all(text, "{a}", a);

			if (debug_enabled)
			{
				show_debug_message("[l10n_text] Replaced {a} with '" + string(a) + "'. Final fallback text: " + text);
			}
		}
	}
	else
	{
		/* Key not found in translations */
		if (debug_enabled)
		{
			show_debug_message("[l10n_text] No translation found for key: " + string(key));
		}
	}

	/* 5. Handle extra debugging if global.translation_debug is enabled */
	/* (this is separate from our new debug_enabled check) */
	if (global.translation_debug)
	{
		if (global.translations[? key] != undefined
		&& global.language_local_data[# global.language_column_start, global.translations[? key]] != "")
		{
			var letter = string_char_at("ABCDEFGHIJKLMNOPQRSTUVWXYZ", global.selected_language_id + 1);
			text = string(letter) + string(global.translations[? key] + 1) + " " + text + string(round(random(9)));
		}
		else
		{
			text = "A? " + key + string(round(random(9)));
		}
	}

	/* 6. If the key is missing from translations, log it */
	if (global.translations[? key] == undefined)
	{
		if (debug_enabled)
		{
			show_debug_message("[l10n_text] Logging missing translation keyword: " + string(key));
		}
		scr_log_missing_translation_keyword(key);
	}

	/* 7. Replace {br} placeholders with newlines */
	text = string_replace_all(text, "{br}", "\n");

	if (debug_enabled)
	{
		show_debug_message("[l10n_text] Returning final text: " + text);
	}

	return text;
}
