if (instance_exists(obj_camera))
{
	obj_camera.hud_show_lives_timer = global.hud_hide_time * 60;
	obj_camera.hud_show_defeats_timer = global.hud_hide_time * 60;
	
	#region /* Disable the players for the camera */
	if (player == 1) /* Disable player 1 */
	{
		obj_camera.player1 = noone;
		obj_camera.can_spawn_player[1] = false;
	}
	if (player == 2) /* Disable player 2 */
	{
		obj_camera.player2 = noone;
		obj_camera.can_spawn_player[2] = false;
	}
	if (player == 3) /* Disable player 3 */
	{
		obj_camera.player3 = noone;
		obj_camera.can_spawn_player[3] = false;
	}
	if (player == 4) /* Disable player 4 */
	{
		obj_camera.player4 = noone;
		obj_camera.can_spawn_player[4] = false;
	}
	#endregion /* Disable the players for the camera END */
	
}