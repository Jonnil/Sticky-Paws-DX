function scr_draw_report()
{
	var report_back_y = 0;
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	if (menu == "report_send_to_server")
	|| (menu == "report_complete_delete")
	|| (menu == "report_complete_back_to_online_list")
	|| (menu == "report_complete_back_to_select")
	|| (menu == "report_back")
	|| (menu == "report_next")
	|| (menu == "report_reason_back")
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
	|| (menu == "report_send_back")
	|| (menu == "report_send_confirm")
	{
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath text */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
		
	}
	
	#region /* Send report information to the server */
	if (menu == "report_send_to_server")
	{
		
		#region /* Actually upload the report to the server */
		
		/* Create DS Map to hold the HTTP Header info */
		map = ds_map_create();
		
		/* Add to the header DS Map */
		ds_map_add(map, "Host", global.base_url);
		var boundary = "----GMBoundary";
		ds_map_add(map, "Content-Type", "multipart/form-data; boundary=" + boundary);
		ds_map_add(map, "User-Agent", "gmuploader");
		ds_map_add(map, "X-API-Key", global.api_key);
		
		/* If there is a report message, save that in data_send */
		if (global.report_message != undefined && global.report_message != "") 
		{
			data_send = string(global.report_message);
		}
		else
		{
			data_send = "";
		}
		
		/* Post the data to the upload script */
		var post_data = "--" + boundary + "\r\n";
		post_data += "Content-Disposition: form-data; name=\"report_reason\"\r\n\r\n";
		post_data += string(global.report_reason) + "\r\n";
		post_data += "--" + boundary + "\r\n";
		post_data += "Content-Disposition: form-data; name=\"report_message\"\r\n\r\n";
		post_data += data_send + "\r\n";
		post_data += "--" + boundary + "--";
		
		/* Add the Content-Length header to the map */
		ds_map_add(map, "Content-Length", string(string_length(post_data)));
		global.http_request_id = http_request("https://" + global.base_url + "/report/" + string(content_type) + "s/" + string(search_id), "POST", map, post_data);
		
		/* Cleans up! */
		ds_map_destroy(map);
		#endregion /* Actually upload the level to the server END */
		
		if (os_is_network_connected())
		{
			search_for_id_still = false;
			menu = "report_complete_delete"; /* When done sending report to server, go to the final menu */
		}
		else
		{
			if (content_type == "level")
			{
				menu = "no_internet_level"
			}
			else
			{
				menu = "no_internet_character"
			}
		}
	}
	#endregion /* Send report information to the server END */
	
	#region /* Report Complete */
	if (menu == "report_complete_delete")
	|| (menu == "report_complete_back_to_online_list")
	{
		var report_sent_message_y = display_get_gui_height() * 0.5;
		
		scr_draw_text_outlined(display_get_gui_width() * 0.5, report_sent_message_y - 64, l10n_text("Report has been sent"), global.default_text_size * 2, c_black, c_white, 1);
		if (content_type == "level")
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, report_sent_message_y, l10n_text("You can delete the reported level if you want to"), global.default_text_size, c_black, c_white, 1);
			var searched_file_downloaded_delete_y = report_sent_message_y + 50 + (42 * 2);
			var back_to_list_y = report_sent_message_y + 50 + (42 * 3);
			var back_to_list_text = l10n_text("Back to online level list");
			var searched_file_downloaded_back_y = report_sent_message_y + 50 + (42 * 4);
			var searched_file_downloaded_back_text = l10n_text("Back to custom level select");
		}
		else
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, report_sent_message_y, l10n_text("You can delete the reported character if you want to"), global.default_text_size, c_black, c_white, 1);
			var searched_file_downloaded_delete_y = report_sent_message_y + 50 + (42 * 2);
			var back_to_list_y = report_sent_message_y + 50 + (42 * 3);
			var back_to_list_text = l10n_text("Back to online character list");
			var searched_file_downloaded_back_y = report_sent_message_y + 50 + (42 * 4);
			var searched_file_downloaded_back_text = l10n_text("Back to character select");
		}
		draw_menu_button(display_get_gui_width() * 0.5 - 185, searched_file_downloaded_delete_y, l10n_text("Delete"), "report_complete_delete", "report_complete_delete", c_red);
		draw_sprite_ext(spr_icons_delete, 0, display_get_gui_width() * 0.5 - 185 + 16, searched_file_downloaded_delete_y + 20, 1, 1, 0, c_white, 1);
		draw_menu_button(display_get_gui_width() * 0.5 - 185, back_to_list_y, back_to_list_text, "report_complete_back_to_online_list", "report_complete_back_to_online_list");
		draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 16, back_to_list_y + 20, 1, 1, 0, c_white, 1);
		
		#region /* Click Delete */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, searched_file_downloaded_delete_y, display_get_gui_width() * 0.5 + 185, searched_file_downloaded_delete_y + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "report_complete_delete")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (content_type == "level")
			&& (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
			{
				directory_destroy(working_directory + "custom_levels/" + string(global.level_name));
				ini_open(working_directory + "save_files/custom_level_save.ini");
				ini_section_delete(string(global.level_name));
				ini_close();
				global.select_level_index = 0;
				global.level_name = "";
			}
			else
			if (content_type == "character")
			&& (file_exists(working_directory + "custom_characters/" + string(downloaded_character_name) + "/data/character_config.ini"))
			{
				directory_destroy(working_directory + "custom_characters/" + string(downloaded_character_name));
				global.character_index[0] = 0;
			}
			menu = "searched_file_downloaded_deleted_back_to_list";
			menu_delay = 3;
		}
		#endregion /* Click Delete END */
		
		#region /* Click back to online level list */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, back_to_list_y, display_get_gui_width() * 0.5 + 185, back_to_list_y + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "report_complete_back_to_online_list")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			/* Don't set the "select level index" or "level name" here, because we want it saved still */
			menu = "online_download_list_load"; /* Go back to online level list */
			menu_delay = 3;
		}
		#endregion /* Click back to online level list END */
		
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "report_complete_delete")
			{
				menu = "report_complete_back_to_online_list";
			}
			else
			if (menu == "report_complete_back_to_online_list")
			{
				menu = "report_complete_delete";
			}
		}
		else
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "report_complete_delete")
			{
				menu = "report_complete_back_to_online_list";
			}
			else
			if (menu == "report_complete_back_to_online_list")
			{
				menu = "report_complete_delete";
			}
		}
		
	}
	#endregion /* Report Complete END */
	
	#region /* Fill information about report before sending to server */
	
	#region /* Information for the player before asking player to give information */
	if (menu == "report_back")
	|| (menu == "report_next")
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("This report will be sent to") + ": " + string(global.company_name), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 32, l10n_text("Not the user who posted the content"), global.default_text_size, c_black, c_white, 1);
		draw_menu_button(0, report_back_y, l10n_text("Back"), "report_back", report_back_to_menu);
		draw_sprite_ext(spr_icons_back, 0, 16, report_back_y + 21, 1, 1, 0, c_white, 1);
		var report_next_y = display_get_gui_height() * 0.5 + 106;
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_next_y, l10n_text("Next"), "report_next", "report_next");
		draw_sprite_ext(spr_icons_report, 0, display_get_gui_width() * 0.5 - 185 + 16, report_next_y + 21, 1, 1, 0, c_white, 1);
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, report_back_y, display_get_gui_width() * 0.5 - 185 + 370, report_back_y + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "report_back")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = report_back_to_menu;
			menu_delay = 3;
		}
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, report_next_y, display_get_gui_width() * 0.5 - 185 + 370, report_next_y + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "report_next")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = "report_intrusion_of_privacy";
			menu_delay = 3;
		}
		
		if (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = report_back_to_menu;
			menu_delay = 3;
		}
		
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
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
		global.report_message = "";
		keyboard_string = "";
		
		var report_intrusion_of_privacy_y = 42 * 3;
		var report_violence_physical_harm_y = 42 * 4;
		var report_abusive_harassing_bullying = 42 * 5;
		var report_hateful_discriminatory_y = 42 * 6;
		var report_advertising_spam_y = 42 * 7;
		var report_sexually_explicit_y = 42 * 8;
		/* var report_asking_for_likes_y = 42 * 8; */
		var report_uses_a_bug_y = 42 * 9;
		var report_blatant_copying_y = 42 * 10;
		/* var report_phony_world_record_y = 42 * 11; */
		var report_other_inappropriate_content_y = 42 * 11;
		
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 64, l10n_text("Please select the reason for this report"), global.default_text_size, c_black, c_white, 1);
		
		draw_menu_button(0, report_back_y, l10n_text("Back"), "report_reason_back", report_back_to_menu);
		draw_sprite_ext(spr_icons_back, 0, 16, report_back_y + 21, 1, 1, 0, c_white, 1);
		
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_intrusion_of_privacy_y, l10n_text("Intrusion of Privacy"), "report_intrusion_of_privacy", "report_message_ok");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_violence_physical_harm_y, l10n_text("Violence/Physical Harm"), "report_violence_physical_harm", "report_message_ok");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_abusive_harassing_bullying, l10n_text("Abusive/Harassing/Bullying"), "report_abusive_harassing_bullying", "report_message_ok");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_hateful_discriminatory_y, l10n_text("Hateful/Discriminatory"), "report_hateful_discriminatory", "report_message_ok");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_advertising_spam_y, l10n_text("Advertising/Spam"), "report_advertising_spam", "report_message_ok");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_sexually_explicit_y, l10n_text("Sexually Explicit"), "report_sexually_explicit", "report_message_ok");
		/* draw_menu_button(display_get_gui_width() * 0.5 - 185, report_asking_for_likes_y, l10n_text("Asking for Likes"), "report_asking_for_likes", "report_message_ok"); */
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_uses_a_bug_y, l10n_text("Uses a Bug without Bug tag"), "report_uses_a_bug", "report_message_ok");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_blatant_copying_y, l10n_text("Blatant Copying"), "report_blatant_copying", "report_message_ok");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_other_inappropriate_content_y, l10n_text("Other Inappropriate Content"), "report_other_inappropriate_content", "report_message_ok");
		
		#region /* What report reason to use when hovering over different buttons */
		if (menu == "report_intrusion_of_privacy")
		{
			global.report_reason = "report_intrusion_of_privacy";
			report_reason_text = l10n_text("Intrusion of Privacy");
		}
		else
		if (menu == "report_violence_physical_harm")
		{
			global.report_reason = "report_violence_physical_harm";
			report_reason_text = l10n_text("Violence/Physical Harm");
		}
		else
		if (menu == "report_abusive_harassing_bullying")
		{
			global.report_reason = "report_abusive_harassing_bullying";
			report_reason_text = l10n_text("Abusive/Harassing/Bullying");
		}
		else
		if (menu == "report_hateful_discriminatory")
		{
			global.report_reason = "report_hateful_discriminatory";
			report_reason_text = l10n_text("Hateful/Discriminatory");
		}
		else
		if (menu == "report_advertising_spam")
		{
			global.report_reason = "report_advertising_spam";
			report_reason_text = l10n_text("Advertising/Spam");
		}
		else
		if (menu == "report_sexually_explicit")
		{
			global.report_reason = "report_sexually_explicit";
			report_reason_text = l10n_text("Sexually Explicit");
		}
		else
		if (menu == "report_asking_for_likes")
		{
			global.report_reason = "report_asking_for_likes";
			report_reason_text = l10n_text("Asking for Likes");
		}
		else
		if (menu == "report_uses_a_bug")
		{
			global.report_reason = "report_uses_a_bug";
			report_reason_text = l10n_text("Uses a Bug");
		}
		else
		if (menu == "report_blatant_copying")
		{
			global.report_reason = "report_blatant_copying";
			report_reason_text = l10n_text("Blatant Copying");
		}
		else
		if (menu == "report_phony_world_record")
		{
			global.report_reason = "report_phony_world_record";
			report_reason_text = l10n_text("Phony World Record");
		}
		else
		if (menu == "report_other_inappropriate_content")
		{
			global.report_reason = "report_other_inappropriate_content";
			report_reason_text = l10n_text("Other Inappropriate Content");
		}
		#endregion /* What report reason to use when hovering over different buttons END */
		
		#region /* Report Reason Accept */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, report_back_y, display_get_gui_width() * 0.5 - 185 + 370, report_back_y + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "report_reason_back")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = report_back_to_menu;
		}
		else
		if (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "report_intrusion_of_privacy")
			{
				global.report_reason = "report_intrusion_of_privacy";
				report_reason_text = l10n_text("Intrusion of Privacy");
				menu = "report_message_ok";
			}
			else
			if (menu == "report_violence_physical_harm")
			{
				global.report_reason = "report_violence_physical_harm";
				report_reason_text = l10n_text("Violence/Physical Harm");
				menu = "report_message_ok";
			}
			else
			if (menu == "report_abusive_harassing_bullying")
			{
				global.report_reason = "report_abusive_harassing_bullying";
				report_reason_text = l10n_text("Abusive/Harassing/Bullying");
				menu = "report_message_ok";
			}
			else
			if (menu == "report_hateful_discriminatory")
			{
				global.report_reason = "report_hateful_discriminatory";
				report_reason_text = l10n_text("Hateful/Discriminatory");
				menu = "report_message_ok";
			}
			else
			if (menu == "report_advertising_spam")
			{
				global.report_reason = "report_advertising_spam";
				report_reason_text = l10n_text("Advertising/Spam");
				menu = "report_message_ok";
			}
			else
			if (menu == "report_sexually_explicit")
			{
				global.report_reason = "report_sexually_explicit";
				report_reason_text = l10n_text("Sexually Explicit");
				menu = "report_message_ok";
			}
			else
			if (menu == "report_asking_for_likes")
			{
				global.report_reason = "report_asking_for_likes";
				report_reason_text = l10n_text("Asking for Likes");
				menu = "report_message_ok";
			}
			else
			if (menu == "report_uses_a_bug")
			{
				global.report_reason = "report_uses_a_bug";
				report_reason_text = l10n_text("Uses a Bug without Bug tag");
				menu = "report_message_ok";
			}
			else
			if (menu == "report_blatant_copying")
			{
				global.report_reason = "report_blatant_copying";
				report_reason_text = l10n_text("Blatant Copying");
				menu = "report_message_ok";
			}
			else
			if (menu == "report_phony_world_record")
			{
				global.report_reason = "report_phony_world_record";
				report_reason_text = l10n_text("Phony World Record");
				menu = "report_message_ok";
			}
			else
			if (menu == "report_other_inappropriate_content")
			{
				global.report_reason = "report_other_inappropriate_content";
				report_reason_text = l10n_text("Other Inappropriate Content");
				menu = "report_message_ok";
			}
			menu_delay = 3;
		}
		#endregion /* Report Reason Accept END */
		
		if (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = report_back_to_menu;
		}
		
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
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
				/* menu = "report_asking_for_likes"; */
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
		}
		else
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
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
				/* menu = "report_asking_for_likes"; */
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
			global.report_message = "";
			keyboard_string = "";
		}
	}
	#endregion /* Report Reason END */
	
	#region /* Report Comment */
	if (menu == "report_message_ok")
	|| (menu == "report_message_back")
	{
		var report_message_x = display_get_gui_width() * 0.5;
		var report_message_y = display_get_gui_height() * 0.5;
		
		global.report_message = scr_draw_name_input_screen(global.report_message, 100, c_white, 0.9, false, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "report_message_ok", "report_message_back");
		
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 96, l10n_text("Please provide a reason for this report"), global.default_text_size, c_black, c_white, 1);
		
		#region /* Pressing Report Comment OK */
		if (key_a_pressed)
		&& (menu = "report_message_ok")
		&& (global.report_message != "")
		|| (point_in_rectangle(mouse_get_x, mouse_get_y, report_message_x - 185, report_message_y + 52, report_message_x - 185 + 370, report_message_y + 52 + 42))
		&& (global.report_message != "")
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		{
			if (!keyboard_check_pressed(ord("Z")))
			&& (!keyboard_check_pressed(ord("X")))
			&& (!keyboard_check_pressed(vk_backspace))
			&& (!keyboard_check_pressed(vk_space))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
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
		&& (menu = "report_message_back")
		|| (key_b_pressed)
		|| (point_in_rectangle(mouse_get_x, mouse_get_y, report_message_x - 185, report_message_y + 52 + 42, report_message_x - 185 + 370, report_message_y + 52 + 42 + 42))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		{
			if (!keyboard_check_pressed(ord("Z")))
			&& (!keyboard_check_pressed(ord("X")))
			&& (!keyboard_check_pressed(vk_backspace))
			&& (!keyboard_check_pressed(vk_space))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				global.report_message = "";
				keyboard_string = "";
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
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 96, l10n_text("Send this report?"), global.default_text_size, c_black, c_ltgray, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, string(report_reason_text), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, string(global.report_message), global.default_text_size, c_black, c_white, 1);
		
		draw_menu_button(0, report_back_y, l10n_text("Back"), "report_send_back", global.report_reason);
		draw_sprite_ext(spr_icons_back, 0, 16, report_back_y + 21, 1, 1, 0, c_white, 1);
		
		var report_send_confirm_y = display_get_gui_height() * 0.5 + 96;
		draw_menu_button(display_get_gui_width() * 0.5 - 185, report_send_confirm_y, l10n_text("Report"), "report_send_confirm", "report_send_to_server");
		draw_sprite_ext(spr_icons_report, 0, display_get_gui_width() * 0.5 - 185 + 16, report_send_confirm_y + 21, 1, 1, 0, c_white, 1);
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, report_back_y, display_get_gui_width() * 0.5 - 185 + 370, report_back_y + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "report_send_back")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = global.report_reason;
		}
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, report_send_confirm_y, display_get_gui_width() * 0.5 - 185 + 370, report_send_confirm_y + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "report_send_confirm")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = "report_send_to_server";
		}
		
		if (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = global.report_reason;
		}
		
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "report_send_back")
			{
				menu = "report_send_confirm";
			}
			else
			if (menu == "report_send_confirm")
			{
				menu = "report_send_back";
			}
		}
	}
	#endregion /* Confirm report before sending it to server END */
	
	#endregion /* Fill information about report before sending to server END */
	
}