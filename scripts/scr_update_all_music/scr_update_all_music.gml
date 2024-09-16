function scr_update_all_music()
{
	
	#region /* Load Default Music Data */
	if (global.character_select_in_this_menu == "level_editor")
	{
		ini_open(global.use_temp_or_working + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		global.default_music_overworld = ini_read_string("info", "default_music_overworld", "level1");
		global.default_music_underwater = ini_read_string("info", "default_music_underwater", "level1");
		global.default_ambience_overworld = ini_read_string("info", "default_ambience_overworld", "level1");
		global.default_ambience_underwater = ini_read_string("info", "default_ambience_underwater", "level1");
		global.default_clear_melody = ini_read_string("info", "default_clear_melody", "level1");
		ini_close();
		switch_save_data_commit();
		show_debug_message("Default music and ambience loaded from level_information.ini");
	}
	#endregion /* Load Default Music Data END */
	
	#region /* Destroy Existing Audio Streams */
	var audio_streams = [global.music, global.music_underwater, global.ambience, global.ambience_underwater, global.level_clear_melody];
	var stream_names = ["music", "music_underwater", "ambience", "ambience_underwater", "level_clear_melody"];
	
	for (var i = 0; i < array_length(audio_streams); i++)
	{
		if (audio_streams[i] != noone && audio_exists(audio_streams[i]))
		{
			audio_destroy_stream(audio_streams[i]);
			show_debug_message("Destroyed existing " + stream_names[i] + " stream.");
		}
	}
	#endregion /* Destroy Existing Audio Streams END */
	
	function load_audio(filename, default_filename, audio_asset_path)
	{
		if (file_exists(audio_asset_path + filename))
		{
			return audio_create_stream(audio_asset_path + filename);
		}
		else
		if (global.character_select_in_this_menu == "level_editor" && default_filename != noone &&
		file_exists("levels/" + string(default_filename) + "/sound/" + filename))
		{
			return audio_create_stream("levels/" + string(default_filename) + "/sound/" + filename);
		}
		return noone;
	}
	
	#region /* Load Music Streams */
	var base_path = global.character_select_in_this_menu == "main_game" ? 
					"levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/" : 
					global.use_temp_or_working + "custom_levels/" + string(global.level_name) + "/sound/";
	
	global.music = load_audio("music.ogg", global.default_music_overworld, base_path);
	global.music_underwater = load_audio("music_underwater.ogg", global.default_music_underwater, base_path);
	global.ambience = load_audio("ambience.ogg", global.default_ambience_overworld, base_path);
	global.ambience_underwater = load_audio("ambience_underwater.ogg", global.default_ambience_underwater, base_path);
	global.level_clear_melody = load_audio("level_clear_melody.ogg", global.default_clear_melody, base_path);
	#endregion /* Load Music Streams END */
	
	#region /* Debug Messages */
	var audio_debug_names = ["music", "music_underwater", "ambience", "ambience_underwater", "level_clear_melody"];
	var audio_globals = [global.music, global.music_underwater, global.ambience, global.ambience_underwater, global.level_clear_melody];
	
	for (var j = 0; j < array_length(audio_globals); j++)
	{
		if (audio_globals[j] != noone)
		{
			show_debug_message("Loaded " + audio_debug_names[j] + ": " + base_path + audio_debug_names[j] + ".ogg");
		}
		else
		{
			show_debug_message("No " + audio_debug_names[j] + " file found. global." + audio_debug_names[j] + " set to noone.");
		}
	}
	#endregion /* Debug Messages END */
	
}