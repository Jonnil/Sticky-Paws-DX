if (!global.actually_play_edited_level)
{
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, image_blend, image_alpha);
	
	switch (object)
	{
		case level_object_id.id_spring:
		case level_object_id.id_door:
		case level_object_id.id_water_level_change_slow:
		case level_object_id.id_water_level_change_fast:
		case level_object_id.id_water_level_change_faster:
		case level_object_id.id_arrow_sign:
		case level_object_id.id_arrow_sign_small:
			draw_line_width_color(x, y, second_x, second_y, 2, c_black, image_blend);
			draw_arrow(x, y, second_x, second_y, 20);
			break;
			
		case level_object_id.id_water:
		case level_object_id.id_breathable_water:
			if (object == level_object_id.id_water)
				draw_set_alpha(0.5);
			if (object == level_object_id.id_breathable_water)
				draw_set_alpha(0.25);
			draw_rectangle_color(x - 16, y - 16, 16 + second_x, 16 + second_y, c_blue, c_blue, c_blue, c_blue, false);
			draw_set_alpha(1);
			break;
	}
	
	if (draw_item_with_spring)
	{
		draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, 0.5, 0.5, 0, image_blend, image_alpha);
	}
	
	if (draw_item_on_top != noone)
	{
		draw_sprite_ext(draw_item_on_top, 0, x, y, 0.5, 0.5, 0, image_blend, image_alpha);
	}
}