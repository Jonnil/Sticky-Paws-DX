depth = +20;
mask_index = spr_wall;
if (!instance_exists(obj_boss))
&& (instance_exists(obj_boss_defeated))
{
	if (!place_meeting(x, y - 1, obj_boss_barrier))
	{
		time ++;
		if (time > 5)
		{
			if (asset_get_type("obj_brick_particle") == asset_object)
			{
				with(instance_create_depth(x, y, 0, obj_brick_particle))
				{
					sprite_index = spr_boss_barrier;
					motion_set(45, random_range(5, 10));
					brick_particle = true;
				}
				with(instance_create_depth(x, y, 0, obj_brick_particle))
				{
					sprite_index = spr_boss_barrier;
					motion_set(135, random_range(5, 10));
					brick_particle = true;
				}
				with(instance_create_depth(x, y, 0, obj_brick_particle))
				{
					sprite_index = spr_boss_barrier;
					motion_set(225, random_range(5, 10));
					brick_particle = true;
				}
				with(instance_create_depth(x, y, 0, obj_brick_particle))
				{
					sprite_index = spr_boss_barrier;
					motion_set(315, random_range(5, 10));
					brick_particle = true;
				}
			}
			effect_create_above(ef_smoke, x, y, 1, c_white);
			
			if (place_meeting(x - 1, y, obj_spikes_emerge))
			{
				with(instance_nearest(x - 1, y, obj_spikes_emerge))
				{
					instance_destroy();
				}
			}
			if (place_meeting(x + 1, y, obj_spikes_emerge))
			{
				with(instance_nearest(x + 1, y, obj_spikes_emerge))
				{
					instance_destroy();
				}
			}
			if (place_meeting(x, y - 1, obj_spikes_emerge))
			{
				with(instance_nearest(x, y - 1, obj_spikes_emerge))
				{
					instance_destroy();
				}
			}
			if (place_meeting(x, y + 1, obj_spikes_emerge))
			{
				with(instance_nearest(x, y + 1, obj_spikes_emerge))
				{
					instance_destroy();
				}
			}
			
			instance_destroy();
		}
	}
}