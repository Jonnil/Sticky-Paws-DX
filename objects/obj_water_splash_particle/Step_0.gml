depth = - 10;
gravity = 0.5;
gravity_direction = 270;
if (position_meeting(x, y, obj_water))
|| (place_meeting(x, y + 1, obj_wall))
{
	image_alpha = lerp(image_alpha, 0, 0.2);
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}
if (place_meeting(x, y, obj_wall))
{
	hspeed = 0;
	vspeed = 0;
}