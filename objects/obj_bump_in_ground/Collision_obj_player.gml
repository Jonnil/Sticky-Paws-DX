if (place_meeting(x, y - 8, other))
{
	if (other.ground_pound == true)
	{
		
		#region /* 1 Basic Collectible */
		if (type_of_bump = "none")
		{
			if (asset_get_type("obj_basic_collectible") == asset_object)
			{
				with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
				}
			}
		}
		#endregion /* 1 Basic Collectible END */
		
		#region /* 8 Basic Collectibles */
		if (type_of_bump = "8_basic_collectibles")
		{
			if (asset_get_type("obj_basic_collectible") == asset_object)
			{
				with(instance_create_depth(x - 32, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
				}
				with(instance_create_depth(x - 24, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					visible = false;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 10;
				}
				with(instance_create_depth(x - 16, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					visible = false;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 20;
				}
				with(instance_create_depth(x - 8, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					visible = false;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 30;
				}
				with(instance_create_depth(x + 8, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					visible = false;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 40;
				}
				with(instance_create_depth(x + 16, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					visible = false;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 50;
				}
				with(instance_create_depth(x + 24, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					visible = false;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 60;
				}
				with(instance_create_depth(x + 32, bbox_top, 0, obj_basic_collectible))
				{
					image_speed = 1;
					visible = false;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 70;
				}
			}
		}
		#endregion /* 8 Basic Collectibles END */
		
		#region /* Heart Balloon */
		if (type_of_bump = "heart_balloon")
		{
			if (asset_get_type("obj_heart_balloon") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 16, 0, obj_heart_balloon))
				{
					bounceup = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* Heart Balloon END */
		
		#region /* 1-up */
		if (type_of_bump = "1-up")
		{
			if (asset_get_type("obj_extra_life_pickup") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
				{
					number_of_extra_lives = 1;
					bounceup = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* 1-up END */
		
		#region /* 2-up */
		if (type_of_bump = "2-up")
		{
			if (asset_get_type("obj_extra_life_pickup") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
				{
					number_of_extra_lives = 2;
					bounceup = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* 2-up END */
		
		#region /* 3-up */
		if (type_of_bump = "3-up")
		{
			if (asset_get_type("obj_extra_life_pickup") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
				{
					number_of_extra_lives = 3;
					bounceup = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* 3-up END */
		
		#region /* Big Collectible 1 */
		if (type_of_bump = "big_collectible_1")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				with(instance_create_depth(x, bbox_top, 0, obj_big_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 1;
					bounceup = true;
				}
			}
		}
		#endregion /* Big Collectible 1 END */
		
		#region /* Big Collectible 2 */
		if (type_of_bump = "big_collectible_2")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				with(instance_create_depth(x, bbox_top, 0, obj_big_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 2;
					bounceup = true;
				}
			}
		}
		#endregion /* Big Collectible 2 END */
		
		#region /* Big Collectible 3 */
		if (type_of_bump = "big_collectible_3")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				with(instance_create_depth(x, bbox_top, 0, obj_big_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 3;
					bounceup = true;
				}
			}
		}
		#endregion /* Big Collectible 3 END */
		
		#region /* Big Collectible 4 */
		if (type_of_bump = "big_collectible_4")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				with(instance_create_depth(x, bbox_top, 0, obj_big_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 4;
					bounceup = true;
				}
			}
		}
		#endregion /* Big Collectible 4 END */
		
		#region /* Big Collectible 5 */
		if (type_of_bump = "big_collectible_5")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				with(instance_create_depth(x, bbox_top, 0, obj_big_collectible))
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 5;
					bounceup = true;
				}
			}
		}
		#endregion /* Big Collectible 5 END */
		
		#region /* Invincibility Powerup */
		if (type_of_bump = "invincibility_powerup")
		{
			if (asset_get_type("obj_invincibility_powerup") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 20, 0, obj_invincibility_powerup))
				{
					bounceup = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* Invincibility Powerup END */
		
		#region /* Invincibility Powerup Coil Spring */
		if (type_of_bump = "invincibility_powerup_coil_spring")
		{
			if (asset_get_type("obj_invincibility_powerup") == asset_object)
			{
				with(instance_create_depth(x, bbox_top - 20, 0, obj_invincibility_powerup))
				{
					bounceup = true;
					coil_spring = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* Invincibility Powerup END */
		
		instance_destroy();
	}
}