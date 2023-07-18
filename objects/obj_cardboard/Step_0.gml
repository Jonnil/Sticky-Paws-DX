var view_camera_current = view_camera[view_current];
var view_left = camera_get_view_x(view_camera_current);
var view_right = view_left + camera_get_view_width(view_camera_current);
var view_top = camera_get_view_y(view_camera_current);
var view_bottom = view_top + camera_get_view_height(view_camera_current);

var player_nearest = instance_nearest(x, y, obj_player);
var enemy_bowlingball_nearest = instance_nearest(x, y, obj_enemy_bowlingball);

if (distance_to_object(obj_player) < 32 && !collision_line(x, y, player_nearest.x, player_nearest.y, obj_wall, false, true))
{
	if (place_meeting(x, y + 8, obj_player) &&
		player_nearest.vspeed < 0 ||
		place_meeting(x, y - 32, obj_player) && player_nearest.vspeed > 0 && player_nearest.ground_pound ||
		player_nearest.dive ||
		player_nearest.wall_jump > 0 ||
		player_nearest.move_towards_spring_endpoint ||
		player_nearest.speed > 30)
	{
		break_cardboard = true;
		if (instance_exists(obj_player))
		{
			break_cardboard_source_x = player_nearest.x;
			break_cardboard_source_speed = player_nearest.speed;
		}
	}
	
}

if (distance_to_object(obj_enemy_bowlingball) < 32 && !collision_line(x, y, enemy_bowlingball_nearest.x, enemy_bowlingball_nearest.y, obj_wall, false, true))
{
	if (enemy_bowlingball_nearest.sliding_along_ground != 0 || place_meeting(x, y + 1, obj_enemy_bowlingball) && enemy_bowlingball_nearest.vspeed < 0)
	{
		break_cardboard = true;
		if (instance_exists(obj_enemy_bowlingball))
		{
			break_cardboard_source_x = enemy_bowlingball_nearest.x;
			break_cardboard_source_speed = enemy_bowlingball_nearest.speed;
		}
	}
}
var check_margin = 3; /* Adjust this value to set the margin from the corners */
var check_left = bbox_left + check_margin;
var check_right = bbox_right - check_margin;
var check_bottom = bbox_bottom + check_margin;
if (!collision_rectangle(check_left, check_bottom, check_right, check_bottom, obj_wall, false, true) &&
    !collision_rectangle(check_left, check_bottom, check_right, check_bottom, obj_semisolid_platform, false, true))
{
	if (bbox_left < view_right + 8 &&
		bbox_right > view_left - 8 &&
		bbox_top < view_bottom + 8 &&
		bbox_bottom > view_top - 8)
	{
		break_cardboard = true;
		if (instance_exists(obj_player))
		{
			break_cardboard_source_x = player_nearest.x;
			break_cardboard_source_speed = player_nearest.speed;
		}
	}
}
if (break_cardboard)
{
	instance_create_depth(x, y - 32, 0, obj_block_break);
	score += 50;
	var break_cardboard_direction = random_range(103, 167);
	if (break_cardboard_source_x < x)
	{
		break_cardboard_direction = random_range(13, 77);
	}
	var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
	new_instance.sprite_index = sprite_index;
	new_instance.direction = break_cardboard_direction;
	new_instance.speed = random_range(5, 10) + instance_nearest(x, y, obj_cardboard).break_cardboard_source_speed * 0.5;
	if (x < view_right && x > view_left && y < view_bottom && y > view_top)
	{
		effect_create_above(ef_smoke, x, y, 1, c_dkgray);
		scr_audio_play(snd_blockbreak, volume_source.sound);
	}
	with (obj_camera)
	{
		hud_show_score_timer = global.hud_hide_time * 60;
	}
	if (instance_exists(obj_player))
	{
		scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
	}
	instance_destroy();
}