depth = +10;
friction = 0.05;
gravity = random_range(0.01, 0.1);
gravity_direction = 90;
if (hspeed < - 5)
{
	hspeed = -5;
}
if (asset_get_type("obj_water") == asset_object)
and (asset_get_type("obj_water_level") == asset_object)
{
	if (!position_meeting(x, bbox_top, obj_water))
	and (instance_exists(obj_water_level))
	and (y < obj_water_level.y)
	{
		image_alpha = lerp(image_alpha, 0, 0.3);
		gravity = 0;
		vspeed = 0;
	}
}
if (image_alpha <= 0)
{
	instance_destroy();
}