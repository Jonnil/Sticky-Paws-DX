/* Function for retrieving localized text with keyword logging */
function l10n_text(key = "")
{
	/* The common abbreviation for localization is l10n, where the number 10 refers to the number of letters between the L and the N */
	/* This is just to make this function name shorter so I don't have to type localization_text over and over. It's too redundant */
	var text = key;
	
	#region /* Check if the translation exists */
	if (global.translations[? key] != undefined)
	{
		var localized_text = global.language_local_data[# global.selected_language_id, global.translations[? key]];
		
		if (localized_text != "")
		{
			text = localized_text;
			var a = argument_count > 1 ? argument[1] : "";
			text = string_replace_all(text, "{a}", a);
		}
		else
		if (global.language_local_data[# global.language_column_start, global.translations[? key]] != "")
		{
			text = global.language_local_data[# global.language_column_start, global.translations[? key]];
			var a = argument_count > 1 ? argument[1] : "";
			text = string_replace_all(text, "{a}", a);
		}
	}
	#endregion /* Check if the translation exists END */
	
	#region /* Translation Debugging */
	if (global.translation_debug)
	{
		/* In debug mode, make all untranslated text flash random numbers beside the original text, to indicate easier what line is untranslated */
		if (global.translations[? key] != undefined
		&& global.language_local_data[# global.language_column_start, global.translations[? key]] != "")
		{
			var letter = string_char_at("ABCDEFGHIJKLMNOPQRSTUVWXYZ", global.selected_language_id + 1);
			text = string(letter) + string(global.translations[? key] + 1) + " " + string_replace_all(text, "{a}", a) + string(round(random(9)));
		}
		else
		{
			text = "A? " + key + string(round(random(9))); /* A? means there is missing keyword */
		}
	}
	#endregion /* Translation Debugging END */
	
	/* Log missing translation keywords */
	if (global.translations[? key] == undefined)
	{
		scr_log_missing_translation_keyword(key); /* Call the log missing translation keyword script */
	}
	
	/* Replace {br} placeholders with actual newlines */
	text = string_replace_all(text, "{br}", "\n");
	
	return text;
}