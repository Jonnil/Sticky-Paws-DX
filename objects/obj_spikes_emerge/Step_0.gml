#region /* If spikes are disabled, destroy this object */
if (global.assist_enable)
&& (global.assist_enable_spikes == false)
{
	instance_destroy();
}
#endregion /* If spikes are disabled, destroy this object */






#region /* Normal timing */
if (global.spikes_emerge_time < room_speed * 1)
{
	if (timer_offset == false)
	{
		if (asset_get_type("spr_spikes_emerge") == asset_sprite)
		{
			sprite_index = spr_spikes_emerge;
			mask_index = spr_spikes_emerge;
		}
		image_speed = 1;
	}
	else
	if (timer_offset)
	{
		if (asset_get_type("spr_spikes_emerge_in") == asset_sprite)
		{
			sprite_index = spr_spikes_emerge_in;
		}
		image_speed = 1;
		mask_index = noone;
	}
}
else
if (global.spikes_emerge_time < room_speed * 2)
&& (global.spikes_emerge_time > room_speed * 1)
{
	if (timer_offset == false)
	{
		if (asset_get_type("spr_spikes_emerge_in") == asset_sprite)
		{
			sprite_index = spr_spikes_emerge_in;
		}
		image_speed = 1;
		mask_index = noone;
	}
	else
	if (timer_offset)
	{
		if (asset_get_type("spr_spikes_emerge_half_out") == asset_sprite)
		{
			sprite_index = spr_spikes_emerge_half_out;
		}
		image_speed = 1;
		mask_index = noone;
	}
}
else
if (global.spikes_emerge_time < room_speed * 3)
&& (global.spikes_emerge_time > room_speed * 2)
{
	if (timer_offset == false)
	{
		if (asset_get_type("spr_spikes_emerge_in") == asset_sprite)
		{
			sprite_index = spr_spikes_emerge_in;
		}
		image_speed = 1;
		mask_index = noone;
	}
	else
	if (timer_offset)
	{
		if (asset_get_type("spr_spikes_emerge") == asset_sprite)
		{
			sprite_index = spr_spikes_emerge;
			mask_index = spr_spikes_emerge;
		}
		image_speed = 1;
	}
}
else
if (global.spikes_emerge_time > room_speed * 3)
{
	if (timer_offset == false)
	{
		if (asset_get_type("spr_spikes_emerge_half_out") == asset_sprite)
		{
			sprite_index = spr_spikes_emerge_half_out;
		}
		image_speed = 1;
		mask_index = noone;
	}
	else
	if (timer_offset)
	{
		if (asset_get_type("spr_spikes_emerge_in") == asset_sprite)
		{
			sprite_index = spr_spikes_emerge_in;
		}
		image_speed = 1;
		mask_index = noone;
	}
}
#endregion /* Normal timing END */





else
{
	if (asset_get_type("spr_spikes_emerge_in") == asset_sprite)
	{
		sprite_index = spr_spikes_emerge_in;
	}
	image_speed = 1;
	mask_index = noone;
}

#region /* Touching player */
if (image_angle == 0)
&& (instance_exists(obj_player))
&& (place_meeting(x, y - 2, instance_nearest(x, y, obj_player)))
&& (!place_meeting(x - 1, y, instance_nearest(x, y, obj_player)))
&& (!place_meeting(x + 1, y, instance_nearest(x, y, obj_player)))
&& (instance_nearest(x, y, obj_player).vspeed >= 0)
|| (image_angle = 90)
&& (instance_exists(obj_player))
&& (place_meeting(x - 2, y, instance_nearest(x, y, obj_player)))
&& (!place_meeting(x, y - 1, instance_nearest(x, y, obj_player)))
&& (!place_meeting(x, y + 1, instance_nearest(x, y, obj_player)))
&& (instance_nearest(x, y, obj_player).hspeed >= 0)
|| (image_angle = 180)
&& (instance_exists(obj_player))
&& (place_meeting(x, y + 2, instance_nearest(x, y, obj_player)))
&& (!place_meeting(x - 1, y, instance_nearest(x, y, obj_player)))
&& (!place_meeting(x + 1, y, instance_nearest(x, y, obj_player)))
&& (instance_nearest(x, y, obj_player).vspeed <= 0)
|| (image_angle = 270)
&& (instance_exists(obj_player))
&& (place_meeting(x + 2, y, instance_nearest(x, y, obj_player)))
&& (!place_meeting(x, y - 1, instance_nearest(x, y, obj_player)))
&& (!place_meeting(x, y + 1, instance_nearest(x, y, obj_player)))
&& (instance_nearest(x, y, obj_player).hspeed <= 0)
{
	if (instance_nearest(x, y, obj_player).takendamage < 1)
	&& (instance_nearest(x, y, obj_player).assist_invincible == false)
	&& (asset_get_type("spr_spikes_emerge") == asset_sprite)
	&& (sprite_index = spr_spikes_emerge)
	{
		with(instance_nearest(x, y, obj_player))
		{
			if (invincible_timer == false)
			{
				if (have_heart_balloon)
				{
					have_heart_balloon = false;
					
					#region /* Save heart balloon to be false */
					if (player == 1)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player1_have_heart_balloon", false);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					if (player == 2)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player2_have_heart_balloon", false);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					if (player == 3)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player3_have_heart_balloon", false);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					if (player == 4)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player4_have_heart_balloon", false);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					#endregion /* Save heart balloon to be false END */
					
				}
				else
				{
					hp --;
				}
				takendamage = 100;
			}
		}
	}
}
#endregion /* Touching player END */

