#region /*Make wall jump panel invisible if there are only players that have wall jump ability*/
if (instance_exists(obj_camera))
{
	if (obj_camera.player1 > 0)
	and (obj_camera.player1.allow_wall_jump = false)
	or (obj_camera.player2 > 0)
	and (obj_camera.player2.allow_wall_jump = false)
	or (obj_camera.player3 > 0)
	and (obj_camera.player3.allow_wall_jump = false)
	or (obj_camera.player4 > 0)
	and (obj_camera.player4.allow_wall_jump = false)
	{
		visible = true;
	}
	else
	{
		visible = false;
	}
}
#endregion /*Make wall jump panel invisible if there are only players that have wall jump ability END*/