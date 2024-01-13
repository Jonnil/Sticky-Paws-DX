#region /* Collision Event with block break mask */
if (!bounce_up)
{
	if (place_meeting(x, y, obj_block_break)) /* This object is a hurtbox, for blocks. So when this block comes in contact with this object, it will break */
	&& (instance_nearest(x, y, obj_block_break).can_break_other_blocks)
	{
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
#endregion /* Collision Event with block break mask END */