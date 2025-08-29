function scr_get_voice(sound_names)
{

	#region /* Define a get voice function to reduce code duplication */
	var voice = noone;
	var file_path = character_folder + voicepack_folder + sound_names; /* "voicepack folder" variable includes a / already, so don't write + "/" + after that variable, or you will get double // by mistake */

	if (file_exists(string(file_path)))
	{
		voice = audio_create_stream(string(file_path));
	}
	else
	{
		var voice = noone;
	}

	return voice;
	#endregion /* Define a get voice function to reduce code duplication END */

}
