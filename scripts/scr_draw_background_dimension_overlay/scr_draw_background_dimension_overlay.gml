function scr_draw_background_dimension_overlay()
{
	var cam = view_get_camera(view_current);
	if (cam < 0)
	{
		cam = view_get_camera(0);
	}
	if (cam < 0)
	{
		return;
	}

	var view_w = camera_get_view_width(cam);
	var view_h = camera_get_view_height(cam);
	var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();
	var text_x = gui_w - 24;
	var text_size = global.default_text_size * 0.62;
	var text_gap = 4;
	var panel_padding_x = 10;
	var panel_padding_y = 8;
	var panel_bottom_margin = 16;
	var panel_top_min = 8;

	var header = "Level " + string(room_width) + "x" + string(room_height) + "  |  View " + string_format(view_w, 0, 0) + "x" + string_format(view_h, 0, 0);
	var line_text = array_create(5, "");
	var line_color = array_create(5, c_white);
	line_text[0] = header;
	line_color[0] = c_white;

	for (var i = 1; i <= 4; i++)
	{
		var metrics = scr_get_background_layer_metrics(i);
		var line_index = i;
		var line = "";
		var color = c_white;

		if (metrics.sprite == noone)
		{
			line = "BG" + string(i) + ": none loaded";
			color = c_gray;
		}
		else
		{
			var fit_x = 1;
			var fit_y = 1;
			if (metrics.width > 0)
			{
				fit_x = view_w / metrics.width;
			}
			if (metrics.height > 0)
			{
				fit_y = view_h / metrics.height;
			}

			var clamp_x_axis = (!metrics.h_tiled) || (fit_x > 1);
			var clamp_y_axis = (!metrics.v_tiled) || (fit_y > 1);
			var clamp_fit = 1;
			if (metrics.clamped)
			&& (metrics.clamp_autoscale)
			{
				if (clamp_x_axis)
				{
					clamp_fit = max(clamp_fit, fit_x);
				}
				if (clamp_y_axis)
				{
					clamp_fit = max(clamp_fit, fit_y);
				}
			}

			var tiled_text = (metrics.h_tiled ? "H:T" : "H:-") + " " + (metrics.v_tiled ? "V:T" : "V:-");
			var clamp_text = metrics.clamped ? "C:on" : "C:off";
			var auto_text = metrics.clamp_autoscale ? "A:on" : "A:off";
			var cover_text = "cover ok";
			if (fit_x > 1 || fit_y > 1)
			{
				cover_text = "needs " + string_format(max(fit_x, fit_y), 0, 2) + "x";
				color = c_yellow;
				if (!metrics.clamped)
				|| (!metrics.clamp_autoscale)
				{
					color = c_red;
				}
			}
			if (metrics.clamped)
			&& (metrics.clamp_autoscale)
			&& (clamp_fit > 1)
			{
				cover_text = "auto " + string_format(clamp_fit, 0, 2) + "x";
				color = c_lime;
			}

			line = "BG" + string(i) + " " + string_format(metrics.width, 0, 0) + "x" + string_format(metrics.height, 0, 0) + "  " + tiled_text + "  " + clamp_text + " " + auto_text + "  " + cover_text;
		}

		line_text[line_index] = line;
		line_color[line_index] = color;
	}

	var line_height = max(8, string_height("Bg") * text_size);
	var max_line_w = 0;
	for (var j = 0; j <= 4; j++)
	{
		var line_w = string_width(line_text[j]) * text_size;
		if (line_w > max_line_w)
		{
			max_line_w = line_w;
		}
	}

	var panel_height = ceil((panel_padding_y * 2) + ((line_height + text_gap) * 5) - text_gap);
	var panel_left = floor(text_x - max_line_w - panel_padding_x);
	var panel_right = ceil(text_x + panel_padding_x);
	var panel_bottom = gui_h - panel_bottom_margin;
	var panel_top = panel_bottom - panel_height;
	if (panel_top < panel_top_min)
	{
		panel_top = panel_top_min;
		panel_bottom = panel_top + panel_height;
	}
	var y_top = panel_top + panel_padding_y;

	draw_set_alpha(0.35);
	draw_roundrect_color_ext(panel_left, panel_top, panel_right, panel_bottom, 8, 8, c_black, c_black, false);
	draw_set_alpha(1);

	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	for (var k = 0; k <= 4; k++)
	{
		var line_y = y_top + (k * (line_height + text_gap));
		scr_draw_text_outlined(text_x, line_y, line_text[k], text_size, c_black, line_color[k], 1);
	}
}
