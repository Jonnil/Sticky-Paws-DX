#region /* Don't move outside view */
if (x - 42 > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
and (instance_exists(obj_camera))
and (x - 42 > obj_camera.view_x_center + 950)
or (x + 42 < camera_get_view_x(view_camera[view_current]))
and (instance_exists(obj_camera))
and (x - 42 < obj_camera.view_x_center - 950)
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	gravity = 0;
}
if (y + 16 < camera_get_view_y(view_camera[view_current]))
and (instance_exists(obj_camera))
and (x - 42 < obj_camera.view_x_center - 950)
and (!place_meeting(x, y + 1, obj_wall))
and (!place_meeting(x, y + 1, obj_semisolid_platform))
and (flat == true)
and (coil_spring = false)
and (vspeed < 0)
{
	vspeed = +1;
}
#endregion /* Don't move outside view END */

#region /* Enemy touching emerging spikes */
if (instance_exists(obj_spikes_emerge))
and (can_die_from_spikes == true)
{
	if (instance_nearest(x, y, obj_spikes_emerge).image_angle == 0)
	and (place_meeting(x, y + 2, instance_nearest(x, y, obj_spikes_emerge)))
	and (!place_meeting(x - 1, y, instance_nearest(x, y, obj_spikes_emerge)))
	and (!place_meeting(x + 1, y, instance_nearest(x, y, obj_spikes_emerge)))
	and (vspeed >= 0)
	or (instance_nearest(x, y, obj_spikes_emerge).image_angle = 90)
	and (place_meeting(x + 2, y, instance_nearest(x, y, obj_spikes_emerge)))
	and (!place_meeting(x, y - 1, instance_nearest(x, y, obj_spikes_emerge)))
	and (!place_meeting(x, y + 1, instance_nearest(x, y, obj_spikes_emerge)))
	and (hspeed >= 0)
	or (instance_nearest(x, y, obj_spikes_emerge).image_angle = 180)
	and (place_meeting(x, y - 2, instance_nearest(x, y, obj_spikes_emerge)))
	and (!place_meeting(x - 1, y, instance_nearest(x, y, obj_spikes_emerge)))
	and (!place_meeting(x + 1, y, instance_nearest(x, y, obj_spikes_emerge)))
	and (vspeed <= 0)
	or (instance_nearest(x, y, obj_spikes_emerge).image_angle = 270)
	and (place_meeting(x - 2, y, instance_nearest(x, y, obj_spikes_emerge)))
	and (!place_meeting(x, y - 1, instance_nearest(x, y, obj_spikes_emerge)))
	and (!place_meeting(x, y + 1, instance_nearest(x, y, obj_spikes_emerge)))
	and (hspeed <= 0)
	{
		if (x < instance_nearest(x, y, obj_spikes_emerge).x)
		and (die = false)
		{
			vspeed = - 8;
			die_volting = -1;
			die = true;
		}
		else
		if (die = false)
		{
			vspeed = - 8;
			die_volting = +1;
			die = true;
		}
	}
}
#endregion /* Enemy touching emerging spikes END */