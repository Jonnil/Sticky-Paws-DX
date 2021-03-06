if (y>room_height+sprite_height)
{
	instance_destroy();
}
if (asset_get_type("obj_water")==asset_object)
{
	if (place_meeting(x,y,obj_water))
	{
		if (vspeed>+1)
		{
			vspeed=+1;
		}
	}
}