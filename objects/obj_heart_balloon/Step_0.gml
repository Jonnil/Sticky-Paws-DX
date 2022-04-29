#region /*Set the gravity*/
gravity_direction = 270; /*Direction of the gravity*/
if (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y + 1, obj_wall))
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	gravity = 0.5; /*The gravity*/
}
else
{
	gravity = 0;
}
#endregion /*Set the gravity END*/

#region /*If inside wall, destroy yourself*/
if (position_meeting(x, y, obj_wall))
{
	instance_destroy();
}
#endregion /*If inside wall, destroy yourself END*/

if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
{
	if (allow_move = true)
	{
		if (dir = +1)
		{
			if (instance_nearest(x, y, obj_player).x > x)
			and (instance_nearest(x, y, obj_player).hspeed >+ 2)
			{
				hspeed = instance_nearest(x, y, obj_player).hspeed;
				if (hspeed >+8)
				{
					hspeed = +8;
				}
			}
			else
			{
				hspeed = +2;
			}
		}
		else
		{
			if (instance_nearest(x, y, obj_player).x < x)
			and (instance_nearest(x, y, obj_player).hspeed <- 2)
			{
				hspeed = instance_nearest(x, y, obj_player).hspeed;
				if (hspeed <- 8)
				{
					hspeed = - 8;
				}
			}
			else
			{
				hspeed = - 2;
			}
		}
	}
	else
	{
		hspeed = 0;
	}
	if (place_meeting(x, y, obj_player))
	and (bounceup = false)
	{
		if (instance_nearest(x, y, obj_player).have_heart_balloon = false)
		{
			with(instance_nearest(x, y, obj_player))
			{
				have_heart_balloon = true;
				hp = max_hp; /*Refill HP to max*/
				xx_heart = x;
				yy_heart = y;
				
				#region /*Save heart balloon to be true*/
				if (player = 1)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_1_have_heart_balloon", true);
					ini_close();
				}
				if (player = 2)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_2_have_heart_balloon", true);
					ini_close();
				}
				if (player = 3)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_3_have_heart_balloon", true);
					ini_close();
				}
				if (player = 4)
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player_4_have_heart_balloon", true);
					ini_close();
				}
				#endregion /*Save heart balloon to be true END*/
				
			}
		}
		else
		{
			#region /* 10 Basic Collectibles*/
			if (asset_get_type("obj_basic_collectible") == asset_object)
			{
				if (asset_get_type("snd_basic_collectible") == asset_sound)
				{
					audio_play_sound(snd_basic_collectible, 0, 0);
				}
				var obj;
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 10;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 20;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 30;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 40;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 50;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 60;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 70;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 80;
				}
				obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
				with(obj)
				{
					image_speed = 1;
					motion_set(90, 10);
					bounceup = true;
					delay_time = 90;
				}
			}
			#endregion /* 10 Basic Collectibles END*/
		}
		#region /* 1000 Score*/
		score += 1000;
		if (asset_get_type("obj_scoreup") == asset_object)
		{
			obj = instance_create_depth(x, y, 0, obj_scoreup);
			with(obj)
			{
				scoreup = 1000;
			}
		}
		#endregion /* 1000 Score END*/
		effect_create_below(ef_ring, x, y, 1, c_white);
		instance_destroy();
	}
}

#region /*When falling, it's not bouncing up anymore*/
if (vspeed >= 0)
{
	bounceup = false;
}
#endregion /*When falling, it's not bouncing up anymore END*/

if (asset_get_type("obj_wall") == asset_object)
{
	if (place_meeting(x - 1, y, obj_wall))
	{
		dir = +1;
	}
	if (place_meeting(x + 1, y, obj_wall))
	{
		dir =- 1;
	}
	if (place_meeting(x, y - 1, obj_wall))
	{
		vspeed = +4;
	}
}

#region /*Expanding Ring Effect*/
effect_time += 1;
if (effect_time > 60)
{
	effect_time = 0;
	effect_create_below(ef_ring, x, y, 1, c_white);
}
#endregion /*Expanding Ring Effect END*/