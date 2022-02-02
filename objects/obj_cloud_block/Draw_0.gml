if (asset_get_type("obj_player") == asset_object)
and (place_meeting(x, y + 8, obj_player))
and (instance_nearest(x, y, obj_player).vspeed < 0)
{
	draw_xscale = 0.9;
	draw_yscale = 1.1;
}
if (asset_get_type("obj_player") == asset_object)
and (place_meeting(x, y-8, obj_player))
{
	if (instance_nearest(x, bbox_top, obj_player).vspeed >= 0)
	{
		draw_xscale = lerp(draw_xscale, 1.1, 0.1);
		draw_yscale = lerp(draw_yscale, 0.9, 0.1);
	}
}
if (asset_get_type("spr_semisolid_platform") == asset_sprite)
{
	mask_index = spr_semisolid_platform;
}
else
if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
draw_sprite_ext(sprite_index, image_index,x, y,draw_xscale *sign(image_xscale),draw_yscale, image_angle, image_blend, image_alpha);

if (!place_meeting(x - 1, y, obj_cloud_block))
and (!place_meeting(x + 1, y, obj_cloud_block))
{
	image_index = 0;
	image_speed = 0;
}
if (!place_meeting(x - 1, y, obj_cloud_block))
and (place_meeting(x + 1, y, obj_cloud_block))
{
	image_index = 1;
	image_speed = 0;
}
if (place_meeting(x - 1, y, obj_cloud_block))
and (place_meeting(x + 1, y, obj_cloud_block))
{
	image_index = 2;
	image_speed = 0;
}
if (place_meeting(x - 1, y, obj_cloud_block))
and (!place_meeting(x + 1, y, obj_cloud_block))
{
	image_index = 3;
	image_speed = 0;
}