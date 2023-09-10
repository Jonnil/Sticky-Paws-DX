image_index = global.collectible_image_index;

if (bounce_up == false)
&& (instance_exists(obj_player))
{
	if (place_meeting(bbox_left, y, obj_player))
	|| (place_meeting(bbox_right, y, obj_player))
	|| (place_meeting(x, bbox_top, obj_player))
	|| (place_meeting(x, bbox_bottom, obj_player))
	{
		if (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_semisolid_platform, false, true))
		{
			follow_player = true;
		}
	}
}
if (follow_player)
&& (place_meeting(x, y + 16, obj_wall))
|| (follow_player)
&& (place_meeting(x, y + 16, obj_semisolid_platform))
|| (follow_player)
&& (instance_exists(obj_player))
&& (instance_nearest(x, y, obj_player).horizontal_rope_climb)
|| (follow_player)
&& (instance_exists(obj_player))
&& (instance_nearest(x, y, obj_player).climb)
|| (follow_player)
&& (instance_exists(obj_player))
&& (instance_nearest(x, y, obj_player).midair_jumps_left >= instance_nearest(x, y, obj_player).number_of_jumps)
|| (place_meeting(x, bbox_bottom, obj_enemy_bowlingball))
&& (instance_nearest(x, y, obj_enemy_bowlingball).flat)
&& (instance_nearest(x, y, obj_enemy_bowlingball).die == false)
&& (instance_nearest(x, y, obj_enemy_bowlingball).die_volting == false)
{
	effect_create_above(ef_ring, x, y, 2, c_white);
	
	#region /* 3 Basic Collectibles */
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
	#endregion /* 3 Basic Collectibles END */
	
	#region /* 1000 Score */
	score += 1000;
	with(instance_create_depth(x, y, 0, obj_score_up))
	{
		score_up = 1000;
	}
	#endregion /* 1000 Score END */
	
	#region /* What Big Collectible is this? */
	if (big_collectible == 1)
	{
		global.big_collectible1 = true;
		if (instance_exists(obj_camera))
		{
			with(instance_nearest(x, y, obj_camera))
			{
				global.big_collectible1_already_collected = true;
			}
		}
		if (global.character_select_in_this_menu == "main_game")
		{
			var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
			
			ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "big_collectible1", true);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var level_name = string(global.level_name);
			
			ini_open(working_directory + "save_files/custom_level_save.ini");
			ini_write_real(level_name, "big_collectible1", true);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
	}
	if (big_collectible == 2)
	{
		global.big_collectible2 = true;
		if (instance_exists(obj_camera))
		{
			with(instance_nearest(x, y, obj_camera))
			{
				global.big_collectible2_already_collected = true;
			}
		}
		if (global.character_select_in_this_menu == "main_game")
		{
			var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
			
			ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "big_collectible2", true);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var level_name = string(global.level_name);
			
			ini_open(working_directory + "save_files/custom_level_save.ini");
			ini_write_real(level_name, "big_collectible2", true);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
	}
	if (big_collectible == 3)
	{
		global.big_collectible3 = true;
		if (instance_exists(obj_camera))
		{
			with(instance_nearest(x, y, obj_camera))
			{
				global.big_collectible3_already_collected = true;
			}
		}
		if (global.character_select_in_this_menu == "main_game")
		{
			var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
			
			ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "big_collectible3", true);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var level_name = string(global.level_name);
			
			ini_open(working_directory + "save_files/custom_level_save.ini");
			ini_write_real(level_name, "big_collectible3", true);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
	}
	if (big_collectible == 4)
	{
		global.big_collectible4 = true;
		if (instance_exists(obj_camera))
		{
			with(instance_nearest(x, y, obj_camera))
			{
				global.big_collectible4_already_collected = true;
			}
		}
		if (global.character_select_in_this_menu == "main_game")
		{
			var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
			
			ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "big_collectible4", true);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var level_name = string(global.level_name);
			
			ini_open(working_directory + "save_files/custom_level_save.ini");
			ini_write_real(level_name, "big_collectible4", true);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
	}
	if (big_collectible >= 5)
	{
		global.big_collectible5 = true;
		if (instance_exists(obj_camera))
		{
			with(instance_nearest(x, y, obj_camera))
			{
				global.big_collectible5_already_collected = true;
			}
		}
		if (global.character_select_in_this_menu == "main_game")
		{
			var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
			
			ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
			ini_write_real(level_name, "big_collectible5", true);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var level_name = string(global.level_name);
			
			ini_open(working_directory + "save_files/custom_level_save.ini");
			ini_write_real(level_name, "big_collectible5", true);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
	}
	#endregion /* What Big Collectible is this? END */
	
	scr_audio_play(snd_basic_collectible, volume_source.sound);
	instance_create_depth(xstart, ystart, 0, obj_big_collectible_outline);
	instance_destroy();
}

#region /* Follow Player */
if (follow_player)
{
	if (instance_exists(obj_player))
	&& (distance_to_object(obj_player) < sprite_height + sprite_width)
	{
		
		#region /* Show Big Collectible HUD */
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_big_collectibles_timer = global.hud_hide_time * 60;
			}
		}
		#endregion /* Show Big Collectible HUD END */
		
		x = lerp(x, instance_nearest(x, y, obj_player).x, 0.5);
		y = lerp(y, instance_nearest(x, y, obj_player).y, 0.5);
	}
	else
	{
		x = lerp(x, xstart, 0.5);
		y = lerp(y, ystart, 0.5);
		if (x = xstart)
		&& (y = ystart)
		{
			follow_player = false;
		}
	}
}
#endregion /* Follow Player END */

