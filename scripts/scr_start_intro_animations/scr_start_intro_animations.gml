function scr_start_intro_animations()
{
	
	#region /* Start Intro Animations */
	if (global.checkpoint_x <= 0) /* Make sure that you aren't in the middle of a level by touching a checkpoint */
	and (global.checkpoint_y <= 0)
	{
		
		#region /* This intro animation is called "cake_stolen", more intros can be added here */
		if (intro_animation = "cake_stolen")
		and (instance_exists(obj_camera))
		and (obj_camera.intro_animation_play_only_once = false)
		or(intro_animation = "cake_stolen")
		and (instance_exists(obj_camera))
		and (obj_camera.intro_animation_play_only_once == true)
		and (global.current_level_clear_rate = "enter")
		{
			can_move = false;
			crouch = false;
			cutscene_time += 1;
			intro_animation_image_index += 1;
			if (cutscene_time <= 1)
			{
				if (!instance_exists(obj_chair_and_table))
				{
					instance_create_depth(x + 10, y, 0, obj_chair_and_table);
				}
				if (!instance_exists(obj_cake))
				{
					instance_create_depth(x + 40, y + 10, 0, obj_cake);
				}
				if (!instance_exists(obj_cake_stealing_enemy))
				{
					instance_create_depth(-27.795226, y, 0, obj_cake_stealing_enemy);
				}
				if (sprite_sitting_eat_closed_mouth > noone){intro_animation_sprite = sprite_sitting_eat_closed_mouth;}else
				if (sprite_stand > noone){intro_animation_sprite = sprite_stand;}
				image_index = 0;
				image_speed = 1;
			}
			else
			if (cutscene_time = 60 * 2)
			{
				scr_audio_play(voice_open_mouth, volume_source.voice);
				if (sprite_sitting_eat_closed_mouth > noone){intro_animation_sprite = sprite_sitting_eat_open_mouth;}else
				if (sprite_stand > noone){intro_animation_sprite = sprite_stand;}
				image_index = 0;
				image_speed = 1;
			}
			else
			if (cutscene_time = 60 * 3.5)
			{
				scr_audio_play(voice_notice, volume_source.voice);
				if (sprite_sitting_eat_closed_mouth > noone){intro_animation_sprite = sprite_sitting_eat_open_mouth_open_eye;}else
				if (sprite_stand > noone){intro_animation_sprite = sprite_stand;}
				image_index = 0;
				image_speed = 1;
			}
			else
			if (cutscene_time = 60 * 4.2)
			{
				scr_audio_play(voice_scream, volume_source.voice);
				if (sprite_sitting_eat_closed_mouth > noone){intro_animation_sprite = sprite_sitting_eat_surprised;}else
				if (sprite_stand > noone){intro_animation_sprite = sprite_stand;}
				image_index = 0;
				image_speed = 1;
				image_speed = 1;
			}
			else
			if (cutscene_time > 60 * 5.2)
			{
				hspeed = + 8;
				vspeed = - 8;
				can_move = true;
				intro_animation = "";
			}
		}
		#endregion /* This intro animation is called "cake_stolen", more intros can be added here END */
		
		else
		
		#region /* This intro animation is called "ending", more intros can be added here */
		if (intro_animation = "ending")
		and (instance_exists(obj_camera))
		and (obj_camera.intro_animation_play_only_once = false)
		or(intro_animation = "ending")
		and (instance_exists(obj_camera))
		and (obj_camera.intro_animation_play_only_once == true)
		and (global.current_level_clear_rate = "enter")
		{
			can_move = false;
			crouch = false;
			cutscene_time += 1;
			intro_animation_image_index += 0.4;
			if (cutscene_time <= 1)
			{
				x = -16 -sprite_width;
				hspeed = 0;
				instance_create_depth(1697, 745, 0, obj_catlyn_working);
				if (instance_exists(obj_goal))
				{
					with(instance_create_depth(instance_nearest(x, y, obj_goal).x, instance_nearest(x, y, obj_goal).y, 0, obj_chair_and_table))
					{
						ending = true;	
					}
					with(instance_nearest(x, y, obj_goal))
					{
						instance_destroy();
					}
				}
				if (!instance_exists(obj_cake))
				{
					instance_create_depth(- 16 -sprite_width, y, 0, obj_cake);
				}
				if (!instance_exists(obj_cake_stealing_enemy))
				{
					with(instance_create_depth(- 16 -sprite_width, y, 0, obj_cake_stealing_enemy))
					{
						time = room_speed* 2;
					}
				}
				if (sprite_sitting_eat_closed_mouth > noone){intro_animation_sprite = sprite_run;}else
				if (sprite_stand > noone){intro_animation_sprite = sprite_stand;}
				image_index = 0;
				image_speed = 1;
			}
			else
			if (cutscene_time >= 60 * 1)
			and (cutscene_time < 60 * 2)
			{
				x += 8;
				if (sprite_sitting_eat_closed_mouth > noone){intro_animation_sprite = sprite_run;}else
				if (sprite_stand > noone){intro_animation_sprite = sprite_stand;}
				image_index = 0;
				image_speed = 1;
			}
			else
			if (cutscene_time > 60 * 2)
			{
				intro_animation_image_index = 0;
				cutscene_time = 0;
				hspeed += 8;
				can_move = true;
				intro_animation = "";
			}
		}
		#endregion /* This intro animation is called "cake_stolen", more intros can be added here END */
		
		else
		if (intro_animation = "ending_chair")
		{
			if (instance_exists(obj_chair_and_table))
			{
				x = instance_nearest(x, y, obj_chair_and_table).x;
			}
			vspeed = 0;
			if (!place_meeting(x, y + 1, obj_wall))
			{
				y += 1;
			}
			image_xscale = +1;
			can_move = false;
			crouch = false;
			cutscene_time += 1;
			intro_animation_image_index += 0.2;
			if (instance_exists(obj_chair_and_table))
			{
				with(instance_nearest(x, y, obj_cake))
				{
					attatch_player = false;
					if (instance_exists(obj_chair_and_table))
					{
						x = instance_nearest(x, y, obj_chair_and_table).x + 23;
						y = instance_nearest(x, y, obj_chair_and_table).y - 16;
					}
				}
			}
			if (cutscene_time <= 24)
			{
				if (sprite_sitting_eat_closed_mouth > noone){intro_animation_sprite = sprite_sitting_down_to_eat;}else
				if (sprite_stand > noone){intro_animation_sprite = sprite_stand;}
			}
			else
			{
				if (!instance_exists(obj_credits))
				{
					instance_create_depth(x, y, 0, obj_credits);
				}
				ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
				ini_write_real("Player", "beat_last_level", true);
				ini_close();
				if (sprite_sitting_eat_closed_mouth > noone){intro_animation_sprite = sprite_sitting_eating;}else
				if (sprite_stand > noone){intro_animation_sprite = sprite_stand;}
				intro_animation = "ending_chair_eating";
			}
		}
		
		else
		if (intro_animation = "ending_chair_eating")
		{
			if (instance_exists(obj_chair_and_table))
			{
				x = instance_nearest(x, y, obj_chair_and_table).x;
			}
			vspeed = 0;
			if (!place_meeting(x, y + 1, obj_wall))
			{
				y += 1;
			}
			image_xscale = +1;
			can_move = false;
			crouch = false;
			intro_animation_image_index += 0.2;
			if (instance_exists(obj_chair_and_table))
			{
				with(instance_nearest(x, y, obj_cake))
				{
					attatch_player = false;
					if (instance_exists(obj_chair_and_table))
					{
						x = instance_nearest(x, y, obj_chair_and_table).x + 23;
						y = instance_nearest(x, y, obj_chair_and_table).y - 16;
					}
				}
			}
			if (sprite_sitting_eat_closed_mouth > noone){intro_animation_sprite = sprite_sitting_eating;}else
			if (sprite_stand > noone){intro_animation_sprite = sprite_stand;}
		}
		
		else
		{
			intro_animation = "";
		}
	}
	else
	{
		intro_animation = "";
	}
	#endregion /* Start Intro Animations END */
	
}