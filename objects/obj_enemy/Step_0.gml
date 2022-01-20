if (y >room_height + sprite_height)
{
	instance_destroy();
}
if (asset_get_type("obj_water") == asset_object)
{
	if (place_meeting(x, y, obj_water))
	{
		if (vspeed > +1)
		{
			vspeed = +1;
		}
	}
}

#region /*Kill enemy if it's inside the wall*/
if (position_meeting(x, y, obj_wall))
and (die = false)
and (draw_xscale >= 0.8)
{
	flat = false;
	die = true;
	die_volting = true;
}
#endregion /*Kill enemy if it's inside the wall END*/

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);