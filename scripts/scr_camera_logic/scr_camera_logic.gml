function scr_camera_logic()
{
    
	#region /* Camera Logic */
    if (!save_level_as_png)
	{
        /* Screen shake */
        if (shake > 0)
		{
			x += random_range(-shake, shake);
			y += random_range(-shake, shake);
            shake = lerp(shake, 0, 0.1);
        }
        
        /* Smooth camera movement */
        x = lerp(x, xx, 0.1);
        y = lerp(y, yy, 0.15);
        
        #region /* Boss Battle Camera */
        if (instance_exists(obj_boss)
		&& instance_exists(obj_player)
		&& distance_to_object(obj_boss) < 380)
		{
            /* Center camera between boss and player */
            var target_player = -1;
            for (var i = 1; i <= global.max_players; i++)
			{
                if (player[i] > 0 && instance_exists(player[i]))
				{
                    target_player = i;
                    break;
                }
            }
            if (target_player != -1)
			{
				if (!is_autoscrolling_horizontal)
				{
					xx = mean(player[target_player].x, obj_boss.x);
				}
				if (!is_autoscrolling_vertical)
				{
					yy = mean(player[target_player].y, obj_boss.y);
				}
            }
        }
		#endregion /* Boss Battle Camera END */
		
		else
		
		#region /* Multiplayer Camera */
		if (instance_number(obj_player) >= 2)
		{
            var players_to_follow = [];
            for (var i = 1; i <= global.max_players; i++)
			{
                if (player[i] > 0 && instance_exists(player[i]))
				{
                    players_to_follow[array_length(players_to_follow)] = player[i];
                }
            }
            if (array_length(players_to_follow) > 0)
			{
                /* Center camera between all players */
                var sum_x = 0;
                var sum_y = 0;
                for (var i = 0; i < array_length(players_to_follow); i++)
				{
                    sum_x += players_to_follow[i].x;
                    sum_y += players_to_follow[i].y;
                }
				if (!is_autoscrolling_horizontal)
				{
					xx = sum_x / array_length(players_to_follow);
				}
				if (!is_autoscrolling_vertical)
				{
					yy = sum_y / array_length(players_to_follow);
				}
            }
        }
		#endregion /* Multiplayer Camera END */
		
		else
		
		#region /* Single Player Camera */
		if (instance_number(obj_player) == 1)
		{
            for (var i = 1; i <= global.max_players; i++)
			{
                if (player[i] > 0 && instance_exists(player[i]))
				{
                    /* Follow one player */
					if (!is_autoscrolling_horizontal)
					{
						xx = player[i].x + player[i].hspeed * 15;
					}
                    if (!is_autoscrolling_vertical)
					{
						if (player[i].on_ground && player[i].vspeed >= 0)
						{
	                        yy = player[i].y;
	                    }
						else
						if (player[i].y < camera_get_view_y(view_camera[view_current]) + 128)
						{
	                        yy -= abs(player[i].vspeed);
	                    }
                    
						/* Additional conditions for y position adjustments */
	                    if (player[i].wall_jump
						|| player[i].climb
						|| player[i].y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
						{
	                        yy = player[i].y;
	                    }
                    
						/* Adjust y position for specific player actions */
	                    if (player[i].in_water
						|| player[i].stick_to_wall
						|| player[i].spring
						|| player[i].climb
						|| player[i].horizontal_rope_climb)
						{
	                        if (player[i].y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
							{
	                            yy = player[i].y;
	                        }
	                    }
					}
                    break;
                }
            }
        }
		#endregion /* Single Player Camera END */
		
		else
		{
			/* Default camera behavior */
			if (!is_autoscrolling_horizontal)
			{
				xx = x;
			}
			if (!is_autoscrolling_vertical)
			{
				yy = y;
			}
        }
    }
	#endregion /* Camera Logic END */
	
	#region /* Autoscroll Logic */
	if (is_autoscrolling_horizontal)
	{
		xx += autoscroll_speed_x;
	}
	if (is_autoscrolling_vertical)
	{
		yy += autoscroll_speed_y;
	}
	#endregion /* Autoscroll Logic END */
	
}