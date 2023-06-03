var view_left = camera_get_view_x(view_camera[view_current]) - 22;
var view_right = (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current])) + 22;
var view_top = camera_get_view_y(view_camera[view_current]) - 22;
var view_bottom = (camera_get_view_y(view_camera[view_current])) + (camera_get_view_height(view_camera[view_current])) + 22;

#region /* Gravity */
if (asset_get_type("obj_wall") == asset_object)
&& (!position_meeting(x, bbox_bottom + 1, obj_wall))
&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
&& (asset_get_type("obj_camera") == asset_object)
&& (instance_exists(obj_camera))
&& (x < view_right)
&& (x > view_left)
&& (y < view_bottom)
&& (y > view_top)
&& (stop_gravity == false)
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
#endregion /* Gravity END */

#region /* Stop firing if enemies are disabled */
if (global.assist_enable)
&& (global.assist_enable_enemies == false)
{
	time = 0;
}
#endregion /* Stop firing if enemies are disabled END */

if (asset_get_type("obj_player") == asset_object)
&& (asset_get_type("obj_wall") == asset_object)
&& (instance_exists(obj_player))
{
	if (!place_meeting(x - 64, y, obj_player))
	&& (!place_meeting(x - 32, y, obj_player))
	&& (!place_meeting(x - 16, y, obj_player))
	&& (!place_meeting(x - 8, y, obj_player))
	&& (!place_meeting(x + 64, y, obj_player))
	&& (!place_meeting(x + 32, y, obj_player))
	&& (!place_meeting(x + 16, y, obj_player))
	&& (!place_meeting(x + 8, y, obj_player))
	{
		yy = lerp(yy, y, 0.5);
		draw_xscale = lerp(draw_xscale, image_xscale, 0.5);
		draw_yscale = lerp(draw_yscale, image_yscale, 0.5);
		if (time < 201)
		{
			time ++;
		}
	}
	else
	{
		if (place_meeting(x, y - 1, obj_player))
		{
			yy = lerp(yy, y+ random_range(- 1, + 1), 0.5);
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
		if (x < instance_nearest(x, y, obj_player).x)
		&& (!position_meeting(x + 32, y, obj_wall))
		{
			if (give_rewards > 0)
			{
				with(instance_create_depth(x + 8, y, 0, obj_bullet))
				{
					image_xscale = +1;
				}
			}
			else
			{
				with(instance_create_depth(x + 8, y, 0, obj_bullet))
				{
					give_rewards = false;
					image_xscale = +1;
				}
			}
		}
		else
		if (x > instance_nearest(x, y, obj_player).x)
		&& (!position_meeting(x - 32, y, obj_wall))
		{
			if (give_rewards > 0)
			{
				with(instance_create_depth(x - 8, y, 0, obj_bullet))
				{
					image_xscale = -1;
				}
			}
			else
			with(instance_create_depth(x - 8, y, 0, obj_bullet))
			{
				give_rewards = false;
				image_xscale = -1;
			}
		}
		else
		if (!position_meeting(x + 32, y, obj_wall))
		{
			if (give_rewards > 0)
			{
				with(instance_create_depth(x + 8, y, 0, obj_bullet))
				{
					image_xscale = +1;
				}
			}
			else
			{
				with(instance_create_depth(x + 8, y, 0, obj_bullet))
				{
					give_rewards = false;
					image_xscale = +1;
				}
			}
		}
		else
		if (!position_meeting(x - 32, y, obj_wall))
		{
			if (give_rewards > 0)
			{
				with(instance_create_depth(x - 8, y, 0, obj_bullet))
				{
					image_xscale = -1;
				}
			}
			else
			with(instance_create_depth(x - 8, y, 0, obj_bullet))
			{
				give_rewards = false;
				image_xscale = -1;
			}
		}
	}
	time = 0;
}