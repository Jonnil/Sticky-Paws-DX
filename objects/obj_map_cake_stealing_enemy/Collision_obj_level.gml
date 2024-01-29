if (distance_to_point(other.x, other.y) < move_speed + 3)
&& (delay == 0)
&& (enter_level_delay == 0)
&& (other.clear_rate != "clear")
&& (other.level != come_from_level)
{
	x = other.x;
	y = other.y;
	speed = 0;
	enter_level_delay = 1;
	enter_level_y = other.y + 5;
}
else
if (distance_to_point(other.x, other.y) < move_speed + 3)
&& (delay == 0)
&& (enter_level_delay == 0)
&& (other.clear_rate == "clear")
&& (other.level != come_from_level)
{
	delay = 7;
	x = other.x;
	y = other.y;
	direction = instance_nearest(x, y, obj_level).direction_after_completion;
}