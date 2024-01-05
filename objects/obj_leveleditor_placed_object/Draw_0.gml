var liquid_color, spring_scale;

switch (object) {
	case LEVEL_OBJECT_ID.ID_WATER:
	case LEVEL_OBJECT_ID.ID_LAVA:
	case LEVEL_OBJECT_ID.ID_BREATHABLE_WATER:
		draw_set_alpha(0.5);
		
		if (object == LEVEL_OBJECT_ID.ID_BREATHABLE_WATER)
		{
			draw_set_alpha(0.25);
		}
			
		if (object == LEVEL_OBJECT_ID.ID_LAVA)
		{
			liquid_color = c_red;
		}
		else
		{
			liquid_color = c_blue;
		}
		
		draw_rectangle_color(x - 16, y - 16, 16 + second_x, 16 + second_y, liquid_color, liquid_color, liquid_color, liquid_color, false);
		draw_set_alpha(1);
		break;
}

draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, image_blend, image_alpha);
if (hover_over_object_indicator)
{
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, c_blue, scr_wave(0.25, 0.5, 1));
}

if (draw_leveleditor_arrow) {
	draw_set_color(image_blend);
	draw_line_width_color(x, y, second_x, second_y, 2, c_black, image_blend);
	draw_arrow(x, y, second_x, second_y, 20);
}

if (draw_item_on_top != noone) {
	spring_scale = 0.5;
	draw_sprite_ext(draw_item_on_top, 0, x, y, 0.5, 0.5, 0, draw_item_on_top_blend, image_alpha);
}
else {
	spring_scale = 1;
}

if (draw_item_with_spring) {
	draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, spring_scale, spring_scale, 0, image_blend, image_alpha);
}