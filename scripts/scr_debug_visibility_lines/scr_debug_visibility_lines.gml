/// @function scr_debug_get_standard_line_display_text(variable_name, value, label_simplified)
/* Builds the final display string for a debug line, respecting Debug Detailed Mode. */
function scr_debug_get_standard_line_display_text(variable_name, value, label_simplified)
{
	var display_label = global.debug_detailed_mode
		? string(variable_name)
		: string(label_simplified);

	return display_label + ": " + string(value);
}

/// @function scr_debug_get_line_spec_display_text(line_spec)
/* Resolves the final display string for a registry line spec. */
function scr_debug_get_line_spec_display_text(line_spec)
{
	if (!is_struct(line_spec))
	{
		return "";
	}

	if (variable_struct_exists(line_spec, "display_text_override")
	&& string(line_spec.display_text_override) != "")
	{
		return string(line_spec.display_text_override);
	}

	var variable_name = variable_struct_exists(line_spec, "variable_name")
		? line_spec.variable_name
		: "";
	var value = variable_struct_exists(line_spec, "value")
		? line_spec.value
		: "";
	var label_simplified = variable_struct_exists(line_spec, "label_simplified")
		? line_spec.label_simplified
		: "";

	return scr_debug_get_standard_line_display_text(variable_name, value, label_simplified);
}

/// @function scr_debug_ellipsize_text(raw_text, max_width, text_scale)
/* Trims a debug line so it stays inside the provided width. */
function scr_debug_ellipsize_text(raw_text, max_width, text_scale)
{
	var trimmed_text = string(raw_text);
	var ellipsis = "...";

	if ((max_width <= 0)
	|| (string_width(trimmed_text) * text_scale <= max_width))
	{
		return trimmed_text;
	}

	while (string_length(trimmed_text) > 0
	&& (string_width(trimmed_text + ellipsis) * text_scale > max_width))
	{
		trimmed_text = string_delete(trimmed_text, string_length(trimmed_text), 1);
	}

	if (trimmed_text == "")
	{
		return ellipsis;
	}

	return trimmed_text + ellipsis;
}

/// @function scr_draw_highlighted_text(xx, yy, variable_name, value, label_simplified, color_normal, color_alert, alert_condition)
/* Draws a line of debug text with optional alert coloring. */
function scr_draw_highlighted_text(xx, yy, variable_name, value, label_simplified, color_normal, color_alert, alert_condition)
{
	var line_spacing = 25;
	var color = alert_condition ? color_alert : color_normal;
	var display_text = scr_debug_get_standard_line_display_text(variable_name, value, label_simplified);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	scr_draw_text_outlined(xx, yy, display_text, global.default_text_size, c_black, color);

	return yy + line_spacing;
}

