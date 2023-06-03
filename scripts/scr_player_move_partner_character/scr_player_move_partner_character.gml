function scr_player_move_partner_character()
{
	
	#region /* Partner Character Code */
	if (partner_character)
	{
	
		#region /* What player to follow */
		if (player == 1)
		{
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player4))
			{
				partner_follow_player = obj_camera.player4;
			}
			else
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player3))
			{
				partner_follow_player = obj_camera.player3;
			}
			else
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player2))
			{
				partner_follow_player = obj_camera.player2;
			}
		}
		else
		if (player == 2)
		{
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player1))
			{
				partner_follow_player = obj_camera.player1;
			}
			else
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player4))
			{
				partner_follow_player = obj_camera.player4;
			}
			else
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player3))
			{
				partner_follow_player = obj_camera.player3;
			}
		}
		else
		if (player == 3)
		{
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player2))
			{
				partner_follow_player = obj_camera.player2;
			}
			else
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player1))
			{
				partner_follow_player = obj_camera.player1;
			}
			else
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player4))
			{
				partner_follow_player = obj_camera.player4;
			}
		}
		else
		if (player == 4)
		{
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player3))
			{
				partner_follow_player = obj_camera.player3;
			}
			else
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player2))
			{
				partner_follow_player = obj_camera.player2;
			}
			else
			if (instance_exists(obj_camera))
			&& (instance_exists(obj_camera.player1))
			{
				partner_follow_player = obj_camera.player1;
			}
		}
		#endregion /* What player to follow END */
	
		if (instance_exists(obj_camera))
		&& (instance_exists(partner_follow_player))
		&& (distance_to_object(partner_follow_player) > 100)
		&& (x < partner_follow_player.x - 100)
		{
			active_right = true;
			if (invincible_timer >= true)
			&& (assist_invincible == false)
			{
				speed_max = lerp(speed_max, 10, 0.1);
			}
			else
			{
				if (speed_max < speed_max_run)
				{
					speed_max = lerp(speed_max, speed_max_run, 0.1);
				}
			}
		}
		else
		{
			active_right = false;
		}
		if (instance_exists(obj_camera))
		&& (instance_exists(partner_follow_player))
		&& (distance_to_object(partner_follow_player) > 100)
		&& (x > partner_follow_player.x + 100)
		{
			active_left = true;
			if (invincible_timer >= true)
			&& (assist_invincible == false)
			{
				speed_max = lerp(speed_max, 10, 0.1);
			}
			else
			{
				if (speed_max < speed_max_run)
				{
					speed_max = lerp(speed_max, speed_max_run, 0.1);
				}
			}
		}
		else
		{
			active_left = false;
		}
		if (instance_exists(obj_camera))
		&& (instance_exists(partner_follow_player))
		&& (distance_to_object(partner_follow_player) > 100)
		&& (y > partner_follow_player.y + 100)
		&& (on_ground)
		|| (instance_exists(obj_camera))
		&& (instance_exists(partner_follow_player))
		&& (distance_to_object(partner_follow_player) > 100)
		&& (place_meeting(x - 1, y, obj_wall))
		&& (x > partner_follow_player.x + 100)
		&& (on_ground)
		|| (instance_exists(obj_camera))
		&& (instance_exists(partner_follow_player))
		&& (distance_to_object(partner_follow_player) > 100)
		&& (place_meeting(x + 1, y, obj_wall))
		&& (x < partner_follow_player.x - 100)
		&& (on_ground)
		{
			active_jump = true;
			active_up = true;
		}
		else
		{
			active_jump = false;
			active_up = false;
		}
		if (instance_exists(obj_camera))
		&& (instance_exists(partner_follow_player))
		&& (distance_to_object(partner_follow_player) > 100)
		&& (y < partner_follow_player.y - 100)
		{
			active_down = true;
		}
		else
		{
			active_down = false;
		}
	}
	#endregion /* Partner Character Code */
	
}