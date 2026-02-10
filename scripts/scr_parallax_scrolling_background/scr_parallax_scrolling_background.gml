function scr_parallax_scrolling_background()
{
	/* Have this script in End Step, so that the background scrolling can keep up with a moving camera */

	var current_view_camera = view_get_camera(view_current);
	var view_x = camera_get_view_x(current_view_camera);
	var view_y = camera_get_view_y(current_view_camera);
	var view_w = camera_get_view_width(current_view_camera);
	var view_h = camera_get_view_height(current_view_camera);

	#region /* Parallax Scrolling Background */
	for (var i = 1; i <= 4; i++)
	{
		var layer_name = "Background_" + string(i);
		var layer_id = layer_get_id(layer_name);
		if (layer_id == -1)
		{
			continue;
		}
		var x_parallax = custom_background_x_parallax[i];
		var y_parallax = custom_background_y_parallax[i];
		var x_offset = custom_background_x_offset[i];
		var y_offset = custom_background_y_offset[i];
		var safe_x_parallax = (x_parallax == 0) ? 0.001 : x_parallax;
		var safe_y_parallax = (y_parallax == 0) ? 0.001 : y_parallax;
		var layer_x_pos = view_x / safe_x_parallax + x_offset;
		var layer_y_pos = view_y / safe_y_parallax + y_offset;

		var metrics = scr_get_background_layer_metrics(i);
		var layer_background_id = layer_background_get_id(layer_id);
		var effective_x_scale = metrics.x_scale;
		var effective_y_scale = metrics.y_scale;
		var effective_width = metrics.width;
		var effective_height = metrics.height;
		var clamp_x_axis = false;
		var clamp_y_axis = false;

		/* Clamp applies to non-tiled axes; auto-scale is an optional separate setting */
		if (metrics.sprite != noone)
		&& (metrics.clamped)
		{
			clamp_x_axis = !metrics.h_tiled;
			clamp_y_axis = !metrics.v_tiled;

			/* Auto-scale extends clamp behavior to impossible-coverage cases */
			if (metrics.clamp_autoscale)
			{
				clamp_x_axis = clamp_x_axis || (view_w > effective_width);
				clamp_y_axis = clamp_y_axis || (view_h > effective_height);

				var fit_multiplier = 1;
				if (clamp_x_axis)
				&& (effective_width > 0)
				{
					fit_multiplier = max(fit_multiplier, view_w / effective_width);
				}
				if (clamp_y_axis)
				&& (effective_height > 0)
				{
					fit_multiplier = max(fit_multiplier, view_h / effective_height);
				}

				if (fit_multiplier > 1)
				{
					var x_sign = (metrics.x_scale < 0) ? -1 : 1;
					var y_sign = (metrics.y_scale < 0) ? -1 : 1;
					effective_x_scale = x_sign * abs(metrics.x_scale) * fit_multiplier;
					effective_y_scale = y_sign * abs(metrics.y_scale) * fit_multiplier;
				}
			}
		}

		if (metrics.sprite != noone)
		{
			effective_width = abs(metrics.source_width * effective_x_scale);
			effective_height = abs(metrics.source_height * effective_y_scale);
		}

		if (layer_background_id != -1)
		{
			layer_background_xscale(layer_background_id, effective_x_scale);
			layer_background_yscale(layer_background_id, effective_y_scale);
		}

		if (metrics.sprite != noone)
		&& (metrics.clamped)
		{
			/* Clamp background positions so edges never appear inside the view */
			if (clamp_x_axis)
			{
				if (view_w > 0)
				{
					var min_x = view_x + view_w - effective_width;
					var max_x = view_x;
					if (min_x > max_x)
					{
						var temp_x = min_x;
						min_x = max_x;
						max_x = temp_x;
					}
					layer_x_pos = clamp(layer_x_pos, min_x, max_x);
				}
			}

			if (clamp_y_axis)
			{
				if (view_h > 0)
				{
					var min_y = view_y + view_h - effective_height;
					var max_y = view_y;
					if (min_y > max_y)
					{
						var temp_y = min_y;
						min_y = max_y;
						max_y = temp_y;
					}
					layer_y_pos = clamp(layer_y_pos, min_y, max_y);
				}
			}
		}

		layer_x(layer_id, layer_x_pos);
		layer_y(layer_id, layer_y_pos);
	}
	#endregion /* Parallax Scrolling Background END */

}

