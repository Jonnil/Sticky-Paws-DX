if (asset_get_type("obj_player") == asset_object)
and (place_meeting(x, y + 8, obj_player))
and (instance_nearest(x, y, obj_player).vspeed < 0)
{
	draw_xscale = 0.9;
	draw_yscale = 1.1;
}
if (asset_get_type("obj_player") == asset_object)
and (place_meeting(x, y - 8, obj_player))
{
	if (instance_nearest(x, bbox_top, obj_player).vspeed >= 0)
	{
		draw_xscale = lerp(draw_xscale, 1.1, 0.1);
		draw_yscale = lerp(draw_yscale, 0.9, 0.1);
	}
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);