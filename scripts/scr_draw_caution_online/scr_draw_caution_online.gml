function scr_draw_caution_online()
{
	var fixed_player = 1;
	
	if (menu == "caution_online_back")
	|| (menu == "caution_online_do_not_show")
	|| (menu == "caution_online_proceed")
	{
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = false;
		}
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath text */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
		
		draw_menu_button(0, 0, l10n_text("Back"), "caution_online_back", "caution_online_back");
		draw_sprite_ext(spr_icon_back, 0, 16, 21, 1, 1, 0, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 128, l10n_text("Caution: Online Communication"), global.default_text_size * 2, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 64, l10n_text("Online communication is offered by official servers that are owned operated and supervised by us"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, l10n_text("We are moderating user-generated content as much as we can but we might not catch everything"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("You may be exposed to unmoderated user-generated content that may not be suitable for everyone"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 32, l10n_text("If you find inappropriate content please report it"), global.default_text_size, c_black, c_white, 1);
		caution_online_do_not_show = draw_menu_checkmark(display_get_gui_width() * 0.5 - 280, display_get_gui_height() * 0.5 + 96, l10n_text("Do not show this screen again"), "caution_online_do_not_show", caution_online_do_not_show);
		draw_menu_button(display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5 + 138, l10n_text("Proceed"), "caution_online_proceed", "caution_online_proceed");
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5 + 138, display_get_gui_width() * 0.5 - 185 + 370, display_get_gui_height() * 0.5 + 138 + 41))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "caution_online_proceed")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (caution_online_takes_you_to == "online_download_list_load")
			{
				/* Go to online level list, so you can browse all uploaded levels, instead of just searching for specific levels */
				select_custom_level_menu_open = false;
				global.selected_online_download_index = 1;
			}
			if (caution_online_takes_you_to == "search_id_ok")
			{
				keyboard_string = "";
				search_id = "";
				content_type = "character";
				menu = "search_id_ok";
				select_custom_level_menu_open = false;
				menu_delay = 3;
			}
			global.online_enabled = true;
			if (caution_online_do_not_show)
			{
				ini_open(working_directory + "save_file/config.ini");
				ini_write_string("config", "caution_online_do_not_show", true);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			var no_players_can_play = true;
			for(var i = 1; i <= global.max_players; i += 1) {
			    if (global.player_can_play[i]) {
			        no_players_can_play = false;
			        break; /* exit the loop if any player can play */
			    }
			}
			if (no_players_can_play) {
				global.player_can_play[fixed_player] = true;
			}
			information_menu_open = 0;
			
			if (!upload_rules_do_not_show_level) /* If you have not yet agreed to the upload rules for uploading levels */
			&& (caution_online_takes_you_to == "level_editor_upload_pressed") /* And you're supposed to go to the upload edit menu */
			{
				menu = "upload_rules"; /* Then take you to the upload rules menu */
			}
			else
			{
				menu = caution_online_takes_you_to; /* You go to the menu you're supposed to go to from beginning */
			}
			menu_delay = 3;
		}
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 41))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "caution_online_back")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
			menu_delay = 3;
			menu = caution_online_takes_you_back_to;
		}
		
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "caution_online_back")
			{
				menu = "caution_online_proceed";
			}
			else
			if (menu == "caution_online_do_not_show")
			{
				menu = "caution_online_back";
			}
			else
			if (menu == "caution_online_proceed")
			{
				menu = "caution_online_do_not_show";
			}
			menu_delay = 3;
		}
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "caution_online_back")
			{
				menu = "caution_online_do_not_show";
			}
			else
			if (menu == "caution_online_do_not_show")
			{
				menu = "caution_online_proceed";
			}
			else
			if (menu == "caution_online_proceed")
			{
				menu = "caution_online_back";
			}
			menu_delay = 3;
		}
	}
}