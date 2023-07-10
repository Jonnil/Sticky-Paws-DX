#region /* Draw coil spring */
if (coil_spring)
{
	if (place_meeting(x, y + 1, obj_wall))
	|| (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		draw_sprite_ext(global.resource_pack_sprite_coil_spring, 1, x, bbox_bottom, draw_xscale, draw_yscale, 0, image_blend, image_alpha);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, bbox_bottom, draw_xscale, draw_yscale, 0, image_blend, image_alpha);
	}
}
#endregion /* Draw coil spring END */

if (sprite_used = "stand")
&& (global.resource_pack_sprite_big_stationary_enemy > 0)
{
	draw_sprite_ext(global.resource_pack_sprite_big_stationary_enemy, image_index, x, y, draw_xscale * image_xscale, draw_yscale, image_angle, image_blend, image_alpha);
}
else
if (sprite_used = "flattened")
&& (global.resource_pack_sprite_big_stationary_enemy_flattened > 0)
{
	draw_sprite_ext(global.resource_pack_sprite_big_stationary_enemy_flattened, image_index, x, y, draw_xscale * image_xscale, draw_yscale, image_angle, image_blend, image_alpha);
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

#region /* Kill enemy if it's inside the wall */
if (position_meeting(x, y, obj_wall))
&& (die == false)
&& (draw_xscale >= 0.8)
{
	stuck_in_wall_counter ++;
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
		stuck_in_wall_counter --;
	}
}
#endregion /* Kill enemy if it's inside the wall END */