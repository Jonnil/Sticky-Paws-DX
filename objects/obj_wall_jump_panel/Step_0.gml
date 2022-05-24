#region /*Make wall jump panel invisible if there are only players that have wall jump ability*/
if (instance_exists(obj_camera))
{
	if (obj_camera.player1 > 0)
	and (instance_exists(obj_camera.player1))
	and (obj_camera.player1.allow_wall_jump = false)
	or(obj_camera.player2 > 0)
	and (instance_exists(obj_camera.player2))
	and (obj_camera.player2.allow_wall_jump = false)
	or(obj_camera.player3 > 0)
	and (instance_exists(obj_camera.player3))
	and (obj_camera.player3.allow_wall_jump = false)
	or(obj_camera.player4 > 0)
	and (instance_exists(obj_camera.player4))
	and (obj_camera.player4.allow_wall_jump = false)
	
	or (obj_camera.player1 > 0)
	and (instance_exists(obj_camera.player1))
	and (obj_camera.player1.wall_jump_setting <= 0)
	or (obj_camera.player2 > 0)
	and (instance_exists(obj_camera.player2))
	and (obj_camera.player2.wall_jump_setting <= 0)
	or (obj_camera.player3 > 0)
	and (instance_exists(obj_camera.player3))
	and (obj_camera.player3.wall_jump_setting <= 0)
	or (obj_camera.player4 > 0)
	and (instance_exists(obj_camera.player4))
	and (obj_camera.player4.wall_jump_setting <= 0)
	{
		visible = true;
	}
}
#endregion /*Make wall jump panel invisible if there are only players that have wall jump ability END*/