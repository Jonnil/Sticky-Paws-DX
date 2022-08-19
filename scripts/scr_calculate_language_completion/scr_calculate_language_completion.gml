function calculate_translation_completion()
{
	var EmptyCount = 0;
	
	for (var i = 1; i < ds_grid_height(global.language_local_data); i ++;)
	{
		if global.language_local_data[# global.language_localization + 1, i] == ""
		{
			EmptyCount ++
		}
	}
	global.language_completion = (ds_grid_height(global.language_local_data) - EmptyCount) / ds_grid_height(global.language_local_data) * 100;
}