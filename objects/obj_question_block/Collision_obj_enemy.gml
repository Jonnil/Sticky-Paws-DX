#region /* Collision Event with enemy */
if (!bounce_up)
&& (!other.die)
{
	if (instance_exists(obj_enemy))
	&& (place_meeting(x, bbox_bottom, obj_enemy))
	&& (instance_nearest(x, y, obj_enemy).vspeed < 0)
	&& (can_be_hit_from_below)
	{
		if (instance_exists(obj_enemy))
		&& (instance_nearest(x, y, obj_enemy).vspeed < 0)
		{
			instance_nearest(x, y, obj_enemy).vspeed = 0;
			with(instance_create_depth(instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).bbox_top - 18, 0, obj_block_break))
			{
				image_yscale = 0.1;
				can_break_other_blocks = true;

			}
		}
		if (!empty)
		{
			if (instance_exists(obj_player))
			{
				scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
			}
			bounce_up = true;
			with(instance_create_depth(x, y - 32, 0, obj_block_break))
			{
				image_yscale = 0.1;
			}
			
			scr_different_items_inside();
			
		}
	}
}
#endregion /* Collision Event with enemy END */