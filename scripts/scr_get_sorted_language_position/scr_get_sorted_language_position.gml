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