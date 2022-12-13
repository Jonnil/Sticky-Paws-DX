if (instance_exists(obj_player))
and (instance_nearest(x, y, obj_player).key_up_pressed)
and (instance_nearest(x, y, obj_player).on_ground == true)
and (place_meeting(x, y, obj_player))
and (open_door == false)
and (door_xscale >= 0.9)
{
	open_door = true;
}
if (open_door == true)
{
	with(instance_nearest(x, y, obj_player))
	{
		can_move = false;
		hspeed = 0;
		x = instance_nearest(x, y, obj_door).x;
	}
	door_x = lerp(door_x, +32, 0.05);
	door_xscale = lerp(door_xscale, -1, 0.05);
	if (door_x >= 31)
	or (door_xscale <= -1)
	{
		global.iris_zoom_in = true;
		global.player_can_go_outside_view = true;
		instance_nearest(x, y, obj_player).enter_door = true;
		open_door = 2;
	}
}
else
if (open_door == 2)
{
	with(instance_nearest(x, y, obj_player))
	{
		can_move = false;
		hspeed = 0;
		x = instance_nearest(x, y, obj_door).x;
	}
	instance_nearest(x, y, obj_player).image_alpha = lerp(instance_nearest(x, y, obj_player).image_alpha, 0, 0.3);
	instance_nearest(x, y, obj_player).draw_xscale = lerp(instance_nearest(x, y, obj_player).draw_xscale, 0, 0.3);
	instance_nearest(x, y, obj_player).draw_yscale = lerp(instance_nearest(x, y, obj_player).draw_yscale, 0, 0.3);
	if (door_xscale >= 0.9)
	and (door_xscale < 1)
	and (instance_exists(obj_player))
	and (instance_nearest(x, y, obj_player).can_move == false)
	{
		door_x = 0;
		door_xscale = 1;
		global.iris_zoom_in = false;
		instance_nearest(x, y, obj_camera).x = second_x;
		instance_nearest(x, y, obj_camera).y = second_y;
		instance_nearest(x, y, obj_player).can_move = true;
		instance_nearest(x, y, obj_player).enter_door = false;
		instance_nearest(x, y, obj_player).image_alpha = 1;
		instance_nearest(x, y, obj_player).x = second_x;
		instance_nearest(x, y, obj_player).y = second_y;
		instance_nearest(x, y, obj_player).xx_heart = second_x;
		instance_nearest(x, y, obj_player).yy_heart = second_y;
		open_door = false;
		timer += 1;
	}
	door_x = lerp(door_x, 0, 0.04);
	door_xscale = lerp(door_xscale, 1, 0.04);
}
else
{
	door_x = lerp(door_x, 0, 0.04);
	door_xscale = lerp(door_xscale, 1, 0.04);
}

if (timer > 0)
{
	timer += 1;
	if (timer > 10)
	{
		global.player_can_go_outside_view = false;
		timer = 0;
	}
}