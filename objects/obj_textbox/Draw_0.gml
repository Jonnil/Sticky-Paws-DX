if (textbox_alpha > 0)
&& (string_length(textbox_text_masked) > 0)
{
	var xx = x;
	var yy = y - textbox_y_offset;
	var x_adjusted = xx;
	var line_separation = 40;
	var wrap_width = 1000;
	var text_scale = global.default_text_size;
	var textbox_width = string_width_ext(textbox_text_masked, line_separation, wrap_width);
	var textbox_height = string_height_ext(textbox_text_masked, line_separation, wrap_width) * text_scale;
	
	if (xx < camera_get_view_x(view_get_camera(view_current)) + (textbox_width * 0.4))
	{
		x_adjusted = camera_get_view_x(view_get_camera(view_current)) + (textbox_width * 0.4);
	}
	else
	if (xx > camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)) - (textbox_width * 0.4))
	{
		x_adjusted = camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)) - (textbox_width * 0.4);
	}
	
	draw_set_alpha(textbox_alpha * 0.9);
	draw_roundrect_color_ext(x_adjusted - (textbox_width * 0.41) - 8, yy - textbox_height, x_adjusted + (textbox_width * 0.41) + 8, yy + 8, 50, 50, c_black, c_black, false);
	draw_triangle_color(xx - 8, yy + 8, xx + 8, yy + 8, xx, yy + 32, c_black, c_black, c_black, false);
	draw_set_alpha(textbox_alpha);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text_ext_transformed_color(x_adjusted, yy, string(textbox_text_masked), line_separation, wrap_width, text_scale, text_scale, 0, c_white, c_white, c_white, c_white, textbox_alpha);
	draw_set_alpha(1);
}
