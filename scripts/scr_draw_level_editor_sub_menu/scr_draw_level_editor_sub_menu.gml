function scr_draw_level_editor_sub_menu(xx = 394 * (global.select_level_index - column * row) + 100 - 3 + thumbnail_x_offset, yy)
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Draw sub menu (code must be here to be above everything else) */
	if (open_sub_menu == true)
	{
		
		#region /* Navigate Sub Menu */
		if (key_up)
		and (menu_delay == 0)
		and (can_input_level_name == false)
		and (menu_joystick_delay <= 0)
		{
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
				menu = "level_editor_upload";
			}
			else
			if (menu == "level_editor_enter_description")
			{
				menu = "level_editor_edit_name";
			}
			else
			if (menu == "level_editor_selected_back")
			{
				if (show_delete_button == true)
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
			if (menu == "level_editor_create_from_back")
			{
				menu = "level_editor_create_from_template";
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
			menu_delay = 3;
		}
		else
		if (key_down)
		and (menu_delay == 0)
		and (can_input_level_name == false)
		and (menu_joystick_delay <= 0)
		{
			if (menu == "level_editor_play")
			{
				menu = "level_editor_make";
			}
			else
			if (menu == "level_editor_make")
			{
				menu = "level_editor_upload";
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
				if (show_delete_button == true)
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
			menu_delay = 3;
		}
		#endregion /* Navigate Sub Menu END */
		
		#region /* Button Y Positions */
		if (show_delete_button == true)
		{
			var play_y = 0;
			var make_y = 42;
			var upload_y = 42 * 2;
			var edit_name_y = 42 * 3;
			var edit_description_y = 42 * 4;
			var delete_y = 42 * 5;
			var back_y = 42 * 6;
		}
		else
		{
			var play_y = 0;
			var make_y = 42;
			var upload_y = 42 * 2;
			var edit_name_y = 42 * 3;
			var edit_description_y = 42 * 4;
			var delete_y = -99999;
			var back_y = 42 * 5;
		}
		#endregion /* Button Y Positions END */
		
		#region /* Show Sub Menu Buttons */
		if (can_input_level_name == false)
		{
			if (menu == "level_editor_play")
			or (menu == "level_editor_make")
			or (menu == "level_editor_upload")
			or (menu == "level_editor_edit_name")
			or (menu == "level_editor_enter_description")
			or (menu == "level_editor_delete")
			or (menu == "level_editor_selected_back")
			{
				show_level_editor_corner_menu = true;
				lerp_on = true;
				if (get_window_height <= 720)
				{
					scroll_to = floor(global.select_level_index / row) + 0.8; /* Scroll the view to fit all the buttons */
				}
				else
				{
					scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
				}
				draw_rectangle_color(xx, 226 * (column - scroll) + 455 - 3, xx + 384, 226 * (column - scroll) + 475 + back_y + 47 + 3, c_white, c_white, c_white, c_white, false);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (play_y) - 3, l10n_text("Play"), "level_editor_play", "level_editor_play");
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (make_y) - 3, l10n_text("Make"), "level_editor_make", "level_editor_make");
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (upload_y) - 3, l10n_text("Upload"), "level_editor_upload", "level_editor_upload");
				draw_sprite_ext(spr_icons_upload, 0, xx + 8 + 16, 226 * (column - scroll) + 475 + (upload_y) - 3 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (edit_name_y) - 3, l10n_text("Edit Name"), "level_editor_edit_name", "level_editor_edit_name");
				draw_sprite_ext(spr_icons_pen, 0, xx + 8 + 20, 226 * (column - scroll) + 475 + (edit_name_y) - 3 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (edit_description_y) - 3, l10n_text("Edit Description"), "level_editor_enter_description", "level_editor_enter_description");
				draw_sprite_ext(spr_icons_pen, 0, xx + 8 + 20, 226 * (column - scroll) + 475 + (edit_description_y) - 3 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (delete_y) - 3, l10n_text("Delete"), "level_editor_delete", "level_editor_delete_no");
				draw_sprite_ext(spr_icons_delete, 0, xx + 8 + 16, 226 * (column - scroll) + 475 + (delete_y) - 3 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (back_y) - 3, l10n_text("Back"), "level_editor_selected_back", "level_editor_selected_back");
				draw_sprite_ext(spr_icons_back, 0, xx + 8 + 20, 226 * (column - scroll) + 475 + (back_y) - 3 + 21, 1, 1, 0, c_white, 1);
			}
			else
			if (menu == "level_editor_create_from_scratch")
			or (menu == "level_editor_create_from_template")
			or (menu == "level_editor_create_from_back")
			{
				scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
				draw_rectangle_color(xx, 226 * (column - scroll) + 455 - 3, xx + 384, 226 * (column - scroll) + 408+ 216 + 3, c_white, c_white, c_white, c_white, false);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 - 3, l10n_text("Create from Scratch"), "level_editor_create_from_scratch", "level_editor_create_from_scratch");
				if (can_create_level_from_scratch == false)
				{
					draw_set_alpha(0.5);
					draw_rectangle_color(xx + 8, 226 * (column - scroll) + 475 - 3, xx + 8 + 370, 226 * (column - scroll) + 475 - 3 + 42, c_black, c_black, c_black, c_black, false);
					draw_set_alpha(1);
					draw_sprite_ext(spr_lock_icon, 0, xx + 8, 226 * (column - scroll) + 475 - 3, 1, 1, 0, c_white, 1);
				}
				draw_menu_button(xx + 8, 226 * (column - scroll) + 522 - 3, l10n_text("Create from Template"), "level_editor_create_from_template", "level_editor_create_from_template"); /* + 47 on y */
				draw_menu_button(xx + 8, 226 * (column - scroll) + 569 - 3, l10n_text("Back"), "level_editor_create_from_back", "level_editor_create_from_back");
				draw_sprite_ext(spr_icons_back, 0, xx + 8 + 20, 226 * (column - scroll) + 569 - 3 + 21, 1, 1, 0, c_white, 1);
			}
			else
			if (menu == "level_editor_delete_no")
			or (menu == "level_editor_delete_yes")
			{
				scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
				draw_rectangle_color(xx, 226 * (column - scroll) + 455 - 3, xx + 384, 226 * (column - scroll) + 408+ 216 + 3, c_red, c_red, c_red, c_red, false);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(xx + 200, 226 * (column - scroll) + 485 - 3, l10n_text("Delete Level") + "?", global.default_text_size * 1.2, c_white, c_black, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 522 - 3, l10n_text("No"), "level_editor_delete_no", "level_editor_delete"); /* + 47 on y */
				draw_sprite_ext(spr_icons_back, 0, xx + 8 + 20, 226 * (column - scroll) + 522 - 3 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 569 - 3, l10n_text("Yes"), "level_editor_delete_yes", "level_editor_delete_yes");
				draw_sprite_ext(spr_icons_delete, 0, xx + 8 + 16, 226 * (column - scroll) + 569 - 3 + 21, 1, 1, 0, c_white, 1);
				
				if (global.enable_options_for_pc == true)
				{
					if (get_window_width <= 1350)
					{
						scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32, working_directory + "/custom_levels/" + string(global.level_name), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
					}
					else
					{
						scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32, working_directory + "/custom_levels/" + string(global.level_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
					}
				}
			}
		}
		#endregion /* Show Sub Menu Buttons END */
		
		#region /* Pressing the Create from Scratch button */
		if (menu == "level_editor_create_from_scratch")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			show_level_editor_corner_menu = true;
			if (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 - 3, xx + 8 + 370, 226 * (column - scroll) + 475 - 3 + 42))
			and (mouse_check_button_released(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (can_create_level_from_scratch == true)
			or (key_a_released)
			and (can_create_level_from_scratch == true)
			{
				menu = "level_editor_enter_name_ok";
				menu_delay = 3;
				keyboard_string = "";
				can_input_level_name = true;
			}
		}
		#endregion /* Pressing the Create from Scratch button END */
		
		#region /* Pressing the Create from Back button */
		if (menu == "level_editor_create_from_back")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			show_level_editor_corner_menu = true;
			if (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 569 - 3, xx + 8 + 370, 226 * (column - scroll) + 569 - 3 + 42))
			and (mouse_check_button_released(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			or (key_a_released)
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
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			show_level_editor_corner_menu = true;
			if (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (back_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (back_y) - 3 + 42))
			and (mouse_check_button_released(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			or (key_a_released)
			{
				menu_delay = 3;
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
				menu = "level_editor_play";
			}
		}
		#endregion /* Pressing the Back button when selecting level END */
		
		#region /* Pressing the Play button */
		if (menu == "level_editor_play")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (play_y)- 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (play_y)- 3 + 42))
			and (mouse_check_button_released(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			or (key_a_released)
			{
				global.doing_clear_check = false;
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
			if (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (make_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (make_y) - 3 + 42))
			and (mouse_check_button_released(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			or (key_a_released)
			{
				global.doing_clear_check = false;
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
			if (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (edit_name_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (edit_name_y) - 3 + 42))
			and (mouse_check_button_released(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (level_editor_edit_name = false)
			or (key_a_released)
			and (level_editor_edit_name = false)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check = false;
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
			if (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (edit_description_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (edit_description_y) - 3 + 42))
			and (mouse_check_button_released(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (level_editor_edit_name = false)
			or (key_a_released)
			and (level_editor_edit_name = false)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				
				if (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					keyboard_string = ini_read_string("info", "level_description", "");
					global.level_description = ini_read_string("info", "level_description", "");
					ini_close();
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
		
		#region /* Key A Released */
		if (key_a_released)
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			
			#region /* Pressing the Delete button */
			if (menu == "level_editor_delete")
			and (show_delete_button == true)
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
				if (show_delete_button == true)
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
		#endregion /* Key A Released END */
		
		#region /* Pressing the Create from Template button */
		if (key_a_released)
		and (can_input_level_name == false)
		and (menu_delay == 0)
		or (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 522 - 3, xx + 8 + 320, 226 * (column - scroll) + 522 - 3 + 42))
		and (mouse_check_button_released(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			if (menu == "level_editor_create_from_template")
			{
				file_found = "";
				file_load_timer = 0;
				level_find_pos = 0;
				ds_list_clear(global.thumbnail_sprite);
				menu_delay = 3;
				menu = "load_official_level_template";
			}
		}
		#endregion /* Pressing the Create from Template button END */
		
		#region /* Pressing the Yes Delete button */
		if (key_a_released)
		and (can_input_level_name == false)
		and (menu_delay == 0)
		or (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 569 - 3, xx + 8 + 320, 226 * (column - scroll) + 569 - 3 + 42))
		and (mouse_check_button_released(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (can_input_level_name == false)
		and (menu_delay == 0)
		{
			if (menu == "level_editor_delete_yes")
			{
				if (directory_exists(working_directory + "/custom_levels/" + string(global.level_name)))
				{
					directory_destroy(working_directory + "/custom_levels/" + string(global.level_name));
				}
				scr_load_custom_level_initializing();
				can_input_player1_name = false;
				can_input_player2_name = false;
				can_input_player3_name = false;
				can_input_player4_name = false;
				can_navigate = true;
				menu_delay = 3;
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
				player1_accept_selection = false;
				player2_accept_selection = false;
				player3_accept_selection = false;
				player4_accept_selection = false;
				menu = "load_custom_level";
			}
		}
		#endregion /* Pressing the Yes Delete button END */
		
	}
	#endregion /* Draw sub menu END */
	
}