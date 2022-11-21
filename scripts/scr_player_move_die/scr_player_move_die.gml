function scr_player_move_die()
{
	
	#region /* Die */
	if (die == true)
	and (goal == false)
	{
		scr_gamepad_vibration(player, 1, 30);
		
		#region /* Update Checkpoint Time */
		global.checkpoint_millisecond = global.timeattack_millisecond;
		global.checkpoint_second = global.timeattack_second;
		global.checkpoint_minute = global.timeattack_minute;
		global.checkpoint_realmillisecond = global.timeattack_realmillisecond;
		#endregion /* Update Checkpoint Time END */
		
		#region /* Update Level Editor Checkpoint Time */
		if (asset_get_type("room_leveleditor") == asset_room)
		and (room == room_leveleditor)
		and (global.actually_play_edited_level == true)
		and (global.character_select_in_this_menu == "level_editor")
		{
			ini_open(working_directory + "/save_files/custom_level_save.ini");
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_millisecond", global.timeattack_millisecond);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_second", global.timeattack_second);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_minute", global.timeattack_minute);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_realmillisecond", global.timeattack_realmillisecond);
			ini_close();
		}
		#endregion /* Update Level Editor Checkpoint Time END */
		
		if (asset_get_type("obj_player") == asset_object)
		and (global.pause == false)
		{
			if (instance_number(obj_player) <= 1)
			{
				audio_stop_sound(global.music);
				audio_stop_sound(global.music_underwater);
				music = noone;
				music_underwater = noone;
				if (asset_get_type("snd_skidding") == asset_sound)
				{
					audio_stop_sound(snd_skidding);
				}
				if (asset_get_type("snd_skidding_ice") == asset_sound)
				{
					audio_stop_sound(snd_skidding_ice);
				}
				if (asset_get_type("snd_skiddingvertical") == asset_sound)
				{
					audio_stop_sound(snd_skiddingvertical);
				}
			}
			speed = 0;
			takendamage = 0;
			invincible_timer = false;
			scr_audio_play(snd_die, volume_source.sound);
			
			#region /* Turn into obj_player_die */
			if (asset_get_type("obj_player_die") == asset_object)
			{
				
				#region /* Player 1 Die */
				if (player == 1)
				{
					with(instance_create_depth(x, y, 0, obj_player_die))
					{
						player = 1;
						if (instance_nearest(x, y, obj_player).sprite_die > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_die;
						}
						else
						if (instance_nearest(x, y, obj_player).sprite_stand > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_stand;
						}
						else
						if (instance_nearest(x, y, obj_player).sprite_walk > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_walk;
						}
						if (instance_nearest(x, y, obj_player).sprite_game_over_character_portrait > noone)
						{
							sprite_game_over_character_portrait = instance_nearest(x, y, obj_player).sprite_game_over_character_portrait;
						}
						voice_damage = instance_nearest(x, y, obj_player).voice_damage;
						default_voice_pitch = instance_nearest(x, y, obj_player).default_voice_pitch;
						default_xscale = instance_nearest(x, y, obj_player).default_xscale;
						default_yscale = instance_nearest(x, y, obj_player).default_yscale;
					}
				}
				#endregion /* Player 1 Die END */
				
				else
				
				#region /* Player 2 Die */
				if (player == 2)
				{
					with(instance_create_depth(x, y, 0, obj_player_die))
					{
						player = 2;
						if (instance_nearest(x, y, obj_player).sprite_die > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_die;
						}
						else
						if (instance_nearest(x, y, obj_player).sprite_stand > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_stand;
						}
						else
						if (instance_nearest(x, y, obj_player).sprite_walk > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_walk;
						}
						if (instance_nearest(x, y, obj_player).sprite_game_over_character_portrait > noone)
						{
							sprite_game_over_character_portrait = instance_nearest(x, y, obj_player).sprite_game_over_character_portrait;
						}
						voice_damage = instance_nearest(x, y, obj_player).voice_damage;
						default_voice_pitch = instance_nearest(x, y, obj_player).default_voice_pitch;
						default_xscale = instance_nearest(x, y, obj_player).default_xscale;
						default_yscale = instance_nearest(x, y, obj_player).default_yscale;
					}
				}
				#endregion /* Player 2 Die END */
				
				else
				
				#region /* Player 3 Die */
				if (player == 3)
				{
					with(instance_create_depth(x, y, 0, obj_player_die))
					{
						player = 3;
						if (instance_nearest(x, y, obj_player).sprite_die > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_die;
						}
						else
						if (instance_nearest(x, y, obj_player).sprite_stand > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_stand;
						}
						else
						if (instance_nearest(x, y, obj_player).sprite_walk > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_walk;
						}
						if (instance_nearest(x, y, obj_player).sprite_game_over_character_portrait > noone)
						{
							sprite_game_over_character_portrait = instance_nearest(x, y, obj_player).sprite_game_over_character_portrait;
						}
						voice_damage = instance_nearest(x, y, obj_player).voice_damage;
						default_voice_pitch = instance_nearest(x, y, obj_player).default_voice_pitch;
						default_xscale = instance_nearest(x, y, obj_player).default_xscale;
						default_yscale = instance_nearest(x, y, obj_player).default_yscale;
					}
				}
				#endregion /* Player 3 Die END */
				
				else
				
				#region /* Player 4 Die */
				if (player == 4)
				{
					with(instance_create_depth(x, y, 0, obj_player_die))
					{
						player = 4;
						if (instance_nearest(x, y, obj_player).sprite_die > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_die;
						}
						else
						if (instance_nearest(x, y, obj_player).sprite_stand > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_stand;
						}
						else
						if (instance_nearest(x, y, obj_player).sprite_walk > noone)
						{
							sprite_index = instance_nearest(x, y, obj_player).sprite_walk;
						}
						if (instance_nearest(x, y, obj_player).sprite_game_over_character_portrait > noone)
						{
							sprite_game_over_character_portrait = instance_nearest(x, y, obj_player).sprite_game_over_character_portrait;
						}
						voice_damage = instance_nearest(x, y, obj_player).voice_damage;
						default_voice_pitch = instance_nearest(x, y, obj_player).default_voice_pitch;
						default_xscale = instance_nearest(x, y, obj_player).default_xscale;
						default_yscale = instance_nearest(x, y, obj_player).default_yscale;
					}
				}
				#endregion /* Player 4 Die END */
				
			}
			#endregion /* Turn into obj_player_die END */
			
			else
			{
				room_restart();
			}
			
			#region /* Stop invincibility music if you're the last player dying */
			if (asset_get_type("obj_player") == asset_object)
			and (global.pause == false)
			and (instance_number(obj_player) == 1)
			{
				audio_stop_sound(music_invincible);
			}
			#endregion /* Stop invincibility music if you're the last player dying END */
			
			instance_destroy();
		}
	}
	#endregion /* Die END */
	
}