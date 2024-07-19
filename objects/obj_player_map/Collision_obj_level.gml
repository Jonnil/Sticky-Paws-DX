var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

global.select_level_index = other.level; /* Set selected level index to the level closest to you */

#region /* Stop player when touching level */
if (!stop_at_level)
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	stop_at_level = true;
	x = other.x;
	y = other.y;
}
#endregion /* Stop player when touching level END */

#region /* Enter Level */
if (can_enter_level_automatically)
&& (brand_new_file)

|| (can_enter_level >= 30)
&& (speed == 0)
&& (key_a_pressed || mouse_check_button_released(mb_left)
&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 42, 140, display_get_gui_height())
|| point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)))
{
	if (can_move)
	{
		if (other.clear_rate == "enter" || other.clear_rate == "clear")
		{
			
			if (brand_new_file)
			{
				if (music_map != noone)
				{
					audio_sound_gain(music_map, 0, 0);
					audio_stop_sound(music_map);
				}
				audio_stop_all(); /* Stop all sound from playing whenever a brand new file is loaded, so nothing is playing at the loading screen first */
				if (global.loading_music > 0)
				{
					if (!audio_is_playing(global.loading_music)) /* Then after stopping all sound, play the loading music */
					{
						scr_audio_play(global.loading_music, volume_source.music);
					}
				}
			}
			
			#region /* Save Player Position */
			x = other.x;
			y = other.y;
			ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
			ini_write_real("Player", "player_x", x);
			ini_write_real("Player", "player_y", y);
			ini_write_real("Player", "brand_new_file", false);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			#endregion /* Save Player Position END */
			
			can_move = false;
			delay = 0;
			entering_level = true;
			global.checkpoint_x = other.checkpoint_x;
			global.checkpoint_y = other.checkpoint_y;
			global.current_level_clear_rate = other.clear_rate; /* Set the level clear rate to global current clear rate variable for use inside levels, like if a into animation should play or not. Put this code as the last step before closing bracket */
			global.increase_number_of_levels_cleared = other.increase_number_of_levels_cleared;
			global.lives_until_assist = other.lives_until_assist;
			global.spikes_emerge_time = 0;
			score = 0;
			
			with(other)
			{
				if (checkpoint_x > 0 || checkpoint_y > 0)
				{
					global.checkpoint_realmillisecond = checkpoint_realmillisecond;
					global.checkpoint_millisecond = checkpoint_millisecond;
					global.checkpoint_second = checkpoint_second;
					global.checkpoint_minute = checkpoint_minute;
				}
			}
			for(var i = 1; i <= global.max_big_collectible; i += 1)
			{
				global.big_collectible[i] = other.big_collectible[i];
			}
		}
	}
}
#endregion /* Enter Level END */

#region /* Clear Level in debug */
if (key_b_pressed)
|| (global.controls_used_for_navigation == "mouse")
&& (mouse_check_button_released(mb_left))
&& (point_in_rectangle(mouse_get_x, mouse_get_y, 141, display_get_gui_height() - 42, 140 + 140, display_get_gui_height()))
{
	if (global.debug_screen)
	&& (can_move)
	&& (can_enter_level >= 30)
	&& (speed == 0)
	&& (other.clear_rate = "enter")
	{
		with (other)
		{
			clear_rate = "clear";
			alarm[1] = 2;
		}
		with (instance_nearest(x, y, obj_map_exit))
		{
			alarm[0] = 1;
		}
		
		#region /* Save Player Position */
		x = other.x;
		y = other.y;
		ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
		ini_write_real("Player", "player_x", x);
		ini_write_real("Player", "player_y", y);
		ini_write_real("Player", "brand_new_file", false);
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		#endregion /* Save Player Position END */
		
		if (global.character_select_in_this_menu == "main_game")
		{
			var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
			ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
			ini_write_string(level_name, "clear_rate", "clear"); /* Make the level clear after checking number of levels cleared */
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
	}
}
#endregion /* Clear Level in debug END */