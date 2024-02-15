function scr_get_voice(sound_names)
{
	
	#region /* Define a fet voice function to reduce code duplication */
	var character_name = string(global.all_loaded_characters[| global.character_index[player - 1]]);
	var sound_dir = "sound/voicepack" + string(selected_voice_pack);
	var custom_sound_dir = game_save_id + "custom_characters/" + character_name + "/" + sound_dir;
	
	var voice = noone;
	for(var i = 0, len = array_length(sound_names); i < len && voice == noone; i++) {
		var file_path = "characters/" + character_name + "/" + sound_dir + "/" + sound_names[i];
		if (file_exists(file_path)) {
			voice = audio_create_stream(file_path);
		}
		else if (file_exists(custom_sound_dir + "/" + sound_names[i])) {
			voice = audio_create_stream(custom_sound_dir + "/" + sound_names[i]);
		}
	}
	
	return voice;
	#endregion /* Define a get voice function to reduce code duplication END */
	
}