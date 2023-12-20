if (instance_exists(obj_level))
{
	come_from_level = instance_nearest(x, y, obj_level).level;
	direction = instance_nearest(x, y, obj_level).direction_after_completion;
	speed = move_speed;
}