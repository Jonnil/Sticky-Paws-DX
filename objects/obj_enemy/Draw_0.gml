#region /* Draw coil spring underneath enemy, so run this code first */
if (coil_spring == true)
{
	if (place_meeting(x, y + 1, obj_wall))
	or (asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	or (asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	or (asset_get_type("obj_semisolid_platform") == asset_object)
	and (position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		draw_sprite_ext(global.resource_pack_sprite_coil_spring, 1, x, bbox_bottom + 16, draw_xscale, draw_yscale, 0, image_blend, image_alpha);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, bbox_bottom + 16, draw_xscale, draw_yscale, 0, image_blend, image_alpha);
	}
}
#endregion /* Draw coil spring underneath enemy, so run this code first END */

if (sprite_index > 0)
{
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * image_xscale, draw_yscale, image_angle, image_blend, image_alpha);
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

#region /* Kill enemy if it's inside the wall */
if (position_meeting(x, y, obj_wall))
and (die == false)
and (draw_xscale >= 0.8)
{
	stuck_in_wall_counter += 1;
	if (stuck_in_wall_counter >= 3)
	{
		flat = false;
		die = true;
		die_volting = true;
	}
}
else
{
	if (stuck_in_wall_counter > 0)
	{
		stuck_in_wall_counter -= 1;
	}
}
#endregion /* Kill enemy if it's inside the wall END */