if (image_angle == 0)
&& (instance_exists(obj_player))
&& (position_meeting(x, y, instance_nearest(x, y, obj_player)))
&& (asset_get_type("spr_spikes_emerge") == asset_sprite)
&& (sprite_index = spr_spikes_emerge)
{
	with(instance_nearest(x, y, obj_player))
	{
		y -= 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 90)
&& (instance_exists(obj_player))
&& (position_meeting(x, y, instance_nearest(x, y, obj_player)))
&& (asset_get_type("spr_spikes_emerge") == asset_sprite)
&& (sprite_index = spr_spikes_emerge)
{
	with(instance_nearest(x, y, obj_player))
	{
		x -= 22;
		y += 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 180)
&& (instance_exists(obj_player))
&& (position_meeting(x, y, instance_nearest(x, y, obj_player)))
&& (asset_get_type("spr_spikes_emerge") == asset_sprite)
&& (sprite_index = spr_spikes_emerge)
{
	with(instance_nearest(x, y, obj_player))
	{
		y += 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 270)
&& (instance_exists(obj_player))
&& (position_meeting(x, y, instance_nearest(x, y, obj_player)))
&& (asset_get_type("spr_spikes_emerge") == asset_sprite)
&& (sprite_index = spr_spikes_emerge)
{
	with(instance_nearest(x, y, obj_player))
	{
		x += 22;
		y += 22;
		smooth_teleport = 0;
	}
}
if (image_angle == 0)
&& (asset_get_type("spr_spikes_emerge") == asset_sprite)
&& (sprite_index = spr_spikes_emerge)
&& (instance_exists(obj_player))
&& (position_meeting(x, y - 4, instance_nearest(x, y, obj_player)))
&& (instance_nearest(x, y, obj_player).dive)
{
	with(instance_nearest(x, y, obj_player))
	{
		dive = false;
		y -= 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 90)
&& (asset_get_type("spr_spikes_emerge") == asset_sprite)
&& (sprite_index = spr_spikes_emerge)
&& (instance_exists(obj_player))
&& (position_meeting(x - 4, y, instance_nearest(x, y, obj_player)))
&& (instance_nearest(x, y, obj_player).dive)
{
	with(instance_nearest(x, y, obj_player))
	{
		dive = false;
		x -= 22;
		y += 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 180)
&& (asset_get_type("spr_spikes_emerge") == asset_sprite)
&& (sprite_index = spr_spikes_emerge)
&& (instance_exists(obj_player))
&& (position_meeting(x, y + 4, instance_nearest(x, y, obj_player)))
&& (instance_nearest(x, y, obj_player).dive)
{
	with(instance_nearest(x, y, obj_player))
	{
		dive = false;
		y += 22;
		smooth_teleport = 0;
	}
}
if (image_angle = 270)
&& (asset_get_type("spr_spikes_emerge") == asset_sprite)
&& (sprite_index = spr_spikes_emerge)
&& (instance_exists(obj_player))
&& (position_meeting(x + 4, y, instance_nearest(x, y, obj_player)))
&& (instance_nearest(x, y, obj_player).dive)
{
	with(instance_nearest(x, y, obj_player))
	{
		dive = false;
		x += 22;
		y += 22;
		smooth_teleport = 0;
	}
}