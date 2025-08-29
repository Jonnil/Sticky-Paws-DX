if (coil_spring)
{
	if (place_meeting(x, y + 1, obj_wall))
	|| (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		draw_sprite_ext(global.resource_pack_sprite_coil_spring, 1, x, y + 32, draw_xscale, draw_yscale, 0, image_blend, image_alpha);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 32, draw_xscale, draw_yscale, 0, image_blend, image_alpha);
	}
}
if (sprite_exists(sprite_index))
{
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * image_xscale, draw_yscale, image_angle, image_blend, image_alpha);
}
