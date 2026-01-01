if (draw_enemy_with_spring)
{
	draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + (sprite_height * 0.5), 1, 1, 0, image_blend, draw_alpha * image_alpha);
}

var liquid_color, spring_scale;

switch (object)
{
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

if (sprite_exists(sprite_index))
{
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, image_blend, draw_alpha * image_alpha);
	if (hover_over_object_indicator)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, c_blue, scr_wave(0.25, 0.75, 0.5));
	}
}

if (draw_leveleditor_arrow)
{
	draw_set_color(image_blend);
	draw_line_width_color(x, y, second_x, second_y, 2, c_black, image_blend);
	draw_arrow(x, y, second_x, second_y, 20);
}

if (draw_item_on_top != noone)
{
	spring_scale = 0.5;
	draw_sprite_ext(draw_item_on_top, 0, x, y, 0.5, 0.5, 0, draw_item_on_top_blend, draw_alpha * image_alpha);
	if (hover_over_object_indicator)
	{
		draw_sprite_ext(draw_item_on_top, 0, x, y, 0.5, 0.5, 0, c_blue, scr_wave(0.25, 0.75, 0.5));
	}
}
else
{
	spring_scale = 1;
}

if (draw_item_with_spring)
{
	draw_sprite_ext(global.resource_pack_sprite_coil_spring, 0, x, y + 16, spring_scale, spring_scale, 0, image_blend, draw_alpha * image_alpha);
}

if (draw_text_over_placed_object != "")
{
	scr_draw_text_outlined(x, y, string(draw_text_over_placed_object), global.default_text_size, c_white, c_black, 1);
}

#region /* Objects that need to display text when hovered over */
if (position_meeting(x, y, obj_leveleditor))
{
	if (object == LEVEL_OBJECT_ID.ID_SIGN_READABLE)
	|| (object == LEVEL_OBJECT_ID.ID_CHECKPOINT)
	{
		var xx = x;
		var yy = y - 32;
		var x_adjusted = x;
		var textbox_text = "";
		
		if (string_length(second_x) > 0)
		{
			textbox_text = string(second_x);
		}
		else
		if (object == LEVEL_OBJECT_ID.ID_SIGN_READABLE)
		{
			textbox_text = l10n_text("This is a sign");
		}
		
		if (textbox_text != "")
		{
			draw_set_alpha(0.75);
			draw_roundrect_color_ext(x_adjusted - (string_width_ext(textbox_text, 40, 1000) * 0.41) - 8, yy - string_height_ext(textbox_text, 40, 1000), x_adjusted + (string_width_ext(textbox_text, 40, 1000) * 0.41) + 8, yy + 8, 50, 50, c_black, c_black, false);
			draw_triangle_color(xx - 8, yy + 8, xx + 8, yy + 8, xx, yy + 32, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
			draw_text_ext_transformed_color(x_adjusted, yy, string(textbox_text), 40, 1000, global.default_text_size, global.default_text_size, 0, c_white, c_white, c_white, c_white, 1);
		}
	}
}
#endregion /* Objects that need to display text when hovered over END */
