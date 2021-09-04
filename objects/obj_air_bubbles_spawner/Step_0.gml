image_speed = 0.5;
time += 1;
if (time > 180)
{
	with(instance_create_depth(x, bbox_bottom, 0, obj_big_air_bubble))
	{
		hspeed = random_range(-0.1, +0.1);
	}
	time = 0;
}
if (random(10) >= 9)
{
	with(instance_create_depth(x, bbox_bottom, 0, obj_bubble))
	{
		hspeed = random_range(-1, +1);
	}
}
if (!position_meeting(x, bbox_bottom+1, obj_wall))
{
	y += 1;
}