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
	var names	= struct_get_names(global);
	var cnt		= array_length(names);
	
	for (var i = 0; i < cnt; i++)
	{
		var fname = names[i];
		
		/* Skip our own list, or any non-boolean
		struct_get_names(global) returns *every* field on the global struct,
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
	
	show_debug_message("[scr_export_bool_globals] Bool‐global dump written to: " + string(ini_path));
}

/// @function scr_generate_network_error_code
/// @description Pack as many booleans into one unique NWT-### via bitmask + DS list
function scr_generate_network_error_code()
{
	/* (Re)build our list & dump it */
	scr_init_bool_globals();
	scr_export_bool_globals();
	
	/* Build the mask dynamically from our boolean-flag list */
	var mask		= 0;
	var flag_count	= ds_list_size(global.bool_flag_list);
	show_debug_message("[scr_generate_network_error_code] found " + string(flag_count) + " flags");
	
	for (var i = 0; i < flag_count; i++)
	{
		/* Grab the name, fetch its value (defaults to false) */
		var name = global.bool_flag_list[| i];
		var val  = variable_global_exists(name)
					? variable_global_get(name)
					: false;
		show_debug_message("[scr_generate_network_error_code] flag[" + string(i) + "] = " + string(name) + " to " + string(val));
		
		/* If the flag is false => "error" => set the bit */
		if (!val)
		{
			mask |= (1 << i);
			show_debug_message("[scr_generate_network_error_code] to bit " + string(i) + " set; new mask = " + string(mask));
		}
	}
	
	/* Encode in Base-64 instead of decimal, so that error codes are shorter */
	show_debug_message("[scr_generate_network_error_code] raw mask = " + string(mask));
	var shortMask = scr_to_base64(mask);
	show_debug_message("[scr_generate_network_error_code] base64 mask = " + string(shortMask));
	return "NWT-" + string(shortMask);
}