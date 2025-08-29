/* Function to get custom background information (real) */
function get_custom_level_information_real(section_name, key_name, default_value)
{
	if (ini_key_exists(section_name, key_name))
	{
		return ini_read_real(section_name, key_name, default_value);
	}
	else
	{
		if (can_save_to_level_information)
		&& (global.character_select_in_this_menu == "level_editor")
		{
			ini_write_real(section_name, key_name, default_value);
		}
		return default_value;
	}
}

/* Function to get custom background information (string) */
function get_custom_level_information_string(section_name, key_name, default_value)
{
	if (ini_key_exists(section_name, key_name))
	{
		return ini_read_string(section_name, key_name, default_value);
	}
	else
	{
		if (can_save_to_level_information)
		&& (global.character_select_in_this_menu == "level_editor")
		{
			ini_write_string(section_name, key_name, default_value);
		}
		return default_value;
	}
}
