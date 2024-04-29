if (place_meeting(x, y - 8, other))
{
	if (other.ground_pound >= 1)
	{
		
		#region /* 1 Basic Collectible */
		if (type_of_bump = "none")
		{
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
		}
		#endregion /* 1 Basic Collectible END */
		
		#region /* 8 Basic Collectibles */
		if (type_of_bump = "8_basic_collectibles")
		{
			with(instance_create_depth(x - 32, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			with(instance_create_depth(x - 24, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10;
			}
			with(instance_create_depth(x - 16, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 20;
			}
			with(instance_create_depth(x - 8, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 30;
			}
			with(instance_create_depth(x + 8, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 40;
			}
			with(instance_create_depth(x + 16, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 50;
			}
			with(instance_create_depth(x + 24, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 60;
			}
			with(instance_create_depth(x + 32, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 70;
			}
		}
		#endregion /* 8 Basic Collectibles END */
		
		#region /* Heart Balloon */
		if (type_of_bump = "heart_balloon")
		{
			with(instance_create_depth(x, bbox_top - 16, 0, obj_heart_balloon))
			{
				bounce_up = true;
				motion_set(90, 10);
			}
		}
		#endregion /* Heart Balloon END */
		
		#region /* 1-up */
		if (type_of_bump = "1-up")
		{
			with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
			{
				number_of_extra_lives = 1;
				bounce_up = true;
				motion_set(90, 10);
			}
		}
		#endregion /* 1-up END */
		
		#region /* 2-up */
		if (type_of_bump = "2-up")
		{
			with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
			{
				number_of_extra_lives = 2;
				bounce_up = true;
				motion_set(90, 10);
			}
		}
		#endregion /* 2-up END */
		
		#region /* 3-up */
		if (type_of_bump = "3-up")
		{
			with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
			{
				number_of_extra_lives = 3;
				bounce_up = true;
				motion_set(90, 10);
			}
		}
		#endregion /* 3-up END */
		
		#region /* Big Collectible */
		if (type_of_bump = "big_collectible")
		{
			with(instance_create_depth(x, bbox_top, 0, obj_big_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
		}
		#endregion /* Big Collectible END */
		
		#region /* Invincibility Powerup */
		if (type_of_bump = "invincibility_powerup")
		{
			with(instance_create_depth(x, bbox_top - 20, 0, obj_invincibility_powerup))
			{
				bounce_up = true;
				motion_set(90, 10);
			}
		}
		#endregion /* Invincibility Powerup END */
		
		#region /* Invincibility Powerup Coil Spring */
		if (type_of_bump = "invincibility_powerup_coil_spring")
		{
			with(instance_create_depth(x, bbox_top - 20, 0, obj_invincibility_powerup))
			{
				bounce_up = true;
				coil_spring = true;
				motion_set(90, 10);
			}
		}
		#endregion /* Invincibility Powerup END */
		
		instance_destroy();
	}
}