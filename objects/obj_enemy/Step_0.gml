if (place_meeting(x, y, obj_water))
{
	if (vspeed > +1)
	{
		vspeed = +1;
	}
}

if (stomped_delay > 0)
{
	stomped_delay -= 1;
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

scr_enemy_dying_offscreen();