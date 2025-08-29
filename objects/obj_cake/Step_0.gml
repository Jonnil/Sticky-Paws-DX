var player_exists = instance_exists(obj_player);
var chair_exists = instance_exists(obj_chair_and_table);

if (player_exists)
{
	if (obj_player.intro_animation == "cake_stolen")
	{
		has_gravity = false;
	}
	else
	if (obj_player.intro_animation == "ending_chair")
	&& (chair_exists)
	{
		var nearest_chair = instance_nearest(x, y, obj_chair_and_table);
		x = nearest_chair.x + 23;
		y = nearest_chair.y - 16;
		has_gravity = false;
	}
	else
	if (attach_player)
	{
		var nearest_player = instance_nearest(x, y, obj_player);
		x = nearest_player.x;
		y = nearest_player.bbox_top - 32;
		has_gravity = false;
	}
	else
	{
		has_gravity = true;
	}
}
else
{
	has_gravity = true;
}

if (room == rm_world)
{
	visible = global.win;
}

if (has_gravity)
&& (!place_meeting(x, y + 1, obj_wall))
&& (!place_meeting(x, y, obj_player))
&& (!place_meeting(x, y, obj_cake_stealing_enemy))
&& (!place_meeting(x, y, obj_chair_and_table))
{
	gravity = 0.5;
	gravity_direction = 270;
}
else
{
	speed = 0;
	gravity = 0;
	gravity_direction = 270;
}
