depth = +10;
friction = 0.05;
gravity = random_range(0.01, 0.1);
gravity_direction = 90;
if (hspeed < - 5)
{
	hspeed = -5;
}
if (!position_meeting(x, bbox_top, obj_water))
&& (instance_exists(obj_water_level))
&& (y < obj_water_level.y)
{
	image_alpha = lerp(image_alpha, 0, 0.3);
	gravity = 0;
	vspeed = 0;
}
if (image_alpha <= 0)
{
	instance_destroy();
}
