function scr_player_move_goal()
{
	
	#region /* Goal */
	if (instance_exists(obj_goal))
	{
		if (distance_to_object(obj_goal) < 1920)
		{
			
			#region /* Touching goal */
			if (x > instance_nearest(x, y, obj_goal).bbox_right)
			&& (x < instance_nearest(x, y, obj_goal).bbox_right + 16)
			&& (y < instance_nearest(x, y, obj_goal).bbox_bottom)
			&& (goal == false)
			&& (!collision_line(x, y, instance_nearest(x, y, obj_goal).x, instance_nearest(x, y, obj_goal).y, obj_wall, false, true))
			&& (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_goal).x + 1, instance_nearest(x, y, obj_goal).y + 1, obj_wall, false, true))
			|| (place_meeting(x, y, obj_goal))
			&& (goal == false)
			{
				just_hit_goal = true;
				obj_goal.goal = true;
			}
			#endregion /* Touching goal END */
			
			else
			
			#region /* Can't walk back when touched goal */
			if (x < instance_nearest(x, y, obj_goal).x)
			&& (goal)
			{
				x = instance_nearest(x, y, obj_goal).x;
			}
			#endregion /* Can't walk back when touched goal END */
			
			if (just_hit_goal)
			&& (goal == false)
			{
				if (!instance_exists(obj_camera.player1))
				{
					global.player_can_play[1] = false;
				}
				if (!instance_exists(obj_camera.player2))
				{
					global.player_can_play[2] = false;
				}
				if (!instance_exists(obj_camera.player3))
				{
					global.player_can_play[3] = false;
				}
				if (!instance_exists(obj_camera.player4))
				{
					global.player_can_play[4] = false;
				}
				global.level_clear_rate = "clear";
				global.goal_active = true;
				global.player_has_entered_goal = true;
				/* global quit level, global quit to map, global quit to title, and custom restart level, are all going to stay at false, so no need to set it to false here. You can't change these to true while winning level */
				instance_nearest(x, y, obj_goal).image_index = 1;
				invincible_timer = false;
				
				if (instance_nearest(x, y, obj_goal).trigger_ending)
				{
					global.trigger_ending = true;
				}
				
				#region /* Stop Music */
				audio_stop_sound(global.music);
				audio_stop_sound(global.music_underwater);
				global.music = noone;
				global.music_underwater = noone;
				music = noone;
				music_underwater = noone;
				#endregion /* Stop Music END */
				
				#region /* Save Checkpoint */
				if (room == rm_leveleditor)
				&& (global.character_select_in_this_menu == "main_game")
				{
					global.checkpoint_x = 0;
					global.checkpoint_y = 0;
					global.checkpoint_millisecond = 0;
					global.checkpoint_second = 0;
					global.checkpoint_minute = 0;
					global.checkpoint_realmillisecond = 0;
					
					var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
					
					ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
					ini_write_real(level_name, "checkpoint_x", 0);
					ini_write_real(level_name, "checkpoint_y", 0);
					ini_write_real(level_name, "checkpoint_millisecond", 0);
					ini_write_real(level_name, "checkpoint_second", 0);
					ini_write_real(level_name, "checkpoint_minute", 0);
					ini_write_real(level_name, "checkpoint_realmillisecond", 0);
					ini_write_real(level_name, "checkpoint_direction", +1);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (room == rm_leveleditor)
				&& (global.character_select_in_this_menu == "level_editor")
				{
					global.checkpoint_x = 0;
					global.checkpoint_y = 0;
					global.checkpoint_millisecond = 0;
					global.checkpoint_second = 0;
					global.checkpoint_minute = 0;
					global.checkpoint_realmillisecond = 0;
					
					var level_name = global.level_name;
					
					ini_open(working_directory + "save_file/custom_level_save.ini");
					ini_write_real(level_name, "checkpoint_x", 0);
					ini_write_real(level_name, "checkpoint_y", 0);
					ini_write_real(level_name, "checkpoint_millisecond", 0);
					ini_write_real(level_name, "checkpoint_second", 0);
					ini_write_real(level_name, "checkpoint_minute", 0);
					ini_write_real(level_name, "checkpoint_realmillisecond", 0);
					ini_write_real(level_name, "checkpoint_direction", +1);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Save Checkpoint END */
				
				scr_audio_play(voice_enter_goal, volume_source.voice);
				
				#region /* Level Clear Melody */
				if (global.level_clear_melody > noone)
				&& (!audio_is_playing(global.level_clear_melody))
				{
					scr_audio_play(global.level_clear_melody, volume_source.melody);
				}
				#endregion /* Level Clear Melody END */
				
				goal = true; /* Set goal to true on last line */
			}
		}
	}
	#endregion /* Goal END */
	
}