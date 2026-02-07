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
		var x_parallax = custom_background_x_parallax[i];
		var y_parallax = custom_background_y_parallax[i];
		var x_offset = custom_background_x_offset[i];
		var y_offset = custom_background_y_offset[i];
		var safe_x_parallax = (x_parallax == 0) ? 0.001 : x_parallax;
		var safe_y_parallax = (y_parallax == 0) ? 0.001 : y_parallax;
		var layer_x_pos = view_x / safe_x_parallax + x_offset;
		var layer_y_pos = view_y / safe_y_parallax + y_offset;

		var metrics = scr_get_background_layer_metrics(i);

		if (metrics.sprite != noone)
		{
			/* Clamp background positions so edges never appear inside the view */
			if (!metrics.h_tiled)
			{
				if (view_w > 0)
				{
					var min_x = view_x + view_w - metrics.width;
					var max_x = view_x;
					if (min_x > max_x)
					{
						var temp_x = min_x;
						min_x = max_x;
						max_x = temp_x;
					}
					//layer_x_pos = clamp(layer_x_pos, min_x, max_x);
				}
			}

			if (!metrics.v_tiled)
			{
				if (view_h > 0)
				{
					var min_y = view_y + view_h - metrics.height;
					var max_y = view_y;
					if (min_y > max_y)
					{
						var temp_y = min_y;
						min_y = max_y;
						max_y = temp_y;
					}
					//layer_y_pos = clamp(layer_y_pos, min_y, max_y);
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

	switch (layer_index)
	{
		case 1:
			sprite = global.custom_background1;
			x_scale = custom_background1_x_scale;
			y_scale = custom_background1_y_scale;
			h_tiled = custom_background1_htiled;
			v_tiled = custom_background1_vtiled;
			break;
		case 2:
			sprite = global.custom_background2;
			x_scale = custom_background2_x_scale;
			y_scale = custom_background2_y_scale;
			h_tiled = custom_background2_htiled;
			v_tiled = custom_background2_vtiled;
			break;
		case 3:
			sprite = global.custom_background3;
			x_scale = custom_background3_x_scale;
			y_scale = custom_background3_y_scale;
			h_tiled = custom_background3_htiled;
			v_tiled = custom_background3_vtiled;
			break;
		case 4:
			sprite = global.custom_background4;
			x_scale = custom_background4_x_scale;
			y_scale = custom_background4_y_scale;
			h_tiled = custom_background4_htiled;
			v_tiled = custom_background4_vtiled;
			break;
	}

	var width = 0;
	var height = 0;
	if (sprite != noone)
	{
		width = sprite_get_width(sprite) * x_scale;
		height = sprite_get_height(sprite) * y_scale;
	}

	return {
		sprite: sprite,
		width: width,
		height: height,
		h_tiled: h_tiled,
		v_tiled: v_tiled
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
