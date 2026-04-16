function draw_menu_dropdown(x_position, y_position, string_text, menu_index, variable_to_change, string_text_item1 = "", string_text_item2 = "", string_text_item3 = "", string_text_item4 = "", string_text_item5 = "", string_text_item6 = "", string_text_item7 = "", string_text_item8 = "", string_text_item9 = "", string_text_item10 = "", string_text_item11 = "")
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var default_dropdown_text = scr_get_default_dropdown_description(menu_index);
	var dropdown_layout = scr_menu_dropdown_get_layout();
	var dropdown_items = [
		string_text_item1,
		string_text_item2,
		string_text_item3,
		string_text_item4,
		string_text_item5,
		string_text_item6,
		string_text_item7,
		string_text_item8,
		string_text_item9,
		string_text_item10,
		string_text_item11
	];
	var dropdown_item_count = scr_menu_dropdown_get_item_count(dropdown_items);
	var dropdown_y_position = y_position;
	var button_left = x_position + dropdown_layout.button_x_offset;
	var button_right = button_left + dropdown_layout.dropdown_width;
	var button_top = dropdown_y_position + 2;
	var button_bottom = dropdown_y_position + dropdown_layout.button_height - 1;
	var button_center_x = button_left + (dropdown_layout.dropdown_width * 0.5);
	var button_center_y = dropdown_y_position + dropdown_layout.button_center_y;
	var popup_top = scr_menu_dropdown_get_popup_top(dropdown_y_position, dropdown_item_count, dropdown_layout);
	var popup_bottom = popup_top + (dropdown_item_count * dropdown_layout.item_step);
	var selected_text = "";

	if (variable_to_change >= 0)
	&& (variable_to_change < array_length(dropdown_items))
	{
		selected_text = string(dropdown_items[variable_to_change]);
	}

	if (variable_instance_exists(self, "menu")) /* Check if the object even have these variables before running this code */
	&& (variable_instance_exists(self, "menu_delay"))
	&& (variable_instance_exists(self, "open_dropdown"))
	{
		#region /* Button */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, button_left, button_top, button_right, button_bottom))
		&& (global.controls_used_for_navigation == "mouse")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!open_dropdown)
		{
			if (!open_dropdown)
			{
				menu = menu_index;
			}
			if (variable_instance_exists(self, "can_navigate_settings_sidebar"))
			{
				can_navigate_settings_sidebar = false;
			}
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, button_left, button_center_y, dropdown_layout.button_scale_x, 1, 0, c_lime, 1);
		}
		else
		{
			if (menu == menu_index)
			&& (global.controls_used_for_navigation == "keyboard"
			|| global.controls_used_for_navigation == "gamepad")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, button_left, button_center_y, dropdown_layout.button_scale_x, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, button_left, button_center_y, dropdown_layout.button_scale_x, 1, 0, c_white, 1);
			}
		}
		if (variable_instance_exists(self, "can_navigate_settings_sidebar"))
		{
			draw_sprite_ext(spr_icon_dropdown_menu, menu_cursor_index, button_left + 20, button_center_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_icon_dropdown_menu, menu_cursor_index, button_right - 20, button_center_y, 1, 1, 0, c_white, 1);
		}

		#region /* Show a menu cursor when the option is highlighted */
		if (menu == menu_index)
		&& (!open_dropdown)
		{
			if (variable_instance_exists(self, "menu_cursor_y_position"))
			&& (variable_instance_exists(self, "menu_y_offset"))
			{
				menu_cursor_y_position = y_position - menu_y_offset;
			}
			if (variable_instance_exists(self, "menu_cursor_index"))
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + 16, y_position + 24, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_cursor, 0, x_position + 16, y_position + 24, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Show a menu cursor when the option is highlighted END */

		#region /* Clicking the menu button */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, button_left, button_top, button_right, button_bottom))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!open_dropdown)
		|| (key_a_pressed)
		&& (menu == menu_index)
		&& (!input_key)
		&& (!open_dropdown)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = menu_index;
			open_dropdown = true;
			menu_delay = 3;
			if (variable_instance_exists(self, "can_navigate_settings_sidebar"))
			{
				can_navigate_settings_sidebar = false;
			}
		}
		else
		if (key_b_pressed)
		&& (menu == menu_index)
		&& (!input_key)
		&& (open_dropdown)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_a_pressed)
		&& (menu == menu_index)
		&& (!input_key)
		&& (open_dropdown)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = menu_index;
			open_dropdown = false;
			menu_delay = 3;
		}
		#endregion /* Clicking the menu button END */

		#region /* Text above the menu button */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(button_center_x, button_center_y - 32, string(string_text), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		#endregion /* Text above the menu button END */

		#region /* Text inside the menu button */
		if (selected_text != "")
		{
			scr_draw_text_outlined(button_center_x, button_center_y, selected_text, global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* Text inside the menu button END */

		#region /* Open dropdown menu */
		if (open_dropdown)
		&& (menu == menu_index)
		{
			scr_menu_dropdown_handle_popup_mouse_input(button_left, popup_top, variable_to_change, menu_index, dropdown_items, dropdown_layout);

			if (!(open_dropdown)
			|| (menu != menu_index))
			{
				return(variable_to_change);
			}

			var popup_cursor_anchor = popup_top - menu_y_offset + (dropdown_item_count * dropdown_layout.item_step);

			if (variable_instance_exists(self, "menu_cursor_y_position"))
			&& (variable_instance_exists(self, "menu_y_offset"))
			{
				menu_cursor_y_position = popup_cursor_anchor;
			}

			if (variable_instance_exists(self, "menu_cursor_y_position_end"))
			{
				menu_cursor_y_position_end = max(menu_cursor_y_position_end, popup_cursor_anchor);
			}

			scr_menu_dropdown_queue_popup(id, button_left, popup_top, variable_to_change, menu_index, default_dropdown_text, dropdown_items, dropdown_layout, dropdown_item_count);
		}
		#endregion /* Open dropdown menu END */

		#endregion /* Button END */

		#region /* Clicking outside the menu button */
		if (!point_in_rectangle(mouse_get_x, mouse_get_y, button_left, button_top, button_right, button_bottom))
		&& !(open_dropdown
		&& dropdown_item_count > 0
		&& point_in_rectangle(mouse_get_x, mouse_get_y, button_left, popup_top, button_right, popup_bottom))
		&& (global.controls_used_for_navigation == "mouse")
		&& (open_dropdown)
		&& (menu == menu_index)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (mouse_check_button_released(mb_left))
			{
				open_dropdown = false;
				menu_delay = 3;
			}
		}
		#endregion /* Clicking outside the menu button END */

	}
	return(variable_to_change);
}

