#region /*If spikes are disabled, destroy this object*/
if (global.assist_enable = true)
and (global.assist_enable_spikes = false)
{
	instance_destroy();
}
#endregion /*If spikes are disabled, destroy this object*/

if (global.spikes_emerge_time < room_speed * 1)
{
	if (asset_get_type("spr_spikes_emerge_half_out") == asset_sprite)
	{
		sprite_index = spr_spikes_emerge_half_out;
	}
	image_speed = 1;
	mask_index = noone;
}
else
if (global.spikes_emerge_time < room_speed * 2)
and (global.spikes_emerge_time > room_speed * 1)
{
	if (asset_get_type("spr_spikes_emerge") == asset_sprite)
	{
		sprite_index = spr_spikes_emerge;
		mask_index = spr_spikes_emerge;
	}
	image_speed = 1;
}
else
if (global.spikes_emerge_time >= room_speed * 3)
{
	if (asset_get_type("spr_spikes_emerge_in") == asset_sprite)
	{
		sprite_index = spr_spikes_emerge_in;
	}
	image_speed = 1;
	mask_index = noone;
}
else
{
	if (asset_get_type("spr_spikes_emerge_in") == asset_sprite)
	{
		sprite_index = spr_spikes_emerge_in;
	}
	image_speed = 1;
	mask_index = noone;
}

#region /*Touching player*/
if (image_angle = 0)
and (place_meeting(x, y - 2, instance_nearest(x, y, obj_player)))
and (!place_meeting(x - 1, y, instance_nearest(x, y, obj_player)))
and (!place_meeting(x + 1, y, instance_nearest(x, y, obj_player)))
and (instance_nearest(x, y, obj_player).vspeed >= 0)
or(image_angle = 90)
and (place_meeting(x - 2, y, instance_nearest(x, y, obj_player)))
and (!place_meeting(x, y - 1, instance_nearest(x, y, obj_player)))
and (!place_meeting(x, y + 1, instance_nearest(x, y, obj_player)))
and (instance_nearest(x, y, obj_player).hspeed >= 0)
or(image_angle = 180)
and (place_meeting(x, y + 2, instance_nearest(x, y, obj_player)))
and (!place_meeting(x - 1, y, instance_nearest(x, y, obj_player)))
and (!place_meeting(x + 1, y, instance_nearest(x, y, obj_player)))
and (instance_nearest(x, y, obj_player).vspeed <= 0)
or(image_angle = 270)
and (place_meeting(x + 2, y, instance_nearest(x, y, obj_player)))
and (!place_meeting(x, y - 1, instance_nearest(x, y, obj_player)))
and (!place_meeting(x, y + 1, instance_nearest(x, y, obj_player)))
and (instance_nearest(x, y, obj_player).hspeed <= 0)
{
	if (instance_nearest(x, y, obj_player).takendamage < 1)
	and (instance_nearest(x, y, obj_player).assist_invincible = false)
	and (asset_get_type("spr_spikes_emerge") == asset_sprite)
	and (sprite_index = spr_spikes_emerge)
	{
		with(instance_nearest(x, y, obj_player))
		{
			if (invincible = false)
			{
				if (have_heart_balloon = true)
				{
					have_heart_balloon = false;
					
					#region /*Save heart balloon to be false*/
					if (player = 1)
					{
						ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player_1_have_heart_balloon", false);
						ini_close();
					}
					if (player = 2)
					{
						ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player_2_have_heart_balloon", false);
						ini_close();
					}
					if (player = 3)
					{
						ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player_3_have_heart_balloon", false);
						ini_close();
					}
					if (player = 4)
					{
						ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player_4_have_heart_balloon", false);
						ini_close();
					}
					#endregion /*Save heart balloon to be false END*/
					
				}
				else
				{
					hp -= 1;
				}
				takendamage = 100;
			}
		}
	}
}
#endregion /*Touching player END*/

