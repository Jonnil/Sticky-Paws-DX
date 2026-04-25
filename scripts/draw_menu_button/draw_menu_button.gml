function draw_menu_button(x_position, y_position, string_text, menu_index, menu_takes_you_to = "", highlight_color = c_lime, alpha = 1)
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var actual_highlight_color, outline_color, fill_color;

	var point_in_button = point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position + 1, x_position + 370, y_position + 41);
	var using_mouse = (global.controls_used_for_navigation == "mouse");
	var is_same_menu = (menu == menu_index);
	var input_blocked = scr_block_menu_input_for_network_request();
	var not_open_dropdown = !open_dropdown && !input_blocked;

	if ((point_in_button
	&& using_mouse
	&& not_open_dropdown)
	|| (is_same_menu
	&& !using_mouse
	&& not_open_dropdown))
	{
		if (menu_delay == 0 && menu_joystick_delay == 0) /* Only change menu when "menu delay" is 0, otherwise there could be weird menu bugs that happen when you hover over a button when game needs to load code */
		{
			menu = menu_index;
		}

		if (mouse_check_button_released(mb_left)
		&& menu_takes_you_to != false
		&& menu_takes_you_to != noone
		&& menu_takes_you_to != ""
		&& menu_takes_you_to != menu_index
		&& menu_delay == 0
		&& menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = menu_takes_you_to;
		}

		actual_highlight_color = highlight_color;
		outline_color = c_black;
		fill_color = c_white;
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position - 24, y_position + 20, 1, 1, 0, c_white, alpha);
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + 394, y_position + 20, 1, 1, 180, c_white, alpha);
	}
	else
	{
		actual_highlight_color = c_white;
		outline_color = c_white;
		fill_color = c_black;
	}

	var text_scale = (string_width(string_text) >= 360) ? 0.7 : 1;

	draw_sprite_ext(spr_menu_button, global.menu_button_subimg, x_position, y_position + 21, 1, 1, 0, actual_highlight_color, alpha);
	if (highlight_color != c_lime
	&& actual_highlight_color == c_white)
	{
		draw_sprite_ext(spr_menu_button, global.menu_button_subimg, x_position, y_position + 21, 1, 1, 0, highlight_color, 0.1 * alpha);
	}

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x_position + 185, y_position + 21, string(string_text), global.default_text_size * text_scale, outline_color, fill_color, alpha);

	var mouse_activated = point_in_button
		&& global.controls_used_for_navigation == "mouse"
		&& mouse_check_button_released(mb_left)
		&& menu_delay == 0
		&& menu_joystick_delay == 0;

	var level_editor_activated = instance_exists(obj_leveleditor)
		&& menu == menu_index
		&& obj_leveleditor.key_a_pressed
		&& menu_delay == 0
		&& menu_joystick_delay == 0;

	var key_activated = variable_instance_exists(self, "key_a_pressed")
		&& menu == menu_index
		&& key_a_pressed
		&& menu_delay == 0
		&& menu_joystick_delay == 0;

	if (!input_blocked
	&& (mouse_activated || level_editor_activated || key_activated))
	{
		return true;
	}
}

function draw_menu_info_row(x_position, y_position, string_text, value_text, menu_index, option_description = "", row_width = -1, can_move_cursor_position = true)
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var row_height = 40;

	if (row_width <= 0)
	{
		row_width = max(380, display_get_gui_width() - x_position - 64);
	}

	var row_left = x_position;
	var row_top = y_position;
	var row_right = row_left + row_width;
	var row_bottom = row_top + row_height;
	var using_mouse = (global.controls_used_for_navigation == "mouse");
	var row_hovered = point_in_rectangle(mouse_get_x, mouse_get_y, row_left, row_top, row_right, row_bottom);
	var row_selected = (menu == menu_index);
	var row_focused = false;
	var row_fill_color = make_color_rgb(20, 20, 20);
	var row_outline_color = make_color_rgb(60, 60, 60);
	var row_text_color = c_white;

	if ((row_hovered
	&& using_mouse
	&& !open_dropdown)
	|| (row_selected
	&& !using_mouse
	&& !open_dropdown))
	{
		if (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = menu_index;
		}

		row_focused = true;
		row_fill_color = make_color_rgb(24, 88, 94);
		row_outline_color = c_white;
		can_navigate_settings_sidebar = false;
	}

	if (row_focused)
	{
		draw_set_alpha(using_mouse ? 0.9 : scr_wave(0.15, 0.45, 1));
		draw_roundrect_color_ext(row_left - 2, row_top - 2, row_right + 2, row_bottom + 2, 18, 18, c_white, c_white, false);
		draw_set_alpha(1);
	}

	draw_roundrect_color_ext(row_left, row_top, row_right, row_bottom, 16, 16, row_fill_color, row_fill_color, false);

	var display_text = string(string_text) + ": " + string(value_text);
	var text_scale = global.default_text_size * 0.78;
	var clipped_text = scr_debug_ellipsize_text(display_text, row_width - 32, text_scale);

	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(row_left + 14, row_top + (row_height * 0.5), clipped_text, text_scale, c_black, row_text_color, 1);

	if (row_selected)
	{
		if (can_move_cursor_position)
		&& (variable_instance_exists(self, "menu_cursor_y_position"))
		&& (variable_instance_exists(self, "menu_y_offset"))
		{
			menu_cursor_y_position = y_position - menu_y_offset;
		}

		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, row_left - 20, row_top + (row_height * 0.5), 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, row_right + 20, row_top + (row_height * 0.5), 1, 1, 180, c_white, 1);
		global.option_default = -1;

		if (option_description != "")
		{
			global.option_description = option_description;
		}
		else
		{
			global.option_description = display_text;
		}
	}
}

function scr_draw_settings_overlay_title(x_position, y_position, title_text, max_width = -1)
{
	var title_scale = global.default_text_size * 1.1;
	var padding_x = 26;
	var padding_y = 14;
	var title_width = (string_width(string(title_text)) * title_scale) + (padding_x * 2);
	var title_max_width = (max_width > 0)
		? max_width
		: min(display_get_gui_width() - 440, 620);
	var panel_width = clamp(title_width, 320, max(320, title_max_width));
	var text_height = max(18, string_height("W") * title_scale);
	var panel_height = text_height + (padding_y * 2);
	var panel_left = x_position - (panel_width * 0.5);
	var panel_right = x_position + (panel_width * 0.5);
	var panel_top = y_position - (panel_height * 0.5);
	var panel_bottom = y_position + (panel_height * 0.5);

	draw_roundrect_glossy_color_ext(panel_left, panel_top, panel_right, panel_bottom, 18, 18, c_black, c_black, false, 1);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x_position, y_position, string(title_text), title_scale, c_menu_outline, c_menu_fill, 1);
}