/// @function scr_debug_draw_registry_text_line(item_key, xx, yy, display_text, color_normal, color_alert, alert_condition, text_halign, text_valign, text_scale, line_spacing, max_width, allow_interaction)
/* Draws one registry-backed debug line and handles hover quick-lock behavior when allowed. */
function scr_debug_draw_registry_text_line(item_key, xx, yy, display_text, color_normal, color_alert, alert_condition, text_halign = fa_left, text_valign = fa_top, text_scale = -1, line_spacing = 25, max_width = -1, allow_interaction = true)
{
	var definition = scr_debug_get_visibility_definition(item_key);
	if (definition == undefined)
	{
		return yy;
	}

	if (text_scale <= 0)
	{
		text_scale = global.default_text_size;
	}

	var current_mode = scr_debug_get_item_mode(item_key);
	var resolved_text = string(display_text);
	if (max_width > 0)
	{
		resolved_text = scr_debug_ellipsize_text(resolved_text, max_width, text_scale);
	}

	var text_color = alert_condition ? color_alert : color_normal;
	var text_width = string_width(resolved_text) * text_scale;
	var text_height = string_height(resolved_text) * text_scale;
	var text_left = xx;
	var text_top = yy;

	switch (text_halign)
	{
		case fa_right:
			text_left = xx - text_width;
			break;

		case fa_center:
			text_left = xx - (text_width * 0.5);
			break;
	}

	switch (text_valign)
	{
		case fa_middle:
			text_top = yy - (text_height * 0.5);
			break;

		case fa_bottom:
			text_top = yy - text_height;
			break;
	}

	var text_right = text_left + text_width;
	var text_bottom = text_top + text_height;
	var can_show_quick_lock = definition.allow_mouse_quick_lock;
	var show_lock_icon = can_show_quick_lock
		&& current_mode == DEBUG_VISIBILITY_MODE.ALWAYS;
	var lock_x = text_left - 16;
	var lock_y = text_top + (text_height * 0.5);
	var row_top = yy;
	var row_bottom = yy + line_spacing;

	switch (text_valign)
	{
		case fa_middle:
			row_top = yy - (line_spacing * 0.5);
			row_bottom = yy + (line_spacing * 0.5);
			break;

		case fa_bottom:
			row_top = yy - line_spacing;
			row_bottom = yy;
			break;
	}

	var hover_left = text_left - 12;
	var hover_top = max(text_top - 2, row_top + 1);
	var hover_right = text_right + 12;
	var hover_bottom = min(text_bottom + 2, row_bottom - 1);
	var can_toggle = allow_interaction
		&& global.debug_screen
		&& global.controls_used_for_navigation == "mouse"
		&& can_show_quick_lock
		&& definition.allow_always
		&& (current_mode == DEBUG_VISIBILITY_MODE.IN_OVERLAY
		|| current_mode == DEBUG_VISIBILITY_MODE.ALWAYS);

	if (hover_bottom <= hover_top)
	{
		hover_top = row_top;
		hover_bottom = row_bottom;
	}

	if (show_lock_icon)
	{
		hover_left = min(hover_left, lock_x - 12);
	}

	if (can_toggle)
	{
		var _gui_mouse_x = device_mouse_x_to_gui(0);
		var _gui_mouse_y = device_mouse_y_to_gui(0);
		if (point_in_rectangle(_gui_mouse_x, _gui_mouse_y, hover_left, hover_top, hover_right, hover_bottom))
		{
			draw_set_alpha(0.35);
			draw_roundrect_color_ext(hover_left, hover_top, hover_right, hover_bottom, 14, 14, c_white, c_white, false);
			draw_set_alpha(1);

			if (mouse_check_button_released(mb_left))
			{
				scr_debug_toggle_compact_item_lock(item_key);
				current_mode = scr_debug_get_item_mode(item_key);
				show_lock_icon = current_mode == DEBUG_VISIBILITY_MODE.ALWAYS;
			}
		}
	}

	draw_set_halign(text_halign);
	draw_set_valign(text_valign);
	scr_draw_text_outlined(xx, yy, resolved_text, text_scale, c_black, text_color, 1);

	if (show_lock_icon)
	{
		draw_sprite_ext(spr_lock_icon, 0, lock_x, lock_y, 1, 1, 0, c_white, 1);
	}

	return yy + line_spacing;
}

/// @function scr_debug_draw_registry_line_spec(item_key, xx, yy, line_spec, text_halign, text_valign, text_scale, line_spacing, max_width, allow_interaction)
/* Draws a prebuilt registry line spec. */
function scr_debug_draw_registry_line_spec(item_key, xx, yy, line_spec, text_halign = fa_left, text_valign = fa_top, text_scale = -1, line_spacing = 25, max_width = -1, allow_interaction = true)
{
	if (!is_struct(line_spec))
	{
		return yy;
	}

	var display_text = scr_debug_get_line_spec_display_text(line_spec);
	var color_normal = variable_struct_exists(line_spec, "color_normal")
		? line_spec.color_normal
		: c_white;
	var color_alert = variable_struct_exists(line_spec, "color_alert")
		? line_spec.color_alert
		: c_red;
	var alert_condition = variable_struct_exists(line_spec, "alert_condition")
		? line_spec.alert_condition
		: false;

	return scr_debug_draw_registry_text_line(item_key, xx, yy, display_text, color_normal, color_alert, alert_condition, text_halign, text_valign, text_scale, line_spacing, max_width, allow_interaction);
}

/// @function scr_draw_registry_highlighted_text(item_key, xx, yy, variable_name, value, label_simplified, color_normal, color_alert, alert_condition)
/* Draws a registry-backed line only when the item is visible in the main overlay. */
function scr_draw_registry_highlighted_text(item_key, xx, yy, variable_name, value, label_simplified, color_normal, color_alert, alert_condition)
{
	if (!scr_debug_should_draw_registry_item(item_key))
	{
		return yy;
	}

	var line_spec =
	{
		variable_name: variable_name,
		value: value,
		label_simplified: label_simplified,
		color_normal: color_normal,
		color_alert: color_alert,
		alert_condition: alert_condition
	};

	return scr_debug_draw_registry_line_spec(item_key, xx, yy, line_spec, fa_left, fa_top, global.default_text_size, 25, -1, true);
}
