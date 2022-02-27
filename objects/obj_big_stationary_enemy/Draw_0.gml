if (sprite_used = "stand")
and (global.resourcepack_sprite_big_stationary_enemy > 0)
{
	draw_sprite_ext(global.resourcepack_sprite_big_stationary_enemy, image_index, x, y, draw_xscale * image_xscale, draw_yscale, image_angle, image_blend, image_alpha);
}
else
if (sprite_used = "flattened")
and (global.resourcepack_sprite_big_stationary_enemy_flattened > 0)
{
	draw_sprite_ext(global.resourcepack_sprite_big_stationary_enemy_flattened, image_index, x, y, draw_xscale * image_xscale, draw_yscale, image_angle, image_blend, image_alpha);
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

#region /*Don't move outside view*/
if (x - 42 > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
or (x + 42 < camera_get_view_x(view_camera[view_current]))
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	gravity = 0;
}
if (y + 16 < camera_get_view_y(view_camera[view_current]))
and (!place_meeting(x, y + 1, obj_wall))
and (!place_meeting(x, y + 1, obj_semisolid_platform))
and (flat = true)
and (vspeed < 0)
{
	vspeed = +1;
}
#endregion /*Don't move outside view END*/

#region /*Kill enemy if it's inside the wall*/
if (position_meeting(x, y, obj_wall))
and (die = false)
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
#endregion /*Kill enemy if it's inside the wall END*/