if (bounce_up)
{
	
	#region /* Show Big Collectible HUD */
	if (instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_big_collectibles_timer = global.hud_hide_time * 60;
		}
	}
	#endregion /* Show Big Collectible HUD END */
	
	if (delay >= delay_time)
	{
		if (coinsound == false)
		{
			scr_audio_play(snd_basic_collectible, volume_source.sound);
			coinsound = true;
		}
		visible = true;
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0.5; /* The gravity */
		if (vspeed > 0)
		&& (y > ystart - 32)
		{
			
			#region /* 3 Basic Collectibles */
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
			#endregion /* 3 Basic Collectibles END */
			
			#region /* 1000 Score */
			score += 1000;
			with(instance_create_depth(x, y, 0, obj_score_up))
			{
				score_up = 1000;
			}
			#endregion /* 1000 Score END */
			
			#region /* What Big Collectible is this? */
			if (big_collectible == 1)
			{
				global.big_collectible1 = true;
				if (instance_exists(obj_camera))
				{
					with(instance_nearest(x, y, obj_camera))
					{
						global.big_collectible1_already_collected = true;
					}
					if (global.character_select_in_this_menu == "main_game")
					{
						var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						
						ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
						ini_write_real(level_name, "big_collectible1", true);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (global.character_select_in_this_menu == "level_editor")
					{
						var level_name = string(global.level_name);
						
						ini_open(working_directory + "save_files/custom_level_save.ini");
						ini_write_real(level_name, "big_collectible1", true);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
				}
			}
			if (big_collectible == 2)
			{
				global.big_collectible2 = true;
				if (instance_exists(obj_camera))
				{
					with(instance_nearest(x, y, obj_camera))
					{
						global.big_collectible2_already_collected = true;
					}
					if (global.character_select_in_this_menu == "main_game")
					{
						var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						
						ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
						ini_write_real(level_name, "big_collectible2", true);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (global.character_select_in_this_menu == "level_editor")
					{
						var level_name = string(global.level_name);
						
						ini_open(working_directory + "save_files/custom_level_save.ini");
						ini_write_real(level_name, "big_collectible2", true);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
				}
			}
			if (big_collectible == 3)
			{
				global.big_collectible3 = true;
				if (instance_exists(obj_camera))
				{
					with(instance_nearest(x, y, obj_camera))
					{
						global.big_collectible3_already_collected = true;
					}
					if (global.character_select_in_this_menu == "main_game")
					{
						var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						
						ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
						ini_write_real(level_name, "big_collectible3", true);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (global.character_select_in_this_menu == "level_editor")
					{
						var level_name = string(global.level_name);
						
						ini_open(working_directory + "save_files/custom_level_save.ini");
						ini_write_real(level_name, "big_collectible3", true);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
				}
			}
			if (big_collectible == 4)
			{
				global.big_collectible4 = true;
				if (instance_exists(obj_camera))
				{
					with(instance_nearest(x, y, obj_camera))
					{
						global.big_collectible4_already_collected = true;
					}
					if (global.character_select_in_this_menu == "main_game")
					{
						var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						
						ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
						ini_write_real(level_name, "big_collectible4", true);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (global.character_select_in_this_menu == "level_editor")
					{
						var level_name = string(global.level_name);
						
						ini_open(working_directory + "save_files/custom_level_save.ini");
						ini_write_real(level_name, "big_collectible4", true);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
				}
			}
			if (big_collectible == 5)
			{
				global.big_collectible5 = true;
				if (instance_exists(obj_camera))
				{
					with(instance_nearest(x, y, obj_camera))
					{
						global.big_collectible5_already_collected = true;
					}
					if (global.character_select_in_this_menu == "main_game")
					{
						var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
						
						ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
						ini_write_real(level_name, "big_collectible5", true);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (global.character_select_in_this_menu == "level_editor")
					{
						var level_name = string(global.level_name);
						
						ini_open(working_directory + "save_files/custom_level_save.ini");
						ini_write_real(level_name, "big_collectible5", true);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
				}
			}
			#endregion /* What Big Collectible is this? END */
			
			effect_create_above(ef_ring, x, y, 2, c_white);
			instance_create_depth(xstart, ystart, 0, obj_big_collectible_outline);
			instance_destroy();
		}
	}
	else
	{
		visible = false;
		y = ystart;
	}
	delay ++;
}

#region /* Expanding Ring Effect */
effect_time ++;
if (effect_time > 60)
{
	effect_time = 0;
	effect_create_below(ef_ring, x, y, 1, c_white);
}
#endregion /* Expanding Ring Effect END */