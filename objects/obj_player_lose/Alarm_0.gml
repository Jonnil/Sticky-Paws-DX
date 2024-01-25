if (instance_exists(obj_camera))
{
	obj_camera.hud_show_lives_timer = global.hud_hide_time * 60;
	obj_camera.hud_show_defeats_timer = global.hud_hide_time * 60;
	
	#region /* Disable the players for the camera */
	for(var i = 1; i <= global.max_players; i += 1)
	{
		if (player == i)
		{
			obj_camera.player[i] = noone;
			obj_camera.can_spawn_player[i] = false;
			break; /* Exit the loop once the correct player is found */
		}
	}
	#endregion /* Disable the players for the camera END */
	
}