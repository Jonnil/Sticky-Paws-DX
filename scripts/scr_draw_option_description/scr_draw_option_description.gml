function scr_get_option_description_payload()
{
	var text_fill = c_white;
	var option_default = "";

	if (global.option_default == 1)
	{
		option_default = l10n_text("On by default");
		text_fill = c_lime;
	}
	else
	if (global.option_default == 0)
	{
		option_default = l10n_text("Off by default");
	}

	var option_description_text = "";

	if (global.option_description != "" && global.option_default == -2)
	{
		option_description_text = l10n_text("Default") + ": " + string(global.option_description);
	}
	else
	if (global.option_description != "" && option_default != "")
	{
		option_description_text = string(global.option_description) + " - " + string(option_default);
	}
	else
	if (global.option_description != "")
	{
		option_description_text = string(global.option_description);
	}
	else
	{
		option_description_text = string(option_default);
	}

	return {
		text : option_description_text,
		text_fill : text_fill
	};
}

function scr_get_wrapped_text_metrics(text, max_width, line_sep, scale = 1)
{
	var resolved_text = string(text);
	var wrapped_lines = [];
	var paragraph_list = string_split(resolved_text, "\n");

	if (max_width <= 0)
	{
		max_width = 1;
	}

	for (var paragraph_index = 0; paragraph_index < array_length(paragraph_list); paragraph_index++)
	{
		var paragraph_text = string_trim(string(paragraph_list[paragraph_index]));

		if (paragraph_text == "")
		{
			array_push(wrapped_lines, "");
			continue;
		}

		var word_list = string_split(paragraph_text, " ");
		var current_line = "";

		for (var word_index = 0; word_index < array_length(word_list); word_index++)
		{
			var next_word = string_trim(string(word_list[word_index]));

			if (next_word == "")
			{
				continue;
			}

			var candidate_line = (current_line == "")
				? next_word
				: current_line + " " + next_word;

			if (current_line != ""
			&& (string_width(candidate_line) * scale > max_width))
			{
				array_push(wrapped_lines, current_line);
				current_line = next_word;
			}
			else
			{
				current_line = candidate_line;
			}
		}

		if (current_line != "")
		{
			array_push(wrapped_lines, current_line);
		}
	}

	if (array_length(wrapped_lines) <= 0)
	{
		array_push(wrapped_lines, "");
	}

	var outline_offset = max(1, round(scale));
	var line_height = max(1, string_height("W") * scale);
	var line_gap = max(4, round(line_height * 0.2));
	var line_box_height = line_height + (outline_offset * 2);
	var widest_line_width = 1;

	for (var line_index = 0; line_index < array_length(wrapped_lines); line_index++)
	{
		widest_line_width = max(widest_line_width, min(max_width, string_width(string(wrapped_lines[line_index])) * scale));
	}

	var text_height = (array_length(wrapped_lines) * line_box_height) + (max(0, array_length(wrapped_lines) - 1) * line_gap);

	return {
		lines : wrapped_lines,
		line_count : array_length(wrapped_lines),
		line_gap : line_gap,
		line_box_height : line_box_height,
		widest_line_width : widest_line_width,
		text_height : text_height
	};
}

function scr_get_option_description_layout(gui_width = display_get_gui_width(), gui_height = display_get_gui_height())
{
	if (gui_width <= 0)
	{
		gui_width = 1280;
	}

	if (gui_height <= 0)
	{
		gui_height = 720;
	}

	var description_payload = scr_get_option_description_payload();

	if (description_payload.text == "")
	{
		return {
			visible : false,
			rect_top : gui_height - 20
		};
	}

	var scale = (variable_global_exists("default_text_size") && global.default_text_size > 0)
		? global.default_text_size * 0.9
		: 1;
	var line_sep = 0;
	var padding_x = max(28, round(gui_width * 0.024));
	var padding_y = max(10, round(9 * scale));
	var panel_margin = max(42, round(gui_width * 0.05));
	var panel_width = max(360, gui_width - (panel_margin * 2));
	var inner_width = max(1, panel_width - (padding_x * 2));
	var wrapped_metrics = scr_get_wrapped_text_metrics(description_payload.text, inner_width, line_sep, scale);
	var rect_bottom = gui_height - max(14, round(gui_height * 0.02));
	var rect_top = rect_bottom - wrapped_metrics.text_height - (padding_y * 2);
	var rect_left = (gui_width - panel_width) * 0.5;
	var rect_right = rect_left + panel_width;
	var text_block_top = rect_bottom - padding_y - wrapped_metrics.text_height;

	return {
		visible : true,
		text : description_payload.text,
		text_fill : description_payload.text_fill,
		lines : wrapped_metrics.lines,
		line_count : wrapped_metrics.line_count,
		line_gap : wrapped_metrics.line_gap,
		line_box_height : wrapped_metrics.line_box_height,
		scale : scale,
		line_sep : line_sep,
		padding_y : padding_y,
		inner_width : inner_width,
		rect_left : rect_left,
		rect_top : rect_top,
		rect_right : rect_right,
		rect_bottom : rect_bottom,
		text_block_top : text_block_top
	};
}

function scr_draw_option_description()
{
	var description_layout = scr_get_option_description_layout();

	if (description_layout.visible)
	{
		draw_roundrect_glossy_color_ext(
			description_layout.rect_left,
			description_layout.rect_top,
			description_layout.rect_right,
			description_layout.rect_bottom,
			50, 50, c_black, c_black, false, 1
		);

		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);

		for (var line_index = 0; line_index < description_layout.line_count; line_index++)
		{
			var display_line = string(description_layout.lines[line_index]);

			if (string_trim(display_line) == "")
			{
				continue;
			}

			var line_center_y = description_layout.text_block_top
				+ (description_layout.line_box_height * 0.5)
				+ (line_index * (description_layout.line_box_height + description_layout.line_gap));

			scr_draw_text_outlined(
				(description_layout.rect_left + description_layout.rect_right) * 0.5,
				line_center_y,
				display_line,
				description_layout.scale,
				c_black,
				description_layout.text_fill,
				1
			);
		}
	}

	/* Reset so that the description disappears when not needed */
	global.option_default = -1;
	global.option_description = "";
}
