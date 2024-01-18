#region /* Make wall jump panel invisible if there are only players that have wall jump ability */
if (instance_exists(obj_camera))
{
	var set_alpha = 0;
	for (var i = 1; i <= global.max_players; i += 1)
	{
		if (obj_camera.player[i] > 0 && instance_exists(obj_camera.player[i]) && obj_camera.player[i].allow_wall_jump <= 0)
		{
			set_alpha = 1;
			break; /* exit the loop if the condition is met */
		}
	}
	if (set_alpha == 0)
	{
		for (var i = 1; i <= global.max_players; i += 1)
		{
			if (obj_camera.player[i] > 0 && instance_exists(obj_camera.player[i]) && obj_camera.player[i].wall_jump_setting <= 0)
			{
				set_alpha = 1;
				break; /* exit the loop if the condition is met */
			}
		}
	}
	image_alpha = set_alpha;
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