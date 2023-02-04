if (instance_exists(obj_player))
and (instance_nearest(x, y, obj_player).key_up_pressed)
and (instance_nearest(x, y, obj_player).on_ground == true)
and (place_meeting(x, y, obj_player))
and (open_door == false)
and (door_xscale >= 0.9)
{
	/* The door must sit on ground too before a player can enter */
	if (position_meeting(x, bbox_bottom + 1, obj_wall))
	or (position_meeting(bbox_left - 1, bbox_bottom + 1, obj_wall))
	or (position_meeting(bbox_right + 1, bbox_bottom + 1, obj_wall))
	or (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	or (position_meeting(bbox_left - 1, bbox_bottom + 1, obj_semisolid_platform))
	or (position_meeting(bbox_right + 1, bbox_bottom + 1, obj_semisolid_platform))
	{
		open_door = true;
	}
}
if (open_door == true)
{
	global.iris_zoom_in = true;
	with(instance_nearest(x, y, obj_player))
	{
		can_move = false;
		hspeed = 0;
		x = instance_nearest(x, y, obj_door).x;
	}
	door_x = lerp(door_x, +32, 0.05);
	door_xscale = lerp(door_xscale, -1, 0.05);
	if (obj_camera.iris_xscale <= 0.02)
	{
		global.player_can_go_outside_view = true;
	}
	if (obj_camera.iris_xscale <= 0.01)
	{
		door_x = 0;
		door_xscale = 1;
		global.iris_zoom_in = false;
		instance_nearest(x, y, obj_camera).x = second_x;
		instance_nearest(x, y, obj_camera).y = second_y;
		instance_nearest(x, y, obj_player).can_move = true;
		instance_nearest(x, y, obj_player).image_alpha = 1;
		instance_nearest(x, y, obj_player).x = second_x;
		instance_nearest(x, y, obj_player).y = second_y;
		instance_nearest(x, y, obj_player).xx_heart = second_x;
		instance_nearest(x, y, obj_player).yy_heart = second_y;
		open_door = false;
		var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
		{
			global.player_can_go_outside_view = false;
		}
		, [], 1);
		time_source_start(time_source);
		with (instance_nearest(obj_player.x, obj_player.y, obj_door))
		{
			if (place_meeting(x, y, obj_player))
			{
				door_x = +32;
				door_xscale = -1;
				open_door = false;
			}
		}
	}
}
else
{
	door_x = lerp(door_x, 0, 0.05);
	door_xscale = lerp(door_xscale, 1, 0.05);
}