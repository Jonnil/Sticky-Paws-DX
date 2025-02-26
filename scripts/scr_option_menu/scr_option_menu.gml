function scr_option_menu()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var fixed_player = 1;
	
	#region /* Background Brightness in Menus Options */
	if (background_brightness_menu_lerp < 0)
	{
		draw_set_alpha(abs(background_brightness_menu_lerp));
		draw_rectangle_color(- 32, - 32, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	else
	if (background_brightness_menu_lerp > 0)
	{
		draw_set_alpha(abs(background_brightness_menu_lerp));
		draw_rectangle_color(- 32, - 32, display_get_gui_width(), display_get_gui_height(), c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	#endregion /* Background Brightness in Menus Options END */
	
	#region /* Black Background behind sidebar */
	draw_set_alpha(1);
	draw_rectangle_color(left_sidebar_x + 0, 0, left_sidebar_x + 370, get_window_height, c_black, c_black, c_black, c_black, false);
	#endregion /* Black Background behind sidebar END */
	
	#region /* Set Font */
	var text_x_offset = 0;
	var icon_x_offset = 0;
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	#endregion /* Set Font END */
	
	#region /* Tabs Graphics */
	if (left_sidebar_x > -400)
	{
		
		#region /* Menu navigation tabs y positions */
		accessibility_settings_y = 40;
		if (global.enable_how_to_play_settings)
		{
			how_to_play_y = accessibility_settings_y + 40;
			game_text_y = how_to_play_y + 40;
		}
		else
		{
			how_to_play_y = -999;
			game_text_y = accessibility_settings_y + 40;
		}
		game_settings_y = game_text_y + 40;
		if (global.enable_multiplayer_settings)
		{
			multiplayer_settings_y = game_settings_y + 40;
			controls_text_y = multiplayer_settings_y + 40;
		}
		else
		{
			multiplayer_settings_y = -999;
			controls_text_y = game_settings_y + 40;
		}
		if (global.enable_keyboard_and_mouse_settings)
		{
			keyboard_and_mouse_settings_y = controls_text_y + 40;
			controller_settings_y = keyboard_and_mouse_settings_y + 40;
		}
		else
		{
			keyboard_and_mouse_settings_y = -999;
			controller_settings_y = controls_text_y + 40;
		}
		if (global.enable_touch_settings)
		{
			touch_settings_y = controller_settings_y + 40;
			general_text_y = touch_settings_y + 40;
		}
		else
		{
			touch_settings_y = -999;
			general_text_y = controller_settings_y + 40;
		}
		if (global.enable_account_settings)
		{
			account_settings_y = general_text_y + 40;
			video_settings_y = account_settings_y + 40;
		}
		else
		{
			account_settings_y = -999;
			video_settings_y = general_text_y + 40;
		}
		audio_settings_y = video_settings_y + 40;
		custom_resources_settings_y = audio_settings_y + 40;
		storage_settings_y = custom_resources_settings_y + 40;
		language_settings_y = storage_settings_y + 40;
		if (global.enable_broadcast_settings)
		{
			broadcast_settings_y = language_settings_y + 40;
		}
		else
		{
			broadcast_settings_y = -999;
		}
		#endregion /* Menu navigation tabs y positions END */
		
		#region /* Accessibility Settings */
		if (global.settings_sidebar_menu == "accessibility_settings")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, accessibility_settings_y, 370, accessibility_settings_y + 39))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + accessibility_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + accessibility_settings_y, 1, 1, 0, c_gray, 1);
			}
			/* Button Hightlighted */
			
			draw_sprite_ext(spr_settings_icon, 1, left_sidebar_x + 20 + icon_x_offset, 20 + accessibility_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + accessibility_settings_y, l10n_text("Accessibility"), global.default_text_size * 1.05, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + accessibility_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + accessibility_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icon, 1, left_sidebar_x + 20 + icon_x_offset, 20 + accessibility_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + accessibility_settings_y, l10n_text("Accessibility"), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* Accessibility Settings END */
		
		#region /* My Game Settings */
		scr_draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (game_text_y), l10n_text("Game"), global.default_text_size * 0.5, c_black, c_white, 1);
		
		#region /* Game Settings */
		if (global.settings_sidebar_menu == "game_settings")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, game_settings_y, 370, game_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icon, 2, left_sidebar_x + 20 + icon_x_offset, 20 + game_settings_y, 1, 1, 0, c_white, 1) /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + game_settings_y, l10n_text("Game"), global.default_text_size * 1.05, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, game_settings_y, 370, game_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icon, 2, left_sidebar_x + 20 + icon_x_offset, 20 + game_settings_y, 0.9, 0.9, 0, c_white, 1)
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + game_settings_y, l10n_text("Game"), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* Game Settings END */
		
		#region /* Multiplayer Settings */
		if (global.enable_multiplayer_settings)
		{
			if (global.settings_sidebar_menu == "multiplayer_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icon, 3, left_sidebar_x + 20 + icon_x_offset, 20 + multiplayer_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + multiplayer_settings_y, l10n_text("Multiplayer"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icon, 3, left_sidebar_x + 20 + icon_x_offset, 20 + multiplayer_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + multiplayer_settings_y, l10n_text("Multiplayer"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Multiplayer Settings END */
		
		#endregion /* My Game Settings END */
		
		#region /* Controls Settings */
		scr_draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (controls_text_y), l10n_text("Controls"), global.default_text_size * 0.5, c_black, c_white, 1);
		
		#region /* Keyboard and Mouse Settings */
		if (global.enable_keyboard_and_mouse_settings)
		{
			if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, keyboard_and_mouse_settings_y, 370, keyboard_and_mouse_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icon, 4, left_sidebar_x + 20 + icon_x_offset, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +keyboard_and_mouse_settings_y, l10n_text("Keyboard & Mouse"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, keyboard_and_mouse_settings_y, 370, keyboard_and_mouse_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icon, 4, left_sidebar_x + 20 + icon_x_offset, 20 +keyboard_and_mouse_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +keyboard_and_mouse_settings_y, l10n_text("Keyboard & Mouse"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Keyboard and Mouse Settings */
		
		#region /* Controller Settings */
		if (global.enable_controller_settings)
		{
			if (global.settings_sidebar_menu == "controller_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, controller_settings_y, 370, controller_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icon, 5, left_sidebar_x + 20 + icon_x_offset, 20 + controller_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + controller_settings_y, l10n_text("Controller"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, controller_settings_y, 370, controller_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icon, 5, left_sidebar_x + 20 + icon_x_offset, 20 + controller_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + controller_settings_y, l10n_text("Controller"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Controller Settings END */
		
		#region /* Touch Settings */
		if (global.enable_touch_settings)
		{
			if (global.settings_sidebar_menu == "touch_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, touch_settings_y, 370, touch_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icon,6, left_sidebar_x + 20 + icon_x_offset, 20 + touch_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + touch_settings_y, l10n_text("Touch"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, touch_settings_y, 370,(40 * 9) - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icon,6, left_sidebar_x + 20 + icon_x_offset, 20 + touch_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + touch_settings_y, l10n_text("Touch"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Touch Settings END */
		
		#endregion /* Controls Settings END */
		
		#region /* General Settings */
		scr_draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + general_text_y, l10n_text("General"), global.default_text_size * 0.5, c_black, c_white, 1);
		
		#region /* Account Settings */
		if (global.enable_account_settings)
		{
			if (global.settings_sidebar_menu == "account_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, account_settings_y, 370, account_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + account_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + account_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_icon_person, 0, left_sidebar_x + 20 + icon_x_offset, 20 + account_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + account_settings_y, l10n_text("Account"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, account_settings_y, 370, account_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + account_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + account_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_icon_person, 0, left_sidebar_x + 20 + icon_x_offset, 20 + account_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + account_settings_y, l10n_text("Account"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Account Settings END */
		
		#region /* Video Settings */
		if (global.settings_sidebar_menu == "video_settings")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, video_settings_y, 370, video_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icon, 8, left_sidebar_x + 20 + icon_x_offset, 20 + video_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + video_settings_y, l10n_text("Video"), global.default_text_size * 1.05, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, video_settings_y, 370, video_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icon, 8, left_sidebar_x + 20 + icon_x_offset, 20 + video_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + video_settings_y, l10n_text("Video"), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* Video Settings END */
		
		#region /* Audio Settings */
		if (global.settings_sidebar_menu == "audio_settings")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, audio_settings_y, 370, audio_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + audio_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + audio_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icon,9, left_sidebar_x + 20 + icon_x_offset, 20 + audio_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + audio_settings_y, l10n_text("Audio"), global.default_text_size * 1.05, c_black, c_white, 1);
		}
		else
			{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, audio_settings_y, 370, audio_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + audio_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + audio_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icon,9, left_sidebar_x + 20 + icon_x_offset, 20 + audio_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + audio_settings_y, l10n_text("Audio"), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* Audio Settings END */
		
		#region /* Custom Resources Settings */
		if (global.enable_custom_resources_settings)
		{
			if (global.settings_sidebar_menu == "custom_resources_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, custom_resources_settings_y, 370, custom_resources_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + custom_resources_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + custom_resources_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icon, 10, left_sidebar_x + 20 + icon_x_offset, 20 + custom_resources_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + custom_resources_settings_y, l10n_text("Custom Resources"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, custom_resources_settings_y, 370, custom_resources_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + custom_resources_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + custom_resources_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icon, 10, left_sidebar_x + 20 + icon_x_offset, 20 + custom_resources_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + custom_resources_settings_y, l10n_text("Custom Resources"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Custom Resources Settings END */
		
		#region /* Storage Settings */
		if (global.enable_storage_settings)
		{
			if (global.settings_sidebar_menu == "storage_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, storage_settings_y, 370, storage_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icon, 11, left_sidebar_x + 20 + icon_x_offset, 20 + storage_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + storage_settings_y, l10n_text("Storage"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, storage_settings_y, 370, storage_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icon, 11, left_sidebar_x + 20 + icon_x_offset, 20 + storage_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + storage_settings_y, l10n_text("Storage"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Storage Settings END */
		
		#region /* Language Settings */
		if (global.enable_language_settings)
		{
			if (global.settings_sidebar_menu == "language_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, language_settings_y, 370, language_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icon, 12, left_sidebar_x + 20 + icon_x_offset, 20 +language_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +language_settings_y, l10n_text("Language"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, language_settings_y, 370, language_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icon, 12, left_sidebar_x + 20 + icon_x_offset, 20 +language_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +language_settings_y, l10n_text("Language"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Language Settings END */
		
		#region /* Broadcast Settings */
		if (global.enable_broadcast_settings)
		{
			if (global.settings_sidebar_menu == "broadcast_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, broadcast_settings_y, 370, broadcast_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icon, 13, left_sidebar_x + 20 + icon_x_offset, 20 +broadcast_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +broadcast_settings_y, l10n_text("Broadcast"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, broadcast_settings_y, 370, broadcast_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icon, 13, left_sidebar_x + 20 + icon_x_offset, 20 +broadcast_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +broadcast_settings_y, l10n_text("Broadcast"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Broadcast Settings END */
		
		#region /* How to play Settings */
		if (global.enable_how_to_play_settings)
		{
			if (global.settings_sidebar_menu == "how_to_play")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, how_to_play_y, 370, how_to_play_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icon, 14, left_sidebar_x + 20 + icon_x_offset, 20 +how_to_play_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +how_to_play_y, l10n_text("How to Play"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, how_to_play_y, 370, how_to_play_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icon, 14, left_sidebar_x + 20 + icon_x_offset, 20 +how_to_play_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +how_to_play_y, l10n_text("How to Play"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* General Settings END */
		
		#region /* Add-Ons Settings */
		if (global.enable_add_ons_settings)
		{
			scr_draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (40 * 18), l10n_text("Add-Ons"), global.default_text_size * 0.5, c_black, c_white, 1);
			
			if (global.settings_sidebar_menu == "resource_pack_settings")
			{draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + (40 * 19), 1, 1, 0, c_gray, 1); /* Button Hightlighted */
			draw_sprite_ext(spr_settings_icon, 15, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 19), 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 19), l10n_text("Resource Packs"), global.default_text_size * 1.05, c_black, c_white, 1);
			}else{draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + (40 * 19), 1, 1, 0, c_white, 1); /* Button Not Selected */
			draw_sprite_ext(spr_settings_icon, 15, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 19), 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 19), l10n_text("Resource Packs"), global.default_text_size, c_white, c_black, 1);}
			
			if (global.settings_sidebar_menu == "behavior_packs_settings")
			{draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + (40 * 20), 1, 1, 0, c_gray, 1); /* Button Hightlighted */
			draw_sprite_ext(spr_settings_icon, 16, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 20), 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 20), l10n_text("Behavior Packs"), global.default_text_size * 1.05, c_black, c_white, 1);
			}else{draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + (40 * 20), 1, 1, 0, c_white, 1); /* Button Not Selected */
			draw_sprite_ext(spr_settings_icon, 16, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 20), 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 20), l10n_text("Behavior Packs"), global.default_text_size, c_white, c_black, 1);}
		}
		#endregion /* Add-Ons Settings END */
		
		#region /* The "Back" button should always appear at the top of the screen */
		if (global.settings_sidebar_menu == "settings_back")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 39))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20, 1, 1, 0, c_gray, 1);
			}
			/* Button Hightlighted */
			
			draw_sprite_ext(spr_icon_back, 0, left_sidebar_x + 20 + icon_x_offset, 20, 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20, l10n_text("Back"), global.default_text_size * 1.05, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 39))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20, 1, 1, 0, c_white, 1);
			}
			/* Button Not Selected */
			
			draw_sprite_ext(spr_icon_back, 0, left_sidebar_x + 20 + icon_x_offset, 20, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20, l10n_text("Back"), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* The "Back" button should always appear at the top of the screen END */
		
		#endregion /* Settings Sidebar END */
		
		draw_set_alpha(darken_settings_sidebar_alpha);
		draw_rectangle_color(left_sidebar_x, 0, left_sidebar_x + 370, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
	}
	#endregion /* Tabs Graphics END */
	
	if (in_settings)
	{
		scr_scroll_menu();
		
		#region /* Go back out of setting menu */
		if (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (global.settings_sidebar_menu == "settings_back")
		&& (can_navigate_settings_sidebar)
		&& (!input_key)
		&& (!input_gamepad_button)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate_settings_sidebar)
		&& (!input_key)
		&& (!input_gamepad_button)
		{
			scr_config_save(); /* Save Config */
			if (global.pause_room != rm_leveleditor)
			&& (global.selected_resource_pack != old_selected_resource_pack)
			{
				scr_load_resource_pack_sprite(); /* Load new sprites from resource pack */
				old_selected_resource_pack = global.selected_resource_pack;
			}
			in_settings = false;
			menu = "options";
			menu_delay = 3;
		}
		#endregion /* Go back out of setting menu END */
	
		if (key_b_pressed)
		&& (!can_navigate_settings_sidebar)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!input_key)
		&& (!input_gamepad_button)
		{
			if (open_dropdown)
			{
				open_dropdown = false;
			}
			else
			{
				can_navigate_settings_sidebar = true;
				menu_delay = 3;
				menu = noone;
			}
		}
		else
		if (key_right)
		&& (global.settings_sidebar_menu != "settings_back")
		&& (can_navigate_settings_sidebar)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_a_pressed)
		&& (global.settings_sidebar_menu != "settings_back")
		&& (can_navigate_settings_sidebar)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			can_navigate_settings_sidebar = false;
			if (global.settings_sidebar_menu == "accessibility_settings"){menu = "assist_enable";}
			if (global.settings_sidebar_menu == "game_settings")
			{
				menu = "difficulty_settings";
			}
			if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
			|| (global.settings_sidebar_menu == "controller_settings")
			{
				menu = "remap_select_player";
				for(var i = 1; i <= global.max_players; i += 1)
				{
					scr_set_character_folder(i);
					ini_open(character_folder + "/data/character_config.ini"); /* First open the character folder ini before initializing custom character abilities */
					allow_player_tongue[i] = scr_initialize_character_abilities(i - 1, "allow_tongue", false);
					allow_player_double_jump[i] = scr_initialize_character_abilities(i - 1, "number_of_jumps", 1, "values");
					allow_player_dive[i] = scr_initialize_character_abilities(i - 1, "allow_dive", false);
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				}
			}
			if (global.settings_sidebar_menu == "account_settings"){menu = "change_username";}
			if (global.settings_sidebar_menu == "video_settings")
			{
				if (!window_get_fullscreen())
				{
					menu = "resolution_setting";
				}
				else
				{
					menu = "gui_scale_modifier";
				}
			}
			if (global.settings_sidebar_menu == "audio_settings"){menu = "volume_main";}
			if (global.settings_sidebar_menu == "custom_resources_settings")
			{
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				&& (!global.enable_option_for_pc)
				|| (global.enable_option_for_pc)
				{
					menu = "resource_pack";
				}
				else
				{
					menu = "title_background";
				}
			}
			if (global.settings_sidebar_menu == "storage_settings"){menu = "file_select";}
			if (global.settings_sidebar_menu == "language_settings")
			{
				menu = "Language" + string(global.current_language_menu_position);
				menu_cursor_y_position = global.current_language_menu_position * 50;
			}
		}
		/* When you navigate the sidebar or not */
	
		/* Main Settings on left sidebar */
	
		background_brightness_menu_lerp = lerp(background_brightness_menu_lerp, global.background_brightness_menu, 0.1); /* Background Brightness in Menus Options END */
	
		left_sidebar_x = lerp(left_sidebar_x, 0, 0.1);
	
		#region /* Menu navigation with mouse */
	
		#region /* Click Back */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 40 - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (global.settings_sidebar_menu == "settings_back")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			scr_config_save(); /* Save Config */
			if (global.pause_room != rm_leveleditor)
			&& (global.selected_resource_pack != old_selected_resource_pack)
			{
				scr_load_resource_pack_sprite(); /* Load new sprites from resource pack */
				old_selected_resource_pack = global.selected_resource_pack;
			}
			input_key = false;
			in_settings = false;
			menu = "options";
			menu_delay = 3;
		}
		#endregion /* Click Back END */
	
		else
		
		#region /* Back */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 40 - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "settings_back";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Back END */
		
		else
	
		#region /* Click Accessibility */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (global.settings_sidebar_menu == "accessibility_settings")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "accessibility_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			menu = "assist_enable";
		}
		#endregion /* Click Accessibility END */
		
		else
		
		#region /* Accessibility */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "accessibility_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Accessibility END */
		
		else
		
		#region /* Click Game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, game_settings_y, 370,(game_settings_y + 40) - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (global.settings_sidebar_menu == "game_settings")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "game_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			menu = "difficulty_settings";
		}
		#endregion /* Click Game END */
		
		#region /* Game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, game_settings_y, 370,(game_settings_y + 40) - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "game_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Game END */
		
		if (global.enable_multiplayer_settings)
		{
			
			#region /* Click Multiplayer */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.settings_sidebar_menu == "multiplayer_settings")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "multiplayer_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
			}
			#endregion /* Click Multiplayer END */
			
			#region /* Multiplayer */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "multiplayer_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Multiplayer END */
			
		}
	
		#region /* Click Keyboard and Mouse */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, keyboard_and_mouse_settings_y, 370, keyboard_and_mouse_settings_y + 40 - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (global.sprite_select_player[remapping_player + 1] == noone)
			{
				scr_change_character_portrait();
			}
			global.settings_sidebar_menu = "keyboard_and_mouse_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			menu = "remap_select_player";
			for(var i = 1; i <= global.max_players; i += 1)
			{
				scr_set_character_folder(i);
				ini_open(character_folder + "/data/character_config.ini"); /* First open the character folder ini before initializing custom character abilities */
				allow_player_tongue[i] = scr_initialize_character_abilities(i - 1, "allow_tongue", false);
				allow_player_double_jump[i] = scr_initialize_character_abilities(i - 1, "number_of_jumps", 1, "values");
				allow_player_dive[i] = scr_initialize_character_abilities(i - 1, "allow_dive", false);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
		}
		#endregion /* Click Keyboard and Mouse END */
		
		#region /* Keyboard and Mouse */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, keyboard_and_mouse_settings_y, 370, keyboard_and_mouse_settings_y + 40 - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (global.sprite_select_player[remapping_player + 1] == noone)
			{
				scr_change_character_portrait();
			}
			global.settings_sidebar_menu = "keyboard_and_mouse_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Keyboard and Mouse END */
		
		if (global.enable_controller_settings)
		{
			
			#region /* Click Controller */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, controller_settings_y, 370, controller_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.settings_sidebar_menu == "controller_settings")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (global.sprite_select_player[remapping_player + 1] == noone)
				{
					scr_change_character_portrait();
				}
				global.settings_sidebar_menu = "controller_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
				menu = "remap_select_player";
				for(var i = 1; i <= global.max_players; i += 1)
				{
					scr_set_character_folder(i);
					ini_open(character_folder + "/data/character_config.ini"); /* First open the character folder ini before initializing custom character abilities */
					allow_player_tongue[i] = scr_initialize_character_abilities(i - 1, "allow_tongue", false);
					allow_player_double_jump[i] = scr_initialize_character_abilities(i - 1, "number_of_jumps", 1, "values");
					allow_player_dive[i] = scr_initialize_character_abilities(i - 1, "allow_dive", false);
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				}
			}
			#endregion /* Click Controller END */
			
			#region /* Controller */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, controller_settings_y, 370, controller_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (global.sprite_select_player[remapping_player + 1] == noone)
				{
					scr_change_character_portrait();
				}
				global.settings_sidebar_menu = "controller_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Controller END */
			
		}
	
		if (global.enable_touch_settings)
		{
			
			#region /* Click Touch */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, touch_settings_y, 370, touch_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.settings_sidebar_menu == "touch_settings")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "touch_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
			}
			#endregion /* Click Touch END */
			
			#region /* Touch */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, touch_settings_y, 370, touch_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "touch_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Touch END */
			
		}
	
		if (global.enable_account_settings)
		{
			
			#region /* Click Account */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, account_settings_y, 370, account_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.settings_sidebar_menu == "account_settings")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "account_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
				menu = "change_username";
			}
			#endregion /* Click Account END */
			
			#region /* Profile */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, account_settings_y, 370, account_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "account_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Profile END */
			
		}
		
		#region /* Click Video */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, video_settings_y, 370, video_settings_y + 40 - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (global.settings_sidebar_menu == "video_settings")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "video_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			if (!window_get_fullscreen())
			{
				menu = "resolution_setting";
			}
			else
			{
				menu = "gui_scale_modifier";
			}
		}
		#endregion /* Click Video END */
		
		#region /* Video */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, video_settings_y, 370, video_settings_y + 40 - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "video_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Video END */
		
		#region /* Click Audio */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, audio_settings_y, 370, audio_settings_y + 40 - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (global.settings_sidebar_menu == "audio_settings")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "audio_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			menu = "volume_main";
		}
		#endregion /* Click Audio END */
		
		#region /* Audio */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, audio_settings_y, 370, audio_settings_y + 40 - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "audio_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Audio END */
		
		if (global.enable_custom_resources_settings)
		{
			
			#region /* Click Custom Resources */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, custom_resources_settings_y, 370, custom_resources_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.settings_sidebar_menu == "custom_resources_settings")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "custom_resources_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				&& (!global.enable_option_for_pc)
				|| (global.enable_option_for_pc)
				{
					menu = "resource_pack";
				}
				else
				{
					menu = "title_background";
				}
			}
			#endregion /* Click Custom Resources END */
			
			#region /* Custom Resources */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, custom_resources_settings_y, 370, custom_resources_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "custom_resources_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Custom Resources END */
			
		}
	
		if (global.enable_storage_settings)
		{
			
			#region /* Click Storage */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, storage_settings_y, 370, storage_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.settings_sidebar_menu == "storage_settings")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "storage_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
				menu = "file_select";
				scr_load_storage_variables();
			}
			#endregion /* Click Storage END */
			
			#region /* Storage */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, storage_settings_y, 370, storage_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "storage_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
				scr_load_storage_variables();
			}
			#endregion /* Storage END */
			
		}
	
		if (global.enable_language_settings)
		{
			
			#region /* Click Language */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, language_settings_y, 370, language_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.settings_sidebar_menu == "language_settings")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "language_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
				menu = "Language" + string(global.current_language_menu_position);
			}
			#endregion /* Click Language END */
			
			#region /* Language */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, language_settings_y, 370, language_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "language_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Language END */
			
		}
	
		if (global.enable_broadcast_settings)
		{
			
			#region /* Click Broadcast */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, broadcast_settings_y, 370, broadcast_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.settings_sidebar_menu == "broadcast_settings")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "broadcast_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
			}
			#endregion /* Click Broadcast END */
			
			#region /* Broadcast */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, broadcast_settings_y, 370, broadcast_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "broadcast_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Broadcast END */
			
		}
	
		if (global.enable_how_to_play_settings)
		{
			
			#region /* Click How to Play */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, how_to_play_y, 370, how_to_play_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.settings_sidebar_menu == "how_to_play")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "how_to_play";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
			}
			#endregion /* Click How to Play END */
			
			#region /* How to Play */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, how_to_play_y, 370, how_to_play_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "how_to_play";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* How to Play END */
			
		}
	
		#endregion /* Menu navigation with mouse END */
	
		#region /* Settings Sidebar Navigation */
		if (menu_delay == 0 && menu_joystick_delay == 0)
		{
			
			#region /* Accessibility Settings */
			if (global.settings_sidebar_menu == "accessibility_settings")
			{
				if (key_up)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					global.settings_sidebar_menu = "settings_back";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (global.enable_how_to_play_settings)
					{
						global.settings_sidebar_menu = "how_to_play";
					}
					else
					{
						global.settings_sidebar_menu = "game_settings";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Accessibility Settings END */
		
			#region /* How to play Settings */
			if (global.enable_how_to_play_settings)
			{
				if (global.settings_sidebar_menu == "how_to_play")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "accessibility_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "game_settings";
						menu_delay = 3;
					}
				}
			}
			#endregion /* How to play Settings END */
		
			#region /* My Game Settings */
		
			#region /* Game Settings */
			if (global.settings_sidebar_menu == "game_settings")
			{
				if (key_up)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (global.enable_how_to_play_settings)
					{
						global.settings_sidebar_menu = "how_to_play";
					}
					else
					{
						global.settings_sidebar_menu = "accessibility_settings";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (global.enable_multiplayer_settings)
					{
						global.settings_sidebar_menu = "multiplayer_settings";
					}
					else
					if (global.enable_keyboard_and_mouse_settings)
					{
						if (global.sprite_select_player[remapping_player + 1] == noone)
						{
							scr_change_character_portrait();
						}
						global.settings_sidebar_menu = "keyboard_and_mouse_settings";
					}
					else
					if (global.enable_controller_settings)
					{
						if (global.sprite_select_player[remapping_player + 1] == noone)
						{
							scr_change_character_portrait();
						}
						global.settings_sidebar_menu = "controller_settings";
					}
					else
					if (global.enable_touch_settings)
					{
						global.settings_sidebar_menu = "touch_settings";
					}
					else
					if (global.enable_account_settings)
					{
						global.settings_sidebar_menu = "account_settings";
					}
					else
					{
						global.settings_sidebar_menu = "video_settings";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Game Settings END */
	
			#region /* Multiplayer Settings */
			if (global.enable_multiplayer_settings)
			{
				if (global.settings_sidebar_menu == "multiplayer_settings")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "game_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_keyboard_and_mouse_settings)
						{
							if (global.sprite_select_player[remapping_player + 1] == noone)
							{
								scr_change_character_portrait();
							}
							global.settings_sidebar_menu = "keyboard_and_mouse_settings";
						}
						else
						if (global.enable_controller_settings)
						{
							if (global.sprite_select_player[remapping_player + 1] == noone)
							{
								scr_change_character_portrait();
							}
							global.settings_sidebar_menu = "controller_settings";
						}
						else
						if (global.enable_touch_settings)
						{
							global.settings_sidebar_menu = "touch_settings";
						}
						else
						if (global.enable_account_settings)
						{
							global.settings_sidebar_menu = "account_settings";
						}
						else
						{
							global.settings_sidebar_menu = "video_settings";
						}
						menu_delay = 3;
					}
				}
			}
			#endregion /* Multiplayer Settings END */
	
			#endregion /* My Game Settings END */
		
			#region /* Controls Settings */
	
			#region /* Keyboard and Mouse Settings */
			if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
			{
				if (key_up)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (global.enable_multiplayer_settings)
					{
						global.settings_sidebar_menu = "multiplayer_settings";
					}
					else
					{
						global.settings_sidebar_menu = "game_settings";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (global.enable_controller_settings)
					{
						if (global.sprite_select_player[remapping_player + 1] == noone)
						{
							scr_change_character_portrait();
						}
						global.settings_sidebar_menu = "controller_settings";
					}
					else
					if (global.enable_touch_settings)
					{
						global.settings_sidebar_menu = "touch_settings";
					}
					else
					if (global.enable_account_settings)
					{
						global.settings_sidebar_menu = "account_settings";
					}
					else
					{
						global.settings_sidebar_menu = "video_settings";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Keyboard and Mouse Settings */
	
			#region /* Controller Settings */
			if (global.enable_controller_settings)
			{
				if (global.settings_sidebar_menu == "controller_settings")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_keyboard_and_mouse_settings)
						{
							if (global.sprite_select_player[remapping_player + 1] == noone)
							{
								scr_change_character_portrait();
							}
							global.settings_sidebar_menu = "keyboard_and_mouse_settings";
						}
						else
						{
							if (global.enable_multiplayer_settings)
							{
								global.settings_sidebar_menu = "multiplayer_settings";
							}
							else
							{
								global.settings_sidebar_menu = "game_settings";
							}
						}
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_touch_settings)
						{
							global.settings_sidebar_menu = "touch_settings";
						}
						else
						if (global.enable_account_settings)
						{
							global.settings_sidebar_menu = "account_settings";
						}
						else
						{
							global.settings_sidebar_menu = "video_settings";
						}
						menu_delay = 3;
					}
				}
			}
			#endregion /* Controller Settings END */
	
			#region /* Touch Settings */
			if (global.enable_touch_settings)
			{
				if (global.settings_sidebar_menu == "touch_settings")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_touch_settings)
						{
							if (global.sprite_select_player[remapping_player + 1] == noone)
							{
								scr_change_character_portrait();
							}
							global.settings_sidebar_menu = "controller_settings";
						}
						else
						{
							if (global.sprite_select_player[remapping_player + 1] == noone)
							{
								scr_change_character_portrait();
							}
							global.settings_sidebar_menu = "keyboard_and_mouse_settings";
						}
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_account_settings)
						{
							global.settings_sidebar_menu = "account_settings";
						}
						else
						{
							global.settings_sidebar_menu = "video_settings";
						}
						menu_delay = 3;
					}
				}
			}
			#endregion /* Touch Settings END */
	
			#endregion /* Controls Settings END */
		
			#region /* General Settings */
	
			#region /* Account Settings */
			if (global.enable_account_settings)
			{
				if (global.settings_sidebar_menu == "account_settings")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_touch_settings)
						{
							global.settings_sidebar_menu = "touch_settings";
						}
						else
						if (global.enable_controller_settings)
						{
							if (global.sprite_select_player[remapping_player + 1] == noone)
							{
								scr_change_character_portrait();
							}
							global.settings_sidebar_menu = "controller_settings";
						}
						else
						{
							if (global.sprite_select_player[remapping_player + 1] == noone)
							{
								scr_change_character_portrait();
							}
							global.settings_sidebar_menu = "keyboard_and_mouse_settings";
						}
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "video_settings";
						menu_delay = 3;
					}
				}
			}
			#endregion /* Account Settings END */
	
			#region /* Video Settings */
			if (global.settings_sidebar_menu == "video_settings")
			{
				if (key_up)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (global.enable_account_settings)
					{
						global.settings_sidebar_menu = "account_settings";
					}
					else
					if (global.enable_touch_settings)
					{
						global.settings_sidebar_menu = "touch_settings";
					}
					else
					if (global.enable_controller_settings)
					{
						if (global.sprite_select_player[remapping_player + 1] == noone)
						{
							scr_change_character_portrait();
						}
						global.settings_sidebar_menu = "controller_settings";
					}
					else
					{
						if (global.sprite_select_player[remapping_player + 1] == noone)
						{
							scr_change_character_portrait();
						}
						global.settings_sidebar_menu = "keyboard_and_mouse_settings";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					global.settings_sidebar_menu = "audio_settings";
					menu_delay = 3;
				}
			}
			#endregion /* Video Settings END */
			
			#region /* Audio Settings */
			if (global.settings_sidebar_menu == "audio_settings")
			{
				if (key_up)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					global.settings_sidebar_menu = "video_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (global.enable_custom_resources_settings)
					{
						global.settings_sidebar_menu = "custom_resources_settings";
					}
					else
					if (global.enable_storage_settings)
					{
						global.settings_sidebar_menu = "storage_settings";
						scr_load_storage_variables();
					}
					else
					if (global.enable_language_settings)
					{
						global.settings_sidebar_menu = "language_settings";
					}
					else
					if (global.enable_broadcast_settings)
					{
						global.settings_sidebar_menu = "broadcast_settings";
					}
					else
					if (global.enable_how_to_play_settings)
					{
						global.settings_sidebar_menu = "how_to_play_settings";
					}
					else
					if (global.enable_add_ons_settings)
					{
						global.settings_sidebar_menu = "resource_pack_settings";
					}
					else
					{
						global.settings_sidebar_menu = "settings_back";
					}
					menu_delay = 3;
				}
			}
			#endregion /* Audio Settings END */
	
			#region /* Custom Resources Settings */
			if (global.enable_custom_resources_settings)
			{
				if (global.settings_sidebar_menu == "custom_resources_settings")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "audio_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_storage_settings)
						{
							global.settings_sidebar_menu = "storage_settings";
							scr_load_storage_variables();
						}
						else
						if (global.enable_language_settings)
						{
							global.settings_sidebar_menu = "language_settings";
						}
						else
						if (global.enable_broadcast_settings)
						{
							global.settings_sidebar_menu = "broadcast_settings";
						}
						else
						if (global.enable_how_to_play_settings)
						{
							global.settings_sidebar_menu = "how_to_play_settings";
						}
						else
						if (global.enable_add_ons_settings)
						{
							global.settings_sidebar_menu = "resource_pack_settings";
						}
						else
						{
							global.settings_sidebar_menu = "settings_back";
						}
						menu_delay = 3;
					}
				}
			}
			#endregion /* Custom Resources Settings END */
	
			#region /* Storage Settings */
			if (global.enable_storage_settings)
			{
				if (global.settings_sidebar_menu == "storage_settings")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_custom_resources_settings)
						{
							global.settings_sidebar_menu = "custom_resources_settings";
						}
						else
						{
							global.settings_sidebar_menu = "audio_settings";
						}
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_language_settings)
						{
							global.settings_sidebar_menu = "language_settings";
						}
						else
						if (global.enable_broadcast_settings)
						{
							global.settings_sidebar_menu = "broadcast_settings";
						}
						else
						if (global.enable_how_to_play_settings)
						{
							global.settings_sidebar_menu = "how_to_play_settings";
						}
						else
						if (global.enable_add_ons_settings)
						{
							global.settings_sidebar_menu = "resource_pack_settings";
						}
						else
						{
							global.settings_sidebar_menu = "settings_back";
						}
						menu_delay = 3;
					}
				}
			}
			#endregion /* Storage Settings END */
	
			#region /* Language Settings */
			if (global.enable_language_settings)
			{
				if (global.settings_sidebar_menu == "language_settings")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "storage_settings";
						scr_load_storage_variables();
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_broadcast_settings)
						{
							global.settings_sidebar_menu = "broadcast_settings";
						}
						else
						if (global.enable_add_ons_settings)
						{
							global.settings_sidebar_menu = "resource_pack_settings";
						}
						else
						{
							global.settings_sidebar_menu = "settings_back";
						}
						menu_delay = 3;
					}
				}
			}
			#endregion /* Language Settings END */
	
			#region /* Broadcast Settings */
			if (global.enable_broadcast_settings)
			{
				if (global.settings_sidebar_menu == "broadcast_settings")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "language_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "how_to_play";
						menu_delay = 3;
					}
				}
			}
			#endregion /* Broadcast Settings END */
		
			#region /* Add-Ons Settings */
			if (global.enable_add_ons_settings)
			{
				if (global.settings_sidebar_menu == "resource_pack_settings")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "how_to_play";
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "behavior_packs_settings";
						menu_delay = 3;
					}
				}
		
				if (global.settings_sidebar_menu == "behavior_packs_settings")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "resource_pack_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						global.settings_sidebar_menu = "settings_back";
						menu_delay = 3;
					}
				}
			}
			#endregion /* Add-Ons Settings END */

			#region /* The "Back" button should always appear at the top of the screen */
			if (global.settings_sidebar_menu == "settings_back")
			{
				if (key_up)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (global.enable_add_ons_settings)
					{
						global.settings_sidebar_menu = "behavior_packs_settings";
					}
					else
					if (global.enable_how_to_play_settings)
					{
						global.settings_sidebar_menu = "how_to_play";
					}
					else
					if (global.enable_broadcast_settings)
					{
						global.settings_sidebar_menu = "broadcast_settings";
					}
					else
					if (global.enable_language_settings)
					{
						global.settings_sidebar_menu = "language_settings";
					}
					else
					if (global.enable_storage_settings)
					{
						global.settings_sidebar_menu = "storage_settings";
						scr_load_storage_variables();
					}
					else
					if (global.enable_custom_resources_settings)
					{
						global.settings_sidebar_menu = "custom_resources_settings";
					}
					else
					{
						global.settings_sidebar_menu = "audio_settings";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					global.settings_sidebar_menu = "accessibility_settings";
					menu_delay = 3;
				}
			}
			#endregion /* The "Back" button should always appear at the top of the screen END */
	
			#endregion /* General Settings END */
		
		}
	
		#endregion /* Settings Sidebar Navigation END */
	
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);

		#region /* Assist Settings */
		if (global.settings_sidebar_menu == "accessibility_settings")
		{
			global.assist_enable = draw_menu_checkmark(450, 50 + menu_y_offset, l10n_text("Enable Assist Mode"), "assist_enable", global.assist_enable, false);
			scr_draw_text_outlined(450, 100 + menu_y_offset, l10n_text("The game is meant to be played without Assist Mode"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(450, 132 + menu_y_offset, l10n_text("Only enable this if you cannot enjoy the game without extra help"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
			
			global.assist_above_1_hp = draw_menu_checkmark(450, 332 + menu_y_offset, l10n_text("Always Above 1 HP"), "assist_above_1_hp", global.assist_above_1_hp, false);
			global.assist_invincibility = draw_menu_checkmark(450, 332 + (45) + menu_y_offset, l10n_text("Invincible"), "assist_invincibility", global.assist_invincibility, false);
			global.assist_moonjump = draw_menu_checkmark(450, 332 + (45 * 2) + menu_y_offset, l10n_text("Moonjump"), "assist_moonjump", global.assist_moonjump, false);
			global.assist_hover_when_holding_jump = draw_menu_checkmark(450, 332 + (45 * 3) + menu_y_offset, l10n_text("Hover When Holding Jump"), "assist_hover_when_holding_jump", global.assist_hover_when_holding_jump, false);
			global.assist_floor_over_bottomless_pit = draw_menu_checkmark(450, 332 + (45 * 4) + menu_y_offset, l10n_text("Floor Over Bottomless Pit"), "assist_floor_over_bottomless_pit", global.assist_floor_over_bottomless_pit, false);
			global.assist_breathe_underwater = draw_menu_checkmark(450, 332 + (45 * 5) + menu_y_offset, l10n_text("Breathe Underwater"), "assist_breathe_underwater", global.assist_breathe_underwater, false);
			global.assist_guiding_arrows = draw_menu_checkmark(450, 332 + (45 * 6) + menu_y_offset, l10n_text("Show Assist Arrows"), "assist_guiding_arrows", global.assist_guiding_arrows, false);
			global.assist_normal_arrows = draw_menu_checkmark(450, 332 + (45 * 7) + menu_y_offset, l10n_text("Show Normal Arrows"), "assist_normal_arrows", global.assist_normal_arrows, true);
			global.assist_enable_enemies = draw_menu_checkmark(450, 332 + (45 * 8) + menu_y_offset, l10n_text("Enable Enemies"), "assist_enable_enemies", global.assist_enable_enemies, true);
			global.assist_enable_spikes = draw_menu_checkmark(450, 332 + (45 * 9) + menu_y_offset, l10n_text("Enable Spikes"), "assist_enable_spikes", global.assist_enable_spikes, true);
			menu_cursor_y_position_end = 332 + (45 * 9);
			
			#region /* Assist Extra HP */
			draw_menu_dropdown(450, 262 + menu_y_offset, l10n_text("Extra Health Points"), "assist_extra_hp", global.assist_extra_hp,
			l10n_text("None"),
			"+1",
			"+2",
			"+3",
			"+4",
			"+5",
			"+6",
			"+7",
			"+8",
			"+9");
			scr_set_default_dropdown_description("assist_extra_hp", "None");
			#endregion /* Assist Extra HP END */
			
			#region /* Assist item appear */
			draw_menu_dropdown(450, 182 + menu_y_offset, l10n_text("Assist Item"), "assist_item_appear", global.assist_item_appear,
			l10n_text("Always Appear"),
			l10n_text("Appear after 1 defeat on a level"),
			l10n_text("Appear after 2 defeats on a level"),
			l10n_text("Appear after 3 defeats on a level"),
			l10n_text("Appear after 4 defeats on a level"),
			l10n_text("Appear after 5 defeats on a level"),
			l10n_text("Appear after 6 defeats on a level"),
			l10n_text("Appear after 7 defeats on a level"),
			l10n_text("Appear after 8 defeats on a level"),
			l10n_text("Appear after 9 defeats on a level"),
			l10n_text("Never Appear"));
			scr_set_default_dropdown_description("assist_item_appear", "Never Appear");
			#endregion /* Assist item appear END */
			
			#region /* Make sure you can't navigate the assist menu unless you have enabled assist mode */
			if (!global.assist_enable)
			{
				if (menu == "assist_above_1_hp")
				|| (menu == "assist_invincibility")
				|| (menu == "assist_moonjump")
				|| (menu == "assist_hover_when_holding_jump")
				|| (menu == "assist_floor_over_bottomless_pit")
				|| (menu == "assist_breathe_underwater")
				|| (menu == "assist_guiding_arrows")
				|| (menu == "assist_normal_arrows")
				|| (menu == "assist_extra_hp")
				|| (menu == "assist_item_appear")
				{
					menu = "assist_enable";
				}
				open_dropdown = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(left_sidebar_x + 370, 157 + menu_y_offset, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
			}
			#endregion /* Make sure you can't navigate the assist menu unless you have enabled assist mode END */
			
		}
		#endregion /* Assist Settings END */
		
		#region /* My Game Settings */
		
		#region /* Game Settings */
		if (global.settings_sidebar_menu == "game_settings") {
			difficulty_settings_y = 48;
			automatically_pause_when_window_is_unfocused_settings_y = 48 * 2;
			show_timer_settings_y = 48 * 3;
			show_defeats_counter_settings_y = 48 * 4;
			if (global.enable_ranks) {
				show_ranks_settings_y = 48 * 5;
				show_tutorial_signs_y = 48 * 6;
				players_can_collide_y = 48 * 7;
				show_new_items_notification_y = 48 * 8;
				hud_hide_time_y = 48 * 9 + 16;
				selected_font_y = 48 * 10 + 32;
				debug_screen_y = 48 * 11 + 32;
			}
			else {
				show_ranks_settings_y = -9999;
				show_tutorial_signs_y = 48 * 5;
				players_can_collide_y = 48 * 6;
				show_new_items_notification_y = 48 * 7;
				hud_hide_time_y = 48 * 8 + 16;
				selected_font_y = 48 * 9 + 32;
				debug_screen_y = 48 * 10 + 32;
			}
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			
			if (global.enable_option_for_pc)
			{
				global.automatically_pause_when_window_is_unfocused = draw_menu_checkmark(380, automatically_pause_when_window_is_unfocused_settings_y, l10n_text("Automatically pause when the game is unfocused"), "automatically_pause_when_window_is_unfocused_settings", global.automatically_pause_when_window_is_unfocused, true); /* Automatically Pause When Window Is Unfocused */
			}
			global.show_timer = draw_menu_checkmark(380, show_timer_settings_y, l10n_text("Show Timer"), "show_timer_settings", global.show_timer, false); /* Show Timer */
			global.show_defeats_counter = draw_menu_checkmark(380, show_defeats_counter_settings_y, l10n_text("Show Defeats Counter"), "show_defeats_counter_settings", global.show_defeats_counter, true); /* Show Defeats Counter */
			if (global.enable_ranks)
			{
				global.show_defeats_counter = draw_menu_checkmark(380, show_ranks_settings_y, l10n_text("Show Ranks"), "show_ranks_settings", global.show_ranks, false); /* Show Ranks */
			}
			global.show_tutorial_signs = draw_menu_checkmark(380, show_tutorial_signs_y, l10n_text("Show Tutorial Signs"), "show_tutorial_signs", global.show_tutorial_signs, true); /* Show Tutorial Signs */
			global.players_can_collide = draw_menu_checkmark(380, players_can_collide_y, l10n_text("Players Can Collide"), "players_can_collide", global.players_can_collide, false); /* Show Tutorial Signs */
			global.show_new_items_notification = draw_menu_checkmark(380, show_new_items_notification_y, l10n_text("Show New Items Notification"), "show_new_items_notification", global.show_new_items_notification, true); /* Show new items notification in level editor */
			if (global.enable_option_for_pc)
			{
				global.debug_screen = draw_menu_checkmark(380, debug_screen_y, l10n_text("Debug Screen"), "debug_screen", global.debug_screen, false);
			}
			
			if (global.hud_hide_time > 10)
			{
				global.hud_hide_time = 3;
			}
			
			/* If you have selected Japanese language, you can't use Open Dyslexic, as it isn't supported */
			if (global.language_local_data[# global.selected_language_id, 0] == "日本語 (Japanese)")
			{
				/* Only include Game Font and Normal Font for Japanese language, as these are the only supported ones*/
				/* Doesn't include Open Dyslexic, as some languages are not supported */
				var can_select_font = false;
			}
			else
			{
				draw_menu_dropdown(380, selected_font_y, l10n_text("Selected Font"), "select_font", global.selected_font, l10n_text("Game Font"), l10n_text("Normal Font"), l10n_text("Open Dyslexic")); /* Includes Open Dyslexic */
				scr_set_default_dropdown_description("select_font", "Game Font");
				var can_select_font = true;
			}
			draw_menu_dropdown(380, hud_hide_time_y, l10n_text("HUD hide timer"), "hud_hide_time", global.hud_hide_time, l10n_text("Never Show"), l10n_text("After 1 Second"), l10n_text("After 2 Seconds"), l10n_text("After 3 Seconds"), l10n_text("After 4 Seconds"), l10n_text("After 5 Seconds"), l10n_text("After 6 Seconds"), l10n_text("After 7 Seconds"), l10n_text("After 8 Seconds"), l10n_text("After 9 Seconds"), l10n_text("Always Show"));
			scr_set_default_dropdown_description("hud_hide_time", "After 3 Seconds");
			
			draw_menu_dropdown(380, difficulty_settings_y, l10n_text("Level Layout Difficulty"), "difficulty_settings", global.difficulty, l10n_text("Easy"), l10n_text("Normal"), l10n_text("Hard")); /* Difficulty Settings */
			scr_set_default_dropdown_description("difficulty_settings", "Normal");
		}
		#endregion /* Game Settings END */
	
		#region /* Multiplayer Settings */
		if (global.settings_sidebar_menu == "multiplayer_settings")
		{
			draw_set_halign(fa_left);draw_set_valign(fa_middle);
			scr_draw_text_outlined(410, 20 + (40 * 3), "Change how multiplayer works here", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Multiplayer Settings END */
		
		#endregion /* My Game Settings */
		
		scr_option_control_menu();
		
		#region /* General Settings */
		
		scr_option_account();
		
		#region /* Graphics Settings */
		scr_option_graphics();
		#endregion /* Graphics Settings END */
		
		#region /* Audio Settings */
		if (global.settings_sidebar_menu == "audio_settings")
		{
			var volume_main_y = 64 + menu_y_offset;
			var volume_music_y = 96 + (64) + menu_y_offset;
			var volume_melody_y = 96 + (64 * 2) + menu_y_offset;
			var volume_sound_y = 96 + (64 * 3) + menu_y_offset;
			var volume_ambient_y = 96 + (64 * 4) + menu_y_offset;
			var volume_footstep_y = 96 + (64 * 5) + menu_y_offset;
			var volume_voice_y = 96 + (64 * 6) + menu_y_offset;
			var number_of_audio_channels_y = 96 + 8 + (64 * 7) - 20 + menu_y_offset;
			var narrator_y = 96 + 8 + (64 * 8) - 10 + menu_y_offset;
			var default_audio_settings_y = 96 + (64 * 8) + 20 + menu_y_offset;
			
			#region /* Make volumes stay between 0 and 1 */
			global.volume_main = clamp(global.volume_main, 0, 1);
			global.volume_music = clamp(global.volume_music, 0, 1);
			global.volume_melody = clamp(global.volume_melody, 0, 1);
			global.volume_sound = clamp(global.volume_sound, 0, 1);
			global.volume_ambient = clamp(global.volume_ambient, 0, 1);
			global.volume_footstep = clamp(global.volume_footstep, 0, 1);
			global.volume_voice = clamp(global.volume_voice, 0, 1);
			global.verbosity_slider = clamp(global.verbosity_slider, 0, 1);
			#endregion /* Make volumes stay between 0 and 1 END */
			
			#region /* Draw volume slider bars that represent how much volume each channel have */
			draw_menu_slider(410, volume_main_y, l10n_text("Main Volume"), "volume_main", global.volume_main, c_red);
			draw_line_width_color(410, volume_main_y + 32, 820, volume_main_y + 32, 3, c_white, c_white);
			draw_menu_slider(410, volume_music_y, l10n_text("Music Volume"), "volume_music", global.volume_music, c_red);
			draw_menu_slider(410, volume_melody_y, l10n_text("Melody Volume"), "volume_melody", global.volume_melody, c_red);
			draw_menu_slider(410, volume_sound_y, l10n_text("Sound Volume"), "volume_sound", global.volume_sound, c_lime);
			draw_menu_slider(410, volume_ambient_y, l10n_text("Ambient Volume"), "volume_ambient", global.volume_ambient, c_lime);
			draw_menu_slider(410, volume_footstep_y, l10n_text("Footstep Volume"), "volume_footstep", global.volume_footstep, c_lime);
			draw_menu_slider(410, volume_voice_y, l10n_text("Voices Volume"), "volume_voices", global.volume_voice, c_aqua);
			
			#region /* Verbosity Bar */
			if (global.enable_verbosity_slider)
			{
				draw_menu_slider(410, 96 + (64 * 7), l10n_text("Voices Volume"), "volume_voices", global.volume_voice, c_aqua);
			}
			#endregion /* Verbosity Bar END */
			
			#endregion /* Draw volume slider bars that represent how much volume each channel have END */
			
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			
			#region /* Select Narrator */
			if (global.enable_narrator)
			{
				var file_select_x = 450;
				var file_select_right_arrow_x = 400;
				
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				
				if (global.narrator_selection <= -3)
				{
					global.narrator_selection = -2;
					global.narrator = -1;
				}
				
				if (menu == "select_narrator")
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, narrator_y, 1, 1, 0, c_white, 1);
				}
				if (global.narrator_selection <= -2)
				{
					scr_draw_text_outlined(file_select_x, narrator_y, l10n_text("Narrator") + ": " + l10n_text("Nobody"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				}
				else
				if (global.narrator_selection == -1)
				{
					/* This option makes it so that whatever character is selected for Player 1, the narrator voice will be that same character, and globla.narrator will be changed to match that character slot */
					scr_draw_text_outlined(file_select_x, narrator_y, l10n_text("Narrator") + ": " + l10n_text("Match Player 1"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				}
				else
				if (global.narrator_selection >= 0)
				{
					scr_draw_text_outlined(file_select_x, narrator_y, l10n_text("Narrator") + ": " + string(narrator_name), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				}
				
				#region /* Select Narrator Left and Right Key, show underneath text */
				if (global.narrator_selection >= -1)
				{
					draw_sprite_ext(spr_keyboard_keys, vk_left, file_select_x - 32, narrator_y, 0.5, 0.5, 0, c_white, 1);
					if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x - 32 - 16, narrator_y - 16, file_select_x - 32 + 16, narrator_y + 16))
					&& (global.controls_used_for_navigation == "mouse")
					{
						if (!open_dropdown)
						{
							menu = "select_narrator";
						}
						draw_set_alpha(0.5);
						draw_rectangle_color(file_select_x - 32 - 16, narrator_y - 16, file_select_x - 32 + 16, narrator_y + 16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				if (global.narrator_selection < ds_list_size(global.all_loaded_characters) - 1)
				{
					draw_sprite_ext(spr_keyboard_keys, vk_right, file_select_x + file_select_right_arrow_x + 100, narrator_y, 0.5, 0.5, 0, c_white, 1);
					if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x + file_select_right_arrow_x + 100 - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 100 + 16, narrator_y + 16))
					&& (global.controls_used_for_navigation == "mouse")
					{
						if (!open_dropdown)
						{
							menu = "select_narrator";
						}
						draw_set_alpha(0.5);
						draw_rectangle_color(file_select_x + file_select_right_arrow_x + 100 - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 100 + 16, narrator_y + 16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /* Select Narrator Left and Right Key, show underneath text END */
				
				#region /* Player 1 change portrait when clicking left or right */
				
				#region /* Player 1 Key Left (change portrait sprites) */
				if (key_left)
				&& (menu == "select_narrator")
				|| (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x - 32 - 16, narrator_y - 16, file_select_x - 32 + 16, narrator_y + 16))
				&& (global.controls_used_for_navigation == "mouse")
				{
					menu = "select_narrator";
					if (menu_delay == 0 && menu_joystick_delay == 0)
					&& (global.narrator_selection > -2)
					&& (!open_dropdown)
					{
						menu_delay = 3;
						if (global.narrator_selection > -2)
						{
							global.narrator_selection --;
						}
						
						scr_set_narrator();
						
						#region /* Character Name */
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
						|| (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
						{
							if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
							{
								ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
							}
							else
							{
								ini_open(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
							}
						
							#region /* Character Name */
							narrator_name = string(ds_list_find_value(global.all_loaded_characters, global.narrator));
							#endregion /* Character Name END */
						
							ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
						}
						else
						{
							narrator_name = string(global.narrator + 1);
						}
						#endregion /* Character Name END */
						
						#region /* Player 1 character select portrait sprite */
						scr_delete_sprite_properly(global.sprite_select_player[fixed_player]);
						global.sprite_select_player[fixed_player] = spr_noone;
						scr_set_character_folder(fixed_player, global.skin_for_player[fixed_player]);
						ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
						global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("idle", global.sprite_select_player[fixed_player]);
						global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("stand", global.sprite_select_player[fixed_player]);
						global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[fixed_player]);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
						#endregion /* Player 1 character select portrait sprite END */
						
					}
					open_dropdown = false;
				}
				#endregion /* Player 1 Key Left (change portrait sprites) END */
				
				#region /* Player 1 Key Right (change portrait sprites) */
				if (key_right)
				&& (menu == "select_narrator")
				|| (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x + file_select_right_arrow_x + 100 - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 100 + 16, narrator_y + 16))
				&& (global.controls_used_for_navigation == "mouse")
				{
					menu = "select_narrator";
					if (menu_delay == 0 && menu_joystick_delay == 0)
					&& (!open_dropdown)
					{
						menu_delay = 3;
						global.narrator_selection = clamp(global.narrator_selection + 1, -2, ds_list_size(global.all_loaded_characters) - 1);
						
						scr_set_narrator();
						
						#region /* Character Name */
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
						|| (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
						{
							if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
							{
								ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
							}
							else
							{
								ini_open(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
							}
						
							#region /* Character Name */
							narrator_name = string(ds_list_find_value(global.all_loaded_characters, global.narrator));
							#endregion /* Character Name END */
						
							ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
						}
						else
						{
							narrator_name = string(global.narrator + 1);
						}
						#endregion /* Character Name END */
						
						#region /* Player 1 character select portrait sprite */
						scr_delete_sprite_properly(global.sprite_select_player[fixed_player]);
						global.sprite_select_player[fixed_player] = spr_noone;
						scr_set_character_folder(fixed_player, global.skin_for_player[fixed_player]);
						ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
						global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("walk", global.sprite_select_player[fixed_player]);
						global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("idle", global.sprite_select_player[fixed_player]);
						global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("stand", global.sprite_select_player[fixed_player]);
						global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[fixed_player]);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
						#endregion /* Player 1 character select portrait sprite END */
						
					}
					open_dropdown = false;
				}
				#endregion /* Player 1 Key Right (change portrait sprites) END */
				
				#endregion /* Player 1 change portrait when clicking left or right END */
				
			}
			#endregion /* Select Narrator END */
			
			#region /* Reset to Default Audio Settings */
			draw_menu_button(430, default_audio_settings_y, l10n_text("Default Settings"), "default_audio_settings", "default_audio_settings");
			
			if (menu == "default_audio_settings")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (mouse_check_button_released(mb_left) && mouse_get_x > 370)
				&& (point_in_rectangle(mouse_get_x, mouse_get_y, 430, default_audio_settings_y + 1, 430 + 370, default_audio_settings_y + 41))
				&& (global.controls_used_for_navigation == "mouse")
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_set_default_audio_settings();
					menu_delay = 3;
				}
			}
			#endregion /* Reset to Default Audio Settings END */
			
			draw_menu_dropdown(390, number_of_audio_channels_y, l10n_text("Number of Audio Channels"), "number_of_audio_channels", global.number_of_audio_channels, "32", "64", "96", "128", "160", "192", "224", "256"); /* Dropdown menus should be drawn last so they are above everything else when you open them */
			scr_set_default_dropdown_description("number_of_audio_channels", "128");
		}
		#endregion /* Audio Settings END */
		
		scr_option_language_menu(); /* Language Options */
		
		scr_option_custom_resources(); /* Custom Resources Settings */
		
		scr_option_storage(); /* Storage Settings */
		
		#region /* Broadcast Settings */
		if (global.settings_sidebar_menu == "broadcast_settings")
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(410, 20 + (40 * 3), "Connect your Twitch account \n and earn in-game rewards \n as you stream the game :)", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Broadcast Settings END */
		
		#region /* How to Play */
		if (global.settings_sidebar_menu == "how_to_play")
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(410, 20 + (40 * 3), "Control frog. \n Frog jump. \n Frog tongue. \n Frog happy.", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* How to Play END */
	
		#endregion /* General Settings END */
	
		draw_set_alpha(darken_settings_alpha);
		draw_rectangle_color(left_sidebar_x + 370, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	
		#region /* Menu Navigation */
		if (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		{
			
			#region /* Options Menu */
			
			#region /* Difficulty Settings Navigation */
			if (menu == "difficulty_settings")
			{
				if (key_up)
				&& (open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (global.difficulty > 0)
				{
					menu_delay = 3;
					global.difficulty --;
				}
				else
				if (key_down)
				&& (open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (global.difficulty < 2)
				{
					menu_delay = 3;
					global.difficulty ++;
				}
				else
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_option_for_pc)
					{
						menu = "debug_screen";
					}
					else
					if (can_select_font)
					{
						menu = "select_font";
					}
					else
					{
						menu = "hud_hide_time";
					}
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_option_for_pc)
					{
						menu = "automatically_pause_when_window_is_unfocused_settings";
					}
					else
					{
						menu = "show_timer_settings";
					}
				}
			}
			#endregion /* Difficulty Settings Navigation END */
	
			else
	
			#region /* Navigate Game Settings */
			if (menu == "automatically_pause_when_window_is_unfocused_settings")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "difficulty_settings";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "show_timer_settings";
				}
			}
			else
			if (menu == "show_timer_settings")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_option_for_pc) {
						menu = "automatically_pause_when_window_is_unfocused_settings";
					}
					else {
						menu = "difficulty_settings";
					}
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "show_defeats_counter_settings";
				}
			}
			else
			if (menu == "show_defeats_counter_settings")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "show_timer_settings";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_ranks)
					{
						menu = "show_ranks_settings";
					}
					else
					{
						menu = "show_tutorial_signs";
					}
				}
			}
			else
			if (menu == "show_ranks_settings")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "show_defeats_counter_settings";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "show_tutorial_signs";
				}
			}
			else
			if (menu == "show_tutorial_signs")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_ranks)
					{
						menu = "show_ranks_settings";
					}
					else
					{
						menu = "show_defeats_counter_settings";
					}
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "players_can_collide";
				}
			}
			else
			if (menu == "players_can_collide")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "show_tutorial_signs";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "show_new_items_notification";
				}
			}
			else
			if (menu == "show_new_items_notification")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "players_can_collide";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "hud_hide_time";
				}
			}
			else
			if (menu == "hud_hide_time")
			{
				if (key_up)
				&& (open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (global.hud_hide_time > 0)
				{
					menu_delay = 3;
					global.hud_hide_time --;
				}
				else
				if (key_down)
				&& (open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (global.hud_hide_time < 10)
				{
					menu_delay = 3;
					global.hud_hide_time ++;
				}
				else
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "show_new_items_notification";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (can_select_font)
					{
						menu = "select_font";
					}
					else
					if (global.enable_option_for_pc)
					{
						menu = "debug_screen";
					}
					else
					{
						menu = "difficulty_settings";
					}
				}
			}
			else
			if (menu == "select_font")
			{
				if (key_up)
				&& (open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (global.selected_font > 0)
				&& (can_select_font)
				{
					menu_delay = 3;
					global.selected_font --;
					scr_set_font();
				}
				else
				if (key_down)
				&& (open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (can_select_font)
				{
					/* If you have selected Japanese language, you can't use Open Dyslexic, as it isn't supported */
					/* If "Global Selected Font" checks for less than 1 here, then you can only select Game font and Normal font */
					if (global.language_local_data[# global.selected_language_id, 0] == "日本語 (Japanese)")
					&& (global.selected_font < 1)
					|| (global.language_local_data[# global.selected_language_id, 0] != "日本語 (Japanese)")
					&& (global.selected_font < 2)
					{
						menu_delay = 3;
						global.selected_font ++;
						scr_set_font();
					}
				}
				else
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "hud_hide_time";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_option_for_pc)
					{
						menu = "debug_screen";
					}
					else
					{
						menu = "difficulty_settings";
					}
				}
			}
			else
			if (menu == "debug_screen")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (can_select_font)
					{
						menu = "select_font";
					}
					else
					{
						menu = "hud_hide_time";
					}
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "difficulty_settings";
				}
			}
			#endregion /* Navigate Game Settings END */
			
			else
			
			#region /* Players can collide */
			if (menu == "players_can_collide")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "hud_hide_time";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "assist_settings";
				}
			}
			#endregion /* Players can collide END */
			
			else
			
			#region /* Assist Enable Navigation */
			if (menu == "assist_enable")
			&& (global.assist_enable)
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_enable_spikes";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_item_appear";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Enable Navigation END */
	
			else
	
			#region /* Assist Item Appear Navigation */
			if (menu == "assist_item_appear")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_enable";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_extra_hp";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (open_dropdown)
				&& (global.assist_item_appear > 0)
				{
					global.assist_item_appear --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (open_dropdown)
				&& (global.assist_item_appear < 10)
				{
					global.assist_item_appear ++;
					menu_delay = 3;
				}
			}
			#endregion /* Assist Item Appear Navigation END */
			
			else
			
			#region /* Assist Extra HP Navigation */
			if (menu == "assist_extra_hp")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					menu = "assist_item_appear";
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					menu = "assist_above_1_hp";
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (open_dropdown)
				&& (global.assist_extra_hp > 0)
				{
					menu_delay = 3;
					global.assist_extra_hp --;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (open_dropdown)
				&& (global.assist_extra_hp < 9)
				{
					menu_delay = 3;
					global.assist_extra_hp ++;
				}
			}
			#endregion /* Assist Extra HP Navigation END */
			
			else
			
			#region /* Assist Above 1 HP Navigation */
			if (menu == "assist_above_1_hp")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_extra_hp";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_invincibility";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Above 1 HP Navigation END */
			
			else
			
			#region /* Assist Invincibility Navigation */
			if (menu == "assist_invincibility")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_above_1_hp";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_moonjump";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Invincibility Navigation END */
			
			else
			
			#region /* Assist Moonjump Navigation */
			if (menu == "assist_moonjump")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_invincibility";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_hover_when_holding_jump";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Moonjump Navigation END */
			
			else
			
			#region /* Assist Hover When Holding Jump Navigation */
			if (menu == "assist_hover_when_holding_jump")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_moonjump";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_floor_over_bottomless_pit";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Hover When Holding Jump Navigation END */
			
			else
			
			#region /* Assist Floor Over Bottomless Pit Navigation */
			if (menu == "assist_floor_over_bottomless_pit")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_hover_when_holding_jump";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_breathe_underwater";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Floor Over Bottomless Pit Navigation END */
			
			else
			
			#region /* Assist Breathe Underwater Navigation */
			if (menu == "assist_breathe_underwater")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_floor_over_bottomless_pit";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_guiding_arrows";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Breathe Underwater Navigation END */
	
			else
	
			#region /* Assist Guiding Arrows Navigation */
			if (menu == "assist_guiding_arrows")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_breathe_underwater";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_normal_arrows";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Guiding Arrows Navigation END */
	
			else
	
			#region /* Assist Normal Arrows Navigation */
			if (menu == "assist_normal_arrows")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_guiding_arrows";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "assist_enable_enemies";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Normal Arrows Navigation END */
		
			else
		
			#region /* Assist Enable Enemies Navigation */
			if (menu == "assist_enable_enemies")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "assist_normal_arrows";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "assist_enable_spikes";
				}
			}
			#endregion /* Assist Enable Enemies Navigation END */
		
			else
		
			#region /* Assist Enable Spikes Navigation */
			if (menu == "assist_enable_spikes")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "assist_enable_enemies";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "assist_enable";
				}
			}
			#endregion /* Assist Enable Spikes Navigation END */
			
			else
			
			#region /* Main Volume Navigation */
			if (menu == "volume_main")
			{
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_main > 0)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_main -= 0.0001;
						}
						else
						{
							global.volume_main -= 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_main < +1)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_main += 0.0001;
						}
						else
						{
							global.volume_main += 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "default_audio_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_music";
					menu_delay = 3;
				}
			}
			#endregion /* Main Volume Navigation END */
		
			else
		
			#region /* Music Volume Navigation */
			if (menu == "volume_music")
			{
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_music > 0)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_music -= 0.0001;
						}
						else
						{
							global.volume_music -= 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_music * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_music < +1)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_music += 0.0001;
						}
						else
						{
							global.volume_music += 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_music * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_main";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_melody";
					menu_delay = 3;
				}
			}
			#endregion /* Music Volume Navigation END */
			
			else
			
			#region /* Melody Volume Navigation */
			if (menu == "volume_melody")
			{
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_melody > 0)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_melody -= 0.0001;
						}
						else
						{
							global.volume_melody -= 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_melody * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_melody < +1)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_melody += 0.0001;
						}
						else
						{
							global.volume_melody += 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_melody * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_music";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_sound";
					menu_delay = 3;
				}
			}
			#endregion /* Melody Volume Navigation END */
			
			else
			
			#region /* Sound Volume Navigation */
			if (menu == "volume_sound")
			{
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_sound > 0)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_sound -= 0.0001;
						}
						else
						{
							global.volume_sound -= 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_sound * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_sound < +1)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_sound += 0.0001;
						}
						else
						{
							global.volume_sound += 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_sound * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_melody";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_ambient";
					menu_delay = 3;
				}
			}
			#endregion /* Sound Volume Navigation END */
	
			else
	
			#region /* Ambient Volume Navigation */
			if (menu == "volume_ambient")
			{
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_ambient > 0)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_ambient -= 0.0001;
						}
						else
						{
							global.volume_ambient -= 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_ambient * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_ambient < +1)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_ambient += 0.0001;
						}
						else
						{
							global.volume_ambient += 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_ambient * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_sound";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_footstep";
					menu_delay = 3;
				}
			}
			#endregion /* Ambient Volume Navigation END */
		
			else
		
			#region /* Footstep Volume Navigation */
			if (menu == "volume_footstep")
			{
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_footstep > 0)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_footstep -= 0.0001;
						}
						else
						{
							global.volume_footstep -= 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_footstep * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_footstep < +1)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_footstep += 0.0001;
						}
						else
						{
							global.volume_footstep += 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_footstep * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_ambient";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_voices";
					menu_delay = 3;
				}
			}
			#endregion /* Footstep Volume Navigation END */
		
			else
		
			#region /* Voices Volume Navigation */
			if (menu == "volume_voices")
			{
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_voice > 0)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_voice -= 0.0001;
						}
						else
						{
							global.volume_voice -= 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_voice * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.volume_voice < +1)
					{
						if (keyboard_check(vk_shift))
						{
							global.volume_voice += 0.0001;
						}
						else
						{
							global.volume_voice += 0.05;
						}
					}
					audio_play_sound(snd_basic_collectible, 0, 0, global.volume_voice * global.volume_main); /* Play a sound effect so player can hear how loud it will sound like */
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_footstep";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "number_of_audio_channels";
					menu_delay = 3;
				}
			}
			#endregion /* Voices Volume Navigation END */

			else
	
			#region /* Number of Audio Channels Navigation */
			if (menu == "number_of_audio_channels")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_voices";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					if (global.enable_verbosity_slider)
					{
						menu = "verbosity_slider";
						menu_delay = 3;
					}
					else
					if (global.enable_narrator)
					{
						menu = "select_narrator";
						menu_delay = 3;
					}
					else
					{
						menu = "volume_music";
						menu_delay = 3;
					}
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (open_dropdown)
				&& (global.number_of_audio_channels> 0)
				{
					global.number_of_audio_channels --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (open_dropdown)
				&& (global.number_of_audio_channels< 7)
				{
					global.number_of_audio_channels++;
					menu_delay = 3;
				}
			}
			#endregion /* Number of Audio Channels Navigation END */
	
			else
	
			#region /* Verbosity Slider Navigation */
			if (menu == "verbosity_slider")
			{
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.verbosity_slider > 0)
					{
						if (keyboard_check(vk_shift))
						{
							global.verbosity_slider -= 0.0001;
						}
						else
						{
							global.verbosity_slider -= 0.05;
						}
					}
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu_delay = 3;
					if (global.verbosity_slider < +1)
					{
						if (keyboard_check(vk_shift))
						{
							global.verbosity_slider += 0.0001;
						}
						else
						{
							global.verbosity_slider += 0.05;
						}
					}
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_voices";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					if (global.enable_narrator)
					{
						menu = "select_narrator";
						menu_delay = 3;
					}
					else
					{
						menu = "volume_music";
						menu_delay = 3;
					}
				}
			}
			#endregion /* Verbosity Slider Navigation END */

			else

			#region /* Select Narrator Navigation */
			if (menu == "select_narrator")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					if (global.enable_verbosity_slider)
					{
						menu = "verbosity_slider";
						menu_delay = 3;
					}
					else
					{
						menu = "number_of_audio_channels";
						menu_delay = 3;
					}
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "default_audio_settings";
					menu_delay = 3;
				}
			}
			#endregion /* Select Narrator Navigation */
		
			else
		
			#region /* Default Audio Settings Navigation */
			if (menu == "default_audio_settings")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					if (global.enable_narrator)
					{
						menu = "select_narrator";
						menu_delay = 3;
					}
					else
					if (global.enable_verbosity_slider)
					{
						menu = "verbosity_slider";
						menu_delay = 3;
					}
					else
					{
						menu = "number_of_audio_channels";
						menu_delay = 3;
					}
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "volume_main";
					menu_delay = 3;
				}
			}
			#endregion /* Default Audio Settings Navigation */
		
			#endregion /* Options Menu END */
		
		}
		#endregion /* Menu Navigation END */
		
	}
	else
	{
		left_sidebar_x = lerp(left_sidebar_x, -400, 0.1);
		background_brightness_menu_lerp = lerp(background_brightness_menu_lerp, 0, 0.1);
	}
	
	#region /* Darken sidebar when it's not the focus */
	if (can_navigate_settings_sidebar)
	&& (in_settings)
	{
		darken_settings_alpha = lerp(darken_settings_alpha, 0.5, 0.1); /* Darken the settings */
		darken_settings_sidebar_alpha = lerp(darken_settings_sidebar_alpha, 0, 0.1); /* But not the settings sidebar */
	}
	else
	if (!can_navigate_settings_sidebar)
	&& (in_settings)
	{
		darken_settings_alpha = lerp(darken_settings_alpha, 0, 0.1); /* Don't darken the settings */
		darken_settings_sidebar_alpha = lerp(darken_settings_sidebar_alpha, 0.5, 0.1); /* But darken the settings sidebar */
	}
	else
	if (!in_settings)
	{
		darken_settings_alpha = lerp(darken_settings_alpha, 0, 0.1); /* Don't darken the settings */
		darken_settings_sidebar_alpha = lerp(darken_settings_sidebar_alpha, 0, 0.1); /* And don't darken the settings sidebar */
	}
	#endregion /* Darken sidebar when it's not the focus END */
	
	scr_menu_navigation_with_joystick_delay();
	scr_draw_option_description();
}