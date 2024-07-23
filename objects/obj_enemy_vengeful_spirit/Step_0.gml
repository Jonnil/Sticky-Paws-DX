if (!die)
&& (instance_exists(obj_player))
{
	xx = lerp(xx, instance_nearest(x, y, obj_player).x, 0.1);
	yy = lerp(yy, instance_nearest(x, y, obj_player).y, 0.1);
	speed = lerp(speed, 3, 0.01);
	
	move_towards_point(xx, yy, speed);
	
	if (hspeed < 0)
	{
		image_xscale = -1;
	}
	else
	{
		image_xscale = +1;
	}
}

if (die)
{
	gravity = 0.5;
}