if (y > room_height + sprite_height)
{
	instance_destroy();
}
if (asset_get_type("obj_water") == asset_object)
{
	if (place_meeting(x, y, obj_water))
	{
		if (vspeed > + 1)
		{
			vspeed = +1;
		}
	}
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);