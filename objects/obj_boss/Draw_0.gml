draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

red_blink_timer++;
if (red_blink_timer > 60)
{
	red_blink_timer = 0;
}

if (red_blink_timer > 55 && hp <= 1)
{
	draw_sprite_ext(sprite_index, image_index, x + random_range(-8, 8), y + random_range(-8, 8), draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, 1);
}
else
{
	var sprite_alpha = 0.5;
	var red_alpha = 0;

	if (taken_damage % 2 == 0)
	{
		sprite_alpha = 1;
		if (hp = 2)
		{
			red_alpha = 0.25;
		}
		else if (hp <= 1)
		{
			red_alpha = 0.5;
		}
	}

	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, c_white, sprite_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, red_alpha);
}

if (can_jump_on_head)
{
	arrow_xscale = scr_wave(1, 0, 1, 0);
	draw_sprite_ext(spr_arrow_sign, image_index, x, y - 32, 1, arrow_xscale, 270, image_blend, 1);
}
