scr_zoom_camera_draw_gui(10);

if (global.convention_mode == true)
and (!instance_exists(obj_title))
{
	reset_game_if_no_interactivity += 1;
	reset_game_if_no_interactivity_second_countdown_timer += 1;
	if (reset_game_if_no_interactivity_second_countdown_timer >= 60)
	{
		reset_game_if_no_interactivity_second_countdown_timer = 0;
		reset_game_if_no_interactivity_second_countdown -= 1;
	}
	if (reset_game_if_no_interactivity >= 3600)
	{
		game_restart();
	}
}
if (global.convention_mode == true)
and (!instance_exists(obj_title))
and (reset_game_if_no_interactivity_second_countdown <= 30)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (reset_game_if_no_interactivity_second_countdown >= 2)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Game will restart in") + " " + string(reset_game_if_no_interactivity_second_countdown) + " " + l10n_text("seconds"), global.default_text_size * 2, c_black, c_red, 1);
	}
	else
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Game will restart in") + " " + string(reset_game_if_no_interactivity_second_countdown) + " " + l10n_text("second"), global.default_text_size * 2, c_black, c_red, 1);
	}
	scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42, l10n_text("Start moving to continue playing"), global.default_text_size, c_black, c_red, 1);
}


scr_debug_screen();
scr_virtual_keys();