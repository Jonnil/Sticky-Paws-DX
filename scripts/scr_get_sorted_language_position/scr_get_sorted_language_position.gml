/// @function scr_get_sorted_language_list()
/// @description Returns a sorted array of language data based on the global.valid_languages array.
/// If global.valid_languages isn’t set, it calls scr_get_valid_languages() to initialize it.
function scr_get_sorted_language_list()
{
	/* If valid_languages isn't defined, initialize it */
	if (!variable_global_exists("valid_languages")
	|| global.valid_languages == undefined)
	{
		scr_get_valid_languages();
		
		/* Optionally, check if it is still undefined: */
		if (!variable_global_exists("valid_languages")
		|| global.valid_languages == undefined)
		{
			show_debug_message("[scr_get_sorted_language_list] ERROR: global.valid_languages not set.");
			return [];
		}
	}
	
	var temp_languages = [];
	
	/* Loop through valid_languages (starting at 1, assuming index 0 is not used) */
	for (var i = 1; i < array_length(global.valid_languages); i++)
	{
		/* Access the language name from the CSV grid using the index from valid_languages */
		var language_name = global.language_local_data[# global.valid_languages[i], 0];
		array_push(temp_languages, { index: global.valid_languages[i], name: language_name });
	}
	
	/* Sort the array alphabetically by language name */
	for (var j = 0; j < array_length(temp_languages) - 1; j++)
	{
		for (var k = j + 1; k < array_length(temp_languages); k++)
		{
			if (temp_languages[j].name > temp_languages[k].name)
			{
				var temp = temp_languages[j];
				temp_languages[j] = temp_languages[k];
				temp_languages[k] = temp;
			}
		}
	}
	
	return temp_languages;
}

/// @function scr_get_sorted_language_position(selected_language_id)
/// @description Returns the sorted position of the selected language.
function scr_get_sorted_language_position(selected_language_id)
{
	var temp_languages = scr_get_sorted_language_list();
	var sorted_position = 1;
	
	for (var i = 1; i < array_length(temp_languages); i++)
	{
		if (temp_languages[i].index == selected_language_id)
		{
			sorted_position = i;
			break;
		}
	}
	
	return sorted_position;
}