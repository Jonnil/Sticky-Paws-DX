/// scr_draw_server_timeout_error()
/// Draws an error menu when a server timeout has occurred
function scr_draw_server_timeout_error()
{
	/* --- Draw a centered rounded rectangle as the error box --- */
	var rect_width = 800;
	var rect_height = 310;
	var rect_x1 = display_get_gui_width() * 0.5 - rect_width * 0.5;
	var rect_y1 = display_get_gui_height() * 0.5 - rect_height * 0.5;
	var rect_x2 = rect_x1 + rect_width;
	var rect_y2 = rect_y1 + rect_height;
	draw_roundrect_color_ext(rect_x1, rect_y1, rect_x2, rect_y2, 50, 50, c_black, c_black, false);

	/* --- Draw the error title and message --- */
	draw_set_halign(fa_center);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, rect_y1, l10n_text("Server Timeout"), global.default_text_size * 2, c_black, c_red, 1);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, rect_y1 + 60, l10n_text("The server did not respond in time"), global.default_text_size, c_black, c_red, 1);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, rect_y1 + 100, l10n_text("This could be due to a lost connection server maintenance or high traffic"), global.default_text_size, c_black, c_red, 1);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, rect_y1 + 140, l10n_text("Please check your internet connection or try again later"), global.default_text_size * 0.8, c_black, c_red, 1);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, rect_y1 + 200, l10n_text("Tried to connect for 15 seconds before timeout"), global.default_text_size * 0.7, c_black, c_red, 1);

	/* --- Draw buttons --- */
	/* Position the buttons at the bottom of the error box */
	var button_width = 160;
	var button_x = display_get_gui_width() * 0.5 - button_width - 20;
	var button_y = rect_y2 - 80;

	/* Draw a "Retry" button */
	/* and returns true when clicked */
	var retry_clicked = draw_menu_button(button_x, button_y, l10n_text("Retry"), "server_timeout_retry", "server_timeout_retry");
	draw_sprite_ext(spr_icon_retry, 0, button_x + 20, button_y + 21, 1, 1, 0, c_white, 1);
	button_y += 45;

	var check_status_clicked = false;

	if (global.link_to_check_server_status != "")
	{
		check_status_clicked = draw_menu_button(button_x, button_y, l10n_text("Check Server Status"), "server_timeout_check_status", "server_timeout_check_status");
		draw_sprite_ext(spr_icon_antenna, 0, button_x + 20, button_y + 21, 1, 1, 0, c_white, 1);
		button_y += 45;
	}

	var back_clicked  = draw_menu_button(button_x, button_y, l10n_text("Back"), "server_timeout_back", "server_timeout_back");
	draw_sprite_ext(spr_icon_back, 0, button_x + 20, button_y + 21, 1, 1, 0, c_white, 1);

	/* --- Handle button clicks --- */
	if (retry_clicked)
	{
		/* Reset timeout flag */
		global.server_timeout_end = undefined;
		/* Reinitialize the online download menu to resend the specific HTTP request */
		in_online_download_list_menu = true; show_debug_message("[scr_draw_server_timeout_error] 'In online download list menu' is set to true\n");
		scr_initialize_online_download_menu();
	}

	if (global.link_to_check_server_status != "")
	&& (check_status_clicked)
	{
		url_open(global.link_to_check_server_status);
	}

	if (back_clicked)
	|| (key_b_pressed)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu_delay = 3;
		
		/* Change back to a previous menu state */
		in_online_download_list_menu = false;
		in_online_download_list_load_menu = false;
		in_online_search_id = false;
		
		if (caution_online_takes_you_back_to == "online_level_list")
		{
			select_custom_level_menu_open = true;
		}
		
		menu = caution_online_takes_you_back_to;
	}

	if (key_up)
	&& (!key_down)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu_delay = 3;
		if (menu == "server_timeout_retry")
		{
			menu = "server_timeout_back";
		}
		else
		if (menu == "server_timeout_check_status")
		{
			menu = "server_timeout_retry";
		}
		else
		if (menu == "server_timeout_back")
		{
			if (global.link_to_check_server_status != "")
			{
				menu = "server_timeout_check_status";
			}
			else
			{
				menu = "server_timeout_retry";
			}
		}
	}
	else
	if (key_down)
	&& (!key_up)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu_delay = 3;
		if (menu == "server_timeout_retry")
		{
			if (global.link_to_check_server_status != "")
			{
				menu = "server_timeout_check_status";
			}
			else
			{
				menu = "server_timeout_back";
			}
		}
		else
		if (menu == "server_timeout_check_status")
		{
			menu = "server_timeout_back";
		}
		else
		if (menu == "server_timeout_back")
		{
			menu = "server_timeout_retry";
		}
	}
}
