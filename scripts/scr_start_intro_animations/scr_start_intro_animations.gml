function scr_start_intro_animations()
{
	
	#region /*Start Intro Animations*/
	if (global.x_checkpoint <= 0) /*Make sure that you aren't in the middle of a level by touching a checkpoint*/
	and (global.y_checkpoint <= 0)
	{
		/*This intro animation is called "cake_stolen", more intros can be added here*/
		if (intro_animation = "cake_stolen")
		and (instance_exists(obj_camera))
		and (obj_camera.intro_animation_play_only_once = false)
		or (intro_animation = "cake_stolen")
		and (instance_exists(obj_camera))
		and (obj_camera.intro_animation_play_only_once = true)
		and (global.current_level_clear_rate = "enter")
		{
			can_move = false;
			cutscene_time += 1;
			if (cutscene_time <= 1)
			{
				instance_create_depth(x+10, y, 0, obj_chair_and_table);
				instance_create_depth(x+40, y+10, 0, obj_cake);
				instance_create_depth(x-318, y, 0, obj_cake_stealing_enemy);
				intro_animation_sprite = sprite_sitting_eat_closed_mouth;
				image_index = 0;
				image_speed = 1;
			}
			else
			if (cutscene_time = 60*3)
			{
				audio_play_sound(voice_ahh,0,0);
				audio_sound_gain(voice_ahh,global.voices_volume,0);
				intro_animation_sprite = sprite_sitting_eat_open_mouth;
				image_index = 0;
				image_speed = 1;
			}
			else
			if (cutscene_time = 60*6)
			{
				audio_play_sound(voice_huh,0,0);
				audio_sound_gain(voice_huh,global.voices_volume,0);
				intro_animation_sprite = sprite_sitting_eat_open_mouth_open_eye;
				image_index = 0;
				image_speed = 1;
			}
			else
			if (cutscene_time = 60*8)
			{
				audio_play_sound(voice_scream,0,0);
				audio_sound_gain(voice_scream,global.voices_volume,0);
				intro_animation_sprite = sprite_sitting_eat_surprised;
				image_index = 0;
				image_speed = 1;
				image_speed = 1;
			}
			else
			if (cutscene_time > 60*9)
			{
				hspeed = +8;
				vspeed = -8;
				can_move = true;
				intro_animation = "";
			}
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
	#endregion /*Start Intro Animations END*/
	
}