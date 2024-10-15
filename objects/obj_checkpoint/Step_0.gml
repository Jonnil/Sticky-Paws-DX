if (instance_exists(obj_player))
{
	if (global.checkpoint_x != x)
	|| (global.checkpoint_y != y)
	{
		if (instance_nearest(x, y, obj_player).x > x - 32)
		&& (instance_nearest(x, y, obj_player).x < x + 32)
		&& (instance_nearest(x, y, obj_player).y < y)
		|| (place_meeting(x, y, instance_nearest(x, y, obj_player)))
		{
			if (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
			&& (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_player).x + 1, instance_nearest(x, y, obj_player).y + 1, obj_wall, false, true))
			{
				if (!checkpoint_activated)
				{
					checkpoint_activated = true;
					checkpoint_what_player = instance_nearest(x, y, obj_player).player;
					
					if (instance_exists(obj_camera))
					&& (obj_camera.black_screen_gui_alpha <= 0.8) /* Don't get rewards if this code is run when a level first start */
					{
						with(instance_nearest(x, y, obj_player))
						{
							hp ++;
							if (hp > max_hp) /* Don't gain more HP than your max HP */
							{
								hp = max_hp;
							}
						}
						effect_create_below(ef_ring, x, y, 2, c_white);
						
						#region /* 2000 Score */
						score += 2000;
						with(instance_create_depth(x, y, 0, obj_score_up))
						{
							score_up = 2000;
						}
						#endregion /* 2000 Score END */
						
						#region /* Checkpoint text when touching the checkpoint, so everybody knows that this is a checkpoint */
						with(instance_create_depth(x, y - 20, 0, obj_score_up))
						{
							checkpoint_number = instance_nearest(x, y, obj_checkpoint).checkpoint_number;
							checkpoint_max_number = instance_nearest(x, y, obj_checkpoint).checkpoint_max_number;
							score_up = "checkpoint";
						}
						#endregion /* Checkpoint text when touching the checkpoint, so everybody knows that this is a checkpoint END */
						
						scr_audio_play(snd_1up, volume_source.sound);
						
						scr_different_items_inside(bbox_top);
					}
					
					if (!global.doing_clear_check_level) /* Don't save these things if you're doing a clear check. You need to restart from the very start if you lose, regardless if you hit checkpoints */
					{
						global.checkpoint_x = xstart;
						global.checkpoint_y = ystart;
						global.checkpoint_millisecond = global.timeattack_millisecond;
						global.checkpoint_second = global.timeattack_second;
						global.checkpoint_minute = global.timeattack_minute;
						global.checkpoint_realmillisecond = global.timeattack_realmillisecond;
						
						#region /* Save Level Editor Checkpoint */
						if (room == rm_leveleditor)
						&& (global.character_select_in_this_menu == "main_game")
						&& (global.actually_play_edited_level)
						{
							var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
							
							ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
							ini_write_real(level_name, "checkpoint_x", x);
							ini_write_real(level_name, "checkpoint_y", y);
							ini_write_real(level_name, "checkpoint_what_player", instance_nearest(x, y, obj_player).player);
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
							ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
						}
						else
						if (room == rm_leveleditor)
						&& (global.actually_play_edited_level)
						{
							var level_name = global.level_name;
							
							ini_open(game_save_id + "save_file/custom_level_save.ini");
							ini_write_real(level_name, "checkpoint_x", x);
							ini_write_real(level_name, "checkpoint_y", y);
							ini_write_real(level_name, "checkpoint_what_player", instance_nearest(x, y, obj_player).player);
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
							ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
						}
						#endregion /* Save Level Editor Checkpoint END */
						
					}
					
					#region /* Load correct sprite when you get the checkpoint */
					if (instance_exists(obj_camera))
					{
						sprite_index = spr_checkpoint_activated;
						image_speed = 0;
						for(var i = 1; i <= global.max_players; i += 1)
						{
							if (checkpoint_what_player == i
							&& obj_camera.player[i] > 0
							&& instance_exists(obj_camera.player[i])
							&& obj_camera.player[i].sprite_checkpoint_activated > 0)
							{
								sprite_index = obj_camera.player[i].sprite_checkpoint_activated;
								break; /* Exit the loop once a valid player is found */
							}
						}
					}
					else
					{
						sprite_index = spr_checkpoint_activated;
						image_speed = 0;
					}
					#endregion /* Load correct sprite when you get the checkpoint END */
					
				}
			}
		}
	}
}