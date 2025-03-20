/// @function scr_language_load_csv_into_memory(_path)
/// @description Loads the CSV at _path into global.language_local_data
/// and returns a DS map mapping translation codes to row indices.
function scr_language_load_csv_into_memory(_path)
{
	/* load_csv is presumably your existing function that loads a CSV into a DS grid */
	global.language_local_data = load_csv(_path);
	
	if (is_undefined(global.language_local_data))
	{
		show_debug_message("[scr_language_load_csv_into_memory] Error: load_csv returned undefined for " + _path + "\n");
		return -1;
	}
	
	var hh = ds_grid_height(global.language_local_data);
	var translations_map = ds_map_create();
	
	/* Fill a DS map:  key = the text code in the first column, value = row index */
	for (var i = 0; i < hh; i++)
	{
		var code = global.language_local_data[# 0, i];
		ds_map_add(translations_map, code, i);
	}
	
	return translations_map;
}