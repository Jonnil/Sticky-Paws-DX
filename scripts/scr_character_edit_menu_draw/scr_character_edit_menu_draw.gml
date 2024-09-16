function scr_character_edit_menu_draw()
{
	/* Keep the actual player on-screen */
	if (instance_exists(obj_player))
	{
		obj_player.x = -999;
		obj_player.y = -999;
	}
	
	if (menu == "edit_character_load")
	{
		scr_draw_loading(1, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "Loading Character");
		
		if (menu_delay == 19)
		{
			edit_character_sprite_index = spr_noone;
			edit_character_mask_index = spr_noone;
			edit_character_image_index = 0;
			edit_character_sprite_name = "idle";
			what_character_name = string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]));
			can_input_sprite_name = false;
			global.show_collision_mask = true;
			
			if (!instance_exists(obj_player))
			{
				with(instance_create_depth(-999, -999, 0, obj_player))
				{
					/* Create a player 1 object which loads all the graphics and attributes, that this script can take reference from */
					custom_character = global.character_for_player[1];
					selected_voicepack = global.voicepack_for_player[1];
					selected_skin = global.skin_for_player[1];
					player = 1;
					can_move = false;
				}
			}
		}
		else
		if (menu_delay == 10)
		{
			if (instance_exists(obj_player))
			{
				edit_character_sprite_index = scr_select_first_valid_sprite(obj_player.sprite_idle, obj_player.sprite_walk);
				edit_character_mask_index = scr_select_first_valid_sprite(obj_player.sprite_mask);
				
				ini_open(game_save_id + "custom_characters/" + string(what_character_name) + "/data/sprite_origin_point.ini");
				spr_origin_x = ini_read_real("sprite origin points", "sprite_" + string(edit_character_sprite_name) + "_xorig", 0);
				spr_origin_y = ini_read_real("sprite origin points", "sprite_" + string(edit_character_sprite_name) + "_yorig", 0);
				ini_close(); switch_save_data_commit();
			}
		}
		if (menu_delay == 5)
		{
			menu = "edit_charcter_back";
		}
	}
	else
	if (menu == "edit_charcter_back")
	|| (menu == "open_folder_edit_character")
	|| (menu == "open_custom_character_guide")
	|| (menu == "edit_charcter_input_sprite")
	|| (menu == "input_sprite_name_ok")
	|| (menu == "input_sprite_name_cancel")
	|| (menu == "sprite_not_exist_warning")
	|| (menu == "sprite_not_exist_folder")
	|| (menu == "sprite_not_exist_guide")
	{
		/* Variables for scaling */
		var xscale = 5;
		var yscale = 5;
		
		/* Calculate the position to draw the sprite (centered on the screen) */
		var draw_x = display_get_gui_width() * 0.5;
		var draw_y = display_get_gui_height() * 0.5;
		
		/* Set the floor position to be underneath the mask height */
		var floor_y = draw_y + (sprite_get_height(edit_character_mask_index) * (yscale * 0.5));
		draw_sprite_ext(spr_edit_character_background, 0, -320, floor_y, 5, 5, 0, c_white, 1);
		
		var open_character_folder_y = 42;
		if (global.enable_open_custom_folder)
		{
			var custom_character_guide_y = open_character_folder_y + 42;
		}
		else
		{
			var custom_character_guide_y = 42;
		}
		
		if (!can_input_sprite_name)
		&& (menu != "sprite_not_exist_warning")
		&& (menu != "sprite_not_exist_folder")
		&& (menu != "sprite_not_exist_guide")
		{
			draw_menu_button(0, 0, l10n_text("Back"), "edit_charcter_back", "edit_character_actually_back");
			draw_sprite_ext(spr_icon_back, 0, 16, 21, 1, 1, 0, c_white, 1);
			
			#region /* Open Character Folder */
			if (global.enable_open_custom_folder)
			{
				draw_menu_button(0, open_character_folder_y, l10n_text("Open Character Folder"), "open_folder_edit_character", "open_folder_edit_character");
				draw_sprite_ext(spr_icon_folder, 0, 16, open_character_folder_y + 21, 1, 1, 0, c_white, 1);
			}
			#endregion /* Open Character Folder END */
			
			#region /* Open Custom Character Guide */
			var custom_character_guide_x = 0;
			draw_menu_button(custom_character_guide_x, custom_character_guide_y, l10n_text("Custom Character Guide"), "open_custom_character_guide", "open_custom_character_guide");
			if (menu == "open_custom_character_guide")
			{
				draw_set_halign(fa_left);
				scr_draw_text_outlined(custom_character_guide_x + 380, custom_character_guide_y + 21, string(global.link_to_website_guide_custom_character), global.default_text_size, c_black, c_white, 1);
				draw_set_halign(fa_center);
			}
			
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), custom_character_guide_x, custom_character_guide_y + 2, custom_character_guide_x + 371, custom_character_guide_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			|| (menu == "sprite_not_exist_guide")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				url_open(global.link_to_website_guide_custom_character);
			}
			#endregion /* Open Custom Character Guide END */
			
		}
		
		var sprite_name_x = 185;
		var sprite_name_y = custom_character_guide_y + 84;
		scr_draw_name_box(edit_character_sprite_name, c_white, 0.5, sprite_name_x, sprite_name_y);
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), sprite_name_x - 150, sprite_name_y - 16, sprite_name_x + 150, sprite_name_y + 16))
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(sprite_name_x - 150, sprite_name_y - 16, sprite_name_x + 150, sprite_name_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				keyboard_string = string(edit_character_sprite_name);
				can_input_sprite_name = true;
				menu = "input_sprite_name_ok";
			}
		}
		
		if (menu == "edit_charcter_back")
		&& (key_a_pressed || key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!can_input_sprite_name)
		{
			menu = "edit_character_actually_back";
			menu_delay = 3;
		}
		
		#region /* Open Character Folder */
		if (!can_input_sprite_name)
		&& (global.enable_open_custom_folder)
		{
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, open_character_folder_y + 2, 371, open_character_folder_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			|| (menu == "open_folder_edit_character")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				menu = "open_folder_edit_character";
			
				if (directory_exists(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "\\sprites"))
				{
					scr_open_folder(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "\\sprites");
				}
				else
				if (directory_exists(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
				{
					scr_open_folder(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])));
				}
				else
				if (directory_exists("characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
				{
					scr_open_folder(game_save_id + "\custom_characters\\");
				}
			}
		}
		#endregion /* Open Character Folder END */
		
		if (sprite_exists(edit_character_sprite_index)) /* Check if the sprite exists */
		{
		    /* Get the origin offsets */
		    var spr_origin_x = sprite_get_xoffset(edit_character_sprite_index);
		    var spr_origin_y = sprite_get_yoffset(edit_character_sprite_index);
    
		    /* Calculate the sprite's width and height considering scaling */
		    var edit_character_sprite_width = sprite_get_width(edit_character_sprite_index) * xscale;
		    var edit_character_sprite_height = sprite_get_height(edit_character_sprite_index) * yscale;
    
		    /* Draw the main character sprite */
		    draw_sprite_ext(edit_character_sprite_index, edit_character_image_index, draw_x, draw_y, xscale, yscale, 0, c_white, 1);
			
			/* Draw the mask above the character sprite */
			if (sprite_exists(edit_character_mask_index)) /* Check if the mask exists */
			{
				draw_sprite_ext(edit_character_mask_index, edit_character_image_index, draw_x, draw_y, xscale, yscale, 0, c_white, 0.5);
			}
			
			/* Draw the floor */
			draw_line_width_color(0, floor_y, display_get_gui_width(), floor_y, 1, c_red, c_red);
			draw_set_alpha(0.5);
			draw_rectangle_color(0, floor_y, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
			
		    #region /* Draw a crosshair centered on the character sprite */
			var crosshair_center_x = draw_x - (spr_origin_x * xscale) + (edit_character_sprite_width * 0.5)
			var crosshair_center_y = draw_y - (spr_origin_y * yscale) + (edit_character_sprite_height * 0.5)
			
			var crosshair_size = scr_wave(32, 42, 2);
			draw_set_alpha(0.5);
			draw_rectangle_color(crosshair_center_x - crosshair_size - 1, crosshair_center_y - 1, crosshair_center_x + crosshair_size + 1, crosshair_center_y + 1, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(crosshair_center_x - 1, crosshair_center_y - crosshair_size - 1, crosshair_center_x + 1, crosshair_center_y + crosshair_size + 1, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(crosshair_center_x - crosshair_size, crosshair_center_y, crosshair_center_x + crosshair_size, crosshair_center_y, c_red, c_red, c_red, c_red, c_red);
			draw_rectangle_color(crosshair_center_x, crosshair_center_y - crosshair_size, crosshair_center_x, crosshair_center_y + crosshair_size, c_red, c_red, c_red, c_red, c_red);
			
		    #endregion /* Draw a crosshair centered on the character sprite END */
		}
		
		#region /* Crosshair for Sprite Origin Point */
		var crosshair_size = scr_wave(2, 10, 1);
		draw_set_alpha(1);
		draw_rectangle_color(display_get_gui_width() * 0.5 - crosshair_size - 1, display_get_gui_height() * 0.5 - 1, display_get_gui_width() * 0.5 + crosshair_size + 1, display_get_gui_height() * 0.5 + 1, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(display_get_gui_width() * 0.5 - 1, display_get_gui_height() * 0.5 - crosshair_size - 1, display_get_gui_width() * 0.5 + 1, display_get_gui_height() * 0.5 + crosshair_size + 1, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(display_get_gui_width() * 0.5 - crosshair_size, display_get_gui_height() * 0.5, display_get_gui_width() * 0.5 + crosshair_size, display_get_gui_height() * 0.5, c_white, c_white, c_white, c_white, false);
		draw_rectangle_color(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - crosshair_size, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + crosshair_size, c_white, c_white, c_white, c_white, false);
		#endregion /* Crosshair for Sprite Origin Point END */
		
		#region /* Move Origin Point */
		if (!can_input_sprite_name)
		&& (menu != "sprite_not_exist_warning")
		&& (menu != "sprite_not_exist_folder")
		&& (menu != "sprite_not_exist_guide")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 2;
				if (keyboard_check(vk_control))
				{
					spr_origin_y -= 10;
				}
				else
				{
					spr_origin_y --;
				}
				ini_open(game_save_id + "custom_characters/" + string(what_character_name) + "/data/sprite_origin_point.ini");
				ini_write_real("sprite origin points", "sprite_" + string(edit_character_sprite_name) + "_xorig", spr_origin_x);
				ini_close(); switch_save_data_commit();
				sprite_set_offset(edit_character_sprite_index, spr_origin_x, spr_origin_y);
			}
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 2;
				if (keyboard_check(vk_control))
				{
					spr_origin_y += 10;
				}
				else
				{
					spr_origin_y ++;
				}
				ini_open(game_save_id + "custom_characters/" + string(what_character_name) + "/data/sprite_origin_point.ini");
				ini_write_real("sprite origin points", "sprite_" + string(edit_character_sprite_name) + "_xorig", spr_origin_x);
				ini_close(); switch_save_data_commit();
				sprite_set_offset(edit_character_sprite_index, spr_origin_x, spr_origin_y);
			}
			if (key_left)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 2;
				if (keyboard_check(vk_control))
				{
					spr_origin_x -= 10;
				}
				else
				{
					spr_origin_x --;
				}
				ini_open(game_save_id + "custom_characters/" + string(what_character_name) + "/data/sprite_origin_point.ini");
				ini_write_real("sprite origin points", "sprite_" + string(edit_character_sprite_name) + "_xorig", spr_origin_x);
				ini_close(); switch_save_data_commit();
				sprite_set_offset(edit_character_sprite_index, spr_origin_x, spr_origin_y);
			}
			if (key_right)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 2;
				if (keyboard_check(vk_control))
				{
					spr_origin_x += 10;
				}
				else
				{
					spr_origin_x ++;
				}
				ini_open(game_save_id + "custom_characters/" + string(what_character_name) + "/data/sprite_origin_point.ini");
				ini_write_real("sprite origin points", "sprite_" + string(edit_character_sprite_name) + "_xorig", spr_origin_x);
				ini_close(); switch_save_data_commit();
				sprite_set_offset(edit_character_sprite_index, spr_origin_x, spr_origin_y);
			}
		}
		#endregion /* Move Origin Point END */
		
		/* Draw character sprite stats in top-left of screen */
		draw_set_halign(fa_top);
		draw_set_valign(fa_left);
		scr_draw_text_outlined(32, sprite_name_y + 42,
		l10n_text("X Offset") + ": " + string(spr_origin_x) + "\n" +
		l10n_text("Y Offset") + ": " + string(spr_origin_y) + "\n" +
		l10n_text("Sprite Width") + ": " + string(sprite_get_width(edit_character_sprite_index)) + "\n" +
		l10n_text("Sprite Height") + ": " + string(sprite_get_height(edit_character_sprite_index)) + "\n"
		,global.default_text_size, c_black, c_white, 1);
		
		if (can_input_sprite_name)
		{
			edit_character_sprite_name = scr_draw_name_input_screen(edit_character_sprite_name, 100, c_white, 0.5, true, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "input_sprite_name_ok", "input_sprite_name_cancel", false, true, false);
			
			if (global.clicking_ok_input_screen)
			{
				if (instance_exists(obj_player))
				{
					var get_sprite_name = variable_instance_get(obj_player, "sprite_" + string(edit_character_sprite_name));
					if (variable_instance_exists(obj_player, "sprite_" + string(edit_character_sprite_name)))
					{
						edit_character_sprite_index = scr_select_first_valid_sprite(get_sprite_name); /* Update what sprite you edit */
						edit_character_mask_index = scr_select_first_valid_sprite(obj_player.sprite_mask); /* Update the mask sprite */
						ini_open(game_save_id + "custom_characters/" + string(what_character_name) + "/data/sprite_origin_point.ini");
						spr_origin_x = ini_read_real("sprite origin points", "sprite_" + string(edit_character_sprite_name) + "_xorig", 0);
						spr_origin_y = ini_read_real("sprite origin points", "sprite_" + string(edit_character_sprite_name) + "_yorig", 0);
						ini_close(); switch_save_data_commit();
					}
					else
					{
						menu = "sprite_not_exist_warning";
					}
				}
				menu_delay = 3;
				can_input_sprite_name = false;
			}
			else
			if (global.clicking_cancel_input_screen)
			{
				menu_delay = 3;
				can_input_sprite_name = false;
			}
		}
		
		#region /* If sprite doesn't exist when searching for it */
		if (menu == "sprite_not_exist_warning")
		|| (menu == "sprite_not_exist_folder")
		|| (menu == "sprite_not_exist_guide")
		{
			/* When the sprite doesn't exist when you search for it, warn the player of this, and the player has to click "ok" */
			draw_set_alpha(0.9);
			draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 160, string(edit_character_sprite_name) + ": " + l10n_text("Sprite does not exist"), global.default_text_size * 1.5, c_black, c_white, 1);
			
			if (global.enable_open_custom_folder)
			{
				var sprite_not_exist_folder_x = display_get_gui_width() * 0.5 - 185;
				var sprite_not_exist_folder_y = display_get_gui_height() * 0.5 - 64;
				scr_draw_text_outlined(display_get_gui_width() * 0.5, sprite_not_exist_folder_y - 32, l10n_text("Open the Character Sprite folder to see what sprites exists"), global.default_text_size, c_black, c_white, 1);
				draw_menu_button(sprite_not_exist_folder_x, sprite_not_exist_folder_y, l10n_text("Open Character Folder"), "sprite_not_exist_folder", "sprite_not_exist_folder");
				draw_sprite_ext(spr_icon_folder, 0, sprite_not_exist_folder_x + 16, sprite_not_exist_folder_y + 21, 1, 1, 0, c_white, 1);
				
				if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), sprite_not_exist_folder_x, sprite_not_exist_folder_y + 2, sprite_not_exist_folder_x + 371, sprite_not_exist_folder_y + 42))
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (can_navigate)
				|| (menu == "sprite_not_exist_folder")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (can_navigate)
				{
					menu_delay = 3;
					menu = "sprite_not_exist_folder";
					
					if (directory_exists(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "\\sprites"))
					{
						scr_open_folder(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "\\sprites");
					}
					else
					if (directory_exists(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
					{
						scr_open_folder(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])));
					}
					else
					if (directory_exists("characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
					{
						scr_open_folder(game_save_id + "\custom_characters\\");
					}
				}
			}
			
			var sprite_not_exist_guide_x = display_get_gui_width() * 0.5 - 370;
			var sprite_not_exist_guide_y = display_get_gui_height() * 0.5 + 64;
			scr_draw_text_outlined(display_get_gui_width() * 0.5, sprite_not_exist_guide_y - 32, l10n_text("Open the Custom Character Guide if you need help"), global.default_text_size, c_black, c_white, 1);
			draw_menu_button_sprite(spr_menu_button, sprite_not_exist_guide_x, sprite_not_exist_guide_y, 0, 0, 2, 1, 370 * 2, 42, l10n_text(string(global.link_to_website_guide_custom_character)), "sprite_not_exist_guide", "sprite_not_exist_guide");
			
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), sprite_not_exist_guide_x, sprite_not_exist_guide_y + 2, sprite_not_exist_guide_x + (371 * 2), sprite_not_exist_guide_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			|| (menu == "sprite_not_exist_guide")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				url_open(global.link_to_website_guide_custom_character);
			}
			
			var sprite_not_exist_back_x = display_get_gui_width() * 0.5 - 185;
			var sprite_not_exist_back_y = display_get_gui_height() * 0.5 + 128;
			draw_menu_button(sprite_not_exist_back_x, sprite_not_exist_back_y, l10n_text("Back"), "sprite_not_exist_warning", "sprite_not_exist_warning");
			draw_sprite_ext(spr_icon_back, 0, sprite_not_exist_back_x + 16, sprite_not_exist_back_y + 21, 1, 1, 0, c_white, 1);
			
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), sprite_not_exist_back_x, sprite_not_exist_back_y + 2, sprite_not_exist_back_x + 371, sprite_not_exist_back_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			|| (menu == "sprite_not_exist_warning")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate)
			{
				menu_delay = 3;
				keyboard_string = string(edit_character_sprite_name);
				can_input_sprite_name = true;
				menu = "input_sprite_name_ok";
			}
			
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (menu == "sprite_not_exist_warning")
				{
					menu = "sprite_not_exist_guide";
				}
				else
				if (menu == "sprite_not_exist_folder")
				{
					menu = "sprite_not_exist_warning";
				}
				else
				if (menu == "sprite_not_exist_guide")
				{
					menu = "sprite_not_exist_folder";
				}
			}
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (menu == "sprite_not_exist_warning")
				{
					menu = "sprite_not_exist_folder";
				}
				else
				if (menu == "sprite_not_exist_folder")
				{
					menu = "sprite_not_exist_guide";
				}
				else
				if (menu == "sprite_not_exist_guide")
				{
					menu = "sprite_not_exist_warning";
				}
			}
		}
		#endregion /* If sprite doesn't exist when searching for it END */
		
	}
	else
	if (menu == "edit_character_actually_back")
	{
		if (instance_exists(obj_player))
		{
			with(obj_player)
			{
				instance_destroy();
			}
		}
		sprite_index = spr_noone;
		global.show_collision_mask = false;
		in_edit_character_menu = false;
		menu = "click_edit_character";
	}
}