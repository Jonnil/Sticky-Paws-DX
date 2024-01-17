#region /* Make wall jump panel invisible if there are only players that have wall jump ability */
if (instance_exists(obj_camera))
{
	if (obj_camera.player[1] > 0)
	&& (instance_exists(obj_camera.player[1]))
	&& (!obj_camera.player[1].allow_wall_climb)
	|| (obj_camera.player[2] > 0)
	&& (instance_exists(obj_camera.player[2]))
	&& (!obj_camera.player[2].allow_wall_climb)
	|| (obj_camera.player[3] > 0)
	&& (instance_exists(obj_camera.player[3]))
	&& (!obj_camera.player[3].allow_wall_climb)
	|| (obj_camera.player[4] > 0)
	&& (instance_exists(obj_camera.player[4]))
	&& (!obj_camera.player[4].allow_wall_climb)
	
	|| (obj_camera.player[1] > 0)
	&& (instance_exists(obj_camera.player[1]))
	&& (obj_camera.player[1].wall_jump_setting <= 0)
	|| (obj_camera.player[2] > 0)
	&& (instance_exists(obj_camera.player[2]))
	&& (obj_camera.player[2].wall_jump_setting <= 0)
	|| (obj_camera.player[3] > 0)
	&& (instance_exists(obj_camera.player[3]))
	&& (obj_camera.player[3].wall_jump_setting <= 0)
	|| (obj_camera.player[4] > 0)
	&& (instance_exists(obj_camera.player[4]))
	&& (obj_camera.player[4].wall_jump_setting <= 0)
	{
		image_alpha = 1;
	}
	else
	{
		image_alpha = 0;
	}
}
#endregion /* Make wall jump panel invisible if there are only players that have wall jump ability END */

if (position_meeting(bbox_left - 1, y, obj_wall))
{
	image_xscale = +1;
}
else
{
	image_xscale = -1;
}