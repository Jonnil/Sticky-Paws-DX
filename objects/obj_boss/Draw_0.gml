/* Draw Self */
draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
redblinktimer += 1;
if (redblinktimer > 60)
{
	redblinktimer = 0;
}
if (redblinktimer > 55)
and (hp <= 1)
{
	draw_sprite_ext(sprite_index, image_index, x + random_range(- 8, +8), y + random_range(- 8, +8), draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, image_alpha);
}
else
{
	if (takendamage % 2 == 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, image_blend, image_alpha);
	}
	else
	{
		draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, image_blend, 0.5);
	}
	if (hp = 2)
	{
		if (takendamage % 2 == 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, 0.25);
		}
		else
		{
			draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, 0.1);
		}
	}
	if hp <= 1
	{
		if takendamage % 2 == 0
		{
			draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, 0.5);
		}
		else
		{
			draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, 0.1);
		}
	}
}
if (asset_get_type("spr_arrow_sign") == asset_sprite)
and (can_jump_on_head = true)
{
	arrow_xscale = scr_wave(1, 0, 1, 0);
	draw_sprite_ext(spr_arrow_sign, image_index, x, y - 32, 1, arrow_xscale, 270, image_blend, 1);
}