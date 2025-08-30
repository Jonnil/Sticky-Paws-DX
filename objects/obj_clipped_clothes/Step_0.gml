if (fall)
{
	if (!position_meeting(x, bbox_bottom + 1, obj_wall))
	&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	&& (x > camera_get_view_x(view_get_camera(view_current)))
	&& (x < camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)))
	{
		gravity = 0.5;
		if (vspeed <+ 1)
		{
			vspeed = +1;
		}
		image_yscale = 1;
	}
	else
	{
		gravity = 0;
		vspeed = 0;
		if (position_meeting(x, bbox_bottom + 1, obj_wall))
		{
			image_yscale = 0.5;
		}
	}
}

vspeed = clamp(vspeed, -20, +20); /* Limit vertical falling speed END */
