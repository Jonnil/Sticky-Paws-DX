function scr_select_custom_level_menu()
{
	R = 4;
	C = clamp(floor(global.select_level_index/R), 0, floor(ds_list_size(global.all_loaded_custom_levels)))
	
	#region /*Navigate Menu*/
	
	#region /*Key Up*/
	if (key_up)
	or(mouse_wheel_up())
	{
		if (can_input_level_name = false)
		and (menu_delay = 0)
		and (menu_joystick_delay <= 0)
		and (open_sub_menu = false)
		and (menu!= "back_from_level_editor")
		{
			if (global.select_level_index -R < 0)
			and (global.controls_used_for_menu_navigation != "mouse")
			{
				menu_delay = 3;
				menu = "back_from_level_editor";
			}
			else
			if (global.select_level_index -R > - 1)
			{
				global.select_level_index -= clamp(R, 0 , ds_list_size(global.all_loaded_custom_levels - 2/R));
				menu_delay = 3;
				if (mouse_wheel_up())
				{
					scroll_to = scroll - 1;
				}
				else
				{
					scroll_to = floor(global.select_level_index/R);
				}
				lerp_on = true;
			}
		}
	}
	#endregion /*Key Up END*/
	
	else
	
	#region /*Key Down*/
	if (key_down)
	or(mouse_wheel_down())
	{
		if (can_input_level_name = false)
		and (menu_delay = 0)
		and (menu_joystick_delay <= 0)
		and (open_sub_menu = false)
		and (menu!= "back_from_level_editor")
		{
			if (global.select_level_index +R > ds_list_size(global.thumbnail_sprite) - 1)
			and (global.controls_used_for_menu_navigation != "mouse")
			{
				menu_delay = 3;
				menu = "back_from_level_editor";
			}
			else
			if (global.select_level_index +R < ds_list_size(global.thumbnail_sprite))
			{
				global.select_level_index += clamp(R, 0 , ds_list_size(global.all_loaded_custom_levels - 2/R));
				menu_delay = 3;
				if (mouse_wheel_down())
				{
					scroll_to = scroll + 1
				}
				else
				{
					scroll_to = floor(global.select_level_index/R);
				}
				lerp_on = true;
			}
		}
	}
	#endregion /*Key Down END*/
	
	else
	
	#region /*Key Left*/
	if (key_left)
	and (can_input_level_name = false)
	and (menu_delay = 0)
	and (menu_joystick_delay <= 0)
	and (open_sub_menu = false)
	and (menu!= "back_from_level_editor")
	{
		if (global.select_level_index - 1 < 0)
		{
			global.select_level_index = ds_list_size(global.thumbnail_sprite) - 1;
		}
		else
		{
			global.select_level_index -= 1;
		}
		menu_delay = 3;
		scroll_to = floor(global.select_level_index/R);
		lerp_on = true;
	}
	#endregion /*Key Left END*/
	
	else
	
	#region /*Key Right*/
	if (key_right)
	and (can_input_level_name = false)
	and (menu_delay = 0)
	and (menu_joystick_delay <= 0)
	and (open_sub_menu = false)
	and (menu!= "back_from_level_editor")
	{
		if (global.select_level_index + 1 > ds_list_size(global.thumbnail_sprite) - 1)
		{
			global.select_level_index = 0;
		}
		else
		{
			global.select_level_index += 1;
		}
		menu_delay = 3;
		scroll_to = floor(global.select_level_index/R);
		lerp_on = true;
	}
	#endregion /*Key Right END*/
	
	else
	
	#region /*Key A Pressed*/
	if (key_a_pressed)
	or mouse_check_button_pressed(mb_left)
	{
		if (can_input_level_name = false)
		and (open_sub_menu = false)
		and (menu_delay = 0)
		and (menu!= "back_from_level_editor")
		{
		
			#region /*Create New Level*/
			if (global.select_level_index = 0)
			{
				scroll_to = floor(global.select_level_index/R);
				lerp_on = true;
				menu = "level_editor_create_from_scratch";
				menu_delay = 3;
				open_sub_menu = true;
			}
			#endregion /*Create New Level END*/
		
			else
		
			#region /*Open sub menu for levels*/
			if (global.select_level_index >= 1)
			{
				scroll_to = floor(global.select_level_index/R);
				lerp_on = true;
				menu = "level_editor_play";
				menu_delay = 3;
				open_sub_menu = true;
			}
			#endregion /*Open sub menu for levels END*/
		
		}
	}
	#endregion /*Key A Pressed END*/
	
	else
	
	#region /*Key B Pressed*/
	if (key_b_pressed)
	and (can_input_level_name = false)
	and (menu_delay = 0)
	{
		if (open_sub_menu = true)
		{
			menu_delay = 3;
			open_sub_menu = false;
			menu = "level_editor_play";
		}
	}
	#endregion /*Key B Pressed END*/
	
	#endregion /*Navigate Menu END*/
	
	#region /*Red Rectangle to indicate what level you are selecting*/
	if (menu!= "back_from_level_editor")
	{
		if (custom_level_select_blinking_old = 0)
		{
			custom_level_select_blinking = lerp(custom_level_select_blinking, 1, 0.1);
		}
		else
		if (custom_level_select_blinking_old = 1)
		{
			custom_level_select_blinking = lerp(custom_level_select_blinking, 0, 0.1);
		}
		if (custom_level_select_blinking >= 0.99)
		{
			custom_level_select_blinking_old = 1;
		}
		else
		if (custom_level_select_blinking <= 0.01)
		{
			custom_level_select_blinking_old = 0;
		}
		draw_rectangle_color(394 *(global.select_level_index -C*R) + 100 -3, 226*(C-scroll) + 250 -3, 394 *(global.select_level_index -C*R) + 100 + 384 + 3, 226*(C-scroll) + 250 + 216 + 3, c_red, c_red, c_red, c_red, false);
		draw_set_alpha(custom_level_select_blinking);
		draw_rectangle_color(394 *(global.select_level_index -C*R) + 100 -3, 226*(C-scroll) + 250 -3, 394 *(global.select_level_index -C*R) + 100 + 384 + 3, 226*(C-scroll) + 250 + 216 + 3, c_yellow, c_yellow, c_yellow, c_yellow, false);
		draw_set_alpha(1);
	}
	#endregion /*Red Rectangle to indicate what level you are selecting END*/
	
	#region /*Draw Thumbnail*/
	for(i = 0; i <ds_list_size(global.thumbnail_sprite); i += 1)
	{
		C= floor(i/R)
		draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, i), 0, 394 *(i-C*R) + 100, 226*(C-scroll) + 250, 384/sprite_get_width(ds_list_find_value(global.thumbnail_sprite, i)), 216/sprite_get_height(ds_list_find_value(global.thumbnail_sprite, i)), 0, c_white, 1);
	}
	#endregion /*Draw Thumbnail END*/
	
	C= floor(global.select_level_index/R); /*Do this code again here so the sub menu doesn't get misaligned*/
	
	#region /*Draw sub menu (code must be here to be above everything else)*/
	if (open_sub_menu = true)
	{
		
		#region /*Navigate Sub Menu*/
		if (key_up)
		and (can_input_level_name = false)
		and (menu_delay = 0)
		and (menu_joystick_delay <= 0)
		{
			if (menu = "level_editor_play")
			{
				menu = "level_editor_selected_back";
			}
			else
			if (menu = "level_editor_make")
			{
				menu = "level_editor_play";
			}
			else
			if (menu = "level_editor_selected_back")
			{
				menu = "level_editor_delete";
			}
			else
			if (menu = "level_editor_create_from_scratch")
			{
				menu = "level_editor_create_from_back";
			}
			else
			if (menu = "level_editor_create_from_template")
			{
				menu = "level_editor_create_from_scratch";
			}
			else
			if (menu = "level_editor_create_from_back")
			{
				menu = "level_editor_create_from_template";
			}
			else
			if (menu = "level_editor_delete")
			{
				menu = "level_editor_make";
			}
			else
			if (menu = "level_editor_delete_no")
			{
				menu = "level_editor_delete_yes";
			}
			else
			if (menu = "level_editor_delete_yes")
			{
				menu = "level_editor_delete_no";
			}
			menu_delay = 3;
		}
		else
		if (key_down)
		and (can_input_level_name = false)
		and (menu_delay = 0)
		and (menu_joystick_delay <= 0)
		{
			if (menu = "level_editor_play")
			{
				menu = "level_editor_make";
			}
			else
			if (menu = "level_editor_make")
			{
				menu = "level_editor_delete";
			}
			else
			if (menu = "level_editor_selected_back")
			{
				menu = "level_editor_play";
			}
			else
			if (menu = "level_editor_create_from_scratch")
			{
				menu = "level_editor_create_from_template";
			}
			else
			if (menu = "level_editor_create_from_template")
			{
				menu = "level_editor_create_from_back";
			}
			else
			if (menu = "level_editor_create_from_back")
			{
				menu = "level_editor_create_from_scratch";
			}
			else
			if (menu = "level_editor_delete")
			{
				menu = "level_editor_selected_back";
			}
			else
			if (menu = "level_editor_delete_no")
			{
				menu = "level_editor_delete_yes";
			}
			else
			if (menu = "level_editor_delete_yes")
			{
				menu = "level_editor_delete_no";
			}
			menu_delay = 3;
		}
		#endregion /*Navigate Sub Menu END*/
		
		#region /*Pressing the Create from Scratch button*/
		if (menu = "level_editor_create_from_scratch")
		and (can_input_level_name = false)
		and (menu_delay = 0)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) + 475-3, 394 *(global.select_level_index -C*R) + 110 -3+ 370, 226*(C-scroll) + 475-3+ 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation = "mouse")
			or(key_a_pressed)
			{
				menu_delay = 3;
				keyboard_string = "";
				can_input_level_name = true;
			}
		}
		#endregion /*Pressing the Create from Scratch button END*/
		
		#region /*Pressing the Create from Back button*/
		if (menu = "level_editor_create_from_back")
		and (can_input_level_name = false)
		and (menu_delay = 0)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) +569 -3, 394 *(global.select_level_index -C*R) + 110 -3+ 370, 226*(C-scroll) +569 -3+ 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation = "mouse")
			or(key_a_pressed)
			{
				menu_delay = 3;
				open_sub_menu = false;
				menu = "level_editor_play";
			}
		}
		#endregion /*Pressing the Create from Back button END*/
		
		#region /*Pressing the Back button when selecting level*/
		if (menu = "level_editor_selected_back")
		and (can_input_level_name = false)
		and (menu_delay = 0)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) + 616-3, 394 *(global.select_level_index -C*R) + 110 -3+ 370, 226*(C-scroll) + 616-3+ 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation = "mouse")
			or(key_a_pressed)
			{
				menu_delay = 3;
				open_sub_menu = false;
				menu = "level_editor_play";
			}
		}
		#endregion /*Pressing the Back button when selecting level END*/
		
		#region /*Pressing the Play button*/
		if (menu = "level_editor_play")
		and (can_input_level_name = false)
		and (menu_delay = 0)
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) + 475-3, 394 *(global.select_level_index -C*R) + 110 -3+ 370, 226*(C-scroll) + 475-3+ 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation = "mouse")
			or(key_a_pressed)
			{
				global.actually_play_edited_level = true;
				global.play_edited_level = true;
				can_navigate = false;
				menu_delay = 999;
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
		#endregion /*Pressing the Play button END*/
		
		#region /*Pressing the Make button*/
		if (menu = "level_editor_make")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) +522 -3, 394 *(global.select_level_index -C*R) + 110 -3+ 370, 226*(C-scroll) +522 -3+ 42))
			and (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation = "mouse")
			or(key_a_pressed)
			{
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_navigate = false;
				menu_delay = 999;
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
		#endregion /*Pressing the Make button END*/
		
		#region /*Key A Pressed*/
		if (key_a_pressed)
		and (can_input_level_name = false)
		and (menu_delay = 0)
		{
			
			#region /*Pressing the Delete button*/
			if (menu = "level_editor_delete")
			{
				menu_delay = 3;
				menu = "level_editor_delete_no";
			}
			#endregion /*Pressing the Delete button END*/
			
			else
			
			#region /*Pressing the No Delete button*/
			if (menu = "level_editor_delete_no")
			{
				menu_delay = 3;
				menu = "level_editor_delete"
			}
			#endregion /*Pressing the No Delete button END*/
			
		}
		#endregion /*Key A Pressed END*/
		
		#region /*Pressing the Create from Template button*/
		if (key_a_pressed)
		and (can_input_level_name = false)
		and (menu_delay = 0)
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) +522 -3, 394 *(global.select_level_index -C*R) + 110 -3+ 320, 226*(C-scroll) +522 -3+ 42))
		and (mouse_check_button_pressed(mb_left))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (can_input_level_name = false)
		and (menu_delay = 0)
		{
			if (menu = "level_editor_create_from_template")
			{
				file_found = "";
				file_load_timer = 0;
				level_find_pos = 0;
				ds_list_clear(global.thumbnail_sprite);
				menu_delay = 3;
				menu = "load_official_level_template";
			}
		}
		#endregion /*Pressing the Create from Template button END*/
		
		#region /*Pressing the Yes Delete button*/
		if (key_a_pressed)
		and (can_input_level_name = false)
		and (menu_delay = 0)
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) +569 -3, 394 *(global.select_level_index -C*R) + 110 -3+ 320, 226*(C-scroll) +569 -3+ 42))
		and (mouse_check_button_pressed(mb_left))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (can_input_level_name = false)
		and (menu_delay = 0)
		{
			if (menu = "level_editor_delete_yes")
			{
				if (directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))))
				{
					directory_destroy(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)));
				}
				global.select_level_index = 0;
				scr_load_custom_level_initializing();
				can_input_player1_name = false;
				can_input_player2_name = false;
				can_input_player3_name = false;
				can_input_player4_name = false;
				can_navigate = true;
				menu_delay = 3;
				open_sub_menu = false;
				player1_accept_selection = false;
				player2_accept_selection = false;
				player3_accept_selection = false;
				player4_accept_selection = false;
				menu = "load_custom_level";
			}
		}
		#endregion /*Pressing the Yes Delete button END*/
		
		#region /*Navigate Sub Menu*/
		if (can_input_level_name = false)
		{
			if (menu = "level_editor_play")
			or(menu = "level_editor_make")
			or(menu = "level_editor_delete")
			or(menu = "level_editor_selected_back")
			{
				draw_rectangle_color(394 *(global.select_level_index -C*R) + 100 -3, 226*(C-scroll) + 455-3, 394 *(global.select_level_index -C*R) + 100 + 384 + 3, 226*(C-scroll) + 408+ 216 + 47+ 3, c_white, c_white, c_white, c_white, false);
				draw_menu_button(394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) + 475-3, "Play", "level_editor_play", "level_editor_play");
				draw_menu_button(394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) +522 -3, "Make", "level_editor_make", "level_editor_make"); /*+ 47 on y*/
				draw_menu_button(394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) +569 -3, "Delete", "level_editor_delete", "level_editor_delete_no");
				draw_menu_button(394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) + 616-3, "Back", "level_editor_selected_back", "level_editor_selected_back");
			}
			else
			if (menu = "level_editor_create_from_scratch")
			or(menu = "level_editor_create_from_template")
			or(menu = "level_editor_create_from_back")
			{
				draw_rectangle_color(394 *(global.select_level_index -C*R) + 100 -3, 226*(C-scroll) + 455-3, 394 *(global.select_level_index -C*R) + 100 + 384 + 3, 226*(C-scroll) + 408+ 216 + 3, c_white, c_white, c_white, c_white, false);
				draw_menu_button(394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) + 475-3, "Create from Scratch", "level_editor_create_from_scratch", "level_editor_create_from_scratch");
				draw_menu_button(394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) +522 -3, "Create from Template", "level_editor_create_from_template", "level_editor_create_from_template"); /*+ 47 on y*/
				draw_menu_button(394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) +569 -3, "Back", "level_editor_create_from_back", "level_editor_create_from_back");
			}
			else
			if (menu = "level_editor_delete_no")
			or(menu = "level_editor_delete_yes")
			{
				draw_rectangle_color(394 *(global.select_level_index -C*R) + 100 -3, 226*(C-scroll) + 455-3, 394 *(global.select_level_index -C*R) + 100 + 384 + 3, 226*(C-scroll) + 408+ 216 + 3, c_red, c_red, c_red, c_red, false);
				draw_set_halign(fa_center);
				draw_set_valign(fa_center);
				draw_text_outlined(394 *(global.select_level_index -C*R) + 300 -3, 226*(C-scroll) + 485-3, "Delete Level?", global.default_text_size * 1.2, c_white, c_black, 1);
				draw_menu_button(394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) +522 -3, "No", "level_editor_delete_no", "level_editor_delete"); /*+ 47 on y*/
				draw_menu_button(394 *(global.select_level_index -C*R) + 110 -3, 226*(C-scroll) +569 -3, "Yes", "level_editor_delete_yes", "level_editor_delete_yes");
			}
		}
		#endregion /*Navigate Sub Menu END*/
		
	}
	#endregion /*Draw sub menu END*/
	
	#region /*Back Button*/
	draw_menu_button(0, 0, "Back", "back_from_level_editor", "back_from_level_editor");
	
	if (menu = "back_from_level_editor")
	and (key_a_pressed)
	and (menu_delay = 0)
	and (open_sub_menu = false)
	and (can_input_level_name = false)
	or(key_b_pressed)
	and (menu_delay = 0)
	and (open_sub_menu = false)
	and (can_input_level_name = false)
	or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, 0, 320, 42))
	and (mouse_check_button_pressed(mb_left))
	{
		can_input_level_name = false;
		menu_delay = 3;
		open_sub_menu = false;
		can_navigate = true;
		select_custom_level_menu_open = false;
		level_editor_template_select = false;
		global.select_level_index = 0;
		scroll_to = floor(global.select_level_index/R);
		lerp_on = true;
		menu = "leveleditor";
	}
	if (menu = "back_from_level_editor")
	and (key_up)
	and (menu_delay = 0)
	and (menu_joystick_delay <= 0)
	{
		menu_delay = 3;
		can_navigate = true;
		select_custom_level_menu_open = true;
		menu = "level_editor_play";
		if (global.select_level_index -R < 0)
		{
			global.select_level_index = ds_list_size(global.thumbnail_sprite) - 1;
		}
		scroll_to = floor(global.select_level_index/R);
		lerp_on = true;
	}
	if (menu = "back_from_level_editor")
	and (key_down)
	and (menu_delay = 0)
	and (menu_joystick_delay <= 0)
	{
		menu_delay = 3;
		can_navigate = true;
		select_custom_level_menu_open = true;
		menu = "level_editor_play";
		global.select_level_index = 0;
		scroll_to = floor(global.select_level_index/R);
		lerp_on = true;
	}
	
	if (menu = "back_from_level_editor")
	{
		open_sub_menu = false;
	}
	#endregion /*Back Button END*/
	
	#region /*Enter Custom Level*/
	if (iris_xscale <= 0.001)
	and (global.character_select_in_this_menu = "level_editor")
	{
		if (asset_get_type("snd_music_titlescreen") == asset_sound)
		{
			if (audio_is_playing(snd_music_titlescreen))
			{
				audio_stop_sound(snd_music_titlescreen);
			}
		}
		if (asset_get_type("room_leveleditor") == asset_room)
		{
			sprite_delete(title_screen_background);
			
			#region /*Update All Backgrounds*/
			
			sprite_delete(global.custom_background1);
			sprite_delete(global.custom_background2);
			sprite_delete(global.custom_background3);
			sprite_delete(global.custom_background4);
			sprite_delete(global.custom_foreground1);
			sprite_delete(global.custom_foreground_above_static_objects);
			sprite_delete(global.custom_foreground2);
			sprite_delete(global.custom_foreground_secret);
			
			#region /*Update Background1*/
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.bmp")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.bmp", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_vtiled[0]= true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.bmp")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.bmp", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.png")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.png", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.png")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.png", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.gif")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.gif", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.gif")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.gif", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.jpg")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background1.jpg", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.jpg")){global.custom_background1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background1.jpg", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			{
				global.custom_background1 = noone;
			}
			#endregion /*Update Background1 END*/
			
			#region /*Update Background2*/
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.bmp")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.bmp", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_vtiled[0]= true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.bmp")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.bmp", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.png")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.png", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.png")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.png", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.gif")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.gif", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.gif")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.gif", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.jpg")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background2.jpg", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.jpg")){global.custom_background2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background2.jpg", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			{
				global.custom_background2 = noone;
			}
			#endregion /*Update Background2 END*/
			
			#region /*Update Background3*/
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.bmp")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.bmp", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_vtiled[0]= true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.bmp")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.bmp", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.png")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.png", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.png")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.png", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.gif")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.gif", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.gif")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.gif", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.jpg")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background3.jpg", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.jpg")){global.custom_background3 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background3.jpg", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			{
				global.custom_background3 = noone;
			}
			#endregion /*Update Background3 END*/
			
			#region /*Update Background4 */
			/*BMP small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.bmp")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.bmp", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_vtiled[0]= true;}else
			/*BMP big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.bmp")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.bmp", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*PNG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.png")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.png", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*PNG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.png")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.png", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*Gif (small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.gif")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.gif", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*Gif (big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.gif")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.gif", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*JPG small letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.jpg")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/background4.jpg", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			/*JPG big letter File*/if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.jpg")){global.custom_background4 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Background4.jpg", 0, false, false, 0, 0);layer_background_htiled[0]= true;layer_background_htiled[0]= true;}else
			{
				global.custom_background4 = noone;
			}
			#endregion /*Update Background4 END*/
						
			#region /*Update Foreground1*/
			
			#region /*BMP small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground1 = noone;
			}
			
			#endregion /*Update Foreround1 END*/
			
			#region /*Update Foreground above static objects custom level*/
			
			#region /*BMP small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg"))
			{
				global.custom_foreground_above_static_objects = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_above_static_objects.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground_above_static_objects = noone;
			}
			
			#endregion /*Update Foreround above static objects custom level END*/
			
			#region /*Update Foreground2*/
			
			#region /*BMP small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground2 = noone;
			}
			
			#endregion /*Update Foreround2 END*/
			
			#region /*Update Foreground secret*/
			
			#region /*BMP small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/foreground_secret.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg")
			{
				global.custom_foreground_secret = sprite_add(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds/Foreground_secret.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground_secret = noone;
			}
			
			#endregion /*Update Foreround secret END*/
			
			#endregion /*Update All Backgrounds END*/
			
			#region /*Create Ground Tileset PNG if there is none*/
			if (global.character_select_in_this_menu = "level_editor")
			and (global.level_name != "")
			and (!file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/ground_tileset.png"))
			{
				#region /*Save sprite in directory*/
				sprite_variable = sprite_duplicate(spr_ground_tileset);
				sprite_save(sprite_variable, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/ground_tileset.png");
				#endregion /*Save sprite in directory END*/
			}
			#endregion /*Create Ground Tileset PNG if there is none END*/
			
			#region /*Level Tileset File*/
			sprite_delete(global.custom_tileset);
			
			if (global.character_select_in_this_menu = "level_editor")
			and (global.level_name != "")
			and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/ground_tileset.png"))
			{
				global.custom_tileset = sprite_add(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/ground_tileset.png", 0, false, false, 0, 0);
			}
			else
			{
				global.custom_tileset = noone;
			}
			#endregion /*Level Tileset File END*/
			
			room_goto(room_leveleditor);
		}
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
	}
	#endregion /*Enter Custom Level END*/
	
	#region /*Load Level Name*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
	{
		ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
		if (ini_key_exists("info", "level_name"))
		{
			level_name = ini_read_string("info", "level_name", 0);
		}
		else
		{
			level_name = "";
		}
		ini_close();
	}
	else
	{
		level_name = "";
	}
	#endregion /*Load Level Name END*/
	
	#region /*Input Level Name*/
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	
	#region /*Opaque transparent black box*/
	if (can_input_level_name = true)
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	#endregion /*Opaque transparent black box END*/
	
	#region /*Box where name is written on*/
	if (can_input_level_name = true)
	{
		draw_set_alpha(1);
		draw_rectangle_color(394 *(global.select_level_index -C*R) + 300 -3 - 150, 226*(C-scroll) +569 -3 - 16, 394 *(global.select_level_index -C*R) + 300 -3+ 150, 226*(C-scroll) +569 -3+ 16, c_white, c_white, c_white, c_white, false);
	
		draw_set_alpha(1);
		draw_rectangle_color(394 *(global.select_level_index -C*R) + 300 -3 - 150, 226*(C-scroll) +569 -3 - 16, 394 *(global.select_level_index -C*R) + 300 -3+ 150, 226*(C-scroll) +569 -3+ 16, c_black, c_black, c_black, c_black, true);
	}
	#endregion /*Box where name is written on END*/
	
	#region /*Inputed Name Text*/
	if (can_input_level_name = true)
	{
		if (name_enter_blink< 1)
		{
			draw_text_outlined(394 *(global.select_level_index -C*R) + 300, 226*(C-scroll) +569 -3, string(global.level_name) + "|", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			draw_text_outlined(394 *(global.select_level_index -C*R) + 300, 226*(C-scroll) +569 -3, string(global.level_name), global.default_text_size, c_black, c_white, 1);
		}
	}
	#endregion /*Inputed Name Text END*/
	
	#region /*INPUT LEVEL NAME NOW*/
	if (can_input_level_name = true)
	{
		keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_words, true); /*Show virtual keyboard on mobile devices*/
		
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		var _key = keyboard_lastchar;
		if (ord(_key) != ord("\\"))
		and (ord(_key) != ord("/"))
		and (ord(_key) != ord(":"))
		and (ord(_key) != ord("*"))
		and (ord(_key) != ord("?"))
		and (ord(_key) != ord("\""))
		and (ord(_key) != ord("<"))
		and (ord(_key) != ord(">"))
		and (ord(_key) != ord("|"))
		{
			global.level_name = keyboard_string;
		}
		else
		{
			keyboard_string = string_copy(global.level_name, 1, 120);
		}
		
		#region /*Limit Name Input Length for Level*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		if (string_length(global.level_name) >= 120)
		{
			draw_text_outlined(394 * (global.select_level_index - C * R) + 400, 226 * (C - scroll) + 606, "120/120", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			draw_text_outlined(394 * (global.select_level_index - C * R) + 400, 226 * (C - scroll) + 606, string(string_length(global.level_name)) + "/120", global.default_text_size, c_black, c_ltgray, 1);
		}
		
		#region /*OK and Cancel buttons under name input*/
		if (keyboard_string != "")
		{
			draw_menu_button(394 * (global.select_level_index - C * R) + 100, 226 * (C - scroll) + 606 + 32, "OK", "level_editor_enter_name_ok", "level_editor_enter_name_ok");
			if (gamepad_is_connected(0))
			and (asset_get_type("spr_xbox_buttons") == asset_sprite)
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_sprite_ext(spr_xbox_buttons, 0, 394 * (global.select_level_index - C * R) + 440, 226 * (C - scroll) + 606 + 21 + 32, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_enter, 394 * (global.select_level_index - C * R) + 440, 226 * (C - scroll) + 606 + 21 + 32, 0.5, 0.5, 0, c_white, 1);
			}
		}
		draw_menu_button(394 * (global.select_level_index - C * R) + 100, 226 * (C - scroll) + 606 + 74, "Cancel", "level_editor_enter_name_cancel", "level_editor_enter_name_cancel");
		if (gamepad_is_connected(0))
		and (asset_get_type("spr_xbox_buttons") == asset_sprite)
		and (global.controls_used_for_menu_navigation = "controller")
		{
			draw_sprite_ext(spr_xbox_buttons, 1, 394 * (global.select_level_index - C * R) + 440, 226 * (C - scroll) + 606 + 74 + 22, 0.5, 0.5, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, vk_escape, 394 * (global.select_level_index - C * R) + 440, 226 * (C - scroll) + 606 + 74 + 22, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /*OK and Cancel buttons under name input END*/
		
		if (global.controls_used_for_menu_navigation != "mouse")
		{
			menu = "level_editor_create_from_scratch";
		}
		
		if (string_length(global.level_name) > 120)
		{
			global.level_name = string_copy(global.level_name, 1, 120);
		}
		#endregion /*Limit Name Input Length for Name END*/
		
	}
	#endregion /*INPUT LEVEL NAME NOW END*/
	
	#region /*Name Enter Blinking*/
	name_enter_blink+= 0.05;
	if (name_enter_blink> 1.5)
	{
		name_enter_blink= 0;
	}
	#endregion /*Name Enter Blinking END*/
	
	#region /*Press Enter to make new level from scratch*/
	if (keyboard_check_pressed(vk_enter))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	and (keyboard_string != "")
	or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - C * R) + 100, 226 * (C - scroll) + 606 + 32, 394 * (global.select_level_index - C * R) + 100 + 370, 226 * (C - scroll) + 606 + 32 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	and (keyboard_string != "")
	or(gamepad_button_check_pressed(0, gp_face1))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	and (keyboard_string != "")
	or(gamepad_button_check_pressed(1, gp_face1))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	and (keyboard_string != "")
	or(gamepad_button_check_pressed(2, gp_face1))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	and (keyboard_string != "")
	or(gamepad_button_check_pressed(3, gp_face1))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	and (keyboard_string != "")
	{
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
		can_navigate = false;
		menu_delay = 999;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				iris_zoom = 0;
			}
		}
		can_input_level_name = false;
	}
	#endregion /*Press Enter to make new level from scratch END*/
	
	#region /*Press Escape to back out from level from scratch menu*/
	if (keyboard_check_pressed(vk_escape))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (global.select_level_index - C * R) + 100, 226 * (C - scroll) + 606 + 74, 394 * (global.select_level_index - C * R) + 100 + 370, 226 * (C - scroll) + 606 + 74 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	or(mouse_check_button_pressed(mb_right))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	or(gamepad_button_check_pressed(0, gp_face2))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	or(gamepad_button_check_pressed(1, gp_face2))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	or(gamepad_button_check_pressed(2, gp_face2))
	and (can_input_level_name = true)
	and (menu_delay = 0)
	or(gamepad_button_check_pressed(3, gp_face2))
	and (can_input_level_name = true)
	and (menu_delay = 0)
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
		menu = "level_editor_create_from_scratch";
	}
	#endregion /*Press Escape to back out from level from scratch menu END*/
	
	#endregion /*Input Level Name END*/
	
}