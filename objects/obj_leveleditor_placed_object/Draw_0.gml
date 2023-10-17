if (!global.actually_play_edited_level)
{
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, image_blend, image_alpha);
	
	if (draw_leveleditor_arrow)
	{
		draw_set_color(image_blend);
		draw_line_width_color(x, y, second_x, second_y, 2, c_black, image_blend);
		draw_arrow(x, y, second_x, second_y, 20);
	}
	
	switch (object)
	{
		case LEVEL_OBJECT_ID.ID_WATER:
		case LEVEL_OBJECT_ID.ID_BREATHABLE_WATER:
			if (object == LEVEL_OBJECT_ID.ID_WATER)
				draw_set_alpha(0.5);
			if (object == LEVEL_OBJECT_ID.ID_BREATHABLE_WATER)
				draw_set_alpha(0.25);
			draw_rectangle_color(x - 16, y - 16, 16 + second_x, 16 + second_y, c_blue, c_blue, c_blue, c_blue, false);
			draw_set_alpha(1);
			break;
	}
	
	if (draw_item_on_top != noone)
	{
		if (draw_item_with_spring)
		{
			draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, image_blend, image_alpha);
		}
		draw_sprite_ext(draw_item_on_top, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);
	}
	else
	if (draw_item_with_spring)
	{
		draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 1, 1, 0, image_blend, image_alpha);
	}
}

if (object == LEVEL_OBJECT_ID.ID_SIGN_READABLE)
{
	scr_draw_text_outlined(x, y - 64, string(second_x), global.default_text_size, c_black, c_white, 1);
}