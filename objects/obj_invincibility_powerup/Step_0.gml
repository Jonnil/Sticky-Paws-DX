image_speed = 0.1;

#region /* Set the gravity */
gravity_direction = 270; /* Direction of the gravity */
if (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y + 1, obj_wall))
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
and (x - 32 < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
and (x + 32 > camera_get_view_x(view_camera[view_current]))
{
	gravity = 0.5; /* The gravity */
}
else
{
	gravity = 0;
	vspeed = 0;
}
#endregion /* Set the gravity END */

if (y + 32 < camera_get_view_y(view_camera[view_current]))
and (vspeed < 0)
{
	vspeed = +1;
}
else
if (y - 32 > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
and (!place_meeting(x, y + 1, obj_wall))
and (!place_meeting(x, y + 1, obj_semisolid_platform))
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
	bounceup = false;
}
#endregion /* When falling, it's not bouncing up anymore END */

if (coil_spring = true)
{
	if (hspeed >= 0)
	{
		hspeed = +2;
	}
	else
	{
		hspeed = -2;
	}
	if (asset_get_type("obj_wall") == asset_object)
	and (place_meeting(x - 1, y, obj_wall))
	{
		hspeed = +2;
	}
	else
	if (asset_get_type("obj_wall") == asset_object)
	and (place_meeting(x + 1, y, obj_wall))
	{
		hspeed = -2;
	}
	if (asset_get_type("obj_wall") == asset_object)
	and (place_meeting(x, y + 1, obj_wall))
	or(asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	or(asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	or(asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
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

if (floor(random(10 - 1)) = 0)
and (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
and (x > camera_get_view_x(view_camera[view_current]))
and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
and (y > camera_get_view_y(view_camera[view_current]))
{
	effect_create_below(ef_star, x + random_range(- 16, + 16), y + random_range(- 16, + 16), 0, c_white);
}

#region /* Expanding Ring Effect */
effect_time += 1;
if (effect_time > 60)
and (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
and (x > camera_get_view_x(view_camera[view_current]))
and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
and (y > camera_get_view_y(view_camera[view_current]))
{
	effect_time = 0;
	effect_create_below(ef_ring, x, y, 1, c_white);
}
#endregion /* Expanding Ring Effect END */