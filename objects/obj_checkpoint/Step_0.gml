if (get_rewards_cooldown > 0)
{
	get_rewards_cooldown --;
}

if (asset_get_type("obj_player") == asset_object)
&& (instance_exists(obj_player))
{
	if (global.checkpoint_x != x)
	|| (global.checkpoint_y != y)
	{
		if (instance_nearest(x, y, obj_player).x > x - 32)
		&& (instance_nearest(x, y, obj_player).x < x + 32)
		&& (instance_nearest(x, y, obj_player).y < y)
		|| (place_meeting(x, y, instance_nearest(x, y, obj_player)))
		{
			if (asset_get_type("obj_wall") == asset_object)
			&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
			&& (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_player).x + 1, instance_nearest(x, y, obj_player).y + 1, obj_wall, false, true))
			{
				if (checkpoint_activated == false)
				{
					checkpoint_activated = true;
					checkpoint_which_player = instance_nearest(x, y, obj_player).player;
					
					if (get_rewards_cooldown <= 0)
					{
						with(instance_nearest(x, y, obj_player))
						{
							hp ++;
						}
						effect_create_below(ef_ring, x, y, 2, c_white);
						
						#region /* Collect 10 basic collectibles */
						if (asset_get_type("obj_basic_collectible") == asset_object)
						{
							scr_audio_play(snd_basic_collectible, volume_source.sound);
							with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
							{
								image_speed = 1;
								motion_set(90, 10);
								bounce_up = true;
							}
							with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
							{
								image_speed = 1;
								motion_set(90, 10);
								bounce_up = true;
								delay_time = 10;
							}
							with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
							{
								image_speed = 1;
								motion_set(90, 10);
								bounce_up = true;
								delay_time = 20;
							}
							with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
							{
								image_speed = 1;
								motion_set(90, 10);
								bounce_up = true;
								delay_time = 30;
							}
							with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
							{
								image_speed = 1;
								motion_set(90, 10);
								bounce_up = true;
								delay_time = 40;
							}
							with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
							{
								image_speed = 1;
								motion_set(90, 10);
								bounce_up = true;
								delay_time = 50;
							}
							with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
							{
								image_speed = 1;
								motion_set(90, 10);
								bounce_up = true;
								delay_time = 60;
							}
							with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
							{
								image_speed = 1;
								motion_set(90, 10);
								bounce_up = true;
								delay_time = 70;
							}
							with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
							{
								image_speed = 1;
								motion_set(90, 10);
								bounce_up = true;
								delay_time = 80;
							}
							with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
							{
								image_speed = 1;
								motion_set(90, 10);
								bounce_up = true;
								delay_time = 90;
							}
					
							#region /* 2000 Score */
							score += 2000;
							if (asset_get_type("obj_score_up") == asset_object)
							{
								with(instance_create_depth(x, y, 0, obj_score_up))
								{
									score_up = 2000;
								}
							}
							#endregion /* 2000 Score END */
							
							#region /* Checkpoint text when touching the checkpoint, so everybody knows that this is a checkpoint */
							if (asset_get_type("obj_score_up") == asset_object)
							{
								with(instance_create_depth(x, y - 20, 0, obj_score_up))
								{
									checkpoint_number = instance_nearest(x, y, obj_checkpoint).checkpoint_number;
									checkpoint_number_max = instance_nearest(x, y, obj_checkpoint).checkpoint_number_max;
									score_up = "checkpoint";
								}
							}
							#endregion /* Checkpoint text when touching the checkpoint, so everybody knows that this is a checkpoint END */
						}
						#endregion /* Collect 10 basic collectibles END */
						
					}
					
					if (global.doing_clear_check == false) /* Don't save these things if you're doing a clear check. You need to restart from the very start if you lose, regardless if you hit checkpoints */
					{
						global.checkpoint_x = xstart;
						global.checkpoint_y = ystart;
						global.checkpoint_millisecond = global.timeattack_millisecond;
						global.checkpoint_second = global.timeattack_second;
						global.checkpoint_minute = global.timeattack_minute;
						global.checkpoint_realmillisecond = global.timeattack_realmillisecond;
						
						#region /* Save Level Editor Checkpoint */
						if (asset_get_type("room_leveleditor") == asset_room)
						&& (room == room_leveleditor)
						&& (global.character_select_in_this_menu == "main_game")
						&& (global.actually_play_edited_level)
						{
							var uppercase_level_name;
							uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
							uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
							var level_name = string(uppercase_level_name);
							
							ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
							ini_write_real(level_name, "checkpoint_x", x);
							ini_write_real(level_name, "checkpoint_y", y);
							ini_write_real(level_name, "checkpoint_which_player", instance_nearest(x, y, obj_player).player);
							if (instance_nearest(x, y, obj_player).hspeed < 0)
							{
								ini_write_real(level_name, "checkpoint_direction", -1);
							}
							else
							{
								ini_write_real(level_name, "checkpoint_direction", +1);
							}
							ini_write_real(level_name, "checkpoint_millisecond", global.timeattack_millisecond);
							ini_write_real(level_name, "checkpoint_second", global.timeattack_second);
							ini_write_real(level_name, "checkpoint_minute", global.timeattack_minute);
							ini_write_real(level_name, "checkpoint_realmillisecond", global.timeattack_realmillisecond);
							ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
						}
						else
						if (asset_get_type("room_leveleditor") == asset_room)
						&& (room == room_leveleditor)
						&& (global.character_select_in_this_menu == "level_editor")
						&& (global.actually_play_edited_level)
						{
							var uppercase_level_name;
							uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
							uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
							var level_name = string(uppercase_level_name);
							
							ini_open(working_directory + "save_files/custom_level_save.ini");
							ini_write_real(level_name, "checkpoint_x", x);
							ini_write_real(level_name, "checkpoint_y", y);
							ini_write_real(level_name, "checkpoint_which_player", instance_nearest(x, y, obj_player).player);
							if (instance_nearest(x, y, obj_player).hspeed < 0)
							{
								ini_write_real(level_name, "checkpoint_direction", -1);
							}
							else
							{
								ini_write_real(level_name, "checkpoint_direction", +1);
							}
							ini_write_real(level_name, "checkpoint_millisecond", global.timeattack_millisecond);
							ini_write_real(level_name, "checkpoint_second", global.timeattack_second);
							ini_write_real(level_name, "checkpoint_minute", global.timeattack_minute);
							ini_write_real(level_name, "checkpoint_realmillisecond", global.timeattack_realmillisecond);
							ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
						}
						#endregion /* Save Level Editor Checkpoint END */
						
					}
					
					#region /* Load correct sprite when you get the checkpoint */
					if (global.checkpoint_x == xstart)
					&& (global.checkpoint_y == ystart)
					{
						if (instance_exists(obj_camera))
						&& (instance_exists(obj_player))
						{
							if (checkpoint_which_player == 1)
							&& (obj_camera.player1 > 0)
							&& (instance_exists(obj_camera.player1))
							&& (obj_camera.player1.sprite_checkpoint_activated > 0)
							{
								sprite_index = obj_camera.player1.sprite_checkpoint_activated;
							}
							else
							if (checkpoint_which_player = 2)
							&& (obj_camera.player2 > 0)
							&& (instance_exists(obj_camera.player2))
							&& (obj_camera.player2.sprite_checkpoint_activated > 0)
							{
								sprite_index = obj_camera.player2.sprite_checkpoint_activated;
							}
							else
							if (checkpoint_which_player = 3)
							&& (obj_camera.player3 > 0)
							&& (instance_exists(obj_camera.player3))
							&& (obj_camera.player3.sprite_checkpoint_activated > 0)
							{
								sprite_index = obj_camera.player3.sprite_checkpoint_activated;
							}
							else
							if (checkpoint_which_player = 4)
							&& (obj_camera.player4 > 0)
							&& (instance_exists(obj_camera.player4))
							&& (obj_camera.player4.sprite_checkpoint_activated > 0)
							{
								sprite_index = obj_camera.player4.sprite_checkpoint_activated;
							}
							else
							{
								sprite_index = spr_checkpoint;
								image_index = 1;
								image_speed = 0;
							}
						}
						else
						{
							sprite_index = spr_checkpoint;
							image_index = 1;
							image_speed = 0;
						}
					}
					#endregion /* Load correct sprite when you get the checkpoint END */
					
				}
			}
		}
	}
}