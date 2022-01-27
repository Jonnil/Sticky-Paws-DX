depth = +20;
mask_index = spr_wall;
if (!instance_exists(obj_boss))
and (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 64)
and (x > camera_get_view_x(view_camera[view_current]) +64)
and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
and (y > camera_get_view_y(view_camera[view_current]))
{
	if (!place_meeting(x, y - 1, obj_boss_barrier))
	{
		time +=1;
		if (time >5)
		{
			if (asset_get_type("obj_brick_particle") == asset_object)
			{
				var obj;
				obj = instance_create_depth(x, y, 0, obj_brick_particle);
				with(obj)
				{
					sprite_index = spr_boss_barrier;
					motion_set(45, random_range(5, 10));
					brick_particle = true;
				}
				var obj;
				obj = instance_create_depth(x, y, 0, obj_brick_particle);
				with(obj)
				{
					sprite_index = spr_boss_barrier;
					motion_set(135, random_range(5, 10));
					brick_particle = true;
				}
				var obj;
				obj = instance_create_depth(x, y, 0, obj_brick_particle);
				with(obj)
				{
					sprite_index = spr_boss_barrier;
					motion_set(225, random_range(5, 10));
					brick_particle = true;
				}
				var obj;
				obj = instance_create_depth(x, y, 0, obj_brick_particle);
				with(obj)
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