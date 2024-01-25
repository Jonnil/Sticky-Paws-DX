function calculate_translation_completion()
{
	var empty_count = 0;
	
	for(var i = 1; i < ds_grid_height(global.language_local_data); i ++;)
	{
		if (global.language_local_data[# global.language_localization + 1, i] == "")
		{
			empty_count ++
		}
	}
	global.language_completion = (ds_grid_height(global.language_local_data) - empty_count) / ds_grid_height(global.language_local_data) * 100;
}