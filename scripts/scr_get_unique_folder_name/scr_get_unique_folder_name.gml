/// @func scr_get_unique_folder_name(root_path, raw_name)
/// @arg root_path   String: e.g. game_save_id + "custom_levels/"
/// @arg raw_name	String: your un‑sanitized level name
/// @return			String: a sanitized, unique folder name (no trailing slash)
function scr_get_unique_folder_name(root_path, raw_name)
{
	/* Sanitize base */
	var base = scr_sanitize_filename(raw_name);
	
	/* First candidate is just the base */
	var candidate = base;
	var full_path = root_path + candidate;
	
	/* If it already exists, append "_1", "_2", ... */
	var suffix = 1;
	
	while (directory_exists(full_path))
	{
		candidate = base + "_" + string(suffix);
		full_path = root_path + candidate;
		suffix++;
		
		/* sanity check: you can bail out if it loops too many times */
		if (suffix > 9999)
		{
			break;
		}
	}
	
	return candidate;
}