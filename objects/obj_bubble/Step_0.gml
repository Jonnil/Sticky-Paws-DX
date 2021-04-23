depth =+ 10;
gravity = 0.1;
gravity_direction = 90;
if (asset_get_type("obj_water")==asset_object)
{
	if (!position_meeting(x,y,obj_water))
	{
		image_alpha = lerp(image_alpha, 0, 0.3);
		gravity = 0;
		vspeed = 0;
		if (image_alpha<=0)
		{
			instance_destroy();
		}
	}
}