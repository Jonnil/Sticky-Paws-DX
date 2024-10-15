/* Indicate when you have already collected this big collectible */
if (global.big_collectible[big_collectible])
{
	image_alpha = 0.5;
	image_blend = c_gray;
}

image_index = global.collectible_image_index;

if (follow_player)
&& (place_meeting(x, y + 16, obj_wall))
|| (follow_player)
&& (place_meeting(x, y + 16, obj_semisolid_platform))
{
	collect_big_collectible = true;
}

#region /* Follow Player */
if (follow_player)
{
	if (instance_exists(obj_player) && distance_to_object(obj_player) < sprite_height + sprite_width)
	{
		
		#region /* Show Big Collectible HUD */
		if (instance_exists(obj_camera))
		{
			obj_camera.hud_show_big_collectibles_timer = global.hud_hide_time * 60;
		}
		#endregion /* Show Big Collectible HUD END */
		
		x = lerp(x, instance_nearest(x, y, obj_player).x, 0.5);
		y = lerp(y, instance_nearest(x, y, obj_player).y, 0.5);
	}
	else
	{
		x = lerp(x, xstart, 0.5);
		y = lerp(y, ystart, 0.5);
		if (x == xstart && y == ystart)
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
		obj_camera.hud_show_big_collectibles_timer = global.hud_hide_time * 60;
	}
	#endregion /* Show Big Collectible HUD END */
	
	if (delay >= delay_time)
	{
		visible = true;
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0.5; /* The gravity */
		if (vspeed > 0 && y > ystart - 32)
		{
			collect_big_collectible = true;
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

#region /* Actually collect big collectible */
if (collect_big_collectible)
{
	
	#region /* Show Big Collectible HUD */
	if (instance_exists(obj_camera))
	{
		obj_camera.hud_show_big_collectibles_timer = global.hud_hide_time * 60;
	}
	#endregion /* Show Big Collectible HUD END */
	
	effect_create_above(ef_ring, x, y, 2, c_white);
	
	#region /* 1000 Score */
	score += 1000;
	with(instance_create_depth(x, y, 0, obj_score_up))
	{
		score_up = 1000;
	}
	#endregion /* 1000 Score END */
	
	#region /* What Big Collectible is this? */
	for(var i = 1; i <= global.max_big_collectible; i ++)
	{
		if (big_collectible == i)
		{
			global.big_collectible[i] = true;
			
			if (instance_exists(obj_camera))
			{
				obj_camera.hud_show_big_collectible_blink[i] = 120;
				if (!global.big_collectible_already_collected[i])
				{
					global.how_many_big_collectible_collected ++;
					global.big_collectible_already_collected[i] = true;
				}
			}
			if (global.character_select_in_this_menu == "main_game")
			{
				var save_path = game_save_id + "save_file/file" + string(global.file) + ".ini"
			}
			else if (global.character_select_in_this_menu == "level_editor")
			{
				var save_path = game_save_id + "save_file/custom_level_save.ini";
			}
			ini_open(save_path);
			
			/* Increase total big collectibe, so player can know how many big collectibles they have collected in total */
			if (!ini_read_real(global.level_name, "big_collectible" + string(i), false)) /* If you have never collected this big collectible before, then increase total big collectibles */
			{
				ini_write_real("Player", "total_big_collectibles", ini_read_real("Player", "total_big_collectibles", 0) + 1);
				if (global.character_select_in_this_menu == "main_game")
				{
					scr_set_stat_achievement("TOTAL_BIG_COLLECTIBLE", ini_read_real("Player", "total_big_collectibles", 0));
				}
			}
			
			ini_write_real(global.level_name, "big_collectible" + string(i), true); /* After increasing total big collectibles, then set this big collectible to be collected */
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			break;
		}
		else
		{
			if (instance_exists(obj_camera))
			{
				obj_camera.hud_show_big_collectible_blink[i] = 0;
			}
		}
	}
	#endregion /* What Big Collectible is this? END */
	
	if (global.how_many_big_collectible_collected >= global.max_big_collectible)
	{
		var big_collectible_sound_index = snd_big_collectible_all;
	}
	else
	{
		var big_collectible_sound_index = snd_big_collectible;
	}
	audio_sound_pitch(big_collectible_sound_index, 0.9 + (0.1 * global.how_many_big_collectible_collected));
	scr_audio_play(big_collectible_sound_index, volume_source.sound);
	
	instance_create_depth(xstart, ystart, 0, obj_big_collectible_outline);
	instance_destroy();
}
#endregion /* Actually collect big collectible END */