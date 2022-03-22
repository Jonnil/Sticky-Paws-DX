if (can_navigate = false)
{
	file_load_timer += 1;
	
	#region /*Load Characters*/
	if (file_load_timer > 1)
	and (load_characters_ok = false)
	{
		if (initialized_characters = false)
		{
			scr_load_character_initializing();
			initialized_characters = true;
		}
		file_found = file_find_next()
		if (file_found == "")
		{
			file_find_close();
			scr_load_all_character_portraits();
			
			#region /*Narrator Voice variable handeling*/
			
			#region /*No Narrator*/
			if (global.narrator = -1)
			{
				company_splash = noone;
				controller_splash = noone;
			}
			#endregion /*No Narrator END*/
			
			else
			
			#region /*Character as Narrator*/
			if (global.narrator >= 0)
			{
				if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sounds/voicepack0/company_splash.ogg"))
				{
					company_splash = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sounds/voicepack0/company_splash.ogg");
				}
				else
				if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sounds/voicepack0/company_splash.ogg"))
				{
					company_splash = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sounds/voicepack0/company_splash.ogg");
				}
				else
				{
					company_splash = noone;
				}
				if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sounds/voicepack0/controller_splash.ogg"))
				{
					controller_splash = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sounds/voicepack0/controller_splash.ogg");
				}
				else
				if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sounds/voicepack0/controller_splash.ogg"))
				{
					controller_splash = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sounds/voicepack0/controller_splash.ogg");
				}
				else
				{
					controller_splash = noone;
				}
			}
			#endregion /*Character as Narrator END*/
			
			#endregion /*Narrator Voice variable handeling END*/
			
			load_characters_ok = true;
		}
		else
		{
			file_exists(working_directory + "custom_characters/" + file_found + "/data/character_config.ini")
			ds_list_add(global.all_loaded_characters, file_found)
			
			file_load_timer = 0; /* 1 not 0. So it doesn't do the file_find_first code which it does at 0*/
		}
	}
	#endregion /*Load Characters END*/
	
	else
	
	#region /*Load Title Backgrounds*/
	if (file_load_timer > 1)
	and (load_title_backgrounds_ok = false)
	{
		if (initialized_title_backgrounds = false)
		{
			scr_load_title_background_initializing();
			initialized_title_backgrounds = true;
		}
		file_found = file_find_next()
		if (file_found == "")
		{
			file_find_close();
			load_title_backgrounds_ok = true;
		}
		else
		{
			if (file_exists(working_directory + "custom_title_backgrounds/" + file_found))
			{
				ds_list_add(global.all_loaded_title_backgrounds, file_found)
			}
			
			file_load_timer = 0; /* 1 not 0. So it doesn't do the file_find_first code which it does at 0*/
		}
	}
	#endregion /*Load Title Background END*/
	
}

if (load_characters_ok = true)
and (load_title_backgrounds_ok = true)
{
	can_navigate = true;
}