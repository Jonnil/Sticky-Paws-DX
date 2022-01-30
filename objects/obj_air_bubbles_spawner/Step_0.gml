image_speed = 0.5;

time += 1;
if (time > 180)
{
	if (place_meeting(x, y, obj_water))
	{
		with(instance_create_depth(x, bbox_top, 0, obj_big_air_bubble))
		{
			hspeed = random_range(-0.1, + 0.1);
		}
	}
	time = 0;
}
if (place_meeting(x, y, obj_water))
and (random(10) >= 9)
and (fps_real >= 210)
{
	with(instance_create_depth(x, bbox_top, 0, obj_bubble))
	{
		hspeed = random_range(- 1, + 1);
	}
}
if (!position_meeting(x, bbox_bottom + 1, obj_wall))
{
	y += 1;
}

if (place_meeting(x, y, obj_water))
{
	image_alpha = lerp(image_alpha, 1, 0.1);
}
else
{
	image_alpha = lerp(image_alpha, 0, 0.1);
}