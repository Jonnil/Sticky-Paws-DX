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