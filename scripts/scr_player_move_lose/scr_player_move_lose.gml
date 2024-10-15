function scr_player_move_lose()
{
	
	#region /* Die */
	if (die)
	&& (!goal)
	{
		scr_gamepad_vibration(player, 1, 30);
		
		#region /* Update Checkpoint Time */
		global.checkpoint_millisecond = global.timeattack_millisecond;
		global.checkpoint_second = global.timeattack_second;
		global.checkpoint_minute = global.timeattack_minute;
		global.checkpoint_realmillisecond = global.timeattack_realmillisecond;
		#endregion /* Update Checkpoint Time END */
		
		#region /* Update Level Editor Checkpoint Time */
		if (room == rm_leveleditor)
		&& (global.actually_play_edited_level)
		&& (global.character_select_in_this_menu == "level_editor")
		{
			ini_open(game_save_id + "save_file/custom_level_save.ini");
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_millisecond", global.timeattack_millisecond);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_second", global.timeattack_second);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_minute", global.timeattack_minute);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_realmillisecond", global.timeattack_realmillisecond);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		#endregion /* Update Level Editor Checkpoint Time END */
		
		if (instance_number(obj_player) <= 1)
		{
			if (global.music != noone)
			{
				audio_sound_gain(global.music, 0, 0);
				audio_stop_sound(global.music);
			}
			if (global.music_underwater != noone)
			{
				audio_sound_gain(global.music_underwater, 0, 0);
				audio_stop_sound(global.music_underwater);
			}
			global.music = noone;
			global.music_underwater = noone;
			audio_stop_sound(snd_skidding);
			audio_stop_sound(snd_skidding_ice);
			audio_stop_sound(snd_skiddingvertical);
		}
		speed = 0;
		invincible_timer = false;
		scr_audio_play(snd_lose, volume_source.sound);
		
		#region /* Turn into obj_player_lose */
		with(instance_create_depth(x, y, 0, obj_player_lose))
		{
			var instance_nearest_player = instance_nearest(x, y, obj_player);
			player = instance_nearest_player.player;
			if (instance_nearest_player.burnt >= 1)
			&& (instance_nearest_player.sprite_burnt > noone)
			{
				burnt = true;
				sprite_index = instance_nearest_player.sprite_burnt;
			}
			else
			if (instance_nearest_player.sprite_die > noone)
			{
				sprite_index = instance_nearest_player.sprite_die;
			}
			else
			if (instance_nearest_player.sprite_idle > noone)
			{
				sprite_index = instance_nearest_player.sprite_idle;
			}
			else
			if (instance_nearest_player.sprite_walk > noone)
			{
				sprite_index = instance_nearest_player.sprite_walk;
			}
			if (instance_nearest_player.sprite_game_over_character_portrait > noone)
			{
				sprite_game_over_character_portrait = instance_nearest_player.sprite_game_over_character_portrait;
			}
			player_lose_melody = instance_nearest_player.player_lose_melody;
			voice_damage = instance_nearest_player.voice_damage;
			voice_burned_die = instance_nearest_player.voice_burned_die;
			default_voice_pitch = instance_nearest_player.default_voice_pitch;
			default_xscale = instance_nearest_player.default_xscale;
			default_yscale = instance_nearest_player.default_yscale;
			image_xscale = instance_nearest_player.image_xscale;
		}
		#endregion /* Turn into obj_player_lose END */
		
		#region /* Stop invincibility music if you're the last player dying */
		if (instance_number(obj_player) == 1)
		{
			audio_stop_sound(music_invincible);
		}
		#endregion /* Stop invincibility music if you're the last player dying END */
		
		instance_destroy();
	}
	#endregion /* Die END */
	
}