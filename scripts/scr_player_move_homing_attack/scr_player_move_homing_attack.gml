function scr_player_move_homing_attack()
{
	
	#region /* Homing Attack */
	if (allow_homing_attack)
	{
		
		#region /* Homing Enemy */
		if (asset_get_type("obj_wall") == asset_object)
		&& (!place_meeting(x, y + 1, obj_wall))
		&& (asset_get_type("obj_semisolid_platform") == asset_object)
		&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		&& (stick_to_wall == false)
		&& (climb == false)
		&& (horizontal_rope_climb == false)
		&& (key_jump)
		&& (asset_get_type("obj_enemy") == asset_object)
		&& (instance_exists(obj_enemy))
		&& (!collision_line(x, y, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, obj_wall, false, true))
		&& (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_enemy).x + 1, instance_nearest(x, y, obj_enemy).y + 1, obj_wall, false, true))
		&& (distance_to_object(obj_enemy) < homing_attack_distance)
		&& (instance_nearest(x, y, obj_enemy).bbox_bottom > y)
		&& (instance_nearest(x, y, obj_enemy).die == false)
		&& (homing_attack_x == 0)
		&& (homing_attack_y == 0)
		{
			homing_attack_x = instance_nearest(x, y, obj_enemy).x;
			homing_attack_y = instance_nearest(x, y, obj_enemy).bbox_top + y - bbox_bottom + 19;
			dive = false;
			ground_pound = false;
			if (speed_max <= 4)
			{
				speed_max = 4;
			}
		}
		#endregion /* Homing Enemy END */
		
		else
		
		#region /* Homing Spring */
		if (asset_get_type("obj_wall") == asset_object)
		&& (!place_meeting(x, y + 1, obj_wall))
		&& (asset_get_type("obj_semisolid_platform") == asset_object)
		&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		&& (stick_to_wall == false)
		&& (climb == false)
		&& (horizontal_rope_climb == false)
		&& (key_jump)
		&& (asset_get_type("obj_spring") == asset_object)
		&& (instance_exists(obj_spring))
		&& (!collision_line(x, y, instance_nearest(x, y, obj_spring).x, instance_nearest(x, y, obj_spring).y, obj_wall, false, true))
		&& (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_spring).x + 1, instance_nearest(x, y, obj_spring).y + 1, obj_wall, false, true))
		&& (distance_to_object(obj_spring) < homing_attack_distance)
		&& (instance_nearest(x, y, obj_spring).bbox_bottom > y)
		&& (instance_nearest(x, y, obj_spring).can_bounce == 0)
		&& (homing_attack_x == 0)
		&& (homing_attack_y == 0)
		{
			homing_attack_x = instance_nearest(x, y, obj_spring).x;
			homing_attack_y = instance_nearest(x, y, obj_spring).y;
			dive = false;
			ground_pound = false;
			if (speed_max <= 4)
			{
				speed_max = 4;
			}
		}
		#endregion /* Homing Spring END */
		
		if (homing_attack_x > 0)
		{
			move_towards_point(homing_attack_x, homing_attack_y, 30);
		}
		if (place_meeting(x, y, obj_enemy))
		{
			if (homing_attack_x > 0)
			|| (homing_attack_y > 0)
			{
				hspeed = 0;
				vspeed = -triple_jump_height;
				homing_attack_x = 0;
				homing_attack_y = 0;
			}
		}
	}
	#endregion /* Homing Attack END */
	
}