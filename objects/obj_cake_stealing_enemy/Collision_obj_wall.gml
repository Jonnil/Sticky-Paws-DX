/* Collision Event with a solid object */
#region /* Push out of the solid object */
while (place_meeting(x, y, other))
{
	x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
	y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
}
#endregion /* Push out of the solid object END */

#region /* Landing on solid object */
if (place_meeting(x, y + 1, other))
&& (vspeed >= 0)
{

	#region /* Smoke Landing Effect */
	if (instance_exists(obj_camera))
	&& (obj_camera.iris_xscale > 1)
	{
		if (position_meeting(x - 24, bbox_bottom + 2, obj_wall))
		{
			effect_create_depth(depth - 1, ef_smoke, x - 24, bbox_bottom - 8, 0, c_white);
		}
		if (position_meeting(x - 16, bbox_bottom + 2, obj_wall))
		{
			effect_create_depth(depth - 1, ef_smoke, x - 16, bbox_bottom, 0, c_white);
		}
		if (position_meeting(x, bbox_bottom + 2, obj_wall))
		{
			effect_create_depth(depth - 1, ef_smoke, x, bbox_bottom, 0, c_white);
			effect_create_depth(depth - 1, ef_smoke, x, bbox_bottom - 8, 0, c_white);
		}
		if (position_meeting(x + 16, bbox_bottom + 2, obj_wall))
		{
			effect_create_depth(depth - 1, ef_smoke, x + 16, bbox_bottom, 0, c_white);
		}
		if (position_meeting(x + 24, bbox_bottom + 2, obj_wall))
		{
			effect_create_depth(depth - 1, ef_smoke, x + 24, bbox_bottom - 8, 0, c_white);
		}
	}
	#endregion /* Smoke Landing Effect END */

	vspeed = 0;
	gravity = 0;
}
#endregion /* Landing on solid object END */

#region /* Hitting your head on ceiling */
if (position_meeting(x, bbox_top - 1, other))
{
	vspeed += 4;
	if (abs(hspeed) < 1)
	{
		hspeed = 0;
	}
}
#endregion /* Hitting your head on ceiling END */

#region /* Hitting wall to your left */
if (position_meeting(bbox_left - 1, bbox_bottom - 8, other))
|| (position_meeting(bbox_left - 1, bbox_top + 8, other))
|| (position_meeting(bbox_left - 1, y, other))
{
	if (hspeed <= 0)
	{
		hspeed = 0;
	}
}
#endregion /* Hitting wall to your left END */

#region /* Hitting wall to your right */
if (position_meeting(bbox_right + 1, bbox_bottom - 8, other))
|| (position_meeting(bbox_right + 1, bbox_top + 8, other))
|| (position_meeting(bbox_right + 1, y, other))
{
	if (hspeed >= 0)
	{
		hspeed = 0;
	}
}
#endregion /* Hitting wall to your right END */
