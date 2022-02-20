if (die_volting = false)
or (die = false)
{
	if (sliding_along_ground = -1)
	and (flat = true)
	and (position_meeting(bbox_left - 1, y, obj_wall))
	{
		sliding_along_ground = +1;
	}
	if (sliding_along_ground = +1)
	and (flat = true)
	and (position_meeting(bbox_right + 1, y, obj_wall))
	{
		sliding_along_ground = -1;
	}
	
	if (place_meeting(x, y - 1, obj_wall))
	and (die = false)
	{
		vspeed = 0;
	}
	
	#region /*Push the enemy out of the solid object*/
	while(place_meeting(x, y, other))
	{
		x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
		y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
	}
	#endregion /*Push the enemy out of the solid object END*/

	#region /*Landing on solid object*/
	if (position_meeting(x, bbox_bottom + 1, other))
	and (vspeed >= 0)
	{
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		and (obj_camera.iris_xscale > 1)
		{
			effect_create_above(ef_smoke, x - 16,bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x + 16,bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x - 16- 8,bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x + 16 +8,bbox_bottom- 8, 0, c_white);
		}
		vspeed = 0;
		gravity = 0;
		draw_xscale = 1.25;
		draw_yscale = 0.75;
	}
}
#endregion /*Landing on solid object END*/