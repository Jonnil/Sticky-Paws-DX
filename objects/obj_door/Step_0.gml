if (sprite_index == spr_warp_box)
|| (sprite_index == spr_warp_box_one_use)
{
	image_blend = make_color_hsv((current_time * 0.1) mod 255, 127, 255);
}

if (open_door)
{
	global.iris_zoom_in = true;
	with(instance_nearest(x, y, obj_player))
	{
		can_move = false;
		ground_pound = 0;
		dive = false;
		hspeed = 0;
		vspeed = 0;
		gravity = 0;
		x = instance_nearest(x, y, obj_door).x;
		if (!instance_nearest(x, y, obj_door).door_need_to_be_on_ground_to_enter)
		{
			y = instance_nearest(x, y, obj_door).y;
		}
		if (instance_nearest(x, y, obj_door).sprite_index == spr_warp_box)
		|| (instance_nearest(x, y, obj_door).sprite_index == spr_warp_box_one_use)
		{
			image_alpha = lerp(image_alpha, 0, 0.3);
		}
	}
	instance_nearest(x, y, obj_camera).xx = x;
	instance_nearest(x, y, obj_camera).yy = y;
	door_x = lerp(door_x, +32, 0.1);
	door_xscale = lerp(door_xscale, -1, 0.1);
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
		instance_nearest(x, y, obj_camera).xx = second_x;
		instance_nearest(x, y, obj_camera).yy = second_y;
		obj_player.can_clamp_inside_view = 0; /* Make the player not clamp within view before teleporting the player. View needs to have time to catch up */
		obj_player.can_move = true;
		obj_player.xx_heart = second_x;
		obj_player.yy_heart = second_y;
		obj_player.image_alpha = 1;
		obj_player.x = second_x; /* Lastly, teleport the player */
		obj_player.y = second_y;
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
		if (destroy_door_after_use)
		{
			instance_destroy(); /* Warp Bloxs gets destroyed after one use */
		}
	}
}
else
{
	door_x = lerp(door_x, 0, 0.1);
	door_xscale = lerp(door_xscale, 1, 0.1);
}