function scr_menu_dropdown_get_layout()
{
	var dropdown_width = sprite_get_width(spr_menu_dropdown_item);
	var base_item_height = sprite_get_height(spr_menu_dropdown_item);
	var target_item_height = max(base_item_height, 36);
	var button_sprite_width = max(1, sprite_get_width(spr_menu_button));

	return {
		button_x_offset : 32,
		button_height : sprite_get_height(spr_menu_button),
		button_center_y : sprite_get_yoffset(spr_menu_button),
		button_scale_x : dropdown_width / button_sprite_width,
		dropdown_width : dropdown_width,
		item_height : target_item_height,
		item_step : target_item_height,
		popup_shadow_offset : 5,
		item_scale_y : target_item_height / max(1, base_item_height),
		item_text_scale : max(global.default_text_size * 1.125, 0.9),
		item_badge_scale : max(global.default_text_size * 0.5, 0.42)
	};
}

function scr_menu_dropdown_get_item_count(dropdown_items)
{
	var highest_item_index = -1;

	for (var item_index = 0; item_index < array_length(dropdown_items); item_index++)
	{
		if (string(dropdown_items[item_index]) != "")
		{
			highest_item_index = item_index;
		}
	}

	return highest_item_index + 1;
}

function scr_menu_dropdown_get_popup_top(y_position, dropdown_item_count, dropdown_layout)
{
	return y_position;
}

function scr_menu_dropdown_handle_popup_mouse_input(popup_left, popup_top, variable_to_change, menu_index, dropdown_items, dropdown_layout)
{
	if (global.controls_used_for_navigation != "mouse")
	{
		return;
	}

	if (!variable_instance_exists(self, "menu_delay")
	|| !variable_instance_exists(self, "menu_joystick_delay")
	|| !variable_instance_exists(self, "open_dropdown"))
	{
		return;
	}

	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var item_width = sprite_get_width(spr_menu_dropdown_item);
	var popup_height = scr_menu_dropdown_get_item_count(dropdown_items) * dropdown_layout.item_step;
	var popup_bottom = popup_top + popup_height;

	if (point_in_rectangle(mouse_get_x, mouse_get_y, popup_left, popup_top, popup_left + item_width, popup_bottom))
	&& (variable_instance_exists(self, "can_navigate_settings_sidebar"))
	{
		can_navigate_settings_sidebar = false;
	}

	for (var dropdown_index = 0; dropdown_index < array_length(dropdown_items); dropdown_index++)
	{
		if (string(dropdown_items[dropdown_index]) == "")
		{
			continue;
		}

		var item_top = popup_top + (dropdown_layout.item_step * dropdown_index);
		var item_bottom = item_top + dropdown_layout.item_height;

		if (point_in_rectangle(mouse_get_x, mouse_get_y, popup_left, item_top, popup_left + item_width, item_bottom))
		{
			menu = menu_index;

			if (mouse_check_button_released(mb_left)
			&& menu_delay == 0
			&& menu_joystick_delay == 0)
			{
				menu_dropdown_variable_to_change(variable_to_change, dropdown_index);
				open_dropdown = false;
				menu_delay = 3;
			}

			return;
		}
	}
}

