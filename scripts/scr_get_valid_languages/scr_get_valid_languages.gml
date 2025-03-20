function scr_get_valid_languages()
{
	/* Make sure the translation grid is valid and has columns beyond language_column_start */
	if (global.language_local_data == 0
	|| ds_grid_width(global.language_local_data) <= global.language_column_start)
	{
		show_debug_message("[scr_get_valid_languages] ERROR: language_local_data is not loaded or has no valid language columns.\n");
		return;
	}
	
	var grid_w = ds_grid_width(global.language_local_data);
	
	/* Ensure that global.language_completion is an array of length grid_w */
	if (!variable_global_exists("language_completion")
	|| !is_array(global.language_completion))
	{
		global.language_completion = array_create(grid_w, 0);
	}
	else
	if (array_length(global.language_completion) < grid_w)
	{
		var current_length = array_length(global.language_completion);
		for (var j = current_length; j < grid_w; j++)
		{
			array_push(global.language_completion, 0);
		}
	}
	
	/* Initialize global.valid_languages as an empty array */
	global.valid_languages = [];
	var valid_array = 0;
	
	/* Loop through each language column, starting at the column defined by global.language_column_start */
	for (var i = global.language_column_start; i < grid_w; i++)
	{
		/* Retrieve the language header and the validity string */
		var language_name = global.language_local_data[# i, 0];
		var language_valid_string = global.language_local_data[# i, 1];
		var comp = global.language_completion[i]; /* Now safe to access because we ensured the array is sized */
		
		/* Skip this column if either the language name or the valid string is undefined or empty */
		if (is_undefined(language_name)
		|| language_name == ""
		|| language_name == "undefined")
		{
			show_debug_message("[scr_get_valid_languages] Skipping language column " + string(i) + " due to undefined or empty language name.");
			continue;
		}
		
		if (is_undefined(language_valid_string)
		|| language_valid_string == ""
		|| language_valid_string == "undefined")
		{
			show_debug_message("[scr_get_valid_languages] Skipping language column " + string(i) + " due to undefined or empty valid string.");
			continue;
		}
		
		var debug_message = string(global.language_local_data[# i, 0]) +
			" global.language_completion[" + string(i) + "] = " +
			string(comp) + " Valid language: " + string(language_valid_string);
		
		/* Check if the language should show up in-game */
		if (language_valid_string != "No")
		{
			//if ((os_type == os_switch
			//&& comp >= 100)
			//|| (os_type != os_switch))
			//{
				valid_array++;
				global.valid_languages[valid_array] = i;
			//}
			debug_message += " global.valid_languages[" + string(valid_array) + "] = " + string(i);
		}
		
		if (global.translation_debug)
		{
			show_debug_message("[scr_get_valid_languages] " + debug_message);
		}
	}
	
	show_debug_message("");
}