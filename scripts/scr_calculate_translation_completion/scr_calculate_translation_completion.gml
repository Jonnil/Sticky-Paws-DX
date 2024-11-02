function calculate_translation_completion()
{
	for (var language_id = 1; language_id < ds_grid_width(global.language_local_data); language_id++)
	{
		var empty_count = 0;
		
		for (var row_index = 1; row_index < ds_grid_height(global.language_local_data); row_index++)
		{
			if (global.language_local_data[# language_id, row_index] == "")
			{
				empty_count++;
			}
		}
		global.language_completion[language_id] = (ds_grid_height(global.language_local_data) - empty_count) / ds_grid_height(global.language_local_data) * 100;
		show_debug_message(string(global.language_local_data[# language_id, 0]) + " global.language_completion[" + string(language_id) + "] = " + string(global.language_completion[language_id]));
	}
}