if (instance_exists(obj_player))
&& (distance_to_object(obj_player) < 20)
{
	var player_nearest = instance_nearest(x, y, obj_player);
	
	if (place_meeting(x, y + 7, obj_player) &&
	player_nearest.vspeed < 0 ||
	place_meeting(x, y - 32, obj_player) && player_nearest.vspeed > 0 && player_nearest.ground_pound >= 1 ||
	player_nearest.dive ||
	player_nearest.wall_jump > 0 ||
	player_nearest.move_towards_spring_endpoint ||
	player_nearest.speed > 30)
	&& (!player_nearest.die)
	{
		alarm[1] = 1; /* Break cardboard */
		break_cardboard_source_x = player_nearest.x;
		break_cardboard_source_speed = player_nearest.speed;
		if (player_nearest.ground_pound >= 1)
		{
			player_nearest.ground_pound = 1;
		}
	}
}

if (distance_to_object(obj_enemy_bowlingball) < 32)
{
	var enemy_bowlingball_nearest = instance_nearest(x, y, obj_enemy_bowlingball);
	if (enemy_bowlingball_nearest.sliding_along_ground != 0 || place_meeting(x, y + 1, obj_enemy_bowlingball) && enemy_bowlingball_nearest.vspeed < 0)
	&& (!enemy_bowlingball_nearest.die)
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
	var view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) * 0.5);
	var view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) * 0.5);
	var view_distance_from_center = 1024; /* How many pixels from view center objects should deactivate. Needs to be enought to not cause problems */
	var view_left = view_x_center - view_distance_from_center;
	var view_top = view_y_center - view_distance_from_center;
	var view_right = view_x_center + view_distance_from_center;
	var view_bottom = view_y_center + view_distance_from_center;
	
	if (bbox_left < view_right)
	&& (bbox_right > view_left)
	&& (bbox_top < view_bottom)
	&& (bbox_bottom > view_top)
	&& (global.deactivate_timer % 7 == 0)
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