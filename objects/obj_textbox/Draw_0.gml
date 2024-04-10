if (textbox_alpha > 0)
&& (string_length(textbox_text_masked) > 0)
{
	var xx = x;
	var yy = y - 64;
	
	if (xx < camera_get_view_x(view_camera[view_current]) + (string_width_ext(textbox_text_masked, 40, 1000) * 0.4))
	{
		var x_adjusted = camera_get_view_x(view_camera[view_current]) + (string_width_ext(textbox_text_masked, 40, 1000) * 0.4);
	}
	else
	if (xx > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - (string_width_ext(textbox_text_masked, 40, 1000) * 0.4))
	{
		var x_adjusted = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - (string_width_ext(textbox_text_masked, 40, 1000) * 0.4);
	}
	else
	{
		var x_adjusted = xx;
	}
	
	draw_set_alpha(textbox_alpha * 0.9);
	draw_roundrect_color_ext(x_adjusted - (string_width_ext(textbox_text_masked, 40, 1000) * 0.41) - 8, yy - string_height_ext(textbox_text_masked, 40, 1000), x_adjusted + (string_width_ext(textbox_text_masked, 40, 1000) * 0.41) + 8, yy + 8, 50, 50, c_black, c_black, false);
	draw_triangle_color(xx - 8, yy + 8, xx + 8, yy + 8, xx, yy + 32, c_black, c_black, c_black, false);
	draw_set_alpha(textbox_alpha);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text_ext_transformed_color(x_adjusted, yy, string(textbox_text_masked), 40, 1000, global.default_text_size, global.default_text_size, 0, c_white, c_white, c_white, c_white, textbox_alpha);
	draw_set_alpha(1);
}