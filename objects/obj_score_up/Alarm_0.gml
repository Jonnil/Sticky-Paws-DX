if (show_remaining_jumps == false)
{
	if (score_up == "1-up")
	{
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_lives_timer = global.hud_hide_time * 60;
			}
		}
		var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
		{
			lives ++;
			audio_sound_pitch(snd_1up, 1);
			scr_audio_play(snd_1up, volume_source.sound);
			if (global.character_select_in_this_menu == "main_game")
			{
				ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
				ini_write_real("Player", "lives", lives);
				ini_close();
			}
		}
		, [], 1);
		time_source_start(time_source);
	}
	else
	if (score_up == "2-up")
	{
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_lives_timer = global.hud_hide_time * 60;
			}
		}
		var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
		{
			lives ++;
			audio_sound_pitch(snd_1up, 1);
			scr_audio_play(snd_1up, volume_source.sound);
		}
		, [], 1);
		time_source_start(time_source);
		var time_source = time_source_create(time_source_game, 20, time_source_units_frames, function()
		{
			lives ++;
			audio_sound_pitch(snd_1up, 1.1);
			scr_audio_play(snd_1up, volume_source.sound);
			if (global.character_select_in_this_menu == "main_game")
			{
				ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
				ini_write_real("Player", "lives", lives);
				ini_close();
			}
		}
		, [], 1);
		time_source_start(time_source);
	}
	else
	if (score_up == "3-up")
	{
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_lives_timer = global.hud_hide_time * 60;
			}
		}
		var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
		{
			lives ++;
			audio_sound_pitch(snd_1up, 1);
			scr_audio_play(snd_1up, volume_source.sound);
		}
		, [], 1);
		time_source_start(time_source);
		var time_source = time_source_create(time_source_game, 20, time_source_units_frames, function()
		{
			lives ++;
			audio_sound_pitch(snd_1up, 1.1);
			scr_audio_play(snd_1up, volume_source.sound);
		}
		, [], 1);
		time_source_start(time_source);
		var time_source = time_source_create(time_source_game, 30, time_source_units_frames, function()
		{
			lives ++;
			audio_sound_pitch(snd_1up, 1.2);
			scr_audio_play(snd_1up, volume_source.sound);
			if (global.character_select_in_this_menu == "main_game")
			{
				ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
				ini_write_real("Player", "lives", lives);
				ini_close();
			}
		}
		, [], 1);
		time_source_start(time_source);
	}
}