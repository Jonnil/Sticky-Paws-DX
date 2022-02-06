depth = +9;
friction = 0.05;
if (used = false)
{
	image_xscale = lerp(image_xscale, 3, 0.1);
	image_yscale = lerp(image_yscale, 3, 0.1);
}
else
if (used = true)
{
	image_xscale = lerp(image_xscale, 0, 0.1);
	image_yscale = lerp(image_yscale, 0, 0.1);
	if (image_xscale <= 0)
	or(image_xscale <= 0)
	{
		instance_destroy();
	}
}
gravity = 0.1;
gravity_direction = 90;
if (hspeed < - 2)
{
	hspeed = -2;
}
if (asset_get_type("obj_water") == asset_object)
{
	if (!position_meeting(x, bbox_top, obj_water))
	{
		image_alpha = lerp(image_alpha, 0, 0.3);
		gravity = 0;
		vspeed = 0;
		if (image_alpha <= 0)
		{
			instance_destroy();
		}
	}
}