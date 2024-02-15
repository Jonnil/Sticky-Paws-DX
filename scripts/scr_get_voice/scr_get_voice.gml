function scr_get_voice(sound_names)
{
	
	#region /* Define a fet voice function to reduce code duplication */
	var voice = noone;
	var file_path = character_folder + voicepack_folder + "/" + sound_names;
	if (file_exists(file_path)) {
		voice = audio_create_stream(file_path);
	}
	
	return voice;
	#endregion /* Define a get voice function to reduce code duplication END */
	
}