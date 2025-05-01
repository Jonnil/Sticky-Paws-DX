/// @function scr_init_nwt_flags
/// @description Call once at game start to define which globals map to which bit
function scr_init_nwt_flags()
{
	global.nwt_flag_list = ds_list_create();
	
	/* prefix "!" means "error when this var is TRUE", otherwise it means "error when this var is FALSE" */
	ds_list_add(global.nwt_flag_list, "!online_token_expired");
	ds_list_add(global.nwt_flag_list, "online_token_present");
	ds_list_add(global.nwt_flag_list, "online_token_validated");
	ds_list_add(global.nwt_flag_list, "online_enabled");
	ds_list_add(global.nwt_flag_list, "switch_account_network_service_available");
	ds_list_add(global.nwt_flag_list, "switch_logged_in");
	ds_list_add(global.nwt_flag_list, "switch_account_open");
	ds_list_add(global.nwt_flag_list, "switch_account_is_user_online");
	
	/* ...add more ds_list_add calls here as you introduce new flags... */
}

/// @function scr_generate_network_error_code
/// @description Pack as many booleans into one unique NWT-### via bitmask + DS list
function scr_generate_network_error_code()
{
	/* Build the mask dynamically from global.nwt_flag_list */
	var mask		= 0;
	var flag_count	= ds_list_size(global.nwt_flag_list);
	
	for (var i = 0; i < flag_count; i++)
	{
		var entry = global.nwt_flag_list[| i];
		var invert	= string_char_at(entry, 1) == "!"; /* Detect invert prefix */
		var name	= invert
					? string_delete(entry, 1, 1)
					: entry;
		var val = variable_global_exists(name) /* Fetch the global var (default false if missing) */
				? variable_global_get(name)
				: false;
		var is_error = invert ? val : !val; /* If invert == true then error_when_true (val == true) else when error_when_false (val == false) */
		
		if (is_error)
		{
			mask |= (1 << i);
		}
	}
	
	var codeNum = 100 + mask; /* Offset into your reserved range (e.g. 100–...) */
	var fmt	= string_format(codeNum, 3, 0); /* Zero-pad to three digits */
	var padded = string_replace_all(fmt, " ", "0");
	
	return "NWT-" + padded;
}
