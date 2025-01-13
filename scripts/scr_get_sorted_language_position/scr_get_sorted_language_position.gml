function scr_get_sorted_language_list()
{
	var temp_languages = [];
	
	for (var i = 1; i < array_length(global.valid_languages); i ++)
	{
		var language_name = global.language_local_data[# global.valid_languages[i], 0];
		array_push(temp_languages, {index: global.valid_languages[i], name: language_name});
	}
	
	/* Sort the array alphabetically */
	for (var j = 0; j < array_length(temp_languages) - 1; j ++)
	{
		for (var k = j + 1; k < array_length(temp_languages); k ++)
		{
			if (temp_languages[j].name > temp_languages[k].name)
			{
				var temp = temp_languages[j];
				temp_languages[j] = temp_languages[k];
				temp_languages[k] = temp;
			}
		}
	}
	
	return temp_languages; /* Return just the sorted list */
}

function scr_get_sorted_language_position(selected_language_id)
{
	var temp_languages = scr_get_sorted_language_list(); /* Reuse the sorted list */
	var sorted_position = 1;
	
	for (var i = 1; i < array_length(temp_languages); i ++)
	{
		if (temp_languages[i].index == selected_language_id)
		{
			sorted_position = i;
			break;
		}
	}
	
	return sorted_position; /* Return only the position */
}