if (!global.actually_play_edited_level)
{
	switch (object)
	{
		case LEVEL_OBJECT_ID.ID_WATER:
		case LEVEL_OBJECT_ID.ID_LAVA:
		case LEVEL_OBJECT_ID.ID_BREATHABLE_WATER:
			if (object == LEVEL_OBJECT_ID.ID_WATER)
				draw_set_alpha(0.5);
			if (object == LEVEL_OBJECT_ID.ID_BREATHABLE_WATER)
				draw_set_alpha(0.25);
			if (object == LEVEL_OBJECT_ID.ID_LAVA)
				var liquid_color = c_red;
			else
				var liquid_color = c_blue;
			draw_rectangle_color(x - 16, y - 16, 16 + second_x, 16 + second_y, liquid_color, liquid_color, liquid_color, liquid_color, false);
			draw_set_alpha(1);
			break;
	}
	
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, image_blend, image_alpha);
	
	if (draw_leveleditor_arrow)
	{
		draw_set_color(image_blend);
		draw_line_width_color(x, y, second_x, second_y, 2, c_black, image_blend);
		draw_arrow(x, y, second_x, second_y, 20);
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
	
	if (object == LEVEL_OBJECT_ID.ID_SIGN_READABLE)
	{
		if (place_meeting(x, y, obj_leveleditor))
		{
			var xx = x;
			var yy = y - 64;
			if (string_width(second_x) > 2000)
			{
				var extra_height = string_height(l10n_text(second_x)) - 8;
			}
			else
			{
				var extra_height = 0;
			}
			draw_set_alpha(0.9);
			draw_roundrect_color_ext(xx - (string_width(second_x) * 0.41) - 8, yy - string_height(l10n_text(second_x)) - extra_height, xx + (string_width(second_x) * 0.41) + 8, yy + 8, 50, 50, c_black, c_black, false);
			draw_set_alpha(1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
			draw_text_ext_transformed_color(xx, yy, string(second_x), 40, 2000, global.default_text_size, global.default_text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
	}
}