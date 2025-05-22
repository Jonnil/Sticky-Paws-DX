/// @function scr_init_bool_globals
/// @description  Automatically finds every Boolean in global and stores its name in a list
function scr_init_bool_globals()
{
	/* Create (or clean up) the list */
	if (variable_struct_exists(global, "bool_flag_list"))
	{
		ds_list_destroy(global.bool_flag_list);
		global.bool_flag_list = undefined;
	}
	
	global.bool_flag_list = ds_list_create();
	
	/* Get every field name in the global struct */
	var names = struct_get_names(global);
	/* Ensure stable, alphabetical ordering so bit‐indices never shift (true = ascending) */
	array_sort(names, true);
	var cnt = array_length(names);
	
	for (var i = 0; i < cnt; i++)
	{
		var fname = names[i];
		
		/* Skip our own list, or any non-boolean
		'struct get names(global)' returns *every* field on the global struct,
		including our own bool_flag_list, so skip that one! */
		if (fname == "bool_flag_list")
		{
			continue;
		}
		
		/* IMPORTANT: 'global' in GML is a struct, not a ds_map.
		If you try 'global[? fname]', GameMaker under the hood treats
		'global' like a map and crashes with "expecting a ds_map".
		Instead, use variable_struct_get() to pull out a struct member by name */
		var val = variable_struct_get(global, fname);
		
		/* Only want pure Boolean fields here */
		if ( is_bool(val) )
		{
			ds_list_add(global.bool_flag_list, fname);
		}
	}
}

/// @function scr_export_bool_globals
/// @description  Writes all Boolean globals out to an INI under your game’s save folder
function scr_export_bool_globals()
{
	/* Build the full path in AppData (via GameMaker’s save‐ID) */
	var ini_path = game_save_id + "debug_logs/BoolGlobals.ini";
	
	/* Delete any old copy so we start fresh */
	if (file_exists(ini_path))
	{
		file_delete(ini_path);
	}
	
	/* Open (or create) the INI file */
	ini_open(ini_path);
	
	/* Loop through each flagged name and write its 0/1 value */
	var cnt = ds_list_size(global.bool_flag_list);
	
	for (var i = 0; i < cnt; i++)
	{
		/* Pull the i-th entry out of the DS list (not an array!) */
		var name = ds_list_find_value(global.bool_flag_list, i);
		/* Read a struct member by name—global is a struct, not a ds_map */
		var val  = variable_struct_get(global, name);
		ini_write_real("BoolGlobals", name, real(val));
	}
	
	/* Close (and flush) the file */
	ini_close();
	
	show_debug_message("[scr_export_bool_globals] Bool‐global dump written to: " + string(ini_path) + "\n");
}

/// @function scr_generate_network_error_code
/// @description Packs all false bools into a Base-64 string via scr_flags_to_base64
function scr_generate_network_error_code()
{
	/* 1) Re‐discover your Boolean globals */
	scr_init_bool_globals();
	
	/* 2) Dump them for logging/debugging */
	scr_export_bool_globals();
	
	/* 3) Encode every flag into Base-64 (6 flags per character) */
	var code = scr_flags_to_base64();
	
	/* 4) Prefix and return */
	return "NWT-" + string(code);
}