function scr_menu_dropdown_queue_popup(owner_id, popup_left, popup_top, variable_to_change, menu_index, default_dropdown_text, dropdown_items, dropdown_layout, dropdown_item_count)
{
	global.menu_dropdown_popup_request = {
		owner_id : owner_id,
		popup_left : popup_left,
		popup_top : popup_top,
		variable_to_change : variable_to_change,
		menu_index : menu_index,
		default_dropdown_text : default_dropdown_text,
		dropdown_items : dropdown_items,
		dropdown_layout : dropdown_layout,
		dropdown_item_count : dropdown_item_count
	};
}

function scr_menu_dropdown_draw_deferred_popup()
{
	if (!variable_global_exists("menu_dropdown_popup_request")
	|| !is_struct(global.menu_dropdown_popup_request))
	{
		return;
	}

	var popup_request = global.menu_dropdown_popup_request;
	var popup_owner = popup_request.owner_id;

	if (instance_exists(popup_owner))
	{
		with (popup_owner)
		{
			scr_menu_dropdown_draw_popup_shadow(popup_request.popup_left, popup_request.popup_top, popup_request.dropdown_layout, popup_request.dropdown_item_count);

			for (var dropdown_index = 0; dropdown_index < array_length(popup_request.dropdown_items); dropdown_index++)
			{
				draw_menu_dropdown_item(
					popup_request.dropdown_items[dropdown_index],
					popup_request.popup_left,
					popup_request.popup_top,
					popup_request.variable_to_change,
					dropdown_index,
					popup_request.menu_index,
					popup_request.default_dropdown_text,
					popup_request.dropdown_layout
				);
			}
		}
	}

	global.menu_dropdown_popup_request = undefined;
}

function scr_menu_dropdown_draw_popup_shadow(popup_left, popup_top, dropdown_layout, dropdown_item_count)
{
	var popup_right = popup_left + dropdown_layout.dropdown_width;
	var popup_bottom = popup_top + (dropdown_item_count * dropdown_layout.item_step);

	draw_set_alpha(0.25);
	draw_roundrect_color_ext(
		popup_left + dropdown_layout.popup_shadow_offset,
		popup_top + dropdown_layout.popup_shadow_offset,
		popup_right + dropdown_layout.popup_shadow_offset,
		popup_bottom + dropdown_layout.popup_shadow_offset,
		10,
		10,
		c_black,
		c_black,
		false
	);
	draw_set_alpha(1);
}

function draw_menu_default_badge(badge_left, badge_top, badge_text = "", badge_text_scale = -1, badge_min_width = 52)
{
	if (badge_text == "")
	{
		badge_text = l10n_text("Default");
	}

	if (badge_text_scale < 0)
	{
		badge_text_scale = global.default_text_size * 0.42;
	}

	var badge_padding_x = 10;
	var badge_height = max(12, badge_text_scale * 18);
	var badge_outline = make_color_rgb(235, 235, 235);
	var badge_fill = make_color_rgb(18, 18, 18);
	var badge_text_fill = c_white;
	var badge_width = max(badge_min_width, (string_width(badge_text) * badge_text_scale) + (badge_padding_x * 2));
	var badge_right = badge_left + badge_width;
	var badge_bottom = badge_top + badge_height;

	draw_set_alpha(0.45);
	draw_roundrect_color_ext(badge_left + 1, badge_top + 1, badge_right + 1, badge_bottom + 1, 9, 9, c_black, c_black, false);
	draw_set_alpha(1);

	draw_roundrect_color_ext(badge_left - 1, badge_top - 1, badge_right + 1, badge_bottom + 1, 9, 9, badge_outline, badge_outline, false);
	draw_roundrect_color_ext(badge_left, badge_top, badge_right, badge_bottom, 8, 8, badge_fill, badge_fill, false);

	draw_set_alpha(0.12);
	draw_roundrect_color_ext(badge_left + 1, badge_top + 1, badge_right - 1, badge_top + (badge_height * 0.45), 7, 7, c_white, c_white, false);
	draw_set_alpha(1);

	scr_draw_text_outlined(badge_left + (badge_width * 0.5), badge_top + (badge_height * 0.5) + 0.5, badge_text, badge_text_scale, c_black, badge_text_fill, 1);
}

