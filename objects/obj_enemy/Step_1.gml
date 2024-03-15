if (stomped_delay > 0)
{
	stomped_delay --;
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

var wall_below = place_meeting(x, y + 1, obj_wall)
	|| place_meeting(x, y + 1, obj_enemy_only_wall);
var semisolid_platform_below = position_meeting(x, bbox_bottom + 1, obj_semisolid_platform);

on_ground = wall_below || semisolid_platform_below;

/* If you are not blind, then turn around when seeing pit */
if (!blind && !coil_spring && on_ground)
{
    var wall_right = !place_meeting(x + 5, y + 1, obj_wall) && !place_meeting(x + 5, y + 1, obj_enemy_only_wall) && !position_meeting(x + 5, bbox_bottom + 1, obj_semisolid_platform);
    var wall_left = !place_meeting(x - 5, y + 1, obj_wall) && !place_meeting(x - 5, y + 1, obj_enemy_only_wall) && !position_meeting(x - 5, bbox_bottom + 1, obj_semisolid_platform);
    if (wall_right)
    {
        image_xscale = -1;
    }
    else if (wall_left)
    {
        image_xscale = 1;
    }
}

#region /* Don't move outside view */
var view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) * 0.5);
var view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) * 0.5);
var view_distance_from_center = 1044; /* How many pixels from view center objects should deactivate. Needs to be enought to not cause problems */
var view_left = view_x_center - view_distance_from_center;
var view_top = view_y_center - view_distance_from_center;
var view_right = view_x_center + view_distance_from_center;
var view_bottom = view_y_center + view_distance_from_center;
if (!die)
{
	if (bbox_right < view_left)
	&& (hspeed < 0)
	|| (bbox_left > view_right)
	&& (hspeed > 0)
	|| (bbox_bottom < view_top)
	&& (vspeed < 0)
	|| (bbox_top > view_bottom)
	&& (hspeed > 0)
	{
		hspeed = 0;
		vspeed = 0;
		speed = 0;
		gravity = 0;
		friction = 500;
		/* Stop enemy from moving, but don't reset the "sliding along ground" variable */
	}
	else
	{
		friction = 0;
	}
}
else
{
	friction = 0;
}
#endregion /* Don't move outside view END */