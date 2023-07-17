function scr_draw_report()
{
	
	#region /* Send report information to the server */
	if (menu == "report_send_to_server")
	{
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath text */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
		
		
	}
	#endregion /* Send report information to the server END */
	
	#region /* Fill information about report before sending to server */
	
	#region /* Information for the player before asking player to give information */
	if (menu == "report_back")
	|| (menu == "report_next")
	{
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath text */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
		
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("This report will be sent to") + ": " + string(global.company_name), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 32, l10n_text("Not the user who posted the content"), global.default_text_size, c_black, c_white, 1);
		draw_menu_button(0, 0, l10n_text("Back"), "report_back", report_back_to_menu);
		draw_sprite_ext(spr_icons_back, 0, 16, 21, 1, 1, 0, c_white, 1);
		draw_menu_button(display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5 + 106, l10n_text("Next"), "report_next", "report_next");
		draw_sprite_ext(spr_icons_report, 0, display_get_gui_width() * 0.5 - 185 + 16, display_get_gui_height() * 0.5 + 106 + 21, 1, 1, 0, c_white, 1);
		
		if (key_a_pressed)
		&& (menu_delay == 0)
		{
			if (menu == "report_back")
			{
				menu = report_back_to_menu;
			}
			else
			if (menu == "report_next")
			{
				menu = "report_intrusion_of_privacy";
			}
			menu_delay = 3;
		}
		
		if (key_b_pressed)
		&& (menu_delay == 0)
		{
			menu = report_back_to_menu;
			menu_delay = 3;
		}
		
		if (key_up)
		&& (menu_delay == 0)
		|| (key_down)
		&& (menu_delay == 0)
		{
			if (menu == "report_back")
			{
				menu = "report_next";
			}
			else
			if (menu == "report_next")
			{
				menu = "report_back";
			}
			menu_delay = 3;
		}
	}
	#endregion /* Information for the player before asking player to give information END */
	
	#region /* Report Reason */
	if (menu == "report_reason_back")
	|| (menu == "report_intrusion_of_privacy")
	|| (menu == "report_violence_physical_harm")
	|| (menu == "report_abusive_harassing_bullying")
	|| (menu == "report_hateful_discriminatory")
	|| (menu == "report_advertising_spam")
	|| (menu == "report_sexually_explicit")
	|| (menu == "report_asking_for_likes")
	|| (menu == "report_uses_a_bug")
	|| (menu == "report_blatant_copying")
	|| (menu == "report_phony_world_record")
	|| (menu == "report_other_inappropriate_content")
	{
		var report_intrusion_of_privacy_y = 42 * 3;
		var report_violence_physical_harm_y = 42 * 4;
		var report_abusive_harassing_bullying = 42 * 5;
		var report_hateful_discriminatory_y = 42 * 6;
		var report_advertising_spam_y = 42 * 7;
		var report_sexually_explicit_y = 42 * 8;
		//var report_asking_for_likes_y = 42 * 8;
		var report_uses_a_bug_y = 42 * 9;
		var report_blatant_copying_y = 42 * 10;
		//var report_phony_world_record_y = 42 * 11;
		var report_other_inappropriate_content_y = 42 * 11;
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath text */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
		
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 64, l10n_text("Please select the reason for this report"), global.default_text_size, c_black, c_white, 1);
		
		draw_menu_button(0, 0, l10n_text("Back"), "report_reason_back", report_back_to_menu);
		draw_sprite_ext(spr_icons_back, 0, 16, 21, 1, 1, 0, c_white, 1);
		
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_intrusion_of_privacy_y, l10n_text("Intrusion of Privacy"), "report_intrusion_of_privacy", "report_intrusion_of_privacy");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_violence_physical_harm_y, l10n_text("Violence/Physical Harm"), "report_violence_physical_harm", "report_violence_physical_harm");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_abusive_harassing_bullying, l10n_text("Abusive/Harassing/Bullying"), "report_abusive_harassing_bullying", "report_abusive_harassing_bullying");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_hateful_discriminatory_y, l10n_text("Hateful/Discriminatory"), "report_hateful_discriminatory", "report_hateful_discriminatory");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_advertising_spam_y, l10n_text("Advertising/Spam"), "report_advertising_spam", "report_advertising_spam");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_sexually_explicit_y, l10n_text("Sexually Explicit"), "report_sexually_explicit", "report_sexually_explicit");
		//draw_menu_button(display_get_gui_width() * 0.5 - 185, report_asking_for_likes_y, l10n_text("Asking for Likes"), "report_asking_for_likes", "report_asking_for_likes");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_uses_a_bug_y, l10n_text("Uses a Bug"), "report_uses_a_bug", "report_uses_a_bug");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_blatant_copying_y, l10n_text("Blatant Copying"), "report_blatant_copying", "report_blatant_copying");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_other_inappropriate_content_y, l10n_text("Other Inappropriate Content"), "report_other_inappropriate_content", "report_other_inappropriate_content");
		
		#region /* Report Reason Accept */
		if (key_a_pressed)
		&& (menu_delay == 0)
		{
			if (menu == "report_reason_back")
			{
				menu = report_back_to_menu;
			}
			else
			if (menu == "report_intrusion_of_privacy")
			{
				global.report_reason = "report_intrusion_of_privacy";
				report_reason_text = l10n_text("Intrusion of Privacy");
				menu = "report_comment_ok";
			}
			else
			if (menu == "report_violence_physical_harm")
			{
				global.report_reason = "report_violence_physical_harm";
				report_reason_text = l10n_text("Violence/Physical Harm");
				menu = "report_comment_ok";
			}
			else
			if (menu == "report_abusive_harassing_bullying")
			{
				global.report_reason = "report_abusive_harassing_bullying";
				report_reason_text = l10n_text("Abusive/Harassing/Bullying");
				menu = "report_comment_ok";
			}
			else
			if (menu == "report_hateful_discriminatory")
			{
				global.report_reason = "report_hateful_discriminatory";
				report_reason_text = l10n_text("Hateful/Discriminatory");
				menu = "report_comment_ok";
			}
			else
			if (menu == "report_advertising_spam")
			{
				global.report_reason = "report_advertising_spam";
				report_reason_text = l10n_text("Advertising/Spam");
				menu = "report_comment_ok";
			}
			else
			if (menu == "report_sexually_explicit")
			{
				global.report_reason = "report_sexually_explicit";
				report_reason_text = l10n_text("Sexually Explicit");
				menu = "report_comment_ok";
			}
			else
			if (menu == "report_asking_for_likes")
			{
				global.report_reason = "report_asking_for_likes";
				report_reason_text = l10n_text("Asking for Likes");
				menu = "report_comment_ok";
			}
			else
			if (menu == "report_uses_a_bug")
			{
				global.report_reason = "report_uses_a_bug";
				report_reason_text = l10n_text("Uses a Bug");
				menu = "report_comment_ok";
			}
			else
			if (menu == "report_blatant_copying")
			{
				global.report_reason = "report_blatant_copying";
				report_reason_text = l10n_text("Blatant Copying");
				menu = "report_comment_ok";
			}
			else
			if (menu == "report_phony_world_record")
			{
				global.report_reason = "report_phony_world_record";
				report_reason_text = l10n_text("Phony World Record");
				menu = "report_comment_ok";
			}
			else
			if (menu == "report_other_inappropriate_content")
			{
				global.report_reason = "report_other_inappropriate_content";
				report_reason_text = l10n_text("Other Inappropriate Content");
				menu = "report_comment_ok";
			}
			menu_delay = 3;
		}
		#endregion /* Report Reason Accept END */
		
		if (key_b_pressed)
		&& (menu_delay == 0)
		{
			menu = report_back_to_menu;
			menu_delay = 3;
		}
		
		if (key_up)
		&& (menu_delay == 0)
		{
			if (menu == "report_reason_back")
			{
				menu = "report_other_inappropriate_content";
			}
			else
			if (menu == "report_intrusion_of_privacy")
			{
				menu = "report_reason_back";
			}
			else
			if (menu == "report_violence_physical_harm")
			{
				menu = "report_intrusion_of_privacy";
			}
			else
			if (menu == "report_abusive_harassing_bullying")
			{
				menu = "report_violence_physical_harm";
			}
			else
			if (menu == "report_hateful_discriminatory")
			{
				menu = "report_abusive_harassing_bullying";
			}
			else
			if (menu == "report_advertising_spam")
			{
				menu = "report_hateful_discriminatory";
			}
			else
			if (menu == "report_sexually_explicit")
			{
				menu = "report_advertising_spam";
			}
			else
			if (menu == "report_asking_for_likes")
			{
				menu = "report_sexually_explicit";
			}
			else
			if (menu == "report_uses_a_bug")
			{
				//menu = "report_asking_for_likes";
				menu = "report_sexually_explicit";
			}
			else
			if (menu == "report_blatant_copying")
			{
				menu = "report_uses_a_bug";
			}
			else
			if (menu == "report_other_inappropriate_content")
			{
				menu = "report_blatant_copying";
			}
			menu_delay = 3;
		}
		if (key_down)
		&& (menu_delay == 0)
		{
			if (menu == "report_reason_back")
			{
				menu = "report_intrusion_of_privacy";
			}
			else
			if (menu == "report_intrusion_of_privacy")
			{
				menu = "report_violence_physical_harm";
			}
			else
			if (menu == "report_violence_physical_harm")
			{
				menu = "report_abusive_harassing_bullying";
			}
			else
			if (menu == "report_abusive_harassing_bullying")
			{
				menu = "report_hateful_discriminatory";
			}
			else
			if (menu == "report_hateful_discriminatory")
			{
				menu = "report_advertising_spam";
			}
			else
			if (menu == "report_advertising_spam")
			{
				menu = "report_sexually_explicit";
			}
			else
			if (menu == "report_sexually_explicit")
			{
				//menu = "report_asking_for_likes";
				menu = "report_uses_a_bug";
			}
			else
			if (menu == "report_asking_for_likes")
			{
				menu = "report_uses_a_bug";
			}
			else
			if (menu == "report_uses_a_bug")
			{
				menu = "report_blatant_copying";
			}
			else
			if (menu == "report_blatant_copying")
			{
				menu = "report_other_inappropriate_content";
			}
			else
			if (menu == "report_other_inappropriate_content")
			{
				menu = "report_reason_back";
			}
			global.report_comment = "";
			keyboard_string = "";
			menu_delay = 3;
		}
	}
	#endregion /* Report Reason END */
	
	#region /* Report Comment */
	if (menu == "report_comment_ok")
	|| (menu == "report_comment_back")
	{
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		var report_comment_x = display_get_gui_width() * 0.5;
		var report_comment_y = display_get_gui_height() * 0.5;
		
		global.report_comment = scr_draw_name_input_screen(global.report_comment, 100, c_white, 0.9, false, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "report_comment_ok", "report_comment_back");
		
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 96, l10n_text("Please provide a reason for this report"), global.default_text_size, c_black, c_white, 1);
		
		#region /* Pressing Report Comment OK */
		if (key_a_pressed)
		&& (menu = "report_comment_ok")
		&& (global.report_comment != "")
		|| (point_in_rectangle(mouse_get_x, mouse_get_y, report_comment_x - 185, report_comment_y + 22 + 52, report_comment_x - 185 + 370, report_comment_y + 22 + 52 + 42))
		&& (global.report_comment != "")
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		{
			if (!keyboard_check_pressed(ord("Z")))
			&& (!keyboard_check_pressed(ord("X")))
			&& (!keyboard_check_pressed(vk_backspace))
			&& (!keyboard_check_pressed(vk_space))
			&& (menu_delay == 0)
			{
				menu_delay = 3;
				input_key = false;
				if (os_is_network_connected())
				{
					menu = "report_send_confirm"; /* Go to send report screen */
				}
				else
				{
					if (content_type == "level")
					{
						menu = "no_internet_level";
					}
					else
					if (content_type == "character")
					{
						menu = "no_internet_character";
					}
				}
			}
		}
		#endregion /* Pressing Report Comment OK END */
		
		else
		
		#region /* Pressing Report Comment Cancel */
		if (key_a_pressed)
		&& (menu = "report_comment_back")
		|| (key_b_pressed)
		|| (point_in_rectangle(mouse_get_x, mouse_get_y, report_comment_x - 185, report_comment_y + 22 + 52 + 42, report_comment_x - 185 + 370, report_comment_y + 22 + 52 + 42 + 42))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		{
			if (!keyboard_check_pressed(ord("Z")))
			&& (!keyboard_check_pressed(ord("X")))
			&& (!keyboard_check_pressed(vk_backspace))
			&& (!keyboard_check_pressed(vk_space))
			&& (menu_delay == 0)
			{
				global.report_comment = "";
				keyboard_string = "";
				menu_delay = 3;
				input_key = false;
				menu = global.report_reason;
			}
		}
		#endregion /* Pressing Report Comment Cancel END */
		
	}
	#endregion /* Report Comment END */
	
	#region /* Confirm report before sending it to server */
	if (menu == "report_send_back")
	|| (menu == "report_send_confirm")
	{
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath text */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
		
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 96, l10n_text("Send this report?"), global.default_text_size, c_black, c_ltgray, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, string(report_reason_text), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, string(global.report_comment), global.default_text_size, c_black, c_white, 1);
		
		draw_menu_button(0, 0, l10n_text("Back"), "report_send_back", global.report_reason);
		draw_sprite_ext(spr_icons_back, 0, 16, 21, 1, 1, 0, c_white, 1);
		
		draw_menu_button(display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5 + 96, l10n_text("Report"), "report_send_confirm", "report_send_to_server");
		draw_sprite_ext(spr_icons_report, 0, display_get_gui_width() * 0.5 - 185 + 16, display_get_gui_height() * 0.5 + 96 + 21, 1, 1, 0, c_white, 1);
		
		if (key_a_pressed)
		&& (menu_delay == 0)
		{
			if (menu == "report_send_back")
			{
				menu = global.report_reason;
			}
			else
			if (menu == "report_send_confirm")
			{
				menu = "report_send_to_server";
			}
			menu_delay = 3;
		}
		
		if (key_b_pressed)
		&& (menu_delay == 0)
		{
			menu = global.report_reason;
			menu_delay = 3;
		}
		
		if (key_up)
		&& (menu_delay == 0)
		|| (key_down)
		&& (menu_delay == 0)
		{
			if (menu == "report_send_back")
			{
				menu = "report_send_confirm";
			}
			else
			if (menu == "report_send_confirm")
			{
				menu = "report_send_back";
			}
			menu_delay = 3;
		}
	}
	#endregion /* Confirm report before sending it to server END */
	
	#endregion /* Fill information about report before sending to server END */
	
}