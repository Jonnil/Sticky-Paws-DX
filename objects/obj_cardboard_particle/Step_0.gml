if (brick_particle)
{
	#region /* Set the gravity */
	gravity_direction = 270;
	gravity = 0.5;
	#endregion /* Set the gravity END */

	if (hspeed < 0)
	{
		image_angle += 10;
	}
	if (hspeed > 0)
	{
		image_angle -= 10;
	}
}
if (!brick_particle)
{
	if (position_meeting(bbox_left + 3, bbox_bottom + 1, instance_nearest(x, y, obj_player)))
	|| (position_meeting(bbox_right - 3, bbox_bottom + 1, instance_nearest(x, y, obj_player)))
	|| (place_meeting(x, y - 16, instance_nearest(x, y, obj_player)))
	&& (instance_nearest(x, y, obj_player).ground_pound >= 1)
	|| (place_meeting(bbox_left - 4, y, instance_nearest(x, y, obj_player)))
	&& (instance_nearest(x, y, obj_player).dive)
	|| (place_meeting(bbox_right + 4, y, instance_nearest(x, y, obj_player)))
	&& (instance_nearest(x, y, obj_player).dive)
	{
		with(instance_nearest(x, y, obj_player))
		{
			if (key_down)
			{
				ground_pound = true;
			}
			else
			{
				ground_pound = false;
			}
			dive = false;
			vspeed = +4;
		}
		instance_create_depth(x, y - 32, 0, obj_block_break);
	}
}
