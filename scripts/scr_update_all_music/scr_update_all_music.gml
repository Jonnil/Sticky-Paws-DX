function scr_update_all_music()
{
	
	#region /* Get default music if they exist */
	ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
	var default_overworld_music = ini_read_string("info", "default_overworld_music", "level1");
	var default_underwater_music = ini_read_string("info", "default_underwater_music", "level1");
	var default_overworld_ambience = ini_read_string("info", "default_overworld_ambience", "level1");
	var default_underwater_ambience = ini_read_string("info", "default_underwater_ambience", "level1");
	var default_clear_melody = ini_read_string("info", "default_clear_melody", "level1");
	ini_close();
	#endregion /* Get default music if they exist END */
	
	#region /* Custom Music */
	
	audio_destroy_stream(global.music);
	audio_destroy_stream(global.music_underwater);
	audio_destroy_stream(global.ambience);
	audio_destroy_stream(global.ambience_underwater);
	audio_destroy_stream(global.level_clear_melody);
	
	#region /* Update Music */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg"))
	&& (global.character_select_in_this_menu == "main_game")
	|| (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	&& (global.create_level_from_template >= true)
	{
		global.music = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music.ogg");
	}
	else
	/* OGG small letter File */
	if (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/sound/music.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		global.music = audio_create_stream(working_directory + "custom_levels/" + string(global.level_name) + "/sound/music.ogg");
	}
	else
	if (default_overworld_music != noone)
	&& (file_exists("levels/" + string(default_overworld_music) + "/sound/music.ogg"))
	{
		global.music = audio_create_stream("levels/" + string(default_overworld_music) + "/sound/music.ogg");
	}
	else
	{
		global.music = noone;
	}
	#endregion /* Update Music END */
	
	#region /* Update Music Underwater */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music_underwater.ogg"))
	&& (global.character_select_in_this_menu == "main_game")
	|| (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music_underwater.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	&& (global.create_level_from_template >= true)
	{
		global.music_underwater = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/music_underwater.ogg");
	}
	else
	/* OGG small letter File */
	if (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/sound/music_underwater.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		global.music_underwater = audio_create_stream(working_directory + "custom_levels/" + string(global.level_name) + "/sound/music_underwater.ogg");
	}
	else
	if (default_underwater_music != noone)
	&& (file_exists("levels/" + string(default_underwater_music) + "/sound/music_underwater.ogg"))
	{
		global.music_underwater = audio_create_stream("levels/" + string(default_underwater_music) + "/sound/music_underwater.ogg");
	}
	else
	{
		global.music_underwater = noone;
	}
	#endregion /* Update Music Underwater END */
	
	#region /* Update Ambience */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg"))
	&& (global.character_select_in_this_menu == "main_game")
	|| (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	&& (global.create_level_from_template >= true)
	{
		global.ambience = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience.ogg");
	}
	else
	/* OGG small letter File */
	if (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/sound/ambience.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		global.ambience = audio_create_stream(working_directory + "custom_levels/" + string(global.level_name) + "/sound/ambience.ogg");
	}
	else
	if (default_overworld_ambience != noone)
	&& (file_exists("levels/" + string(default_overworld_ambience) + "/sound/ambience.ogg"))
	{
		global.ambience = audio_create_stream("levels/" + string(default_overworld_ambience) + "/sound/ambience.ogg");
	}
	else
	{
		global.ambience = noone;
	}
	#endregion /* Update Ambience END */
	
	#region /* Update Ambience Underwater */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience/ambience_underwater.ogg"))
	&& (global.character_select_in_this_menu == "main_game")
	|| (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience/ambience_underwater.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	&& (global.create_level_from_template >= true)
	{
		global.ambience_underwater = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience/ambience_underwater.ogg");
	}
	else
	/* OGG small letter File */
	if (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/sound/ambience/ambience_underwater.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		global.ambience_underwater = audio_create_stream(working_directory + "custom_levels/" + string(global.level_name) + "/sound/ambience/ambience_underwater.ogg");
	}
	else
	if (default_underwater_ambience != noone)
	&& (file_exists("levels/" + string(default_underwater_ambience) + "/sound/ambience_underwater.ogg"))
	{
		global.ambience_underwater = audio_create_stream("levels/" + string(default_underwater_ambience) + "/sound/ambience_underwater.ogg");
	}
	else
	{
		global.ambience_underwater = noone;
	}
	#endregion /* Update Ambience Underwater END */
	
	#region /* Update Level Clear Melody */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/clear_melody.ogg"))
	&& (global.character_select_in_this_menu == "main_game")
	|| (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/clear_melody.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	&& (global.create_level_from_template)
	{
		global.level_clear_melody = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/clear_melody.ogg");
	}
	else
	/* OGG small letter File */
	if (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/sound/clear_melody.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		global.level_clear_melody = audio_create_stream(working_directory + "custom_levels/" + string(global.level_name) + "/sound/clear_melody.ogg");
	}
	else
	if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/clear_melody.ogg"))
	{
		global.level_clear_melody = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/clear_melody.ogg");
	}
	else
	if (file_exists(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/clear_melody.ogg"))
	{
		global.level_clear_melody = audio_create_stream(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/clear_melody.ogg");
	}
	else
	if (default_clear_melody != noone)
	&& (file_exists("levels/" + string(default_clear_melody) + "/sound/clear_melody.ogg"))
	{
		global.level_clear_melody = audio_create_stream("levels/" + string(default_clear_melody) + "/sound/clear_melody.ogg");
	}
	else
	{
		global.level_clear_melody = noone;
	}
	#endregion /* Update Level Clear Melody END */
	
	#endregion /* Custom Music END */
	
}