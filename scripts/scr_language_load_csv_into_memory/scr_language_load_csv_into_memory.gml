/// @function scr_language_load_csv_into_memory(_path)
/// @description Loads the CSV at _path into global.language_local_data
/// and returns a DS map mapping translation codes to row indices.
function scr_language_load_csv_into_memory(_path)
{
	/* load_csv is presumably your existing function that loads a CSV into a DS grid */
	var loaded_grid = load_csv(_path);

	/* load_csv may return -1 (invalid DS id) instead of undefined on failure */
	if (is_undefined(loaded_grid)
	|| !ds_exists(loaded_grid, ds_type_grid))
	{
		show_debug_message("[scr_language_load_csv_into_memory] Error: load_csv failed or returned invalid grid for " + _path + " (value=" + string(loaded_grid) + ")\n");
		return -1;
	}

	global.language_local_data = loaded_grid;

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
