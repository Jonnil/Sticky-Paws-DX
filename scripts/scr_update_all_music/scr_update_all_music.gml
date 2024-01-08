function scr_update_all_music()
{
	
	#region /* Get default music if they exist */
	if (global.character_select_in_this_menu == "level_editor")
	{
		ini_open(global.use_cache_or_working + "custom_levels/" + global.level_name + "/data/level_information.ini");
		global.default_music_overworld = ini_read_string("info", "default_music_overworld", "level1");
		global.default_music_underwater = ini_read_string("info", "default_music_underwater", "level1");
		global.default_ambience_overworld = ini_read_string("info", "default_ambience_overworld", "level1");
		global.default_ambience_underwater = ini_read_string("info", "default_ambience_underwater", "level1");
		global.default_clear_melody = ini_read_string("info", "default_clear_melody", "level1");
		ini_close();
	}
	#endregion /* Get default music if they exist END */
	
	#region /* Custom Music */
	
	if (audio_exists(global.music))
	{
		audio_destroy_stream(global.music);
	}
	if (audio_exists(global.music_underwater))
	{	
		audio_destroy_stream(global.music_underwater);
	}
	if (audio_exists(global.ambience))
	{	
		audio_destroy_stream(global.ambience);
	}
	if (audio_exists(global.ambience_underwater))
	{	
		audio_destroy_stream(global.ambience_underwater);
	}
	if (audio_exists(global.level_clear_melody))
	{	
		audio_destroy_stream(global.level_clear_melody);
	}
	
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
	if (global.can_load_custom_level_assets)
	&& (file_exists(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/music.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		global.music = audio_create_stream(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/music.ogg");
	}
	else
	if (global.character_select_in_this_menu == "level_editor" && global.default_music_overworld != noone)
	&& (file_exists("levels/" + string(global.default_music_overworld) + "/sound/music.ogg"))
	{
		global.music = audio_create_stream("levels/" + string(global.default_music_overworld) + "/sound/music.ogg");
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
	if (global.can_load_custom_level_assets)
	&& (file_exists(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/music_underwater.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		global.music_underwater = audio_create_stream(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/music_underwater.ogg");
	}
	else
	if (global.character_select_in_this_menu == "level_editor" && global.default_music_underwater != noone)
	&& (file_exists("levels/" + string(global.default_music_underwater) + "/sound/music_underwater.ogg"))
	{
		global.music_underwater = audio_create_stream("levels/" + string(global.default_music_underwater) + "/sound/music_underwater.ogg");
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
	if (global.can_load_custom_level_assets)
	&& (file_exists(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/ambience.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		global.ambience = audio_create_stream(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/ambience.ogg");
	}
	else
	if (global.character_select_in_this_menu == "level_editor" && global.default_ambience_overworld != noone)
	&& (file_exists("levels/" + string(global.default_ambience_overworld) + "/sound/ambience.ogg"))
	{
		global.ambience = audio_create_stream("levels/" + string(global.default_ambience_overworld) + "/sound/ambience.ogg");
	}
	else
	{
		global.ambience = noone;
	}
	#endregion /* Update Ambience END */
	
	#region /* Update Ambience Underwater */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience_underwater.ogg"))
	&& (global.character_select_in_this_menu == "main_game")
	|| (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience_underwater.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	&& (global.create_level_from_template >= true)
	{
		global.ambience_underwater = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/ambience_underwater.ogg");
	}
	else
	/* OGG small letter File */
	if (global.can_load_custom_level_assets)
	&& (file_exists(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/ambience_underwater.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		global.ambience_underwater = audio_create_stream(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/ambience_underwater.ogg");
	}
	else
	if (global.character_select_in_this_menu == "level_editor" && global.default_ambience_underwater != noone)
	&& (file_exists("levels/" + string(global.default_ambience_underwater) + "/sound/ambience_underwater.ogg"))
	{
		global.ambience_underwater = audio_create_stream("levels/" + string(global.default_ambience_underwater) + "/sound/ambience_underwater.ogg");
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
	if (global.can_load_custom_level_assets)
	&& (file_exists(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/clear_melody.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		global.level_clear_melody = audio_create_stream(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/clear_melody.ogg");
	}
	else
	if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/clear_melody.ogg"))
	{
		global.level_clear_melody = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/clear_melody.ogg");
	}
	else
	if (file_exists(global.use_cache_or_working + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/clear_melody.ogg"))
	{
		global.level_clear_melody = audio_create_stream(global.use_cache_or_working + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/clear_melody.ogg");
	}
	else
	if (global.character_select_in_this_menu == "level_editor" && global.default_clear_melody != noone)
	&& (file_exists("levels/" + string(global.default_clear_melody) + "/sound/clear_melody.ogg"))
	{
		global.level_clear_melody = audio_create_stream("levels/" + string(global.default_clear_melody) + "/sound/clear_melody.ogg");
	}
	else
	{
		global.level_clear_melody = noone;
	}
	#endregion /* Update Level Clear Melody END */
	
	#endregion /* Custom Music END */
	
}