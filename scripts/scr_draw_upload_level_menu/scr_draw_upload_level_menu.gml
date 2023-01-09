function scr_draw_upload_level_menu()
{
	var upload_y = 42 * 2;
	
	#region /* Pressing the Upload button */
	if (menu == "level_editor_upload")
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (upload_y) - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 370, 226 * (column - scroll) + 475 + (upload_y) - 3 + 42))
		and (mouse_check_button_pressed(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		or (key_a_pressed)
		{
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			menu_delay = 10;
			ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
			if (ini_key_exists("info", "clear_check"))
			{
				var clear_check = ini_read_real("info", "clear_check", false);
				if (clear_check == true)
				{
					menu = "upload_level_yes";
				}
				else
				{
					menu = "clear_check_yes";
				}
			}
			else
			{
				menu = "clear_check_yes";
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
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 128, l10n_text("Do a clear check?"), global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Clear Check No */
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "clear_check_no";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 370 + 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "clear_check_no")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "clear_check_no")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 370 + 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 370 + 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Clear Check No END */
	
		#region /* Clear Check Yes */
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 + 84 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 84 + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "clear_check_yes";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2 + 84, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2 + 84, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2 + 84, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
		}
		else
		{
			if (menu == "clear_check_yes")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "clear_check_yes")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2 + 84, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2 + 84, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2 + 84, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2 + 84, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
			}
		}
		#endregion /* Clear Check Yes END */
	
		#region /* Return to game */
		if (key_b_pressed)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "level_editor_upload"; /* Return to previous menu */
		}
		#endregion /* Return to game END */
		
		#region /* Clear Check Menu Navigation */
		if (menu == "clear_check_no")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay == 0)
			or (key_a_pressed)
			and (menu_delay == 0)
			{
				menu_delay = 3;
				menu = "level_editor_upload"; /* Return to previous menu */
			}
		}
		else
		if (menu == "clear_check_yes")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 + 84 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 84 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay == 0)
			or (key_a_pressed)
			and (menu_delay == 0)
			{
				global.doing_clear_check = true; /* You will play the level like normal, but the game will watch you to make sure that the level can be completed befre being able to upload */
				global.actually_play_edited_level = true;
				global.play_edited_level = true;
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
	
	else
	
	if (menu == "upload_level_yes")
	or (menu == "upload_level_no")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 128, l10n_text("Upload") + " " + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "?", global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Upload Level No */
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "upload_level_no";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 370 + 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "upload_level_no")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "upload_level_no")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 370 + 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 370 + 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Upload Level No END */
	
		#region /* Upload Level Yes */
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 + 84 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 84 + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "upload_level_yes";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2 + 84, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2 + 84, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2 + 84, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
		}
		else
		{
			if (menu == "upload_level_yes")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "upload_level_yes")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2 + 84, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2 + 84, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2 + 84, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2 + 84, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(window_get_width() / 2, window_get_height() / 2 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
			}
		}
		#endregion /* Upload Level Yes END */
		
		#region /* Return to game */
		if (key_b_pressed)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "level_editor_upload"; /* Return to previous menu */
		}
		#endregion /* Return to game END */
		
		#region /* Upload Level Menu Navigation */
		if (menu == "upload_level_no")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay == 0)
			or (key_a_pressed)
			and (menu_delay == 0)
			{
				menu_delay = 3;
				menu = "level_editor_upload"; /* Return to previous menu */
			}
		}
		else
		if (menu == "upload_level_yes")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 + 84 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 84 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay == 0)
			or (key_a_pressed)
			and (menu_delay == 0)
			{
				/* Actually upload the level to the server */
			}
		}
		if (key_up)
		{
			menu_delay = 3;
			menu = "upload_level_no";
		}
		if (key_down)
		{
			menu_delay = 3;
			menu = "upload_level_yes";
		}
		#endregion /* Upload Level Menu Navigation END */
		
	}
	
	#region /* Enter Custom Level */
	if (iris_xscale <= 0.001)
	and (global.character_select_in_this_menu == "level_editor")
	{
		if (audio_is_playing(title_music))
		{
			audio_stop_sound(title_music);
		}
		if (asset_get_type("room_leveleditor") == asset_room)
		{
			sprite_delete(title_screen_background);
			
			#region /* Update All Backgrounds */
			
			sprite_delete(global.custom_background1);
			sprite_delete(global.custom_background2);
			sprite_delete(global.custom_background3);
			sprite_delete(global.custom_background4);
			sprite_delete(global.custom_foreground1);
			sprite_delete(global.custom_foreground_above_static_objects);
			sprite_delete(global.custom_foreground2);
			sprite_delete(global.custom_foreground_secret);
			
			#region /* Update Background1 */
			/* BMP small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.bmp")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.bmp")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.png")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.png")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.gif")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.gif")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.jpg")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.jpg")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background1 = noone;
			}
			#endregion /* Update Background1 END */
			
			#region /* Update Background2 */
			/* BMP small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.bmp")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.bmp")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.png")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.png")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.gif")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.gif")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.jpg")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.jpg")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background2 = noone;
			}
			#endregion /* Update Background2 END */
			
			#region /* Update Background3 */
			/* BMP small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.bmp")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.bmp")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.png")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.png")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.gif")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.gif")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.jpg")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.jpg")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background3 = noone;
			}
			#endregion /* Update Background3 END */
			
			#region /* Update Background4 */
			/* BMP small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.bmp")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_vtiled(0, true);}else
			/* BMP big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.bmp")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.bmp", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.png")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* PNG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.png")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.png", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.gif")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* Gif (big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.gif")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.gif", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG small letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.jpg")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			/* JPG big letter File */if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.jpg")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.jpg", 0, false, false, 0, 0);layer_background_htiled(0, true);layer_background_htiled(0, true);}else
			{
				global.custom_background4 = noone;
			}
			#endregion /* Update Background4 END */
						
			#region /* Update Foreground1 */
			
			#region /* BMP small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP small letter File END */
			
			#region /* BMP big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP big letter File END */
			
			#region /* PNG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG small letter File END */
			
			#region /* PNG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG big letter File END */
			
			#region /* GIF small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF small letter File END */
			
			#region /* GIF big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF big letter File END */
			
			#region /* JPG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG small letter File END */
			
			#region /* JPG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG big letter File END */
			
			{
				global.custom_foreground1 = noone;
			}
			
			#endregion /* Update Foreround1 END */
			
			#region /* Update Foreground above static objects custom level */
			
			#region /* BMP small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP small letter File END */
			
			#region /* BMP big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP big letter File END */
			
			#region /* PNG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG small letter File END */
			
			#region /* PNG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG big letter File END */
			
			#region /* GIF small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF small letter File END */
			
			#region /* GIF big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF big letter File END */
			
			#region /* JPG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG small letter File END */
			
			#region /* JPG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG big letter File END */
			
			{
				global.custom_foreground_above_static_objects = noone;
			}
			
			#endregion /* Update Foreround above static objects custom level END */
			
			#region /* Update Foreground2 */
			
			#region /* BMP small letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP small letter File END */
			
			#region /* BMP big letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* BMP big letter File END */
			
			#region /* PNG small letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG small letter File END */
			
			#region /* PNG big letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* PNG big letter File END */
			
			#region /* GIF small letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF small letter File END */
			
			#region /* GIF big letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* GIF big letter File END */
			
			#region /* JPG small letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG small letter File END */
			
			#region /* JPG big letter File */
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /* JPG big letter File END */
			
			{
				global.custom_foreground2 = noone;
			}
			
			#endregion /* Update Foreround2 END */
			
			#region /* Update Foreground secret */
			
			#region /* BMP small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* BMP small letter File END */
			
			else
			
			#region /* BMP big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* BMP big letter File END */
			
			else
			
			#region /* PNG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* PNG small letter File END */
			
			else
			
			#region /* PNG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* PNG big letter File END */
			
			else
			
			#region /* GIF small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* GIF small letter File END */
			
			else
			
			#region /* GIF big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* GIF big letter File END */
			
			else
			
			#region /* JPG small letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* JPG small letter File END */
			
			else
			
			#region /* JPG big letter File */
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg"))
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg", image_speed, false, false, 0, 0);
				sprite_collision_mask(global.custom_foreground_secret, false, 0, 0, 0, 0, 0, bboxkind_precise, 25);
			}
			#endregion /* JPG big letter File END */
			
			else
			{
				global.custom_foreground_secret = noone;
			}
			
			#endregion /* Update Foreround secret END */
			
			#endregion /* Update All Backgrounds END */
			
			#region /* Level Tileset File */
			sprite_delete(global.custom_tileset);
			
			if (global.character_select_in_this_menu == "level_editor")
			and (global.level_name != "")
			and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png"))
			{
				global.custom_tileset = sprite_add(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
			}
			else
			{
				global.custom_tileset = noone;
			}
			#endregion /* Level Tileset File END */
			
			room_goto(room_leveleditor);
		}
		global.actually_play_edited_level = true;
		global.play_edited_level = true;
	}
	#endregion /* Enter Custom Level END */
	
}