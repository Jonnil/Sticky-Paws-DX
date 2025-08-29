if (!show_remaining_jumps && above_gui)
{
	depth = -1510;
}
if (!show_remaining_jumps)
{
	if (score_up == "1-up")
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.hud_show_lives_timer = global.hud_hide_time * 60;
		}
		var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
		{
			if (lives < 99)
			{
				lives++;
			}
			audio_sound_pitch(snd_1up, 1);
			scr_audio_play(snd_1up, volume_source.sound);
			if (global.character_select_in_this_menu == "main_game")
			{
				ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
				ini_write_real("Player", "lives", lives);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
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
			obj_camera.hud_show_lives_timer = global.hud_hide_time * 60;
		}
		var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
		{
			if (lives < 99)
			{
				lives++;
			}
			audio_sound_pitch(snd_1up, 1);
			scr_audio_play(snd_1up, volume_source.sound);
		}
		, [], 1);
		time_source_start(time_source);
		var time_source = time_source_create(time_source_game, 20, time_source_units_frames, function()
		{
			if (lives < 99)
			{
				lives++;
			}
			audio_sound_pitch(snd_1up, 1.1);
			scr_audio_play(snd_1up, volume_source.sound);
			if (global.character_select_in_this_menu == "main_game")
			{
				ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
				ini_write_real("Player", "lives", lives);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
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
			obj_camera.hud_show_lives_timer = global.hud_hide_time * 60;
		}
		var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
		{
			if (lives < 99)
			{
				lives++;
			}
			audio_sound_pitch(snd_1up, 1);
			scr_audio_play(snd_1up, volume_source.sound);
		}
		, [], 1);
		time_source_start(time_source);
		var time_source = time_source_create(time_source_game, 20, time_source_units_frames, function()
		{
			if (lives < 99)
			{
				lives++;
			}
			audio_sound_pitch(snd_1up, 1.1);
			scr_audio_play(snd_1up, volume_source.sound);
		}
		, [], 1);
		time_source_start(time_source);
		var time_source = time_source_create(time_source_game, 30, time_source_units_frames, function()
		{
			if (lives < 99)
			{
				lives++;
			}
			audio_sound_pitch(snd_1up, 1.2);
			scr_audio_play(snd_1up, volume_source.sound);
			if (global.character_select_in_this_menu == "main_game")
			{
				ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
				ini_write_real("Player", "lives", lives);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
		}
		, [], 1);
		time_source_start(time_source);
	}
}
