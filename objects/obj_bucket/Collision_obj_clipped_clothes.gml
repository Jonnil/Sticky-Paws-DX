if (asset_get_type("spr_bucket") == asset_sprite)
and (sprite_index = spr_bucket)
{
	if (asset_get_type("spr_bucket_clothes") == asset_sprite)
	{
		sprite_index = spr_bucket_clothes;
	}
	#region /* 1 Basic Collectible*/
	if (item_inside = "noone")
	{
		if (asset_get_type("obj_coin") == asset_object)
		{
			var obj;obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				motion_set(90, 10);
				bounceup = true;
			}
		}
	}
	#endregion /* 1 Basic Collectible END*/
	
	#region /* 8 Basic Collectibles*/
	if (item_inside = "8_basic_collectibles")
	{
		if (asset_get_type("obj_basic_collectible") == asset_object)
		{
			var obj;
			obj = instance_create_depth(x -32,bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				motion_set(90, 10);
				bounceup = true;
			}
			obj = instance_create_depth(x - 24,bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounceup = true;
				delay_time = 10;
			}
			obj = instance_create_depth(x - 16,bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounceup = true;
				delay_time = 20;
			}
			obj = instance_create_depth(x - 8,bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounceup = true;
				delay_time = 30;
			}
			obj = instance_create_depth(x +8,bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounceup = true;
				delay_time = 40;
			}
			obj = instance_create_depth(x + 16,bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounceup = true;
				delay_time = 50;
			}
			obj = instance_create_depth(x + 24,bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounceup = true;
				delay_time = 60;
			}
			obj = instance_create_depth(x + 32,bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				visible = false;
				motion_set(90, 10);
				bounceup = true;
				delay_time = 70;
			}
		}
	}
	#endregion /* 8 Basic Collectibles END*/
		
		#region /*Heart Balloon*/
		if (item_inside = "heart_balloon")
		{
			if (asset_get_type("obj_heart_balloon") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top - 16, 0, obj_heart_balloon);
				with(obj)
				{
					bounceup = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /*Heart Balloon END*/
		
		#region /* 1-up*/
		if (item_inside = "1-up")
		{
			if (asset_get_type("obj_extra_life_pickup") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup);
				with(obj)
				{
					number_of_extra_lives = 1;
					bounceup = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* 1-up END*/
		
		#region /* 2-up*/
		if (item_inside = "2-up")
		{
			if (asset_get_type("obj_extra_life_pickup") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup);
				with(obj)
				{
					number_of_extra_lives = 2;
					bounceup = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* 2-up END*/
		
		#region /* 3-up*/
		if (item_inside = "3-up")
		{
			if (asset_get_type("obj_extra_life_pickup") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup);
				with(obj)
				{
					number_of_extra_lives = 3;
					bounceup = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /* 3-up END*/
		
		#region /*Big Collectible 1*/
		if (item_inside = "big_collectible_1")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top, 0, obj_big_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 1;
					bounceup = true;
				}
			}
		}
		#region /*Big Collectible 1 END*/
		
		#region /*Big Collectible 2*/
		if (item_inside = "big_collectible_2")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top, 0, obj_big_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 2;
					bounceup = true;
				}
			}
		}
		#region /*Big Collectible 2 END*/
		
		#region /*Big Collectible 3*/
		if (item_inside = "big_collectible_3")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top, 0, obj_big_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 3;
					bounceup = true;
				}
			}
		}
		#region /*Big Collectible 3 END*/
		
		#region /*Big Collectible 4 */
		if (item_inside = "big_collectible_4")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top, 0, obj_big_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 4;
					bounceup = true;
				}
			}
		}
		#region /*Big Collectible 4 END*/
		
		#region /*Big Collectible 5*/
		if (item_inside = "big_collectible_5")
		{
			if (asset_get_type("obj_big_collectible") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top, 0, obj_big_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					big_collectible = 5;
					bounceup = true;
				}
			}
		}
		#region /*Big Collectible 5 END*/
		
		#region /*Invincibility Powerup*/
		if (item_inside = "invincibility_powerup")
		{
			if (asset_get_type("obj_invincibility_powerup") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, bbox_top - 16, 0, obj_invincibility_powerup);
				with(obj)
				{
					bounceup = true;
					motion_set(90, 10);
				}
			}
		}
		#endregion /*Invincibility Powerup END*/
	
}
with(other)
{
	instance_destroy();
}