function draw_menu_debug_visibility_row(x_position, y_position, string_text, menu_index, item_id, option_description = "", can_move_cursor_position = true)
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var row_left = x_position + 32;
	var row_width = 555;
	var button_gap = 6;
	var button_height = 39;
	var button_top = y_position + 2;
	var button_bottom = button_top + button_height;
	var definition = scr_debug_get_visibility_definition(item_id);
	var current_mode = scr_debug_get_item_mode(item_id);
	var mode_values = [
		DEBUG_VISIBILITY_MODE.OFF,
		DEBUG_VISIBILITY_MODE.IN_OVERLAY,
		DEBUG_VISIBILITY_MODE.ALWAYS
	];
	var visible_modes = [];
	var any_button_hovered = false;

	if (!variable_instance_exists(self, "debug_visibility_menu_focus")
	|| !is_struct(debug_visibility_menu_focus))
	{
		debug_visibility_menu_focus = {};
	}

	if (!variable_instance_exists(self, "debug_visibility_shared_focus_mode"))
	{
		debug_visibility_shared_focus_mode = current_mode;
	}

	if (definition == undefined)
	{
		return current_mode;
	}

	for (var visible_index = 0; visible_index < array_length(mode_values); visible_index++)
	{
		if (scr_debug_is_visibility_mode_available_in_public_menu(item_id, mode_values[visible_index]))
		{
			array_push(visible_modes, mode_values[visible_index]);
		}
	}

	if (array_length(visible_modes) <= 0)
	{
		return current_mode;
	}

	var button_width = floor((row_width - (button_gap * max(0, array_length(visible_modes) - 1))) / array_length(visible_modes));
	var displayed_mode = current_mode;

	if (!scr_debug_is_visibility_mode_available_in_public_menu(item_id, displayed_mode))
	{
		displayed_mode = DEBUG_VISIBILITY_MODE.OFF;
		if (!scr_debug_is_visibility_mode_available_in_public_menu(item_id, displayed_mode))
		{
			displayed_mode = visible_modes[0];
		}
	}

	var default_focus_mode = displayed_mode;

	if (!scr_debug_is_visibility_mode_available_in_public_menu(item_id, default_focus_mode))
	{
		default_focus_mode = scr_debug_find_next_public_visibility_mode(item_id, default_focus_mode, 1);
	}

	var stored_focus_mode = variable_struct_exists(debug_visibility_menu_focus, menu_index)
		? variable_struct_get(debug_visibility_menu_focus, menu_index)
		: default_focus_mode;

	if (!scr_debug_is_visibility_mode_available_in_public_menu(item_id, stored_focus_mode))
	{
		stored_focus_mode = scr_debug_find_next_public_visibility_mode(item_id, stored_focus_mode, 1);
	}

	var shared_focus_mode = debug_visibility_shared_focus_mode;

	if (!scr_debug_is_visibility_mode_available_in_public_menu(item_id, shared_focus_mode))
	{
		shared_focus_mode = scr_debug_find_next_public_visibility_mode(item_id, shared_focus_mode, 1);
	}

	var focused_mode = (menu == menu_index)
		? shared_focus_mode
		: stored_focus_mode;

	if (!scr_debug_is_visibility_mode_available_in_public_menu(item_id, focused_mode))
	{
		focused_mode = default_focus_mode;
	}

	for (var hover_index = 0; hover_index < array_length(visible_modes); hover_index++)
	{
		var hover_left = row_left + (hover_index * (button_width + button_gap));
		var hover_right = hover_left + button_width;
		var hover_mode = visible_modes[hover_index];

		if (point_in_rectangle(mouse_get_x, mouse_get_y, hover_left, button_top, hover_right, button_bottom)
		&& global.controls_used_for_navigation == "mouse"
		&& !open_dropdown
		&& !input_key)
		{
			any_button_hovered = true;
			menu = menu_index;

			if (variable_instance_exists(self, "can_navigate_settings_sidebar"))
			{
				can_navigate_settings_sidebar = false;
			}

			focused_mode = hover_mode;
			debug_visibility_shared_focus_mode = focused_mode;
			variable_struct_set(debug_visibility_menu_focus, menu_index, focused_mode);

			if (mouse_check_button_released(mb_left)
			&& menu_delay == 0
			&& menu_joystick_delay == 0)
			{
				scr_debug_set_item_mode(item_id, hover_mode, false);
				focused_mode = hover_mode;
				menu_delay = 3;
			}
		}
	}

	if (menu == menu_index)
	{
		debug_visibility_shared_focus_mode = focused_mode;
		variable_struct_set(debug_visibility_menu_focus, menu_index, focused_mode);

		if (can_move_cursor_position
		&& variable_instance_exists(self, "menu_cursor_y_position")
		&& variable_instance_exists(self, "menu_y_offset"))
		{
			menu_cursor_y_position = y_position - menu_y_offset;
		}

		var default_mode_text = scr_debug_get_visibility_mode_label(definition.default_mode);
		scr_set_default_option_description(menu_index, default_mode_text, (option_description != "") ? option_description : string_text);

		if (!open_dropdown
		&& menu_delay == 0
		&& menu_joystick_delay == 0)
		{
			if (key_left)
			{
				focused_mode = scr_debug_find_next_public_visibility_mode(item_id, focused_mode, -1);
				debug_visibility_shared_focus_mode = focused_mode;
				variable_struct_set(debug_visibility_menu_focus, menu_index, focused_mode);
				menu_delay = 3;
			}
			else
			if (key_right)
			{
				focused_mode = scr_debug_find_next_public_visibility_mode(item_id, focused_mode, 1);
				debug_visibility_shared_focus_mode = focused_mode;
				variable_struct_set(debug_visibility_menu_focus, menu_index, focused_mode);
				menu_delay = 3;
			}
			else
			if (key_a_pressed
			&& scr_debug_is_visibility_mode_available_in_public_menu(item_id, focused_mode))
			{
				scr_debug_set_item_mode(item_id, focused_mode, false);
				menu_delay = 3;
			}
		}
	}

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x_position + 277 + 32, y_position + 21 - 32, string(string_text), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);

	for (var button_index = 0; button_index < array_length(visible_modes); button_index++)
	{
		var button_mode = visible_modes[button_index];
		var button_left = row_left + (button_index * (button_width + button_gap));
		var button_right = button_left + button_width;
		var button_selected = (displayed_mode == button_mode);
		var button_focused = (menu == menu_index) && (focused_mode == button_mode);
		var label_text = scr_debug_get_visibility_mode_label(button_mode, button_mode == DEBUG_VISIBILITY_MODE.OFF);
		var label_color = c_white;
		var button_fill_color = make_color_rgb(28, 28, 28);

		if (button_mode == DEBUG_VISIBILITY_MODE.IN_OVERLAY)
		{
			if (button_selected)
			{
				label_color = c_yellow;
			}
		}
		else
		if (button_mode == DEBUG_VISIBILITY_MODE.ALWAYS)
		{
			if (button_selected)
			{
				label_color = c_red;
			}
		}

		if (button_focused)
		{
			draw_set_alpha(any_button_hovered && global.controls_used_for_navigation == "mouse" ? 0.9 : scr_wave(0.15, 0.45, 1));
			draw_roundrect_color_ext(button_left - 2, button_top - 2, button_right + 2, button_bottom + 2, 18, 18, c_white, c_white, false);
			draw_set_alpha(1);
		}

		draw_roundrect_color_ext(button_left, button_top, button_right, button_bottom, 16, 16, button_fill_color, button_fill_color, false);

		if (button_selected)
		{
			draw_set_alpha(0.2);
			draw_roundrect_color_ext(button_left + 2, button_top + 2, button_right - 2, button_bottom - 2, 14, 14, label_color, label_color, false);
			draw_set_alpha(1);
		}

		scr_draw_text_outlined(button_left + (button_width * 0.5), button_top + (button_height * 0.5), label_text, global.default_text_size * 0.7, c_black, label_color, 1);

		if (button_focused)
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, button_left - 20, button_top + (button_height * 0.5), 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, button_right + 20, button_top + (button_height * 0.5), 1, 1, 180, c_white, 1);
		}

		if (button_mode == definition.default_mode)
		{
			var badge_text = l10n_text("Default");
			var badge_text_scale = global.default_text_size * 0.42;
			var badge_width = max(52, (string_width(badge_text) * badge_text_scale) + 20);
			var badge_left = button_left + ((button_width - badge_width) * 0.5);
			var badge_top = button_bottom - 4;
			draw_menu_default_badge(badge_left, badge_top, badge_text, badge_text_scale, badge_width);
		}
	}

	return current_mode;
}
