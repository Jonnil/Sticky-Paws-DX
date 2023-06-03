function scr_different_items_inside()
{
	
	#region /* Different Items Inside */
	
	#region /* No Items Inside (1 Basic Collectible if it's a question block) */
	if (item_inside = "none")
	{
		empty = true;
		if (block_type = "question_block")
		{
			if (asset_get_type("scr_audio_play") == asset_script)
			{
				scr_audio_play(snd_basic_collectible, volume_source.sound);
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				if (variable_instance_exists(self, "bounce_up"))
				{
					bounce_up = true;
				}
			}
			can_break_this_block = false;
		}
		else
		if (block_type = "brick_block")
		{
			can_break_this_block = true;
			break_this_block = true;
		}
	}
	#endregion /* No Items Inside (1 Basic Collectible if it's a question block) END */
	
	#region /* 10 Basic Collectible */
	if (item_inside = "10_basic_collectibles")
	{
		if (hit <= 4)
		&& (empty == false)
		{
			bounce_up = true;
			hit ++;
			with(instance_create_depth(x, y - 32, 0, obj_block_break))
			{
				image_yscale = 0.1;
			}
			
			#region /* 2 Basic Collectibles per hit */
			if (asset_get_type("scr_audio_play") == asset_script)
			{
				scr_audio_play(snd_basic_collectible, volume_source.sound);
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				if (variable_instance_exists(self, "bounce_up"))
				{
					bounce_up = true;
				}
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				if (variable_instance_exists(self, "bounce_up"))
				{
					bounce_up = true;
				}
				if (variable_instance_exists(self, "delay_time"))
				{
					delay_time = 10;
				}
			}
			if (hit >= 5)
			{
				empty = true;
			}
			#endregion /* 2 Basic Collectibles per hit END */
			
		}
	}
	#endregion /* 10 Basic Collectible END */
	
	#region /* Heart Balloon */
	if (item_inside = "heart_balloon")
	{
		if (!place_meeting(x, y - 1, obj_wall))
		{
			with(instance_create_depth(x, bbox_top - 16, 0, obj_heart_balloon))
			{
				image_speed = 1;
				motion_set(90, 10);
				if (variable_instance_exists(self, "bounce_up"))
				{
					bounce_up = true;
				}
			}
		}
		empty = true;
	}
	#endregion /* Heart Balloon END */
	
	#region /* 1-up */
	if (item_inside = "1-up")
	{
		if (!place_meeting(x, y - 1, obj_wall))
		{
			with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
			{
				image_speed = 1;
				motion_set(90, 10);
				if (variable_instance_exists(self, "bounce_up"))
				{
					bounce_up = true;
				}
				if (variable_instance_exists(self, "number_of_extra_lives"))
				{
					number_of_extra_lives = 1;
				}
			}
		}
		empty = true;
	}
	#endregion /* 1-up END */
	
	#region /* 2-up */
	if (item_inside = "2-up")
	{
		if (!place_meeting(x, y - 1, obj_wall))
		{
			with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
			{
				image_speed = 1;
				motion_set(90, 10);
				if (variable_instance_exists(self, "bounce_up"))
				{
					bounce_up = true;
				}
				if (variable_instance_exists(self, "number_of_extra_lives"))
				{
					number_of_extra_lives = 2;
				}
			}
		}
		empty = true;
	}
	#endregion /* 2-up END */
	
	#region /* 3-up */
	if (item_inside = "3-up")
	{
		if (!place_meeting(x, y - 1, obj_wall))
		{
			with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
			{
				image_speed = 1;
				motion_set(90, 10);
				if (variable_instance_exists(self, "bounce_up"))
				{
					bounce_up = true;
				}
				if (variable_instance_exists(self, "number_of_extra_lives"))
				{
					number_of_extra_lives = 3;
				}
			}
		}
		empty = true;
	}
	#endregion /* 3-up END */
	
	#region /* Invincibility Powerup */
	if (item_inside = "invincibility_powerup")
	{
		if (!place_meeting(x, y - 1, obj_wall))
		{
			with(instance_create_depth(x, bbox_top - 32, 0, obj_invincibility_powerup))
			{
				hspeed = +2;
				image_speed = 1;
				motion_set(90, 10);
				if (variable_instance_exists(self, "bounce_up"))
				{
					bounce_up = true;
				}
				if (variable_instance_exists(self, "coil_spring"))
				{
					coil_spring = false;
				}
			}
		}
		empty = true;
	}
	#endregion /* Invincibility Powerup END */
	
	#region /* Invincibility Powerup Coil Spring */
	if (item_inside = "invincibility_powerup_coil_spring")
	{
		if (!place_meeting(x, y - 1, obj_wall))
		{
			with(instance_create_depth(x, bbox_top - 32, 0, obj_invincibility_powerup))
			{
				hspeed = +2;
				image_speed = 1;
				motion_set(90, 10);
				if (variable_instance_exists(self, "bounce_up"))
				{
					bounce_up = true;
				}
				if (variable_instance_exists(self, "coil_spring"))
				{
					coil_spring = true;
				}
			}
		}
		empty = true;
	}
	#endregion /* Invincibility Powerup END */
	
	#endregion /* Different Items Inside END */
	
}