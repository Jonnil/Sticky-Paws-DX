if (has_gravity)
&& (!place_meeting(x, y, obj_player))
&& (!place_meeting(x, y, obj_cake_stealing_enemy))
&& (!place_meeting(x, y, obj_chair_and_table))
{
	while (place_meeting(x, y, other))
	{
		x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
		y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
	}
}