#region /*Touching enemy*/
if (image_angle = 0)
and (place_meeting(x, y - 2, instance_nearest(x, y, obj_enemy)))
and (!place_meeting(x - 1, y, instance_nearest(x, y, obj_enemy)))
and (!place_meeting(x + 1, y, instance_nearest(x, y, obj_enemy)))
and (instance_nearest(x, y, obj_enemy).vspeed >= 0)
or(image_angle = 90)
and (place_meeting(x - 2, y, instance_nearest(x, y, obj_enemy)))
and (!place_meeting(x, y - 1, instance_nearest(x, y, obj_enemy)))
and (!place_meeting(x, y + 1, instance_nearest(x, y, obj_enemy)))
and (instance_nearest(x, y, obj_enemy).hspeed >= 0)
or(image_angle = 180)
and (place_meeting(x, y + 2, instance_nearest(x, y, obj_enemy)))
and (!place_meeting(x - 1, y, instance_nearest(x, y, obj_enemy)))
and (!place_meeting(x + 1, y, instance_nearest(x, y, obj_enemy)))
and (instance_nearest(x, y, obj_enemy).vspeed <= 0)
or(image_angle = 270)
and (place_meeting(x + 2, y, instance_nearest(x, y, obj_enemy)))
and (!place_meeting(x, y - 1, instance_nearest(x, y, obj_enemy)))
and (!place_meeting(x, y + 1, instance_nearest(x, y, obj_enemy)))
and (instance_nearest(x, y, obj_enemy).hspeed <= 0)
{
	if (asset_get_type("spr_spikes_emerge") == asset_sprite)
	and (sprite_index = spr_spikes_emerge)
	and (asset_get_type("obj_boss") == asset_object)
	and (!place_meeting(x - 1, y, obj_boss))
	and (!place_meeting(x + 1, y, obj_boss))
	and (!place_meeting(x, y - 1, obj_boss))
	and (!place_meeting(x, y + 1, obj_boss))
	{
		if (instance_nearest(x, y, obj_enemy).x < x)
		and (instance_nearest(x, y, obj_enemy).die = false)
		{
			instance_nearest(x, y, obj_enemy).vspeed = - 8;
			instance_nearest(x, y, obj_enemy).die_volting = -1;
			instance_nearest(x, y, obj_enemy).die = true;
		}
		else
		if (instance_nearest(x, y, obj_enemy).die = false)
		{
			instance_nearest(x, y, obj_enemy).vspeed = - 8;
			instance_nearest(x, y, obj_enemy).die_volting = +1;
			instance_nearest(x, y, obj_enemy).die = true;
		}
	}
}
#endregion /*Touching enemy END*/

if (image_angle = 0)
{
	if (position_meeting(x, y, instance_nearest(x, y, obj_player)))
	{
		if (asset_get_type("spr_spikes_emerge") == asset_sprite)
		and (sprite_index = spr_spikes_emerge)
		{
			with(instance_nearest(x, y, obj_player))
			{
				y -= 22;
				smooth_teleport = 0;
			}
		}
	}
}
if (image_angle = 90)
{
	if (position_meeting(x, y, instance_nearest(x, y, obj_player)))
	{
		if (asset_get_type("spr_spikes_emerge") == asset_sprite)
		and (sprite_index = spr_spikes_emerge)
		{
			with(instance_nearest(x, y, obj_player))
			{
				x -= 22;
				y += 22;
				smooth_teleport = 0;
			}
		}
	}
}
if (image_angle = 180)
{
	if (position_meeting(x, y, instance_nearest(x, y, obj_player)))
	{
		if (asset_get_type("spr_spikes_emerge") == asset_sprite)
		and (sprite_index = spr_spikes_emerge)
		{
			with(instance_nearest(x, y, obj_player))
			{
				y += 22;
				smooth_teleport = 0;
			}
		}
	}
}
if (image_angle = 270)
{
	if (position_meeting(x, y, instance_nearest(x, y, obj_player)))
	{
		if (asset_get_type("spr_spikes_emerge") == asset_sprite)
		and (sprite_index = spr_spikes_emerge)
		{
			with(instance_nearest(x, y, obj_player))
			{
				x += 22;
				y += 22;
				smooth_teleport = 0;
			}
		}
	}
}

if (image_angle = 0)
and (asset_get_type("spr_spikes_emerge") == asset_sprite)
and (sprite_index = spr_spikes_emerge)
{
	if (position_meeting(x, y - 4, instance_nearest(x, y, obj_player)))
	and (instance_nearest(x, y, obj_player).dive = true)
	{
		with(instance_nearest(x, y, obj_player))
		{
			dive = false;
			y -= 22;
			smooth_teleport = 0;
		}
	}
}
if (image_angle = 90)
and (asset_get_type("spr_spikes_emerge") == asset_sprite)
and (sprite_index = spr_spikes_emerge)
{
	if (position_meeting(x - 4, y, instance_nearest(x, y, obj_player)))
	and (instance_nearest(x, y, obj_player).dive = true)
	{
		with(instance_nearest(x, y, obj_player))
		{
			dive = false;
			x -= 22;
			y += 22;
			smooth_teleport = 0;
		}
	}
}
if (image_angle = 180)
and (asset_get_type("spr_spikes_emerge") == asset_sprite)
and (sprite_index = spr_spikes_emerge)
{
	if (position_meeting(x, y + 4, instance_nearest(x, y, obj_player)))
	and (instance_nearest(x, y, obj_player).dive = true)
	{
		with(instance_nearest(x, y, obj_player))
		{
			dive = false;
			y += 22;
			smooth_teleport = 0;
		}
	}
}
if (image_angle = 270)
and (asset_get_type("spr_spikes_emerge") == asset_sprite)
and (sprite_index = spr_spikes_emerge)
{
	if (position_meeting(x + 4, y, instance_nearest(x, y, obj_player)))
	and (instance_nearest(x, y, obj_player).dive = true)
	{
		with(instance_nearest(x, y, obj_player))
		{
			dive = false;
			x += 22;
			y += 22;
			smooth_teleport = 0;
		}
	}
}