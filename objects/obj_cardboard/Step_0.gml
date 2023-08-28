if (distance_to_object(obj_player) < 32)
{
	var player_nearest = instance_nearest(x, y, obj_player);
	
	if (place_meeting(x, y + 8, obj_player) &&
		player_nearest.vspeed < 0 ||
		place_meeting(x, y - 32, obj_player) && player_nearest.vspeed > 0 && player_nearest.ground_pound ||
		player_nearest.dive ||
		player_nearest.wall_jump > 0 ||
		player_nearest.move_towards_spring_endpoint ||
		player_nearest.speed > 30)
	{
		alarm[1] = 1; /* Break cardboard */
		if (instance_exists(obj_player))
		{
			break_cardboard_source_x = player_nearest.x;
			break_cardboard_source_speed = player_nearest.speed;
		}
	}
}

if (distance_to_object(obj_enemy_bowlingball) < 32)
{
	var enemy_bowlingball_nearest = instance_nearest(x, y, obj_enemy_bowlingball);
	if (enemy_bowlingball_nearest.sliding_along_ground != 0 || place_meeting(x, y + 1, obj_enemy_bowlingball) && enemy_bowlingball_nearest.vspeed < 0)
	{
		alarm[1] = 1; /* Break cardboard */
		if (instance_exists(obj_enemy_bowlingball))
		{
			break_cardboard_source_x = enemy_bowlingball_nearest.x;
			break_cardboard_source_speed = enemy_bowlingball_nearest.speed;
		}
	}
}

#region /* If there isn't any ground underneath, then break itself */
var check_margin = 3; /* Adjust this value to set the margin from the corners */
var check_left = bbox_left + check_margin;
var check_right = bbox_right - check_margin;
var check_bottom = bbox_bottom + check_margin;
if (!collision_rectangle(check_left, check_bottom, check_right, check_bottom, obj_wall, false, true) &&
    !collision_rectangle(check_left, check_bottom, check_right, check_bottom, obj_semisolid_platform, false, true))
{
	var view_camera_current = view_camera[view_current];
	var view_left = camera_get_view_x(view_camera_current);
	var view_right = view_left + camera_get_view_width(view_camera_current);
	var view_top = camera_get_view_y(view_camera_current);
	var view_bottom = view_top + camera_get_view_height(view_camera_current);
	if (bbox_left < view_right + 8 &&
		bbox_right > view_left - 8 &&
		bbox_top < view_bottom + 8 &&
		bbox_bottom > view_top - 8)
	{
		alarm[1] = 1; /* Break cardboard */
		if (instance_exists(obj_player))
		{
			var player_nearest = instance_nearest(x, y, obj_player);
			break_cardboard_source_x = player_nearest.x;
			break_cardboard_source_speed = player_nearest.speed;
		}
	}
}
#endregion /* If there isn't any ground underneath, then break itself END */