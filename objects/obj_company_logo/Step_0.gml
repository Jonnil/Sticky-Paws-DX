if (can_navigate = false)
{
	file_load_timer += 1;
	
	if (global.custom_level_load_delay = 0)
	and (file_load_timer > 1)
	or(global.custom_level_load_delay = 1)
	and (file_load_timer >2)
	or(global.custom_level_load_delay = 2)
	and (file_load_timer >4)
	or(global.custom_level_load_delay = 3)
	and (file_load_timer >8)
	or(global.custom_level_load_delay = 4)
	and (file_load_timer > 16)
	or(global.custom_level_load_delay = 5)
	and (file_load_timer >32)
	or(global.custom_level_load_delay = 6)
	and (file_load_timer >64)
	or(global.custom_level_load_delay = 7)
	and (file_load_timer > 128)
	or(global.custom_level_load_delay = 8)
	and (file_load_timer >256)
	or(global.custom_level_load_delay = 9)
	and (file_load_timer >512)
	{
		file_found = file_find_next()
	
		if (file_found == "")
		{
			file_find_close();
			scr_load_all_character_portraits();
			can_navigate = true;
		}
		else
		{
			file_exists(working_directory + "custom_characters/"+ file_found+"/data/character_config.ini")
			ds_list_add(global.all_loaded_characters, file_found)
			
			file_load_timer = 0; /* 1 not 0. So it doesn't do the file_find_first code which it does at 0*/
		}
	}
}