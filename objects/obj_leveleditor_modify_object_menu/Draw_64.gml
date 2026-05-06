if (can_only_input_numbers)
{
	var checkpoint_defeat_requirement_max = 99;

	if (!numeric_modify_initialized)
	{
		var raw_checkpoint_value = string(modify_object_text);
		var raw_checkpoint_digits = string_digits(raw_checkpoint_value);

		if (raw_checkpoint_value != "")
		&& (raw_checkpoint_digits == raw_checkpoint_value)
		{
			checkpoint_defeat_requirement = clamp(floor(real(raw_checkpoint_digits)), 0, checkpoint_defeat_requirement_max);
		}
		else
		{
			checkpoint_defeat_requirement = 0;
		}

		modify_object_text = string(checkpoint_defeat_requirement);
		keyboard_string = modify_object_text;
		menu = "checkpoint_defeats";
		numeric_modify_initialized = true;
	}

	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	key_left = scr_key_initialize(noone, 0, 1, action.left);
	key_right = scr_key_initialize(noone, 0, 1, action.right);
	key_up = scr_key_initialize(noone, 1, 1, action.up);
	key_down = scr_key_initialize(noone, 1, 1, action.down);
	key_accept_pressed = scr_key_initialize(noone, 1, 1, action.accept) || keyboard_check_pressed(vk_space);
	key_back_pressed = scr_key_initialize(noone, 1, 1, action.back) || keyboard_check_pressed(vk_escape);

	var center_x = display_get_gui_width() * 0.5;
	var center_y = display_get_gui_height() * 0.5;
	var selector_y = center_y - 16;
	var done_y = center_y + 84;
	var cancel_y = center_y + 126;
	var panel_color = make_color_rgb(8, 8, 10);
	var description_panel_margin = 32;

	draw_set_alpha(0.75);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);

	draw_roundrect_glossy_color_ext(description_panel_margin, 28, display_get_gui_width() - description_panel_margin, 128, 18, 18, panel_color, panel_color, false, 0.88);
	draw_roundrect_glossy_color_ext(center_x - 260, selector_y - 20, center_x + 260, selector_y + 60, 18, 18, panel_color, panel_color, false, 0.88);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(center_x, 48, l10n_text("Checkpoint appears after defeats"), global.default_text_size * 1.25, c_black, c_white, 1);
	scr_draw_text_outlined(center_x, 96, l10n_text("Set how many defeats are required before this checkpoint appears. 0 means it appears immediately."), global.default_text_size * 0.8, c_black, c_white, 1, 30, display_get_gui_width() - 128);

	checkpoint_defeat_requirement = draw_menu_left_right_buttons(center_x - 185, selector_y, 370, l10n_text("Defeats"), checkpoint_defeat_requirement, "checkpoint_defeats", 1, false, 0, checkpoint_defeat_requirement_max);
	checkpoint_defeat_requirement = clamp(floor(checkpoint_defeat_requirement), 0, checkpoint_defeat_requirement_max);
	modify_object_text = string(checkpoint_defeat_requirement);
	keyboard_string = modify_object_text;

	draw_menu_button(center_x - 185, done_y, l10n_text("Done"), "ok", "ok");
	draw_menu_button(center_x - 185, cancel_y, l10n_text("Cancel"), "cancel", "cancel");

	if (menu_delay == 0 && menu_joystick_delay == 0)
	{
		if (key_up)
		{
			menu_delay = 3;

			if (menu == "checkpoint_defeats")
			{
				menu = "cancel";
			}
			else
			if (menu == "ok")
			{
				menu = "checkpoint_defeats";
			}
			else
			{
				menu = "ok";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;

			if (menu == "checkpoint_defeats")
			{
				menu = "ok";
			}
			else
			if (menu == "ok")
			{
				menu = "cancel";
			}
			else
			{
				menu = "checkpoint_defeats";
			}
		}

		if (point_in_rectangle(mouse_get_x, mouse_get_y, center_x - 185, done_y, center_x + 185, done_y + 42))
		&& (mouse_check_button_released(mb_left))
		|| (menu == "ok")
		&& (key_accept_pressed)
		{
			numeric_modify_confirmed = true;
		}
		else
		if (point_in_rectangle(mouse_get_x, mouse_get_y, center_x - 185, cancel_y, center_x + 185, cancel_y + 42))
		&& (mouse_check_button_released(mb_left))
		|| (menu == "cancel")
		&& (key_accept_pressed)
		|| (key_back_pressed)
		{
			numeric_modify_cancelled = true;
		}
	}

	if (!scr_draw_cursor_mouse())
	&& (global.controls_used_for_navigation == "mouse")
	&& (!global.full_level_map_screenshot)
	&& (os_type != os_android)
	&& (os_type != os_ios)
	{
		draw_sprite_ext(spr_cursor, 0, mouse_get_x, mouse_get_y, 1, 1, 0, c_white, 1);
	}
}
else
{
	var max_characters = 200;
	modify_object_text = scr_draw_name_input_screen(modify_object_text, max_characters, c_white, 1, true, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "ok", "cancel", false, true, false);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, 32, string(modify_object_description), global.default_text_size, c_black, c_white, 1);
}
