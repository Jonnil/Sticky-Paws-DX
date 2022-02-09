if (flat = false)
{
	draw_sprite_ext(global.resourcepack_sprite_bowlingball, image_index, x, y - 16, 1, draw_xscale, draw_angle, image_blend, image_alpha);
	draw_sprite_ext(global.resourcepack_sprite_bowlingball_shine, image_index, x, y - 16, draw_xscale, draw_yscale, 0, image_blend, image_alpha);
}
else
{
	draw_sprite_ext(global.resourcepack_sprite_bowlingball, image_index, x, y, draw_xscale, draw_yscale, draw_angle, image_blend, image_alpha);
	draw_sprite_ext(global.resourcepack_sprite_bowlingball_shine, image_index, x, y, draw_xscale, draw_yscale, 0, image_blend, image_alpha);
}
if (sprite_index > noone)
{
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * image_xscale, draw_yscale, draw_angle, image_blend, image_alpha);
}

draw_text(x, y-32, string(number_of_times_stomped))

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