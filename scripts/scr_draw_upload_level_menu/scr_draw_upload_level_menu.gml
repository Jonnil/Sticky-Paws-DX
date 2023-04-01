function scr_draw_upload_level_menu()
{
	
	#region /* Debug toggles */
	var destroy_zip_after_uploading = true; /* Game should destroy the zip file once it's been uploaded to the server as a zip file */
	var skip_clear_check = false;
	#endregion /* Debug toggles END */
	
	var upload_y = 42 * 2;
	var message_x_offset = 400;
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Pressing the Upload button */
	if (menu == "level_editor_upload")
	{
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = true;
		}
		can_input_level_name = false;
		if (room == room_title)
		and (point_in_rectangle(mouse_get_x, mouse_get_y, 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (upload_y) - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 370, 226 * (column - scroll) + 475 + (upload_y) - 3 + 42))
		and (mouse_check_button_released(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		or (room = room_leveleditor)
		and (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42 + 42 + 42))
		and (mouse_check_button_released(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		or (key_a_released)
		{
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			menu_delay = 10;
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			if (ini_key_exists("info", "clear_check"))
			and (skip_clear_check == false)
			or (skip_clear_check == true)
			{
				if (ini_read_real("info", "clear_check", false) == true)
				and (skip_clear_check == false)
				or (skip_clear_check == true)
				{
					if (os_is_network_connected()) /* Check if you're even connected to the internet */
					{
						menu_delay = 3;
						menu = "upload_edit_name"; /* Go to the menu where you can edit things about the custom level before uploading it*/
						if (variable_instance_exists(self, "show_level_editor_corner_menu"))
						{
							show_level_editor_corner_menu = false;
						}
					}
					else
					{
						menu_delay = 3;
						menu = "no_internet"; /* If you're not connected to the internet, tell the player that */
						if (variable_instance_exists(self, "show_level_editor_corner_menu"))
						{
							show_level_editor_corner_menu = false;
						}
					}
				}
				else
				{
					menu_delay = 3;
					menu = "clear_check_yes";
					if (variable_instance_exists(self, "show_level_editor_corner_menu"))
					{
						show_level_editor_corner_menu = false;
					}
				}
			}
			else
			{
				menu_delay = 3;
				menu = "clear_check_yes";
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = false;
				}
			}
			ini_close();
		}
	}
	#endregion /* Pressing the Upload button END */
	
	else
	
	#region /* Draw clear check menu */
	if (menu == "clear_check_no")
	or (menu == "clear_check_yes")
	{
		var do_a_clear_check_y = 432;
		var do_a_clear_check_no_y = 532;
		var do_a_clear_check_yes_y = 532;
		if (global.doing_clear_check == false)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_alpha(0.9);
			draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
			{
				/* Draw Thumbnail */
				draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
			}
			draw_set_alpha(0.9);
			draw_rectangle_color(get_window_width * 0.5 - message_x_offset, do_a_clear_check_y - 32, get_window_width * 0.5 + message_x_offset, do_a_clear_check_y + 32, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_y, l10n_text("Do a clear check?"), global.default_text_size * 1.9, c_black, c_white, 1);
			
			#region /* Clear Check No */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_no_y - 42, get_window_width * 0.5 + 370, do_a_clear_check_no_y + 42))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				if (menu_delay == 0)
				{
					menu = "clear_check_no";
				}
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_no_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_no_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				if (menu == "clear_check_no")
				and (global.controls_used_for_menu_navigation == "keyboard")
				or (menu == "clear_check_no")
				and (global.controls_used_for_menu_navigation == "controller")
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_no_y, 1, 1, 180, c_white, 1);
					draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_no_y, 2, 2, 0, c_lime, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
					draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_no_y, 2, 2, 0, c_white, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
					draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
				}
			}
			#endregion /* Clear Check No END */
			
			#region /* Clear Check Yes */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84 - 42, get_window_width * 0.5 + 370, do_a_clear_check_yes_y + 84 + 42))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				if (menu_delay == 0)
				{
					menu = "clear_check_yes";
				}
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_yes_y + 84, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_yes_y + 84, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			}
			else
			{
				if (menu == "clear_check_yes")
				and (global.controls_used_for_menu_navigation == "keyboard")
				or (menu == "clear_check_yes")
				and (global.controls_used_for_menu_navigation == "controller")
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_yes_y + 84, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_yes_y + 84, 1, 1, 180, c_white, 1);
					draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84, 2, 2, 0, c_lime, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84, 2, 2, 0, c_white, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
				}
			}
			#endregion /* Clear Check Yes END */
			
			#region /* Return to game */
			if (key_b_pressed)
			and (level_editor_edit_name = false)
			and (menu_delay == 0)
			{
				menu_delay = 3;
				menu = "level_editor_upload"; /* Return to previous menu */
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
			}
			#endregion /* Return to game END */
			
		}
		
		#region /* Clear Check Menu Navigation */
		if (menu == "clear_check_no")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_no_y - 42, get_window_width * 0.5 + 370, do_a_clear_check_no_y + 42))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (key_a_released)
			and (menu_delay == 0)
			{
				menu_delay = 3;
				menu = "level_editor_upload"; /* Return to previous menu */
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
			}
		}
		else
		if (menu == "clear_check_yes")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84 - 42, get_window_width * 0.5 + 370, do_a_clear_check_yes_y + 84 + 42))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (key_a_released)
			and (menu_delay == 0)
			{
				
				#region /* Set clear_check to false whenever you agree to do a clear check for the first time, just in case it's already not */
				if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
				{
					if (global.level_name != "")
					{
						ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					}
					ini_write_real("info", "clear_check", false); /* Set "clear check" to false when you click on "clear check yes" just in case it isn't already false when doing a "clear check" */
					ini_close();
				}
				#endregion /* Set clear_check to false whenever you agree to do a clear check for the first time, just in case it's already not END */
				
				global.doing_clear_check = true; /* You will play the level like normal, but the game will watch you to make sure that the level can be completed befre being able to upload */
				global.actually_play_edited_level = true;
				global.play_edited_level = true;
				can_navigate = false;
				if (room == room_leveleditor)
				{
					pause = false;
					menu_delay = 0;
					global.character_select_in_this_menu = "level_editor";
					room_restart();
				}
				else
				{
					menu_delay = 9999;
					if (asset_get_type("obj_camera") == asset_object)
					and (instance_exists(obj_camera))
					{
						with(obj_camera)
						{
							iris_zoom = 0;
						}
					}
				}
			}
		}
		if (key_up)
		{
			menu_delay = 3;
			menu = "clear_check_no";
		}
		if (key_down)
		{
			menu_delay = 3;
			menu = "clear_check_yes";
		}
		#endregion /* Clear Check Menu Navigation END */
		
	}
	#endregion /* Draw clear check menu END */
	
	if (keyboard_virtual_status())
	and (keyboard_virtual_height() != 0)
	{
		var draw_name_y = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	{
		var draw_name_y = get_window_height * 0.5 - 22;
	}
	if (keyboard_virtual_status())
	and (keyboard_virtual_height() != 0)
	{
		var draw_description_y = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	{
		var draw_description_y = get_window_height * 0.5 + 42 * 1;
	}
	var edit_name_y = get_window_height * 0.5 + 42 * 2;
	var edit_description_y = get_window_height * 0.5 + 42 * 3;
	var ok_y = get_window_height * 0.5 + 42 * 5;
	var cancel_y = get_window_height * 0.5 + 42 * 6;
	
	#region /* Edit things before uploading */
	if (menu == "upload_edit_name")
	or (menu == "upload_edit_description")
	or (menu == "edit_ok")
	or (menu == "edit_cancel")
	{
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = false;
		}
		open_sub_menu = true;
		lerp_on = true;
		if (room == room_title)
		{
			if (get_window_height <= 720)
			{
				scroll_to = floor(global.select_level_index / row) + 0.8; /* Scroll the view to fit all the buttons */
			}
			else
			{
				scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
			}
		}
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (get_window_height <= 720)
		{
			if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
			{
				/* Draw Thumbnail */
				draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 210, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 1.1, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 1.1, 0, c_white, 1);
			}
		}
		else
		{
			if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
			{
				/* Draw Thumbnail */
				draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
			}
		}
		/* Draw Level Name */ scr_draw_text_outlined(get_window_width * 0.5, draw_name_y, string(global.level_name), global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Draw Level Description */
		if (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		{
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			if (ini_key_exists("info", "level_description"))
			{
				scr_draw_text_outlined(get_window_width * 0.5, draw_description_y, string(ini_read_string("info", "level_description", "")), global.default_text_size * 1.25, c_black, c_white, 1);
			}
			ini_close();
		}
		#endregion /* Draw Level Description END */
		
		draw_menu_button(get_window_width * 0.5 - 185, edit_name_y, l10n_text("Edit Name"), "upload_edit_name", "upload_edit_name");
		draw_sprite_ext(spr_icons_pen, 0, get_window_width * 0.5 - 185 + 16, edit_name_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, edit_description_y, l10n_text("Edit Description"), "upload_edit_description", "upload_edit_description");
		draw_sprite_ext(spr_icons_pen, 0, get_window_width * 0.5 - 185 + 16, edit_description_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, ok_y, l10n_text("Upload"), "edit_ok", "upload_yes");
		draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 185 + 16, ok_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, cancel_y, l10n_text("Cancel"), "edit_cancel", "edit_cancel");
		draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 16, cancel_y + 21, 1, 1, 0, c_white, 1);
		
		#region /* Pressing the Edit Name button */
		if (menu == "upload_edit_name")
		and (menu_delay == 0)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, edit_name_y, get_window_width * 0.5 + 185, edit_name_y + 42))
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
				menu = "upload_enter_name_ok";
			}
		}
		#endregion /* Pressing the Edit Name button END */
		
		#region /* Pressing the Edit Description button */
		if (menu == "upload_edit_description")
		and (menu_delay == 0)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, edit_description_y, get_window_width * 0.5 + 185, edit_description_y + 42))
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
				global.level_description = string(global.level_name);
				
				if (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					keyboard_string = ini_read_string("info", "level_description", "");
					ini_close();
				}
				else
				{
					keyboard_string = "";
				}
				old_level_description = global.level_description; /* Need to remember original description of level, so that renaming level doesn't actually happen if you haven't edited the description */
				global.play_edited_level = false;
				menu_delay = 3;
				menu = "upload_enter_description_ok";
			}
		}
		#endregion /* Pressing the Edit Description button END */
		
		if (key_up)
		and (menu_delay == 3)
		{
			menu_delay = 3;
			if (menu == "upload_edit_description")
			{
				menu = "upload_edit_name";
			}
			else
			if (menu == "edit_ok")
			{
				menu = "upload_edit_description";
			}
			else
			if (menu == "edit_cancel")
			{
				menu = "edit_ok";
			}
		}
		if (key_down)
		and (menu_delay == 3)
		{
			menu_delay = 3;
			if (menu == "upload_edit_name")
			{
				menu = "upload_edit_description";
			}
			else
			if (menu == "upload_edit_description")
			{
				menu = "edit_ok";
			}
			else
			if (menu == "edit_ok")
			{
				menu = "edit_cancel";
			}
		}
		if (menu == "edit_ok")
		and (key_a_released)
		and (menu_delay == 0)
		{
			
			#region /* If at any point the game checks that the level isn't clear checked, then go to the clear check menu */
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			if (ini_read_real("info", "clear_check", false) == false)
			and (skip_clear_check == false)
			{
				menu = "clear_check_yes";
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = false;
				}
				menu_delay = 3;
			}
			else
			{
				menu = "upload_yes"; /* Go to upload confirmation screen */
				menu_delay = 3;
			}
			ini_close();
			#endregion /* If at any point the game checks that the level isn't clear checked, then go to the clear check menu END */
			
		}
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, cancel_y, get_window_width * 0.5 + 185, cancel_y + 42))
		and (mouse_check_button_released(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		or (menu == "edit_cancel")
		and (key_a_released)
		and (menu_delay == 0)
		or (key_b_pressed)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "level_editor_upload"; /* Return to previous menu */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
		}
	}
	#endregion /* Edit things before uploading END */
	
	else
	
	#region /* Edit level name */
	if (menu == "upload_enter_name_ok")
	or (menu == "upload_enter_name_cancel")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		
		if (can_input_level_name == true)
		{
			global.level_name = scr_draw_name_input_screen(global.level_name, 32, c_black, 1, false, get_window_width * 0.5, draw_name_y, "upload_enter_name_ok", "upload_enter_name_cancel");
		}
		
		#region /* Input Level Name */
	
		#region /* Press Enter to confirm new name */
		if (can_input_level_name == true)
		and (menu_delay == 0)
		and (keyboard_string != "")
		and (global.level_name != undefined)
		{
			if (keyboard_check_released(vk_enter))
			and (menu != "upload_enter_name_ok")
			and (menu != "upload_enter_name_cancel")
			or (keyboard_check_released(vk_enter))
			and (menu == "upload_enter_name_ok")
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 - 185,
			draw_name_y + 54,
			get_window_width * 0.5 - 185 + 370,
			draw_name_y + 54 + 42))
			and (mouse_check_button_released(mb_left))
			or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button_accept))
			or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button2_accept))
			or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button_accept))
			or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button2_accept))
			or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button_accept))
			or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button2_accept))
			or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button_accept))
			or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button2_accept))
			{
				if (level_editor_edit_name == true)
				and (global.level_name != old_level_name)
				{
					can_navigate = true;
					menu_delay = 3;
					scr_copy_move_files(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), string(game_save_id) + "\custom_levels\\" + string(global.level_name), true);
					scr_load_custom_level_initializing();
					global.go_to_menu_after_loading_custom_levels = "upload_edit_name";
					menu = "load_custom_level";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == true)
				and (global.level_name == old_level_name)
				{
					menu = "upload_edit_name";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == false)
				{
					can_navigate = false;
					menu_delay = 9999;
					if (asset_get_type("obj_camera") == asset_object)
					and (instance_exists(obj_camera))
					{
						with(obj_camera)
						{
							iris_zoom = 0;
						}
					}
				}
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_input_level_name = false;
			}
		}
		#endregion /* Press Enter to confirm new name END */
	
		#region /* Press Escape to back out from name input menu */
		if (can_input_level_name == true)
		and (menu_delay == 0)
		{
			if (keyboard_check_released(vk_enter))
			and (menu == "upload_enter_name_cancel")
			or (keyboard_check_released(vk_escape))
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 - 185,
			draw_name_y + 54 + 42,
			get_window_width * 0.5 - 185 + 370,
			draw_name_y + 54 + 42 + 42))
			and (mouse_check_button_released(mb_left))
			or (mouse_check_button_released(mb_right))
			or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button_back))
			or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button2_back))
			or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button_back))
			or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button2_back))
			or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button_back))
			or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button2_back))
			or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button_back))
			or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button2_back))
			{
				menu_delay = 3;
				if (asset_get_type("obj_camera") == asset_object)
				and (instance_exists(obj_camera))
				{
					with(obj_camera)
					{
						iris_zoom = 0;
					}
				}
				can_input_level_name = false;
				if (level_editor_edit_name == true)
				{
					menu = "upload_edit_name";
					level_editor_edit_name = false;
				}
				else
				{
					menu = "upload_edit_name";
				}
			}
		}
		#endregion /* Press Escape to back out from name input menu END */
		
		#endregion /* Input Level Name END */
		
	}
	#endregion /* Edit level name END */
	
	else
	
	#region /* Edit level description */
	if (menu == "upload_enter_description_ok")
	or (menu == "upload_enter_description_cancel")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		/* Draw Level Name above description input */ scr_draw_text_outlined(get_window_width * 0.5, draw_name_y, string(global.level_name), global.default_text_size * 1.9, c_black, c_white, 1);
		
		if (can_input_level_name == true)
		{
			global.level_description = scr_draw_name_input_screen(global.level_description, 75, c_black, 1, false, get_window_width * 0.5, draw_description_y, "upload_enter_description_ok", "upload_enter_description_cancel");
		}
		
		#region /* Input Level Description */
		
		#region /* Press Enter to confirm new description */
		if (can_input_level_name == true)
		and (menu_delay == 0)
		and (keyboard_string != "")
		and (global.level_description != undefined)
		{
			if (keyboard_check_released(vk_enter))
			and (menu != "upload_enter_description_ok")
			and (menu != "upload_enter_description_cancel")
			or (keyboard_check_released(vk_enter))
			and (menu == "upload_enter_description_ok")
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 - 185,
			draw_description_y + 54,
			get_window_width * 0.5 - 185 + 370,
			draw_description_y + 54 + 42))
			and (mouse_check_button_released(mb_left))
			or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button_accept))
			or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button2_accept))
			or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button_accept))
			or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button2_accept))
			or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button_accept))
			or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button2_accept))
			or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button_accept))
			or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button2_accept))
			{
				if (level_editor_edit_name == true)
				and (global.level_description != old_level_description)
				{
					can_navigate = true;
					menu_delay = 3;
					
					/* Save description to level_information.ini */
					ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "level_description", string(global.level_description));
					ini_close();
					
					menu = "upload_edit_description";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == true)
				and (global.level_description == old_level_description)
				{
					menu = "upload_edit_description";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == false)
				{
					can_navigate = false;
					menu_delay = 9999;
					if (asset_get_type("obj_camera") == asset_object)
					and (instance_exists(obj_camera))
					{
						with(obj_camera)
						{
							iris_zoom = 0;
						}
					}
				}
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_input_level_name = false;
			}
		}
		#endregion /* Press Enter to confirm new description END */
		
		#region /* Press Escape to back out from description input menu */
		if (can_input_level_name == true)
		and (menu_delay == 0)
		{
			if (keyboard_check_released(vk_enter))
			and (menu == "upload_enter_description_cancel")
			or (keyboard_check_released(vk_escape))
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 - 185,
			draw_description_y + 54 + 42,
			get_window_width * 0.5 - 185 + 370,
			draw_description_y + 54 + 42 + 42))
			and (mouse_check_button_released(mb_left))
			or (mouse_check_button_released(mb_right))
			or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button_back))
			or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button2_back))
			or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button_back))
			or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button2_back))
			or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button_back))
			or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button2_back))
			or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button_back))
			or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button2_back))
			{
				menu_delay = 3;
				if (asset_get_type("obj_camera") == asset_object)
				and (instance_exists(obj_camera))
				{
					with(obj_camera)
					{
						iris_zoom = 0;
					}
				}
				can_input_level_name = false;
				if (level_editor_edit_name == true)
				{
					menu = "upload_edit_description";
					level_editor_edit_name = false;
				}
				else
				{
					menu = "upload_edit_description";
				}
			}
		}
		#endregion /* Press Escape to back out from descriptin input menu END */
	
		#endregion /* Input Level Description END */
		
	}
	#endregion /* Edit level description END */
	
	else
	
	#region /* Upload Level Menu */
	if (menu == "upload_yes")
	or (menu == "upload_no")
	{
		var upload_name_question_y = 432;
		var upload_level_no_y = 532;
		var upload_level_yes_y = 532 + 84;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		draw_set_alpha(0.9);
		draw_rectangle_color(get_window_width * 0.5 - message_x_offset, upload_name_question_y - 32, get_window_width * 0.5 + message_x_offset, upload_name_question_y + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, upload_name_question_y, l10n_text("Upload") + " " + string(global.level_name) + "?", global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Upload Level No */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_level_no_y - 42, get_window_width * 0.5 + 370, upload_level_no_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "upload_no";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_no_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_no_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_no_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, upload_level_no_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "upload_no")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "upload_no")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_no_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_no_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_no_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_level_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, upload_level_no_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_no_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_level_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, upload_level_no_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Upload Level No END */
	
		#region /* Upload Level Yes */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_level_yes_y - 42, get_window_width * 0.5 + 370, upload_level_yes_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "upload_yes";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_yes_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_yes_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 370 + 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "upload_yes")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "upload_yes")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_yes_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_yes_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 370 + 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_yes_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 370 + 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Upload Level Yes END */
		
		#region /* Return to game */
		if (key_b_pressed)
		and (level_editor_edit_name = false)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "edit_ok"; /* Return to previous menu */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = false;
			}
		}
		#endregion /* Return to game END */
		
		#region /* Upload Level Menu Navigation */
		if (menu == "upload_no")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_level_no_y - 42, get_window_width * 0.5 + 370, upload_level_no_y + 42))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (key_a_released)
			and (menu_delay == 0)
			{
				menu_delay = 3;
				menu = "edit_ok"; /* Return to previous menu */
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = false;
				}
			}
		}
		else
		if (menu == "upload_yes")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_level_yes_y - 42, get_window_width * 0.5 + 370, upload_level_yes_y + 42))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (key_a_released)
			and (menu_delay == 0)
			{
				menu = "uploading_level"; /* Go to uploading level loading screen */
				menu_delay = 60 * 3;
			}
		}
		if (key_up)
		{
			menu_delay = 3;
			menu = "upload_no";
		}
		if (key_down)
		{
			menu_delay = 3;
			menu = "upload_yes";
		}
		#endregion /* Upload Level Menu Navigation END */
		
	}
	#endregion /* Upload Level Menu END */
	
	#region /* Uploading Level */
	if (menu == "uploading_level")
	{
		var uploading_level_message_y = 532;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		draw_set_alpha(0.9);
		draw_rectangle_color(get_window_width * 0.5 - message_x_offset, uploading_level_message_y - 32, get_window_width * 0.5 + message_x_offset, uploading_level_message_y + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, uploading_level_message_y, l10n_text("Uploading") + " " + string(global.level_name) + "...", global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Generate Level ID */
		if (menu_delay = 50)
		{
			/* Certain characters is not used as they look too similar to other characters in certain fonts. It's easier to just not include those letters in the Level ID */
			level_id_1 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_2 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_3 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_4 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_5 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_6 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_7 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_8 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_9 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id = string(level_id_1) + string(level_id_2) + string(level_id_3) + string(level_id_4) + string(level_id_5) + string(level_id_6) + string(level_id_7) + string(level_id_8) + string(level_id_9);
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			ini_write_string("info", "level_id", string(level_id)); /* Save the level ID in the level information.ini file, so that it can be referenced later */
			ini_close();
		}
		#endregion /* Generate Level ID END */
		
		#region /* Create Zip File */
		if (menu_delay = 40)
		{
			file = scr_upload_zip_add_files(); /* Add all the level files to a new zip file */
		}
		#endregion /* Create Zip File END */
		
		#region /* Send Zip File to the Server */
		if (menu_delay <= 0)
		{
			
			#region /* Actually upload the level to the server */
			
			/* User is prompted for a file to upload */
			file_name = filename_name(file);
			
			/* Create DS Map to hold the HTTP Header info */
			map = ds_map_create();
			
			/* Add to the header DS Map */
			ds_map_add(map, "Host", global.base_url);
			var boundary = "----GMBoundary";
			ds_map_add(map, "Content-Type", "multipart/form-data; boundary=" + boundary);
			ds_map_add(map, "User-Agent", "gmuploader");
			ds_map_add(map, "X-API-Key", global.api_key);
			
			/* Loads the file into a buffer */
			send_buffer = buffer_create(1, buffer_grow, 1);
			buffer_load_ext(send_buffer, file, 0);
			
			/* Encodes the data as base64 */
			data_send = buffer_base64_encode(send_buffer, 0, buffer_get_size(send_buffer));
			
			/* Post the data to the upload script */
			var post_data = "--" + boundary + "\r\n";
			post_data += "Content-Disposition: form-data; name=\"name\"\r\n\r\n";
			post_data += file_name + "\r\n";
			post_data += "--" + boundary + "\r\n";
			post_data += "Content-Disposition: form-data; name=\"data\"\r\n\r\n";
			post_data += data_send + "\r\n";
			post_data += "--" + boundary + "--";
			
			/* Add the Content-Length header to the map */
			ds_map_add(map, "Content-Length", string(string_length(post_data)));
			http_request("https://" + global.base_url + global.upload_endpoint, "POST", map, post_data);
			
			/* Cleans up! */
			buffer_delete(send_buffer);
			ds_map_destroy(map);
			
			#endregion /* Actually upload the level to the server END */
			
			#region /* Delete some leftover files and folders */
			if (destroy_zip_after_uploading == true)
			{
				file_delete(file);
			}
			#endregion /* Delete some leftover files and folders END */
			
			menu = "level_uploaded";
		}
		#endregion /* Send Zip File to the Server END */
		
	}
	#endregion /* Uploading Level END */
	
	#region /* Level Uploaded */
	if (menu == "level_uploaded")
	{
		var uploaded_level_message_y = 432;
		var ok_y = uploaded_level_message_y + 168;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		draw_set_alpha(0.9);
		draw_rectangle_color(get_window_width * 0.5 - message_x_offset, uploaded_level_message_y - 32, get_window_width * 0.5 + message_x_offset, uploaded_level_message_y + 128, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, uploaded_level_message_y, string(global.level_name) + " " + l10n_text("Uploaded"), global.default_text_size * 1.9, c_black, c_white, 1);
		/* Show Level ID */ scr_draw_text_outlined(get_window_width * 0.5, uploaded_level_message_y + 84, l10n_text("Level ID") + ": " + string(level_id), global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Level Uploaded OK */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "level_uploaded";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "level_uploaded")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "level_uploaded")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Level Uploaded OK END */
		
		#region /* Return to game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		or (mouse_check_button_released(mb_right))
		and (menu_delay == 0)
		or (key_a_released)
		and (menu_delay == 0)
		or (key_b_pressed)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "level_editor_upload"; /* Return to previous menu */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* Level Uploaded END */
	
	#region /* No Internet */
	if (menu == "no_internet")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		/* Don't draw a level thumbnail here, to make it more obvious that there was an error connecting to the internet, because every other screen have a level thumbnail visible usually */
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("No Internet connection"), global.default_text_size * 1.9, c_black, c_white, 1);
		
		var ok_y = get_window_height * 0.5 + 42 + 42 + 42;
		
		#region /* Level Uploaded OK */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "no_internet";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "no_internet")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "no_internet")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Level Uploaded OK END */
		
		#region /* Return to game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		or (key_a_released)
		and (menu_delay == 0)
		or (key_b_pressed)
		and (level_editor_edit_name = false)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "level_editor_upload"; /* Return to previous menu */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* No Internet END */
	
	#region /* Enter Custom Level */
	if (room == room_title)
	and (iris_xscale <= 0.001)
	and (global.character_select_in_this_menu == "level_editor")
	{
		if (audio_is_playing(title_music))
		{
			audio_stop_sound(title_music);
		}
		if (asset_get_type("room_leveleditor") == asset_room)
		{
			scr_delete_sprite_properly(title_screen_background);
			
			scr_update_all_backgrounds();
			
			room_goto(room_leveleditor);
		}
	}
	#endregion /* Enter Custom Level END */
	
}