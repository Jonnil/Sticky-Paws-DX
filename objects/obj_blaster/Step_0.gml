#region /*Gravity*/
if (asset_get_type("obj_wall") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_wall))
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
and (asset_get_type("obj_camera") == asset_object)
and (instance_exists(obj_camera))
and (x < obj_camera.view_x_center + 980)
and (x > obj_camera.view_x_center - 980)
and (y < obj_camera.view_y_center + 980)
and (y > obj_camera.view_y_center - 980)
{
	gravity = 0.5;
}
else
{
	move_snap(32, 32);
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
}
if (vspeed >= 16)
{
	vspeed = 16;
}
#endregion /*Gravity END*/

#region /*Stop firing if enemies are disabled*/
if (global.assist_enable = true)
and (global.assist_enable_enemies = false)
{
	time = 0;
}
#endregion /*Stop firing if enemies are disabled END*/

if (asset_get_type("obj_player") == asset_object)
and (asset_get_type("obj_wall") == asset_object)
and (instance_exists(obj_player))
{
	if (x < instance_nearest(x, y, obj_player).x - 64)
	and (!position_meeting(x + 32, y, obj_wall))
	or(x > instance_nearest(x, y, obj_player).x + 64)
	and (!position_meeting(x -32, y, obj_wall))
	{
		yy = lerp(yy, y, 0.5);
		draw_xscale = lerp(draw_xscale, image_xscale, 0.5);
		draw_yscale = lerp(draw_yscale, image_yscale, 0.5);
		if (time < 201)
		{
			time += 1;
		}
	}
	else
	{
		if (place_meeting(x, y - 1, obj_player))
		{
			yy = lerp(yy, y+random_range(- 1, + 1), 0.5);
			draw_xscale = lerp(draw_xscale, image_xscale + 0.05, 0.5);
			draw_yscale = lerp(draw_yscale, image_yscale -0.05, 0.5);
		}
		else
		{
			yy = lerp(yy, y, 0.5);
			draw_xscale = lerp(draw_xscale, image_xscale, 0.5);
			draw_yscale = lerp(draw_yscale, image_yscale, 0.5);
		}
		time = 0;
	}
}

if (time > 200)
{
	if (asset_get_type("obj_bullet") == asset_object)
	{
		if (give_rewards > 0)
		and (x < instance_nearest(x, y, obj_player).x - 64)
		{
			instance_create_depth(x + 8, y, 0, obj_bullet);
		}
		else
		if (give_rewards > 0)
		and (x > instance_nearest(x, y, obj_player).x + 64)
		{
			instance_create_depth(x - 8, y, 0, obj_bullet);
		}
		else
		{
			if (x < instance_nearest(x, y, obj_player).x - 64)
			{
				with(instance_create_depth(x + 8, y, 0, obj_bullet))
				{
					give_rewards = false;
				}
			}
			else
			if (x > instance_nearest(x, y, obj_player).x + 64)
			{
				with(instance_create_depth(x - 8, y, 0, obj_bullet))
				{
					give_rewards = false;
				}
			}
		}
	}
	time = 0;
}