function scr_get_background_layer_metrics(layer_index)
{
	var sprite = noone;
	var x_scale = 1;
	var y_scale = 1;
	var h_tiled = false;
	var v_tiled = false;
	var clamped = false;
	var clamp_autoscale = false;

	switch (layer_index)
	{
		case 1:
			sprite = global.custom_background1;
			x_scale = custom_background1_x_scale;
			y_scale = custom_background1_y_scale;
			h_tiled = custom_background1_htiled;
			v_tiled = custom_background1_vtiled;
			clamped = custom_background1_clamped;
			clamp_autoscale = custom_background1_clamp_autoscale;
			break;
		case 2:
			sprite = global.custom_background2;
			x_scale = custom_background2_x_scale;
			y_scale = custom_background2_y_scale;
			h_tiled = custom_background2_htiled;
			v_tiled = custom_background2_vtiled;
			clamped = custom_background2_clamped;
			clamp_autoscale = custom_background2_clamp_autoscale;
			break;
		case 3:
			sprite = global.custom_background3;
			x_scale = custom_background3_x_scale;
			y_scale = custom_background3_y_scale;
			h_tiled = custom_background3_htiled;
			v_tiled = custom_background3_vtiled;
			clamped = custom_background3_clamped;
			clamp_autoscale = custom_background3_clamp_autoscale;
			break;
		case 4:
			sprite = global.custom_background4;
			x_scale = custom_background4_x_scale;
			y_scale = custom_background4_y_scale;
			h_tiled = custom_background4_htiled;
			v_tiled = custom_background4_vtiled;
			clamped = custom_background4_clamped;
			clamp_autoscale = custom_background4_clamp_autoscale;
			break;
	}

	var source_width = 0;
	var source_height = 0;
	var width = 0;
	var height = 0;
	if (sprite != noone)
	{
		source_width = sprite_get_width(sprite);
		source_height = sprite_get_height(sprite);
		width = abs(source_width * x_scale);
		height = abs(source_height * y_scale);
	}

	return {
		sprite: sprite,
		source_width: source_width,
		source_height: source_height,
		x_scale: x_scale,
		y_scale: y_scale,
		width: width,
		height: height,
		h_tiled: h_tiled,
		v_tiled: v_tiled,
		clamped: clamped,
		clamp_autoscale: clamp_autoscale
	};
}

function scr_get_background_parallax_default(layer_index)
{
	return (layer_index * 2) + 1;
}

function scr_calc_parallax_recommendation(room_size, view_size, bg_size, base_parallax, is_tiled)
{
	var result = {
		recommended: base_parallax,
		max_parallax: base_parallax,
		can_cover: true
	};

	if (is_tiled)
	{
		return result;
	}

	if (bg_size <= 0 || view_size <= 0 || room_size <= 0)
	{
		return result;
	}

	if (bg_size < view_size)
	{
		result.can_cover = false;
		result.recommended = 1;
		result.max_parallax = 1;
		return result;
	}

	if (room_size <= view_size)
	{
		return result;
	}

	var r_min = (room_size - bg_size) / (room_size - view_size);
	if (r_min <= 0)
	{
		return result;
	}

	var p_max = 1 / r_min;
	if (p_max < 1)
	{
		p_max = 1;
	}

	result.max_parallax = p_max;
	result.recommended = min(base_parallax, p_max);
	return result;
}
