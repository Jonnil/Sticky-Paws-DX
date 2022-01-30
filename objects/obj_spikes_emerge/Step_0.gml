depth = +10;

#region /*If spikes are disabled, destroy this object*/
if (global.activate_cheats = true)
and (global.enable_spikes = false)
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
			if invincible = false
			{
				hp -= 1;
				takendamage = 100;
			}
		}
	}
}

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