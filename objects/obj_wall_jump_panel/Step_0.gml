#region /* Make wall jump panel invisible if there are only players that have wall jump ability */
if (instance_exists(obj_camera))
{
	if (obj_camera.player1 > 0)
	&& (instance_exists(obj_camera.player1))
	&& (obj_camera.player1.allow_wall_jump == false)
	|| (obj_camera.player2 > 0)
	&& (instance_exists(obj_camera.player2))
	&& (obj_camera.player2.allow_wall_jump == false)
	|| (obj_camera.player3 > 0)
	&& (instance_exists(obj_camera.player3))
	&& (obj_camera.player3.allow_wall_jump == false)
	|| (obj_camera.player4 > 0)
	&& (instance_exists(obj_camera.player4))
	&& (obj_camera.player4.allow_wall_jump == false)
	
	|| (obj_camera.player1 > 0)
	&& (instance_exists(obj_camera.player1))
	&& (obj_camera.player1.wall_jump_setting <= 0)
	|| (obj_camera.player2 > 0)
	&& (instance_exists(obj_camera.player2))
	&& (obj_camera.player2.wall_jump_setting <= 0)
	|| (obj_camera.player3 > 0)
	&& (instance_exists(obj_camera.player3))
	&& (obj_camera.player3.wall_jump_setting <= 0)
	|| (obj_camera.player4 > 0)
	&& (instance_exists(obj_camera.player4))
	&& (obj_camera.player4.wall_jump_setting <= 0)
	{
		visible = true;
	}
}
#endregion /* Make wall jump panel invisible if there are only players that have wall jump ability END */