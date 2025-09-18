draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
image_speed = 0.1;

#region /* Set the gravity */
gravity_direction = 270; /* Direction of the gravity */
if (!place_meeting(x, y + 1, obj_wall))
&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
&& (x - 32 < camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)))
&& (x + 32 > camera_get_view_x(view_get_camera(view_current)))
{
	gravity = 0.5; /* The gravity */
}
else
{
	gravity = 0;
	vspeed = 0;
}
#endregion /* Set the gravity END */

if (y + 32 < camera_get_view_y(view_get_camera(view_current)))
&& (vspeed < 0)
{
	vspeed = +1;
}
else
if (y - 32 > camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)))
&& (!place_meeting(x, y + 1, obj_wall))
&& (!place_meeting(x, y + 1, obj_semisolid_platform))
{
	vspeed = 0;
}

#region /* If inside wall, destroy yourself */
if (position_meeting(x, y, obj_wall))
{
	instance_destroy();
}
#endregion /* If inside wall, destroy yourself END */

#region /* When falling, it's not bouncing up anymore */
if (vspeed >= 0)
{
	bounce_up = false;
}
#endregion /* When falling, it's not bouncing up anymore END */

if (coil_spring)
{
	if (hspeed >= 0)
	{
		hspeed = +2;
	}
	else
	{
		hspeed = -2;
	}
	if (place_meeting(x - 1, y, obj_wall))
	{
		hspeed = +2;
	}
	else
	if (place_meeting(x + 1, y, obj_wall))
	{
		hspeed = -2;
	}
	if (place_meeting(x, y + 1, obj_wall))
	|| (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		scr_audio_play(snd_star_bound, volume_source.sound);
		vspeed = -10;
		draw_xscale = 1.25;
		draw_yscale = 0.75;
	}
}
if (place_meeting(x, y - 1, obj_wall))
{
	vspeed = +1;
}

if (floor(random(10)) == 0)
&& (x < camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)))
&& (x > camera_get_view_x(view_get_camera(view_current)))
&& (y < camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)))
&& (y > camera_get_view_y(view_get_camera(view_current)))
{
	effect_create_depth(depth + 1, 
		ef_star,
		x + random_range(- 16, + 16),
		y + random_range(- 16, + 16),
		0,
		c_white
	);
}

#region /* Expanding Ring Effect */
effect_time++;
if (effect_time > 60)
&& (x < camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)))
&& (x > camera_get_view_x(view_get_camera(view_current)))
&& (y < camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)))
&& (y > camera_get_view_y(view_get_camera(view_current)))
{
	effect_time = 0;
	effect_create_depth(depth + 1, ef_ring, x, y, 1, c_white);
}
#endregion /* Expanding Ring Effect END */
