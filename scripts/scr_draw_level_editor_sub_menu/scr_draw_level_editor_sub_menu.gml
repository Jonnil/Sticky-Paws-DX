function scr_draw_level_editor_sub_menu(xx = 394 * (global.select_level_index - column * row) + 100 - 3 + thumbnail_x_offset, yy)
{
	var get_window_height = display_get_gui_height();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var daily_build_enabled = true;
	
	var back_y = 226 * (column - scroll) + 569 - 3;
	var daily_build_y = 226 * (column - scroll) + 569 - 3;
	
	#region /* Draw sub menu (code must be here to be above everything else) */
	if (open_sub_menu)
	&& (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	{
		
		#region /* Navigate Sub Menu */
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!can_input_level_name)
		{
			menu_delay = 3;
			if (menu == "level_editor_play")
			{
				menu = "level_editor_selected_back";
			}
			else
			if (menu == "level_editor_make")
			{
				menu = "level_editor_play";
			}
			else
			if (menu == "level_editor_upload")
			{
				menu = "level_editor_make";
			}
			else
			if (menu == "level_editor_edit_name")
			{
				if (global.free_communication_available)
				{
					menu = "level_editor_upload";
				}
				else
				{
					menu = "level_editor_make";
				}
			}
			else
			if (menu == "level_editor_enter_description")
			{
				menu = "level_editor_edit_name";
			}
			else
			if (menu == "level_editor_selected_back")
			{
				if (show_delete_button)
				{
					menu = "level_editor_delete";
				}
				else
				{
					menu = "level_editor_make";
				}
			}
			else
			if (menu == "level_editor_create_from_scratch")
			{
				menu = "level_editor_create_from_back";
			}
			else
			if (menu == "level_editor_create_from_template")
			{
				menu = "level_editor_create_from_scratch";
			}
			else
			if (menu == "level_editor_create_daily_build")
			{
				menu = "level_editor_create_from_template";
			}
			else
			if (menu == "level_editor_create_from_back")
			{
				if (daily_build_enabled) {
					menu = "level_editor_create_daily_build";
				} else {
					menu = "level_editor_create_from_template";
				}
			}
			else
			if (menu == "level_editor_delete")
			{
				menu = "level_editor_enter_description";
			}
			else
			if (menu == "level_editor_delete_no")
			{
				menu = "level_editor_delete_yes";
			}
			else
			if (menu == "level_editor_delete_yes")
			{
				menu = "level_editor_delete_no";
			}
		}
		else
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!can_input_level_name)
		{
			menu_delay = 3;
			if (menu == "level_editor_play")
			{
				menu = "level_editor_make";
			}
			else
			if (menu == "level_editor_make")
			{
				if (global.free_communication_available)
				{
					menu = "level_editor_upload";
				}
				else
				{
					menu = "level_editor_edit_name";
				}
			}
			else
			if (menu == "level_editor_upload")
			{
				menu = "level_editor_edit_name";
			}
			else
			if (menu == "level_editor_edit_name")
			{
				menu = "level_editor_enter_description";
			}
			else
			if (menu == "level_editor_enter_description")
			{
				if (show_delete_button)
				{
					menu = "level_editor_delete";
				}
				else
				{
					menu = "level_editor_selected_back";
				}
			}
			else
			if (menu == "level_editor_selected_back")
			{
				menu = "level_editor_play";
			}
			else
			if (menu == "level_editor_create_from_scratch")
			{
				menu = "level_editor_create_from_template";
			}
			else
			if (menu == "level_editor_create_from_template")
			{
				if (daily_build_enabled) {
					menu = "level_editor_create_daily_build";
				} else {
					menu = "level_editor_create_from_back";
				}
			}
			else
			if (menu == "level_editor_create_daily_build")
			{
				menu = "level_editor_create_from_back";
			}
			else
			if (menu == "level_editor_create_from_back")
			{
				menu = "level_editor_create_from_scratch";
			}
			else
			if (menu == "level_editor_delete")
			{
				menu = "level_editor_selected_back";
			}
			else
			if (menu == "level_editor_delete_no")
			{
				menu = "level_editor_delete_yes";
			}
			else
			if (menu == "level_editor_delete_yes")
			{
				menu = "level_editor_delete_no";
			}
		}
		#endregion /* Navigate Sub Menu END */
		
		#region /* Button Y Positions */
		if (show_delete_button)
		{
			var play_y = 0;
			var make_y = 42;
			if (global.free_communication_available)
			{
				var upload_y = 42 * 2;
				var edit_name_y = 42 * 3;
				var edit_description_y = 42 * 4;
				var delete_y = 42 * 5;
				var back_y = 42 * 6;
			}
			else
			{
				var upload_y = -99999;
				var edit_name_y = 42 * 2;
				var edit_description_y = 42 * 3;
				var delete_y = 42 * 4;
				var back_y = 42 * 5;
			}
		}
		else
		{
			var play_y = 0;
			var make_y = 42;
			if (global.free_communication_available)
			{
				var upload_y = 42 * 2;
				var edit_name_y = 42 * 3;
				var edit_description_y = 42 * 4;
				var delete_y = -99999;
				var back_y = 42 * 5;
			}
			else
			{
				var upload_y = -99999;
				var edit_name_y = 42 * 2;
				var edit_description_y = 42 * 3;
				var delete_y = -99999;
				var back_y = 42 * 4;
			}
		}
		#endregion /* Button Y Positions END */
		
		#region /* Show Sub Menu Buttons */
		if (!can_input_level_name)
		&& (menu != "load_official_level_template")
		{
			if (menu == "level_editor_delete_no") /* Delete level menu */
			|| (menu == "level_editor_delete_yes")
			{
				scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
				draw_roundrect_color_ext(xx, 226 * (column - scroll) + 455 - 3, xx + 384, 226 * (column - scroll) + 408 + 216 + 3, 50, 50, c_red, c_red, false);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(xx + 200, 226 * (column - scroll) + 485 - 3, l10n_text("Delete Level") + "?", global.default_text_size * 1.2, c_white, c_black, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 522 - 3, l10n_text("No"), "level_editor_delete_no", "level_editor_delete"); /* + 47 on y */
				draw_sprite_ext(spr_icon_back, 0, xx + 8 + 20, 226 * (column - scroll) + 522 - 3 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 569 - 3, l10n_text("Yes"), "level_editor_delete_yes", "level_editor_delete_yes", c_red);
				draw_sprite_ext(spr_icon_delete, 0, xx + 8 + 16, 226 * (column - scroll) + 569 - 3 + 21, 1, 1, 0, c_white, 1);
			}
			else
			if (global.select_level_index == 0) /* Create from Scratch and Create from Template menu */
			{
				var back_y = 226 * (column - scroll) + 569 - 3;
				var daily_build_y = 226 * (column - scroll) + 569 - 3;
				if (daily_build_enabled) {
					back_y += 47;
				}
				
				scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
				draw_roundrect_color_ext(xx - 3, 226 * (column - scroll) + 455 - 3 + 10 - 3, xx + 384 + 3, back_y + 47 + 3, 50, 50, c_black, c_black, false);
				draw_roundrect_color_ext(xx, 226 * (column - scroll) + 455 - 3 + 10, xx + 384, back_y + 47, 50, 50, c_white, c_white, false);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 - 3, l10n_text("Create from Scratch"), "level_editor_create_from_scratch", "level_editor_create_from_scratch");
				draw_menu_button(xx + 8, 226 * (column - scroll) + 522 - 3, l10n_text("Create from Template"), "level_editor_create_from_template", "level_editor_create_from_template"); /* + 47 on y */
				if (daily_build_enabled) {
					draw_menu_button(xx + 8, daily_build_y, l10n_text("Create Daily Build"), "level_editor_create_daily_build", "level_editor_create_daily_build"); /* + 47 on y */
					draw_sprite_ext(spr_icon_daily_build, 0, xx + 8 + 20, daily_build_y + 21, 1, 1, 0, c_white, 1);
				}
				draw_menu_button(xx + 8, back_y, l10n_text("Back"), "level_editor_create_from_back", "level_editor_create_from_back");
				draw_sprite_ext(spr_icon_back, 0, xx + 8 + 20, back_y + 21, 1, 1, 0, c_white, 1);
			}
			else /* Regular sub menu */
			{
				show_level_editor_corner_menu = true;
				if (get_window_height <= 720)
				{
					scroll_to = floor(global.select_level_index / row) + 0.8; /* Scroll the view to fit all the buttons */
				}
				else
				{
					scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
				}
				draw_roundrect_color_ext(xx - 3, 226 * (column - scroll) + 455 - 3 + 10 - 3, xx + 384 + 3, 226 * (column - scroll) + 475 + back_y + 47 + 3 + 3, 50, 50, c_black, c_black, false);
				draw_roundrect_color_ext(xx, 226 * (column - scroll) + 455 - 3 + 10, xx + 384, 226 * (column - scroll) + 475 + back_y + 47 + 3, 50, 50, c_white, c_white, false);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (play_y) - 3, l10n_text("Play"), "level_editor_play", "");
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (make_y) - 3, l10n_text("Make"), "level_editor_make", "");
				if (global.free_communication_available)
				{
					draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (upload_y) - 3, l10n_text("Upload"), "level_editor_upload", "");
					draw_sprite_ext(spr_icon_upload, 0, xx + 8 + 16, 226 * (column - scroll) + 475 + (upload_y) - 3 + 21, 1, 1, 0, c_white, 1);
				}
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (edit_name_y) - 3, l10n_text("Edit Name"), "level_editor_edit_name", "");
				draw_sprite_ext(spr_icon_pen, 0, xx + 8 + 20, 226 * (column - scroll) + 475 + (edit_name_y) - 3 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (edit_description_y) - 3, l10n_text("Edit Description"), "level_editor_enter_description", "");
				draw_sprite_ext(spr_icon_pen, 0, xx + 8 + 20, 226 * (column - scroll) + 475 + (edit_description_y) - 3 + 21, 1, 1, 0, c_white, 1);
				if (show_delete_button)
				{
					draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (delete_y) - 3, l10n_text("Delete"), "level_editor_delete", "level_editor_delete_no", c_red);
					draw_sprite_ext(spr_icon_delete, 0, xx + 8 + 16, 226 * (column - scroll) + 475 + (delete_y) - 3 + 21, 1, 1, 0, c_white, 1);
				}
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (back_y) - 3, l10n_text("Back"), "level_editor_selected_back", "");
				draw_sprite_ext(spr_icon_back, 0, xx + 8 + 20, 226 * (column - scroll) + 475 + (back_y) - 3 + 21, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Show Sub Menu Buttons END */
		
		#region /* Pressing the Create from Scratch button */
		if (menu == "level_editor_create_from_scratch")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			show_level_editor_corner_menu = true;
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 - 3, xx + 8 + 370, 226 * (column - scroll) + 475 - 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			|| (key_a_pressed)
			{
				scr_switch_expand_save_data(); /* Expand the save data before editing level name */
				if (global.save_data_size_is_sufficient)
				{
					creating_daily_build = false; /* Disable Daily Build */
					menu = "level_editor_enter_name_ok";
					menu_delay = 3;
					keyboard_string = "";
					can_input_level_name = true;
				}
				else
				{
					menu_delay = 3;
					can_input_level_name = false;
					global.clicking_ok_input_screen = false;
				}
			}
		}
		#endregion /* Pressing the Create from Scratch button END */
		
		#region /* Pressing the Create from Back button */
		if (menu == "level_editor_create_from_back")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			show_level_editor_corner_menu = true;
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, back_y, xx + 8 + 370, back_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			|| (key_a_pressed)
			{
				menu_delay = 3;
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
				menu = "level_editor_play";
			}
		}
		#endregion /* Pressing the Create from Back button END */
		
		#region /* Pressing the Back button when selecting level */
		if (menu == "level_editor_selected_back")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			show_level_editor_corner_menu = true;
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (back_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (back_y) - 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			|| (key_a_pressed)
			{
				file_load_timer = 0; /* Reset the "file load timer" to 0 just in case, otherwise you can't navigate the thumbnails with mouse */
				menu_delay = 3;
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
				menu = "level_editor_play";
			}
		}
		#endregion /* Pressing the Back button when selecting level END */
		
		#region /* Clicking outside of the sub menu should close the sub menu */
		if (open_sub_menu)
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "level_editor_play")
			|| (menu == "level_editor_make")
			|| (menu == "level_editor_upload")
			|| (menu == "level_editor_edit_name")
			|| (menu == "level_editor_enter_description")
			|| (menu == "level_editor_delete")
			|| (menu == "level_editor_selected_back")
			{
				if (!point_in_rectangle(mouse_get_x, mouse_get_y, xx, 226 * (column - scroll) + 455 - 3 + 10, xx + 384, 226 * (column - scroll) + 475 + back_y + 47 + 3))
				&& (mouse_check_button_released(mb_left))
				&& (global.controls_used_for_navigation == "mouse")
				{
					file_load_timer = 0; /* Reset the "file load timer" to 0 just in case, otherwise you can't navigate the thumbnails with mouse */
					menu_delay = 3;
					open_sub_menu = false;
					show_level_editor_corner_menu = true;
					scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
					menu = "level_editor_play";
				}
			}
			else
			if (menu == "level_editor_create_from_scratch")
			|| (menu == "level_editor_create_from_template")
			|| (menu == "level_editor_create_from_back")
			{
				if (!point_in_rectangle(mouse_get_x, mouse_get_y, xx, 226 * (column - scroll) + 455 - 3 + 10, xx + 384, 226 * (column - scroll) + 408 + 216 + 3))
				&& (mouse_check_button_released(mb_left))
				&& (global.controls_used_for_navigation == "mouse")
				{
					file_load_timer = 0; /* Reset the "file load timer" to 0 just in case, otherwise you can't navigate the thumbnails with mouse */
					menu_delay = 3;
					open_sub_menu = false;
					show_level_editor_corner_menu = true;
					scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
					menu = "level_editor_play";
				}
			}
		}
		#endregion /* Clicking outside of the sub menu should close the sub menu END */
		
		#region /* Pressing the Play button */
		if (menu == "level_editor_play")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (play_y)- 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (play_y)- 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			|| (key_a_pressed)
			{
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = true; /* Even before going to the level, set this variable to true */
				global.play_edited_level = true;
				can_navigate = false;
				menu_delay = 9999;
			}
		}
		#endregion /* Pressing the Play button END */
		
		#region /* Pressing the Make button */
		if (menu == "level_editor_make")
		{
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (make_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (make_y) - 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			|| (key_a_pressed)
			{
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_navigate = false;
				menu_delay = 9999;
			}
		}
		#endregion /* Pressing the Make button END */
		
		#region /* Pressing the Edit Name button */
		if (menu == "level_editor_edit_name")
		{
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (edit_name_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (edit_name_y) - 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			&& (!level_editor_edit_name)
			|| (key_a_pressed)
			&& (!level_editor_edit_name)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;
				if (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
				{
					global.level_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)); /* Set the "level name" to the selected level, so when you exit the level editor, the cursor will remember to appear on the level you selected */
					keyboard_string = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
				}
				old_level_name = global.level_name; /* Need to remember original name of level, so that renaming level doesn't actually happen if you haven't edited the name */
				global.play_edited_level = false;
				menu_delay = 3;
				menu = "level_editor_enter_name_ok"
			}
		}
		#endregion /* Pressing the Edit Name button END */
		
		#region /* Pressing the Edit Description button */
		if (menu == "level_editor_enter_description")
		{
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (edit_description_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (edit_description_y) - 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			&& (!level_editor_edit_name)
			|| (key_a_pressed)
			&& (!level_editor_edit_name)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;
				
				if (file_exists(game_save_id + "custom_levels/" + global.level_name + "/data/level_information.ini"))
				{
					ini_open(game_save_id + "custom_levels/" + global.level_name + "/data/level_information.ini");
					keyboard_string = ini_read_string("info", "level_description", "");
					global.level_description = ini_read_string("info", "level_description", "");
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				{
					keyboard_string = "";
					global.level_description = "";
				}
				
				old_level_description = global.level_description; /* Need to remember original description of level, so that renaming level doesn't actually happen if you haven't edited the description */
				global.play_edited_level = false;
				menu_delay = 3;
				menu = "level_editor_enter_description_ok";
			}
		}
		#endregion /* Pressing the Edit Description button END */
		
		#region /* Key A pressed */
		if (key_a_pressed)
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			
			#region /* Pressing the Delete button */
			if (menu == "level_editor_delete")
			&& (show_delete_button)
			{
				menu_delay = 3;
				menu = "level_editor_delete_no";
			}
			#endregion /* Pressing the Delete button END */
			
			else
			
			#region /* Pressing the No Delete button */
			if (menu == "level_editor_delete_no")
			{
				menu_delay = 3;
				if (show_delete_button)
				{
					menu = "level_editor_delete"
				}
				else
				{
					menu = "level_editor_selected_back";
				}
			}
			#endregion /* Pressing the No Delete button END */
			
		}
		#endregion /* Key A pressed END */
		
		#region /* Pressing the Create from Template button */
		if (key_a_pressed)
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (!hovering_over_level_editor_corner_menu)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 522 - 3, xx + 8 + 320, 226 * (column - scroll) + 522 - 3 + 42))
		&& (mouse_check_button_released(mb_left))
		&& (global.controls_used_for_navigation == "mouse")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "level_editor_create_from_template")
			{
				scr_switch_expand_save_data(); /* Expand the save data before editing level name */
				if (global.save_data_size_is_sufficient)
				{
					creating_daily_build = false; /* Disable Daily Build */
					file_found = "";
					file_load_timer = 0;
					level_find_pos = 0;
					ds_list_clear(global.thumbnail_sprite);
					menu_delay = 3;
					menu = "load_official_level_template";
				}
				else
				{
					menu_delay = 3;
					can_input_level_name = false;
					global.clicking_ok_input_screen = false;
				}
			}
		}
		#endregion /* Pressing the Create from Template button END */
		
		#region /* Pressing the Create Daily Build button */
		if (daily_build_enabled)
		&& (key_a_pressed)
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (daily_build_enabled)
		&& (!hovering_over_level_editor_corner_menu)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, daily_build_y, xx + 8 + 320, daily_build_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (global.controls_used_for_navigation == "mouse")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "level_editor_create_daily_build")
			{
				scr_switch_expand_save_data(); /* Expand the save data before editing level name */
				if (global.save_data_size_is_sufficient)
				{
					creating_daily_build = true; /* Enable Daily Build */
					menu = "level_editor_enter_name_ok";
					menu_delay = 3;
					keyboard_string = "";
					can_input_level_name = true;
				}
				else
				{
					menu_delay = 3;
					can_input_level_name = false;
					global.clicking_ok_input_screen = false;
				}
			}
		}
		#endregion /* Pressing the Create Daily Build button END */
		
		#region /* Pressing the Yes Delete button */
		if (key_a_pressed)
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (!hovering_over_level_editor_corner_menu)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 569 - 3, xx + 8 + 320, 226 * (column - scroll) + 569 - 3 + 42))
		&& (mouse_check_button_released(mb_left))
		&& (global.controls_used_for_navigation == "mouse")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "level_editor_delete_yes")
			{
				if (file_exists(game_save_id + "custom_levels/" + global.level_name + "/data/level_information.ini"))
				{
					directory_destroy(game_save_id + "custom_levels/" + global.level_name);
				}
				ini_open(game_save_id + "save_file/custom_level_save.ini");
				ini_section_delete(global.level_name);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				global.select_level_index --; /* Decrease the "select level index" so that the cursor isn't selecting a level that no longer exists */
				scr_load_custom_level_initializing();
				for(var i = 1; i <= global.max_players; i += 1)
				{
					can_input_player_name[i] = 2;
					player_accept_selection[i] = false;
				}
				can_navigate = true;
				menu_delay = 3;
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
				menu = "load_custom_level";
			}
		}
		#endregion /* Pressing the Yes Delete button END */
		
	}
	#endregion /* Draw sub menu END */
	
}