/// @function l10n_text(key)
/// @description Returns a localized text string based on a keyword.
/// If translations aren’t loaded or the selected language index is invalid,
/// it will attempt to initialize the translations first.
function l10n_text(key = "")
{
	var text = key;
	
	/* Ensure that both the translations DS map and the CSV grid exist */
	if (!variable_global_exists("translations")
	|| global.translations == 0
	|| !variable_global_exists("language_local_data")
	|| global.language_local_data == 0)
	{
		show_debug_message("[l10n_text] Translations data not loaded. Initializing translations...");
		scr_initialize_translations();
		
		/* If still not loaded, return the key */
		if (!variable_global_exists("translations")
		|| global.translations == 0
		|| !variable_global_exists("language_local_data")
		|| global.language_local_data == 0)
		{
			show_debug_message("[l10n_text] ERROR: Translations data is still not available!");
			return key;
		}
	}
	
	/* Check if a translation exists for the given key */
	if (global.translations[? key] != undefined)
	{
		var row = global.translations[? key];
		var col = global.selected_language_id;
		
		/* Guard against an invalid language index */
		if (col >= ds_grid_width(global.language_local_data)
		|| col < global.language_column_start)
		{
			col = global.language_column_start; /* Fallback to the default language column */
			show_debug_message("[l10n_text] Warning: selected_language_id out of bounds. Resetting to default column " + string(col));
		}
		
		var localized_text = global.language_local_data[# col, row];
		
		if (localized_text != "")
		{
			text = localized_text;
			var a = argument_count > 1 ? argument[1] : "";
			text = string_replace_all(text, "{a}", a);
		}
		else
		if (global.language_local_data[# global.language_column_start, row] != "")
		{
			text = global.language_local_data[# global.language_column_start, row];
			var a = argument_count > 1 ? argument[1] : "";
			text = string_replace_all(text, "{a}", a);
		}
	}
	
	/* Translation debugging: append additional info if enabled */
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
			text = "A? " + key + string(round(random(9))); /* Indicate missing keyword */
		}
	}
	
	/* If no translation was found, log the missing keyword */
	if (global.translations[? key] == undefined)
	{
		scr_log_missing_translation_keyword(key);
	}
	
	/* Replace {br} placeholders with actual newlines */
	text = string_replace_all(text, "{br}", "\n");
	
	return text;
}