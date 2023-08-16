function scr_draw_upload_rules()
{
	if (menu == "upload_rules_back")
	|| (menu == "upload_rules_do_not_show")
	|| (menu == "upload_rules")
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
		
		draw_menu_button(0, 0, l10n_text("Back"), "upload_rules_back", "upload_rules_back");
		draw_sprite_ext(spr_icons_back, 0, 16, 21, 1, 1, 0, c_white, 1);
		draw_set_halign(fa_center);
		if (content_type == "level")
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 64, l10n_text("Upload Level Rules"), global.default_text_size * 2, c_black, c_white, 1);
		}
		else
		if (content_type == "character")
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 64, l10n_text("Upload Character Rules"), global.default_text_size * 2, c_black, c_white, 1);
		}
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 128, l10n_text("Before uploading user-generated content, you need to agree to the rules"), global.default_text_size, c_black, c_white, 1);
		draw_set_halign(fa_left);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) - (32 * 4), "1. " + l10n_text("No intrusion of privacy"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) - (32 * 3), "2. " + l10n_text("No display of violence, or physical harm"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) - (32 * 2), "3. " + l10n_text("No abuse, harassment, or bullying"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) - 32, "4. " + l10n_text("No hateful or discriminatory content"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, display_get_gui_height() * 0.5, "5. " + l10n_text("No advertising or spamming"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) + 32, "6. " + l10n_text("No sexually explicit content"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) + (32 * 2), "7. " + l10n_text("No asking for likes"), global.default_text_size, c_black, c_white, 1);
		if (content_type == "level")
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) + (32 * 3), "8. " + l10n_text("If your level uses a bug, make sure to tag your level with Bug Showcase"), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) + (32 * 4), "9. " + l10n_text("No blatant copying of someone else's content"), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) + (32 * 5), "10. " + l10n_text("No inappropriate content"), global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) + (32 * 3), "8. " + l10n_text("No blatant copying of someone else's content"), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5 - 420, (display_get_gui_height() * 0.5) + (32 * 4), "9. " + l10n_text("No inappropriate content"), global.default_text_size, c_black, c_white, 1);
		}
		draw_set_halign(fa_center);
		
		if (content_type == "level")
		{
			upload_rules_do_not_show_level = draw_menu_checkmark(display_get_gui_width() * 0.5 - 280, display_get_gui_height() - 84, "Do not show this screen again", "upload_rules_do_not_show", upload_rules_do_not_show_level);
		}
		else
		if (content_type == "character")
		{
			upload_rules_do_not_show_character = draw_menu_checkmark(display_get_gui_width() * 0.5 - 280, display_get_gui_height() - 84, "Do not show this screen again", "upload_rules_do_not_show", upload_rules_do_not_show_character);
		}
		draw_menu_button(display_get_gui_width() * 0.5 - 185, display_get_gui_height() - 42, l10n_text("I agree"), "upload_rules", "upload_rules");
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, display_get_gui_height() - 32, display_get_gui_width() * 0.5 - 185 + 370, display_get_gui_height() - 32 + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "upload_rules")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (caution_online_takes_you_to == "online_download_list_load")
			{
				/* Go to online level list, so you can browse all uploaded levels, instead of just searching for specific levels */
				select_custom_level_menu_open = false;
				selected_online_download_index = 1;
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
			if (caution_online_takes_you_to == "upload_yes_character")
			{
				ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini");
				if (ini_key_exists("info", "clear_check_character"))
				{
					if (ini_read_real("info", "clear_check_character", false))
					{
						caution_online_takes_you_to = "upload_yes_character";
					}
					else
					{
						caution_online_takes_you_to = "clear_check_character_yes";
					}
				}
				else
				{
					caution_online_takes_you_to = "clear_check_character_yes";
				}
				ini_close();
			}
			if (upload_rules_do_not_show_level)
			{
				ini_open(working_directory + "config.ini");
				ini_write_string("config", "upload_rules_do_not_show_level", true);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			if (upload_rules_do_not_show_character)
			{
				ini_open(working_directory + "config.ini");
				ini_write_string("config", "upload_rules_do_not_show_character", true);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			menu = caution_online_takes_you_to;
			menu_delay = 3;
		}
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 0 + 370, 0 + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "upload_rules_back")
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
			if (menu == "upload_rules_back")
			{
				menu = "upload_rules";
			}
			else
			if (menu == "upload_rules_do_not_show")
			{
				menu = "upload_rules_back";
			}
			else
			if (menu == "upload_rules")
			{
				menu = "upload_rules_do_not_show";
			}
			menu_delay = 3;
		}
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "upload_rules_back")
			{
				menu = "upload_rules_do_not_show";
			}
			else
			if (menu == "upload_rules_do_not_show")
			{
				menu = "upload_rules";
			}
			else
			if (menu == "upload_rules")
			{
				menu = "upload_rules_back";
			}
			menu_delay = 3;
		}
	}
}