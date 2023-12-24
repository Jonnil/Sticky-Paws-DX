#region /* Gravity */
var view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) * 0.5);
var view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) * 0.5);
var view_distance_from_center = 1044; /* How many pixels from view center objects should deactivate. Needs to be enought to not cause problems */
var view_left = view_x_center - view_distance_from_center;
var view_top = view_y_center - view_distance_from_center;
var view_right = view_x_center + view_distance_from_center;
var view_bottom = view_y_center + view_distance_from_center;

if (!position_meeting(x, bbox_bottom + 1, obj_wall))
&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
&& (x < view_right)
&& (x > view_left)
&& (bbox_top < view_bottom)
&& (bbox_bottom > view_top)
{
	gravity = 0.5;
}
else
{
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
}
if (vspeed >= 16)
{
	vspeed = 16;
}
#endregion /* Gravity END */

#region /* Stop firing if enemies are disabled, or you have finished the level */
if (global.assist_enable)
&& (global.assist_enable_enemies == false)
|| (global.goal_active)
{
	time = 0;
}
#endregion /* Stop firing if enemies are disabled, or you have finished the level END */

if (!place_meeting(x - 8, y, obj_player))
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

if (time > 200)
&& (instance_exists(obj_player))
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
	time = 0;
}