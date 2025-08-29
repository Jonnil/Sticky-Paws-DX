function scr_draw_all_level_editor_icon()
{

	#region /* Level Editor Icons */

	#region /* Autoscroll Button */

	var autoscroll_speed_overall = max(abs(autoscroll_speed_x), abs(autoscroll_speed_y));

	#region /* Autoscroll Icon X */
	var autoscroll_xscale = 1;

	if (autoscroll_speed_x == 0)
	&& (autoscroll_speed_y == 0)
	{
		autoscroll_icon_sprite = spr_leveleditor_icon_autoscroll_none;
		autoscroll_xscale = 1;
	}
	else
	if (autoscroll_speed_overall <= +1.5)
	&& (autoscroll_speed_overall > 0)
	|| (autoscroll_speed_overall >= -1.5)
	&& (autoscroll_speed_overall < 0)
	{
		autoscroll_icon_sprite = spr_leveleditor_icon_autoscroll_slow;
		autoscroll_xscale = sign(autoscroll_speed_x);
	}
	else
	if (autoscroll_speed_overall <= +2.5)
	&& (autoscroll_speed_overall > 0)
	|| (autoscroll_speed_overall >= -2.5)
	&& (autoscroll_speed_overall < 0)
	{
		autoscroll_icon_sprite = spr_leveleditor_icon_autoscroll_normal;
		autoscroll_xscale = sign(autoscroll_speed_x);
	}
	else
	{
		autoscroll_icon_sprite = spr_leveleditor_icon_autoscroll_fast;
		autoscroll_xscale = sign(autoscroll_speed_x);
	}
	if (autoscroll_xscale == 0)
	{
		autoscroll_xscale = 1;
	}
	#endregion /* Autoscroll Icon X END */

	#region /* Autoscroll Icon Y */
	if (autoscroll_speed_y == 0)
	{
		var autoscroll_angle = 0;
	}
	else
	if (autoscroll_speed_y < 0)
	{
		if (autoscroll_xscale == 1)
		{
			var autoscroll_angle = 90;
		}
		else
		{
			var autoscroll_angle = 270;
		}
	}
	else
	if (autoscroll_speed_y > 0)
	{
		if (autoscroll_xscale == 1)
		{
			var autoscroll_angle = 270;
		}
		else
		{
			var autoscroll_angle = 90;
		}
	}
	#endregion /* Autoscroll Icon Y END */

	draw_sprite_ext(autoscroll_icon_sprite, autoscroll_icon_subimg, icon_at_left_x + 32, autoscroll_icon_y, autoscroll_xscale, 1, autoscroll_angle, c_white, 1);

	if (show_autoscroll_menu)
	&& (!pause)
	{
		autoscroll_icon_subimg += autoscroll_speed_overall * 0.1;
		draw_roundrect_color_ext(132, autoscroll_icon_y - 8, 670, autoscroll_icon_y + 48 + 42, 50, 50, c_white, c_white, false);
		draw_roundrect_color_ext(132, autoscroll_icon_y - 8, 670, autoscroll_icon_y + 48 + 42, 50, 50, c_black, c_black, true);
		autoscroll_speed_x = draw_menu_left_right_buttons(196, autoscroll_icon_y, 396, l10n_text("Autoscroll Speed X"), autoscroll_speed_x, "autoscroll_speed_x", 0.1, true, 0, 32);
		autoscroll_speed_y = draw_menu_left_right_buttons(196, autoscroll_icon_y + 42, 396, l10n_text("Autoscroll Speed Y"), autoscroll_speed_y, "autoscroll_speed_y", 0.1, true, 0, 32);
		if (key_up)
		{
			level_editor_menu = "autoscroll";
			menu = "autoscroll_speed_x";
		}
		else
		if (key_down)
		{
			level_editor_menu = "autoscroll";
			menu = "autoscroll_speed_y";
		}
	}
	#endregion /* Autoscroll Button END */

	#region /* Click Autoscroll Button */
	if (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(cursor_x, cursor_y, icon_at_left_x - 32, autoscroll_icon_y - 32, icon_at_left_x + 64, autoscroll_icon_y + 32))
	&& (show_icon_at_left)
	&& (!pause)
	|| (level_editor_menu == "autoscroll")
	&& (!pause)
	|| (show_autoscroll_menu)
	&& (key_b_pressed)
	&& (!pause)
	{
		if (!show_autoscroll_menu)
		{
			autoscroll_icon_subimg += autoscroll_speed_overall * 0.1;
		}
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, icon_at_left_x + 80, autoscroll_icon_y, 1, 1, 180, c_white, 1);
		draw_set_alpha(0.5);
		draw_rectangle_color(icon_at_left_x - 32, autoscroll_icon_y - 32, icon_at_left_x + 64, autoscroll_icon_y + 32, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
		tooltip = l10n_text("Autoscroll");
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		|| (level_editor_menu == "autoscroll")
		&& (key_a_pressed)
		|| (show_autoscroll_menu)
		&& (key_b_pressed)
		{
			if (if_clear_checked)
			{
				ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				ini_write_real("info", "clear_check", false); /* Set clear check to false when trying to upload within the level editor */
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				if_clear_checked = false;
			}

			menu = "autoscroll_speed_x";
			show_time_menu = false;
			show_autoscroll_menu = !show_autoscroll_menu;
			ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			ini_write_real("info", "autoscroll_speed_x", autoscroll_speed_x);
			ini_write_real("info", "autoscroll_speed_y", autoscroll_speed_y);
			ini_close();
		}
	}
	#endregion /* Click Autoscroll Button END */

	#region /* Time Button */

	if (global.enable_time_countdown)
	&& (global.time_countdown > 0)
	{
		var time_icon_sprite = spr_leveleditor_icon_time;
	}
	else
	{
		var time_icon_sprite = spr_leveleditor_icon_time_no;
	}

	draw_sprite_ext(time_icon_sprite, 0, icon_at_left_x + 32, time_icon_y, 1, 1, 0, c_white, 1);

	if (show_time_menu)
	&& (!pause)
	{
		draw_roundrect_color_ext(132, time_icon_y - 8, 670, time_icon_y + 48 + 42, 50, 50, c_white, c_white, false);
		draw_roundrect_color_ext(132, time_icon_y - 8, 670, time_icon_y + 48 + 42, 50, 50, c_black, c_black, true);
		global.enable_time_countdown = draw_menu_checkmark(150, time_icon_y, l10n_text("Enable Time Countdown"), "in_editor_enable_time_countdown", global.enable_time_countdown, false);
		if (global.enable_time_countdown)
		{
			global.time_countdown = draw_menu_left_right_buttons(196, time_icon_y + 42, 396, l10n_text("Time Countdown"), global.time_countdown, "in_editor_time_countdown", 1, false);
		}
		if (key_up)
		{
			level_editor_menu = "time";
			menu = "in_editor_enable_time_countdown";
		}
		else
		if (key_down)
		&& (global.enable_time_countdown)
		{
			level_editor_menu = "time";
			menu = "in_editor_time_countdown";
		}
	}
	#endregion /* Time Button END */

	#region /* Click Time Button */
	if (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(cursor_x, cursor_y, icon_at_left_x - 32, time_icon_y - 32, icon_at_left_x + 64, time_icon_y + 32))
	&& (show_icon_at_left)
	&& (!pause)
	|| (level_editor_menu == "time")
	&& (!pause)
	|| (show_time_menu)
	&& (key_b_pressed)
	&& (!pause)
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, icon_at_left_x + 80, time_icon_y, 1, 1, 180, c_white, 1);
		draw_set_alpha(0.5);
		draw_rectangle_color(icon_at_left_x - 32, time_icon_y - 32, icon_at_left_x + 64, time_icon_y + 32, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
		tooltip = l10n_text("Time");
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		|| (level_editor_menu == "time")
		&& (key_a_pressed)
		&& (menu != "in_editor_enable_time_countdown")
		|| (show_time_menu)
		&& (key_b_pressed)
		{
			if (if_clear_checked)
			{
				ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				ini_write_real("info", "clear_check", false); /* Set clear check to false when trying to upload within the level editor */
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				if_clear_checked = false;
			}

			menu = "in_editor_enable_time_countdown";
			show_autoscroll_menu = false;
			show_time_menu = !show_time_menu;
			ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			ini_write_real("info", "enable_time_countdown", global.enable_time_countdown);
			ini_write_real("info", "time_countdown", global.time_countdown);
			ini_close();
		}
	}
	#endregion /* Click Time Button END */

	#region /* Play Level Button */
	if (global.controls_used_for_navigation == "mouse"
	&& point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64)
	&& !pause
	|| pressing_play_timer > 0
	&& !pause
	|| level_editor_menu == "play"
	&& !pause)
	{
		draw_roundrect_color_ext(
		play_level_icon_x - 22 - 16, display_get_gui_height() - 120 + icon_at_bottom_y - 16,
		play_level_icon_x - 22 + 630, display_get_gui_height() - 80 + icon_at_bottom_y + 16,
		50, 50, c_black, c_black, false);
		draw_set_halign(fa_left);
		scr_draw_text_outlined(play_level_icon_x - 22, display_get_gui_height() - 120 + icon_at_bottom_y, l10n_text("Press and hold to start from the beginning"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(play_level_icon_x - 22, display_get_gui_height() - 80 + icon_at_bottom_y, l10n_text("Press once to start from center of screen"), global.default_text_size, c_black, c_white, 1);
	}
	draw_sprite_ext(spr_menu_button_play, 0, play_level_icon_x, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, c_white, 1);

	#region /* Draw Play Key */
	if (global.controls_used_for_navigation == "gamepad"
	&& gamepad_is_connected(global.player_slot[1])
	|| global.always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(button_play, play_level_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, c_white, 1, 1, 1, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, key_play, play_level_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
	}
	#endregion /* Draw Play key END */

	if (pressing_play_timer > 0)
	{
		scr_draw_circular_bar(play_level_icon_x, display_get_gui_height() - 32 + icon_at_bottom_y, pressing_play_timer, frames_until_playtest_from_start, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding play key */
		scr_draw_circular_bar(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, pressing_play_timer, frames_until_playtest_from_start, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding play key */
	}

	if (global.controls_used_for_navigation == "mouse"
	&& point_in_rectangle(cursor_x, cursor_y, play_level_icon_x - 32 + 1, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64 - 1)
	&& show_icon_at_bottom
	&& !pause
	|| level_editor_menu == "play")
	{
		tooltip = l10n_text("Play level");
		show_tooltip += 2;
		draw_set_alpha(0.5);
		draw_rectangle_color(play_level_icon_x - 32 + 1, display_get_gui_height() - 64 + icon_at_bottom_y, play_level_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	#endregion /* Play Level Button END */

	#region /* Place brush icon */
	if (!erase_mode)
	&& (!fill_mode)
	{
		var place_blend = c_white;
	}
	else
	{
		var place_blend = c_dkgray;
	}
	draw_sprite_ext(spr_leveleditor_icon_pen, place_size, place_icon_x, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, place_blend, 1);

	#region /* Draw Brush Key */
	if (global.controls_used_for_navigation == "gamepad")
	&& (gamepad_is_connected(global.player_slot[1]))
	|| (global.always_show_gamepad_buttons)
	{
		if (!fill_mode)
		&& (!erase_mode)
		{
			scr_draw_gamepad_buttons(button_change_draw_size, place_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, c_white, 1, 1, 1, 1);
		}
		else
		{
			scr_draw_gamepad_buttons(button_draw, place_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, c_white, 1, 1, 1, 1);
		}
	}
	else
	{
		if (!fill_mode)
		&& (!erase_mode)
		{
			draw_sprite_ext(spr_keyboard_keys, key_change_draw_size, place_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, key_draw, place_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
	}
	#endregion /* Draw Brush key END */

	#region /* Click Pen */
	if (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(cursor_x, cursor_y, place_icon_x - 32 + 1, display_get_gui_height() - 64, place_icon_x + 32, display_get_gui_height() + 64 - 1))
	&& (show_icon_at_bottom)
	&& (!pause)
	|| (level_editor_menu == "pen")
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, place_icon_x, display_get_gui_height() - 80 + icon_at_bottom_y, 1, 1, 270, c_white, 1);
		draw_set_alpha(0.5);
		draw_rectangle_color(place_icon_x - 32 + 1, display_get_gui_height() - 64 + icon_at_bottom_y, place_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
		tooltip = l10n_text("Paintbrush tool");
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		|| (level_editor_menu == "pen")
		&& (key_a_pressed)
		{
			if (erase_mode || fill_mode)
			{
				erase_mode = false;
				fill_mode = false;
			}
			else
			{
				place_size += 1;
				erase_size = place_size;

				if (place_size > 5)
				{
					place_size = 0;
					erase_size = 0;
				}
			}
		}
	}
	#endregion /* Click Pen END */

	#endregion /* Place brush icon END */

	#region /* Erase icon */
	if (erase_mode)
	{
		var erase_blend = c_white;
	}
	else
	{
		var erase_blend = c_dkgray;
	}
	draw_sprite_ext(spr_leveleditor_icon_erase, erase_size, erase_icon_x, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, erase_blend, 1);

	#region /* Draw Eraser Key */
	if (global.controls_used_for_navigation == "gamepad")
	&& (gamepad_is_connected(global.player_slot[1]))
	|| (global.always_show_gamepad_buttons)
	{
		if (erase_mode)
		{
			scr_draw_gamepad_buttons(button_change_erase_size, erase_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, c_white, 1, 1, 1, 1);
		}
		else
		{
			scr_draw_gamepad_buttons(button_erase, erase_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, c_white, 1, 1, 1, 1);
		}
	}
	else
	{
		if (erase_mode)
		{
			draw_sprite_ext(spr_keyboard_keys, key_change_erase_size, erase_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, key_erase, erase_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
	}
	#endregion /* Draw Eraser key END */

	#region /* Click Erase */
	if (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(cursor_x, cursor_y, erase_icon_x - 32 + 1, display_get_gui_height() - 64, erase_icon_x + 32, display_get_gui_height() + 64 - 1))
	&& (show_icon_at_bottom)
	&& (!pause)
	|| (level_editor_menu == "erase")
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, erase_icon_x, display_get_gui_height() - 80 + icon_at_bottom_y, 1, 1, 270, c_white, 1);
		draw_set_alpha(0.5);
		draw_rectangle_color(erase_icon_x - 32 + 1, display_get_gui_height() - 64 + icon_at_bottom_y, erase_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
		tooltip = l10n_text("Erase tool");
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		|| (level_editor_menu == "erase")
		&& (key_a_pressed)
		{
			if (!erase_mode)
			{
				erase_mode = true;
				fill_mode = false;
			}
			else
			{
				erase_size += 1;
				place_size = erase_size;

				if (erase_size > 5)
				{
					erase_size = 0;
					place_size = 0;
				}
			}
		}
	}
	#endregion /* Click Erase END */

	#endregion /* Erase icon END */

	#region /* Fill icon */
	if (fill_mode)
	&& (!erase_mode)
	&& (difficulty_layer == 0)
	{
		var fill_blend = c_white;
	}
	else
	{
		var fill_blend = c_dkgray;
	}
	if (fill_mode_type == "fill")
	{
		var fill_angle = 0;
		var fill_sprite = spr_leveleditor_icon_fill;
	}
	else
	if (fill_mode_type == "horizontal")
	{
		var fill_angle = 0;
		var fill_sprite = spr_leveleditor_icon_fill_line;
	}
	else
	if (fill_mode_type == "vertical")
	{
		var fill_angle = 90;
		var fill_sprite = spr_leveleditor_icon_fill_line;
	}
	draw_sprite_ext(fill_sprite, 0, fill_icon_x, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, fill_angle, fill_blend, 1);

	#region /* Draw Fill Key */
	if (global.controls_used_for_navigation == "gamepad")
	&& (gamepad_is_connected(global.player_slot[1]))
	|| (global.always_show_gamepad_buttons)
	{
		if (fill_mode)
		{
			scr_draw_gamepad_buttons(button_change_fill_type, fill_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, c_white, 1, 1, 1, 1);
		}
		else
		{
			scr_draw_gamepad_buttons(button_fill, fill_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, c_white, 1, 1, 1, 1);
		}
	}
	else
	{
		if (fill_mode)
		{
			draw_sprite_ext(spr_keyboard_keys, key_change_fill_type, fill_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, key_fill, fill_icon_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
	}
	#endregion /* Draw Fill key END */

	#region /* Click Fill */
	if (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(cursor_x, cursor_y, fill_icon_x - 32 + 1, display_get_gui_height() - 64, fill_icon_x + 32, display_get_gui_height() + 64 - 1))
	&& (show_icon_at_bottom)
	&& (!pause)
	|| (level_editor_menu == "fill")
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, fill_icon_x, display_get_gui_height() - 80 + icon_at_bottom_y, 1, 1, 270, c_white, 1);
		draw_set_alpha(0.5);
		draw_rectangle_color(fill_icon_x - 32 + 1, display_get_gui_height() - 64 + icon_at_bottom_y, fill_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
		tooltip = l10n_text("Fill tool");
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		|| (level_editor_menu == "fill")
		&& (key_a_pressed)
		{
			if (!fill_mode)
			{
				erase_mode = false;
				fill_mode = true;
			}
			else
			if (fill_mode_type == "fill")
			{
				erase_mode = false;
				fill_mode_type = "horizontal";
				fill_mode = true;
			}
			else
			if (fill_mode_type == "horizontal")
			{
				erase_mode = false;
				fill_mode_type = "vertical";
				fill_mode = true;
			}
			else
			if (fill_mode_type == "vertical")
			{
				erase_mode = false;
				fill_mode_type = "fill";
				fill_mode = true;
			}
		}
	}
	#endregion /* Click Fill END */

	#endregion /* Fill icon END */

	#region /* Hide Buttons - Always show level editor buttons toggle */
	if (global.always_show_level_editor_buttons)
	{
		var hide_angle = 90;
	}
	else
	{
		var hide_angle = 270;
	}
	draw_sprite_ext(spr_menu_cursor, 0, always_show_level_editor_buttons_x, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, hide_angle, c_white, 1);

	if (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons)
	{
		/* There is no toggle buttons shortcut for gamepad */
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, ord("T"), always_show_level_editor_buttons_x + 20, display_get_gui_height() - 32 + icon_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
	}
	if (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(cursor_x, cursor_y, always_show_level_editor_buttons_x - 32 + 1, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64 - 1))
	&& (show_icon_at_bottom)
	&& (!pause)
	|| (level_editor_menu == "hide")
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, always_show_level_editor_buttons_x, display_get_gui_height() - 80 + icon_at_bottom_y, 1, 1, 270, c_white, 1);
		draw_set_alpha(0.5);
		draw_rectangle_color(always_show_level_editor_buttons_x - 32 + 1, display_get_gui_height() - 64 + icon_at_bottom_y, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
		if (global.always_show_level_editor_buttons)
		{
			tooltip = l10n_text("Hide buttons");
		}
		else
		if (!global.always_show_level_editor_buttons)
		{
			tooltip = l10n_text("Lock buttons");
		}
		show_tooltip += 2;
	}
	if (global.controls_used_for_navigation == "mouse")
	&& (mouse_check_button_pressed(mb_left))
	&& (point_in_rectangle(cursor_x, cursor_y, always_show_level_editor_buttons_x - 32 + 1, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64 - 1))
	|| (keyboard_check_pressed(ord("T")))
	|| (level_editor_menu == "hide")
	&& (key_a_pressed)
	{
		global.always_show_level_editor_buttons = not global.always_show_level_editor_buttons;
		ini_open(game_save_id + "save_file/config.ini");
		ini_write_real("config", "always_show_level_editor_buttons", global.always_show_level_editor_buttons);
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	}
	#endregion /* Hide Buttons - Always show level editor buttons toggle END */

	if (undo_and_redo_buttons_enabled)
	{

		#region /* Show Undo icon */
		draw_set_halign(fa_right);
		scr_draw_text_outlined(display_get_gui_width() - 16 + undo_redo_icon_y, display_get_gui_height() - 128 - 32, string(current_undo_value) + "/" + string(max_undo_value));

		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, display_get_gui_height() - 128, display_get_gui_width() - 64, display_get_gui_height() - 64))
		&& (mouse_check_button(mb_left))
		{
			draw_sprite_ext(spr_leveleditor_icon, 17, display_get_gui_width() - 96 + undo_redo_icon_y, display_get_gui_height() - 96, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icon, 17, display_get_gui_width() - 96 + undo_redo_icon_y, display_get_gui_height() - 96, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /* Show Undo icon END */

		#region /* Show Redo icon */
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 128, display_get_gui_width(), display_get_gui_height() - 64))
		&& (mouse_check_button(mb_left))
		{
			draw_sprite_ext(spr_leveleditor_icon, 18, display_get_gui_width() - 32 + undo_redo_icon_y, display_get_gui_height() - 96, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icon, 18, display_get_gui_width() - 32 + undo_redo_icon_y, display_get_gui_height() - 96, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /* Show Redo icon */

	}

	#region /* Delete All Objects / Wipe button */
	draw_sprite_ext(spr_leveleditor_icon_wipe, 0, display_get_gui_width() - 32, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, c_white, 1);
	if (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64 + 1, display_get_gui_height() - 64 + icon_at_bottom_y, display_get_gui_width() - 32 + 32, display_get_gui_height() - 32 + icon_at_bottom_y + 32))
	|| (level_editor_menu == "wipe")
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() - 32, display_get_gui_height() - 80 + icon_at_bottom_y, 1, 1, 270, c_white, 1);
		draw_set_alpha(0.5);
		draw_rectangle_color(display_get_gui_width() - 64, display_get_gui_height() - 64 + icon_at_bottom_y, display_get_gui_width() - 32 + 32, display_get_gui_height() - 32 + icon_at_bottom_y + 32, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	#endregion /* Delete All Objects / Wipe button END */

	#region /* Set difficulty layer */
	if (global.enable_difficutly_layers_in_level_editor)
	&& (set_difficulty_mode) {

		#region /* Easy */
		if (difficulty_layer == 1)
		{
			draw_sprite_ext(spr_leveleditor_icon, 20, display_get_gui_width() - 224 - 64, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icon, 20, display_get_gui_width() - 224 - 64, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 64 - 32 - 64 - 64 - 64 + 1, display_get_gui_height() - 32 + icon_at_bottom_y - 32, display_get_gui_width() + 32 - 64 - 32 - 64 - 64 - 64, display_get_gui_height() + 32 + icon_at_bottom_y - 32))
		|| (level_editor_menu == "easy")
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() - 224 - 64, display_get_gui_height() - 80 + icon_at_bottom_y, 1, 1, 270, c_white, 1);
			draw_set_alpha(0.5);
			draw_rectangle_color(display_get_gui_width() - 32 - 64 - 32 - 64 - 64 - 64, display_get_gui_height() - 32 + icon_at_bottom_y - 32, display_get_gui_width() + 32 - 64 - 32 - 64 - 64 - 64, display_get_gui_height() + 32 + icon_at_bottom_y - 32, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		#endregion /* Easy END */

		#region /* Normal */
		if (difficulty_layer == 2)
		{
			draw_sprite_ext(spr_leveleditor_icon, 21, display_get_gui_width() - 160 - 64, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icon, 21, display_get_gui_width() - 160 - 64, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 64 - 32 - 64 - 64 + 1, display_get_gui_height() - 32 + icon_at_bottom_y - 32, display_get_gui_width() + 32 - 64 - 32 - 64 - 64, display_get_gui_height() + 32 + icon_at_bottom_y - 32))
		|| (level_editor_menu == "normal")
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() - 160 - 64, display_get_gui_height() - 80 + icon_at_bottom_y, 1, 1, 270, c_white, 1);
			draw_set_alpha(0.5);
			draw_rectangle_color(display_get_gui_width() - 32 - 64 - 32 - 64 - 64, display_get_gui_height() - 32 + icon_at_bottom_y - 32, display_get_gui_width() + 32 - 64 - 32 - 64 - 64, display_get_gui_height() + 32 + icon_at_bottom_y - 32, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		#endregion /* Normal END */

		#region /* Hard */
		if (difficulty_layer == 3)
		{
			draw_sprite_ext(spr_leveleditor_icon, 22, display_get_gui_width() - 96 - 64, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icon, 22, display_get_gui_width() - 96 - 64, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 64 - 32 - 64 + 1, display_get_gui_height() - 32 + icon_at_bottom_y - 32, display_get_gui_width() + 32 - 64 - 32 - 64, display_get_gui_height() + 32 + icon_at_bottom_y - 32))
		|| (level_editor_menu == "hard")
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() - 96 - 64, display_get_gui_height() - 80 + icon_at_bottom_y, 1, 1, 270, c_white, 1);
			draw_set_alpha(0.5);
			draw_rectangle_color(display_get_gui_width() - 32 - 64 - 32 - 64, display_get_gui_height() - 32 + icon_at_bottom_y - 32, display_get_gui_width() + 32 - 64 - 32 - 64, display_get_gui_height() + 32 + icon_at_bottom_y - 32, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		#endregion /* Hard END */

		#region /* Set Difficulty Mode / Back */
		draw_sprite_ext(spr_leveleditor_icon, 24, display_get_gui_width() - 32 - 64, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, c_white, 1);

		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 64 - 32 + 1, display_get_gui_height() - 32 + icon_at_bottom_y - 32, display_get_gui_width() + 32 - 64 - 32, display_get_gui_height() + 32 + icon_at_bottom_y - 32))
		|| (level_editor_menu == "difficulty_toggle")
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() - 32 - 64, display_get_gui_height() - 80 + icon_at_bottom_y, 1, 1, 270, c_white, 1);
			draw_set_alpha(0.5);
			draw_rectangle_color(display_get_gui_width() - 32 - 64 - 32, display_get_gui_height() - 32 + icon_at_bottom_y - 32, display_get_gui_width() + 32 - 64 - 32, display_get_gui_height() + 32 + icon_at_bottom_y - 32, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		#endregion /* Set Difficulty Mode / Back END */

	}
	else
	if (global.enable_difficutly_layers_in_level_editor) {
		draw_sprite_ext(spr_leveleditor_icon, 19, display_get_gui_width() - 32 - 64, display_get_gui_height() - 32 + icon_at_bottom_y, 1, 1, 0, c_white, 1);

		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 64 - 32 + 1, display_get_gui_height() - 32 + icon_at_bottom_y - 32, display_get_gui_width() + 32 - 64 - 32, display_get_gui_height() + 32 + icon_at_bottom_y - 32))
		|| (level_editor_menu == "difficulty_toggle")
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() - 32 - 64, display_get_gui_height() - 80 + icon_at_bottom_y, 1, 1, 270, c_white, 1);
			draw_set_alpha(0.5);
			draw_rectangle_color(display_get_gui_width() - 32 - 64 - 32, display_get_gui_height() - 32 + icon_at_bottom_y - 32, display_get_gui_width() + 32 - 64 - 32, display_get_gui_height() + 32 + icon_at_bottom_y - 32, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
	}
	#endregion /* Set difficulty layer END */

	#region /* Show icon at top of screen */

	#region /* Show Grid */
	if (show_grid)
	{
		draw_set_halign(fa_left);
		scr_draw_text_outlined(48, 32, l10n_text("View X") + ": " + string(round(camera_get_view_x(view_camera[0]))) + "\n" + l10n_text("View Y") + ": " + string(round(camera_get_view_y(view_camera[0]))), global.default_text_size, c_black, c_white, 1);

		draw_sprite_ext(spr_leveleditor_icon, 13, grid_button_x, + 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
		if (global.grid_hsnap == global.grid_vsnap)
		{
			var grid_text = l10n_text("Grid") + ": " + string(global.grid_hsnap);
		}
		else
		{
			var grid_text = l10n_text("Grid X") + ": " + string(global.grid_hsnap) + "\n" + l10n_text("Grid Y") + ": " + string(global.grid_vsnap);
		}
		draw_set_halign(fa_right);draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() - 80, 80 + icon_at_top_y, string(grid_text), global.default_text_size, c_black, c_white, 1);
		var default_grid_size_text = "";
		if (global.grid_hsnap < 32 && global.grid_vsnap < 32)
		{
			var default_grid_size_text = l10n_text("Under default grid size!");
		}
		else
		if (global.grid_hsnap > 32 && global.grid_vsnap > 32)
		{
			var default_grid_size_text = l10n_text("Above default grid size!");
		}
		if (default_grid_size_text != "")
		{
			scr_draw_text_outlined(display_get_gui_width() - 80, 135 + icon_at_top_y, string(default_grid_size_text), global.default_text_size, c_black, c_white, 1);
		}
		draw_sprite_ext(spr_menu_button_up_down, 0, display_get_gui_width() - 32, 80 + icon_at_top_y + 16, 1, 1, 0, c_white, 1);
		if (global.controls_used_for_navigation == "mouse"
		&& mouse_check_button_pressed(mb_left))
		{
			if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 32, 80 + icon_at_top_y + 16 - 32 + 2, display_get_gui_width() + 64, 80 + icon_at_top_y + 16))
			{
				if (global.grid_hsnap < 63 || global.grid_vsnap < 63)
				{
					global.grid_hsnap++;
					global.grid_vsnap++;
				}
			}
			else
			if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 32, 80 + icon_at_top_y + 16, display_get_gui_width() + 64, 80 + icon_at_top_y + 16 + 32))
			{
				if (global.grid_hsnap > 1 || global.grid_vsnap > 1)
				{
					global.grid_hsnap--;
					global.grid_vsnap--;
				}
			}
		}
		scr_draw_text_outlined(display_get_gui_width() - 16, 32 + 140 + icon_at_top_y, l10n_text("X") + ": " + string(x) + " " + l10n_text("Y") + ": " + string(y), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() - 16, 32 + 190 + icon_at_top_y, l10n_text("View width") + ": " + string(camera_get_view_width(view_camera[0])) + " " + l10n_text("View height") + ": " + string(camera_get_view_height(view_camera[0])), global.default_text_size * 0.5, c_black, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_leveleditor_icon, 13, grid_button_x, + 32 + icon_at_top_y, 1, 1, 0, c_dkgray, 1);
	}
	if (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons)
	{
		/* There is no grid shortcut for gamepad */
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, ord("G"), grid_button_x + 20, + 32 + icon_at_top_y + 20, 0.4, 0.4, 0, c_white, 1);
	}
	#endregion /* Show Grid END */

	#region /* Zoom Out */
	if (zoom_out)
	{
		var zoom_out_blend = c_white;
	}
	else
	{
		var zoom_out_blend = c_dkgray;
	}
	draw_sprite_ext(spr_leveleditor_icon, 14, zoom_out_button_x, + 32 + icon_at_top_y, 1, 1, 0, zoom_out_blend, 1);
	#endregion /* Zoom Out END */

	#region /* Zoom Reset */
	if (zoom_reset)
	{
		var zoom_reset_blend = c_white;
	}
	else
	{
		var zoom_reset_blend = c_dkgray;
	}
	draw_sprite_ext(spr_leveleditor_icon, 15, zoom_reset_button_x, + 32 + icon_at_top_y, 1, 1, 0, zoom_reset_blend, 1);
	#endregion /* Zoom Reset END */

	#region /* Zoom In */
	if (zoom_in)
	{
		var zoom_in_blend = c_white;
	}
	else
	{
		var zoom_in_blend = c_dkgray;
	}
	draw_sprite_ext(spr_leveleditor_icon, 16, zoom_in_button_x, + 32 + icon_at_top_y, 1, 1, 0, zoom_in_blend, 1);
	#endregion /* Zoom In END */

	#region /* Help Button */
	if (welcome_to_level_editor > 0)
	{
		var help_blend = c_white;
		draw_sprite_ext(spr_arrow_swirly, menu_cursor_index, help_button_x - 32, + 132 + icon_at_top_y + scr_wave(0, 16, 1), 1, 1, 180, c_white, 1);
	}
	else
	{
		var help_blend = c_dkgray;
	}
	draw_sprite_ext(spr_leveleditor_icon_help, 0, help_button_x, + 32 + icon_at_top_y, 1, 1, 0, help_blend, 1);
	if (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons)
	{
		/* There is no help shortcut for gamepad */
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, ord("H"), help_button_x + 20, + 32 + icon_at_top_y + 20, 0.4, 0.4, 0, c_white, 1);
	}
	#endregion /* Help Button END */

	#endregion /* Show icon at top of screen END */

	#endregion /* Level Editor Icons */

}
