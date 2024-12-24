function scr_get_valid_languages()
{
	global.valid_languages = noone;
	var valid_array = 0;
	for(var i = 1; i < ds_grid_width(global.language_local_data); i ++;)
	{
		var language_valid_string = global.language_local_data[# i, 1];
		
		/* Display a debug message showing the language name from the first row of the column,
			the calculated completion percentage,
			and if the language is valid or not */
		show_debug_message(string(global.language_local_data[# i, 0]) + 
			" global.language_completion[" + string(i) + "] = " + 
			string(global.language_completion[i]) + " Valid language: " + string(language_valid_string));
		
		/* If the language should show up in-game or not */
		if (language_valid_string != "No")
		{
			/* In Nintendo Switch Guidelines, every language needs to be 100% translated, can't include unfinished translations */
			if (os_type == os_switch
			&& global.language_completion[i] >= 100)
			|| (os_type != os_switch)
			{
				valid_array ++;
				global.valid_languages[valid_array] = i;
			}
			show_debug_message("global.valid_languages[" + string(valid_array) + "] = " + string(i));
		}
	}
}