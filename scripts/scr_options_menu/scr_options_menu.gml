///scr_options_menu()
function scr_options_menu()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Background Brightness in Menus Options */
	if (background_brightness_menu_lerp < 0)
	{
		draw_set_alpha(abs(background_brightness_menu_lerp));
		draw_rectangle_color(- 32, - 32, room_width * 2, room_height * 2, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	else
	if (background_brightness_menu_lerp > 0)
	{
		draw_set_alpha(abs(background_brightness_menu_lerp));
		draw_rectangle_color(- 32, - 32, room_width * 2, room_height * 2, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	#endregion /* Background Brightness in Menus Options END */
	
	#region /* Black Background behind sidebar */
	draw_set_alpha(1);
	draw_rectangle_color(left_sidebar_x + 0, 0, left_sidebar_x + 370, get_window_height, c_black, c_black, c_black, c_black, false);
	#endregion /* Black Background behind sidebar END */
	
	#region /* Set Font */
	//if (global.language_localization = localization.ar_sa)
	//{
	//	var text_x_offset = 290;
	//	var icon_x_offset = 330;
	//	draw_set_halign(fa_right);
	//	draw_set_valign(fa_middle);
	//}
	//else
	//{
		var text_x_offset = 0;
		var icon_x_offset = 0;
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
	//}
	#endregion /* Set Font END */
	
	#region /* Tabs Graphics */
	if (left_sidebar_x > -400)
	{
		
		#region /* Menu navigation tabs y positions */
		accessibility_settings_y = 40;
		if (global.enable_how_to_play_settings == true)
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
		if (global.enable_multiplayer_settings == true)
		{
			multiplayer_settings_y = game_settings_y + 40;
			controls_text_y = multiplayer_settings_y + 40;
		}
		else
		{
			multiplayer_settings_y = -999;
			controls_text_y = game_settings_y + 40;
		}
		if (global.enable_keyboard_and_mouse_settings == true)
		{
			keyboard_and_mouse_settings_y = controls_text_y + 40;
			controller_settings_y = keyboard_and_mouse_settings_y + 40;
		}
		else
		{
			keyboard_and_mouse_settings_y = -999;
			controller_settings_y = controls_text_y + 40;
		}
		if (global.enable_touch_settings == true)
		{
			touch_settings_y = controller_settings_y + 40;
			general_text_y = touch_settings_y + 40;
		}
		else
		{
			touch_settings_y = -999;
			general_text_y = controller_settings_y + 40;
		}
		if (global.enable_profile_settings == true)
		{
			profile_settings_y = general_text_y + 40;
			video_settings_y = profile_settings_y + 40;
		}
		else
		{
			profile_settings_y = -999;
			video_settings_y = general_text_y + 40;
		}
		audio_settings_y = video_settings_y + 40;
		global_resources_settings_y = audio_settings_y + 40;
		storage_settings_y = global_resources_settings_y + 40;
		language_settings_y = storage_settings_y + 40;
		if (global.enable_broadcast_settings == true)
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
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +accessibility_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +accessibility_settings_y, 1, 1, 0, c_gray, 1);
			}
			/* Button Hightlighted */
			
			draw_sprite_ext(spr_settings_icons, 1, left_sidebar_x + 20 + icon_x_offset, 20 +accessibility_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +accessibility_settings_y, l10n_text("Accessibility"), global.default_text_size * 1.05, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +accessibility_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +accessibility_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 1, left_sidebar_x + 20 + icon_x_offset, 20 +accessibility_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +accessibility_settings_y, l10n_text("Accessibility"), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* Accessibility Settings END */
		
		#region /* My Game Settings */
		scr_draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (game_text_y), l10n_text("Game"), global.default_text_size * 0.5, c_black, c_white, 1);
		
		#region /* Game Settings */
		if (global.settings_sidebar_menu == "game_settings")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, game_settings_y, 370, game_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 2, left_sidebar_x + 20 + icon_x_offset, 20 + game_settings_y, 1, 1, 0, c_white, 1) /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + game_settings_y, l10n_text("Game"), global.default_text_size * 1.05, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, game_settings_y, 370, game_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + game_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 2, left_sidebar_x + 20 + icon_x_offset, 20 + game_settings_y, 0.9, 0.9, 0, c_white, 1)
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + game_settings_y, l10n_text("Game"), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* Game Settings END */
		
		#region /* Multiplayer Settings */
		if (global.enable_multiplayer_settings == true)
		{
			if (global.settings_sidebar_menu == "multiplayer_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icons, 3, left_sidebar_x + 20 + icon_x_offset, 20 + multiplayer_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + multiplayer_settings_y, l10n_text("Multiplayer"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + multiplayer_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icons, 3, left_sidebar_x + 20 + icon_x_offset, 20 + multiplayer_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + multiplayer_settings_y, l10n_text("Multiplayer"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Multiplayer Settings END */
		
		#endregion /* My Game Settings END */
		
		#region /* Controls Settings */
		scr_draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (controls_text_y), l10n_text("Controls"), global.default_text_size * 0.5, c_black, c_white, 1);
		
		#region /* Keyboard and Mouse Settings */
		if (global.enable_keyboard_and_mouse_settings == true)
		{
			if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, keyboard_and_mouse_settings_y, 370, keyboard_and_mouse_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icons, 4, left_sidebar_x + 20 + icon_x_offset, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +keyboard_and_mouse_settings_y, l10n_text("Keyboard & Mouse"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, keyboard_and_mouse_settings_y, 370, keyboard_and_mouse_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +keyboard_and_mouse_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icons, 4, left_sidebar_x + 20 + icon_x_offset, 20 +keyboard_and_mouse_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +keyboard_and_mouse_settings_y, l10n_text("Keyboard & Mouse"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Keyboard and Mouse Settings */
		
		#region /* Controller Settings */
		if (global.enable_controller_settings == true)
		{
			if (global.settings_sidebar_menu == "controller_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, controller_settings_y, 370, controller_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icons, 5, left_sidebar_x + 20 + icon_x_offset, 20 + controller_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + controller_settings_y, l10n_text("Controller"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, controller_settings_y, 370, controller_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + controller_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icons, 5, left_sidebar_x + 20 + icon_x_offset, 20 + controller_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + controller_settings_y, l10n_text("Controller"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Controller Settings END */
		
		#region /* Touch Settings */
		if (global.enable_touch_settings == true)
		{
			if (global.settings_sidebar_menu == "touch_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, touch_settings_y, 370, touch_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icons,6, left_sidebar_x + 20 + icon_x_offset, 20 + touch_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + touch_settings_y, l10n_text("Touch"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, touch_settings_y, 370,(40 * 9) - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + touch_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icons,6, left_sidebar_x + 20 + icon_x_offset, 20 + touch_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + touch_settings_y, l10n_text("Touch"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Touch Settings END */
		
		#endregion /* Controls Settings END */
		
		#region /* General Settings */
		scr_draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + general_text_y, l10n_text("General"), global.default_text_size * 0.5, c_black, c_white, 1);
		
		#region /* Profile Settings */
		if (global.enable_profile_settings == true)
		{
			if (global.settings_sidebar_menu == "profile_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, profile_settings_y, 370, profile_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +profile_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +profile_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icons, 7, left_sidebar_x + 20 + icon_x_offset, 20 +profile_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +profile_settings_y, l10n_text("Profile"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, profile_settings_y, 370, profile_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +profile_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +profile_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icons, 7, left_sidebar_x + 20 + icon_x_offset, 20 +profile_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +profile_settings_y, l10n_text("Profile"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Profile Settings END */
		
		#region /* Video Settings */
		if (global.settings_sidebar_menu == "video_settings")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, video_settings_y, 370, video_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons, 8, left_sidebar_x + 20 + icon_x_offset, 20 + video_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + video_settings_y, l10n_text("Video"), global.default_text_size * 1.05, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, video_settings_y, 370, video_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + video_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons, 8, left_sidebar_x + 20 + icon_x_offset, 20 + video_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + video_settings_y, l10n_text("Video"), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* Video Settings END */
		
		#region /* Audio Settings */
		if (global.settings_sidebar_menu == "audio_settings")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, audio_settings_y, 370, audio_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +audio_settings_y, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +audio_settings_y, 1, 1, 0, c_gray, 1);
			}
			draw_sprite_ext(spr_settings_icons,9, left_sidebar_x + 20 + icon_x_offset, 20 +audio_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +audio_settings_y, l10n_text("Audio"), global.default_text_size * 1.05, c_black, c_white, 1);
		}
		else
			{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, audio_settings_y, 370, audio_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +audio_settings_y, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +audio_settings_y, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(spr_settings_icons,9, left_sidebar_x + 20 + icon_x_offset, 20 +audio_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +audio_settings_y, l10n_text("Audio"), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* Audio Settings END */
		
		#region /* Global Resources Settings */
		if (global.enable_global_resources_settings == true)
		{
			if (global.settings_sidebar_menu == "global_resources_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + global_resources_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + global_resources_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icons, 10, left_sidebar_x + 20 + icon_x_offset, 20 + global_resources_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + global_resources_settings_y, l10n_text("Custom Resources"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + global_resources_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + global_resources_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icons, 10, left_sidebar_x + 20 + icon_x_offset, 20 + global_resources_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + global_resources_settings_y, l10n_text("Custom Resources"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Global Resources Settings END */
		
		#region /* Storage Settings */
		if (global.enable_storage_settings == true)
		{
			if (global.settings_sidebar_menu == "storage_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, storage_settings_y, 370, storage_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icons, 11, left_sidebar_x + 20 + icon_x_offset, 20 + storage_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + storage_settings_y, l10n_text("Storage"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, storage_settings_y, 370, storage_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + storage_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icons, 11, left_sidebar_x + 20 + icon_x_offset, 20 + storage_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + storage_settings_y, l10n_text("Storage"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Storage Settings END */
		
		#region /* Language Settings */
		if (global.enable_language_settings == true)
		{
			if (global.settings_sidebar_menu == "language_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, language_settings_y, 370, language_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icons, 12, left_sidebar_x + 20 + icon_x_offset, 20 +language_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +language_settings_y, l10n_text("Language"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, language_settings_y, 370, language_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +language_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icons, 12, left_sidebar_x + 20 + icon_x_offset, 20 +language_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +language_settings_y, l10n_text("Language"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Language Settings END */
		
		#region /* Broadcast Settings */
		if (global.enable_broadcast_settings == true)
		{
			if (global.settings_sidebar_menu == "broadcast_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, broadcast_settings_y, 370, broadcast_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icons, 13, left_sidebar_x + 20 + icon_x_offset, 20 +broadcast_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +broadcast_settings_y, l10n_text("Broadcast"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, broadcast_settings_y, 370, broadcast_settings_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +broadcast_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icons, 13, left_sidebar_x + 20 + icon_x_offset, 20 +broadcast_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +broadcast_settings_y, l10n_text("Broadcast"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Broadcast Settings END */
		
		#region /* How to play Settings */
		if (global.enable_how_to_play_settings == true)
		{
			if (global.settings_sidebar_menu == "how_to_play")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, how_to_play_y, 370, how_to_play_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_settings_icons, 14, left_sidebar_x + 20 + icon_x_offset, 20 +how_to_play_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +how_to_play_y, l10n_text("How to Play"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, how_to_play_y, 370, how_to_play_y + 40 - 1))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 +how_to_play_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_settings_icons, 14, left_sidebar_x + 20 + icon_x_offset, 20 +how_to_play_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 +how_to_play_y, l10n_text("How to Play"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* General Settings END */
		
		#region /* Add-Ons Settings */
		if (global.enable_add_ons_settings == true)
		{
			scr_draw_text_outlined(left_sidebar_x + 20 + text_x_offset, 20 + (40 * 18), l10n_text("Add-Ons"), global.default_text_size * 0.5, c_black, c_white, 1);
			
			if (global.settings_sidebar_menu == "resource_pack_settings")
			{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 * 19), 1, 1, 0, c_gray, 1); /* Button Hightlighted */
			draw_sprite_ext(spr_settings_icons, 15, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 19), 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 19), l10n_text("Resource Packs"), global.default_text_size * 1.05, c_black, c_white, 1);
			}else{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 * 19), 1, 1, 0, c_white, 1); /* Button Not Selected */
			draw_sprite_ext(spr_settings_icons, 15, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 19), 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 19), l10n_text("Resource Packs"), global.default_text_size, c_white, c_black, 1);}
			
			if (global.settings_sidebar_menu == "behavior_packs_settings")
			{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 * 20), 1, 1, 0, c_gray, 1); /* Button Hightlighted */
			draw_sprite_ext(spr_settings_icons, 16, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 20), 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 20), l10n_text("Behavior Packs"), global.default_text_size * 1.05, c_black, c_white, 1);
			}else{draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20 + (40 * 20), 1, 1, 0, c_white, 1); /* Button Not Selected */
			draw_sprite_ext(spr_settings_icons, 16, left_sidebar_x + 20 + icon_x_offset, 20 + (40 * 20), 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + (40 * 20), l10n_text("Behavior Packs"), global.default_text_size, c_white, c_black, 1);}
		}
		#endregion /* Add-Ons Settings END */
		
		#region /* The "Back" button should always appear at the top of the screen */
		if (global.settings_sidebar_menu == "settings_back")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, 0 - room_height, 370, 39))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20, 1, 1, 0, c_green, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20, 1, 1, 0, c_gray, 1);
			}
			/* Button Hightlighted */
			
			draw_sprite_ext(spr_icons_back, 0, left_sidebar_x + 20 + icon_x_offset, 20, 1, 1, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20, l10n_text("Back"), global.default_text_size * 1.05, c_black, c_white, 1);
		}
		else
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, 0 - room_height, 370, 39))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20, 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, left_sidebar_x, 20, 1, 1, 0, c_white, 1);
			}
			/* Button Not Selected */
			
			draw_sprite_ext(spr_icons_back, 0, left_sidebar_x + 20 + icon_x_offset, 20, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
			scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20, l10n_text("Back"), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* The "Back" button should always appear at the top of the screen END */
		
		#endregion /* Settings Sidebar END */
		
		draw_set_alpha(darken_settings_sidebar_alpha);
		draw_rectangle_color(left_sidebar_x, 0, left_sidebar_x + 370, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
	}
	#endregion /* Tabs Graphics END */
	
	if (in_settings == true)
	{
		
		#region /* Scroll menu on right side */
		menu_y_offset = lerp(menu_y_offset, menu_y_offset_real, 0.5);
		if (menu_y_offset_real >= 0)
		{
			menu_y_offset_real = 0;
		}
		if (abs(menu_y_offset_real) + get_window_height - 200 < menu_cursor_y_position)
		{
			menu_y_offset_real -= 10;
		}
		if (abs(menu_y_offset_real) + 200 > menu_cursor_y_position)
		{
			menu_y_offset_real += 10;
		}
		if (abs(menu_y_offset_real) + get_window_height + 200 < menu_cursor_y_position)
		{
			menu_y_offset_real -= 100;
		}
		if (abs(menu_y_offset_real) - 200 > menu_cursor_y_position)
		{
			menu_y_offset_real += 100;
		}
		#endregion /* Scroll menu on right side END */
		
		#region /* Go back out of setting menu */
		if (key_a_pressed)
		and (menu_delay == 0)
		and (global.settings_sidebar_menu = "settings_back")
		and (can_navigate_settings_sidebar == true)
		and (input_key == false)
		and (input_gamepad_button = false)
		or (key_b_pressed)
		and (menu_delay == 0)
		and (can_navigate_settings_sidebar == true)
		and (input_key == false)
		and (input_gamepad_button = false)
		{
			scr_config_save(); /* Save Config */
			if (global.pause_room != room_leveleditor)
			and (global.selected_resource_pack != old_selected_resource_pack)
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
		and (can_navigate_settings_sidebar = false)
		and (menu_delay == 0)
		and (input_key == false)
		and (input_gamepad_button = false)
		{
			if (open_dropdown == true)
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
		and (global.settings_sidebar_menu != "settings_back")
		and (can_navigate_settings_sidebar == true)
		and (menu_delay == 0)
		or (key_a_pressed)
		and (global.settings_sidebar_menu != "settings_back")
		and (can_navigate_settings_sidebar == true)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			can_navigate_settings_sidebar = false;
			if (global.settings_sidebar_menu == "accessibility_settings"){menu = "assist_enable";}
			if (global.settings_sidebar_menu == "game_settings")
			{
				if (global.enable_difficulty_selection_settings == true)
				{
					menu = "difficulty_settings";
				}
				else
				{
					menu = "automatically_pause_when_window_is_unfocused_settings";
				}
			}
			if (global.settings_sidebar_menu == "keyboard_and_mouse_settings"){menu = "remap_select_player";}
			if (global.settings_sidebar_menu == "controller_settings"){menu = "remap_select_player";}
			if (global.settings_sidebar_menu == "video_settings")
			{
				if (os_type != os_ios)
				and (os_type != os_android)
				and (global.enable_options_for_pc == true)
				{
					menu = "fullscreen_mode";
				}
				else
				{
					menu = "interpolate";
				}
			}
			if (global.settings_sidebar_menu == "audio_settings"){menu = "volume_main";}
			if (global.settings_sidebar_menu == "global_resources_settings")
			{
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				and (global.enable_options_for_pc == false)
				or (global.enable_options_for_pc == true)
				{
					menu = "resource_pack";
				}
				else
				{
					menu = "title_backgrounds";
				}
			}
			if (global.settings_sidebar_menu == "storage_settings"){menu = "file_select";}
			if (global.settings_sidebar_menu == "language_settings")
			{
				menu = "Language" + string(language_index);
				menu_cursor_y_position = language_index * 50;
			}
		}
		/* When you navigate the sidebar or not */
	
		/* Main Settings on left sidebar */
	
		background_brightness_menu_lerp = lerp(background_brightness_menu_lerp, global.background_brightness_menu, 0.1); /* Background Brightness in Menus Options END */
	
		left_sidebar_x = lerp(left_sidebar_x, 0, 0.1);
	
		#region /* Menu navigation with mouse */
	
		#region /* Click Back */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, 0 - room_height, 370, 40 - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (global.settings_sidebar_menu = "settings_back")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		{
			scr_config_save(); /* Save Config */
			if (global.pause_room != room_leveleditor)
			and (global.selected_resource_pack != old_selected_resource_pack)
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
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, 0 - room_height, 370, 40 - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button(mb_left))
		and (menu_delay == 0)
		{
			global.settings_sidebar_menu = "settings_back";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Back END */
		
		else
	
		#region /* Click Accessibility */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (global.settings_sidebar_menu = "accessibility_settings")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
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
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, accessibility_settings_y, 370,(accessibility_settings_y + 40) - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button(mb_left))
		and (menu_delay == 0)
		{
			global.settings_sidebar_menu = "accessibility_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Accessibility END */
		
		else
		
		#region /* Click Game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, game_settings_y, 370,(game_settings_y + 40) - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (global.settings_sidebar_menu = "game_settings")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		{
			global.settings_sidebar_menu = "game_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			if (global.enable_difficulty_selection_settings == true)
			{
				menu = "difficulty_settings";
			}
			else
			{
				menu = "automatically_pause_when_window_is_unfocused_settings";
			}
		}
		#endregion /* Click Game END */
		
		#region /* Game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, game_settings_y, 370,(game_settings_y + 40) - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button(mb_left))
		and (menu_delay == 0)
		{
			global.settings_sidebar_menu = "game_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Game END */
		
		if (global.enable_multiplayer_settings == true)
		{
			
			#region /* Click Multiplayer */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (global.settings_sidebar_menu = "multiplayer_settings")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "multiplayer_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
			}
			#endregion /* Click Multiplayer END */
			
			#region /* Multiplayer */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, multiplayer_settings_y, 370, multiplayer_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "multiplayer_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Multiplayer END */
			
		}
	
		#region /* Click Keyboard and Mouse */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, keyboard_and_mouse_settings_y, 370, keyboard_and_mouse_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (global.settings_sidebar_menu = "keyboard_and_mouse_settings")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		{
			global.settings_sidebar_menu = "keyboard_and_mouse_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			menu = "remap_select_player";
		}
		#endregion /* Click Keyboard and Mouse END */
		
		#region /* Keyboard and Mouse */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, keyboard_and_mouse_settings_y, 370, keyboard_and_mouse_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button(mb_left))
		and (menu_delay == 0)
		{
			global.settings_sidebar_menu = "keyboard_and_mouse_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Keyboard and Mouse END */
		
		if (global.enable_controller_settings == true)
		{
			
			#region /* Click Controller */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, controller_settings_y, 370, controller_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (global.settings_sidebar_menu = "controller_settings")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "controller_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
				menu = "remap_select_player";
			}
			#endregion /* Click Controller END */
			
			#region /* Controller */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, controller_settings_y, 370, controller_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "controller_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Controller END */
			
		}
	
		if (global.enable_touch_settings == true)
		{
			
			#region /* Click Touch */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, touch_settings_y, 370, touch_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (global.settings_sidebar_menu = "touch_settings")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "touch_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
			}
			#endregion /* Click Touch END */
			
			#region /* Touch */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, touch_settings_y, 370, touch_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "touch_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Touch END */
			
		}
	
		if (global.enable_profile_settings == true)
		{
			
			#region /* Click Profile */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, profile_settings_y, 370, profile_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (global.settings_sidebar_menu = "profile_settings")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "profile_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
			}
			#endregion /* Click Profile END */
			
			#region /* Profile */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, profile_settings_y, 370, profile_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "profile_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Profile END */
			
		}
	
		#region /* Click Video */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, video_settings_y, 370, video_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (global.settings_sidebar_menu = "video_settings")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		{
			global.settings_sidebar_menu = "video_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			if (os_type != os_ios)
			and (os_type != os_android)
			and (global.enable_options_for_pc == true)
			{
				menu = "fullscreen_mode";
			}
			else
			{
				menu = "interpolate";
			}
		}
		#endregion /* Click Video END */
		
		#region /* Video */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, video_settings_y, 370, video_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button(mb_left))
		and (menu_delay == 0)
		{
			global.settings_sidebar_menu = "video_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Video END */
		
		#region /* Click Audio */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, audio_settings_y, 370, audio_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (global.settings_sidebar_menu = "audio_settings")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		{
			global.settings_sidebar_menu = "audio_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			menu = "volume_main";
		}
		#endregion /* Click Audio END */
		
		#region /* Audio */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, audio_settings_y, 370, audio_settings_y + 40 - 1))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button(mb_left))
		and (menu_delay == 0)
		{
			global.settings_sidebar_menu = "audio_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Audio END */
		
		if (global.enable_global_resources_settings == true)
		{
			
			#region /* Click Global Resources */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (global.settings_sidebar_menu = "global_resources_settings")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "global_resources_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
				if (ds_list_size(global.all_loaded_resource_pack) >= 2)
				and (global.enable_options_for_pc == false)
				or (global.enable_options_for_pc == true)
				{
					menu = "resource_pack";
				}
				else
				{
					menu = "title_backgrounds";
				}
			}
			#endregion /* Click Global Resources END */
			
			#region /* Global Resources */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, global_resources_settings_y, 370, global_resources_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "global_resources_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Global Resources END */
			
		}
	
		if (global.enable_storage_settings == true)
		{
			
			#region /* Click Storage */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, storage_settings_y, 370, storage_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (global.settings_sidebar_menu = "storage_settings")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "storage_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
				menu = "file_select";
			}
			#endregion /* Click Storage END */
			
			#region /* Storage */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, storage_settings_y, 370, storage_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "storage_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Storage END */
			
		}
	
		if (global.enable_language_settings == true)
		{
			
			#region /* Click Language */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, language_settings_y, 370, language_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (global.settings_sidebar_menu = "language_settings")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "language_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
				menu = "Language" + string(language_index);
			}
			#endregion /* Click Language END */
			
			#region /* Language */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, language_settings_y, 370, language_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "language_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Language END */
			
		}
	
		if (global.enable_broadcast_settings == true)
		{
			
			#region /* Click Broadcast */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, broadcast_settings_y, 370, broadcast_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (global.settings_sidebar_menu = "broadcast_settings")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "broadcast_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
			}
			#endregion /* Click Broadcast END */
			
			#region /* Broadcast */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, broadcast_settings_y, 370, broadcast_settings_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "broadcast_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Broadcast END */
			
		}
	
		if (global.enable_how_to_play_settings == true)
		{
			
			#region /* Click How to Play */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, how_to_play_y, 370, how_to_play_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (global.settings_sidebar_menu = "how_to_play")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "how_to_play";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
			}
			#endregion /* Click How to Play END */
			
			#region /* How to Play */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0 - room_width, how_to_play_y, 370, how_to_play_y + 40 - 1))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button(mb_left))
			and (menu_delay == 0)
			{
				global.settings_sidebar_menu = "how_to_play";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* How to Play END */
			
		}
	
		#endregion /* Menu navigation with mouse END */
	
		#region /* Settings Sidebar Navigation */
		if (menu_joystick_delay <= 0)
		{
		
			#region /* Accessibility Settings */
			if (global.settings_sidebar_menu == "accessibility_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
				{
					global.settings_sidebar_menu = "settings_back";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
				{
					if (global.enable_how_to_play_settings == true)
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
			if (global.enable_how_to_play_settings == true)
			{
				if (global.settings_sidebar_menu == "how_to_play")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						global.settings_sidebar_menu = "accessibility_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
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
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
				{
					if (global.enable_how_to_play_settings == true)
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
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
				{
					if (global.enable_multiplayer_settings == true)
					{
						global.settings_sidebar_menu = "multiplayer_settings";
					}
					else
					if (global.enable_keyboard_and_mouse_settings == true)
					{
						global.settings_sidebar_menu = "keyboard_and_mouse_settings";
					}
					else
					if (global.enable_controller_settings == true)
					{
						global.settings_sidebar_menu = "controller_settings";
					}
					else
					if (global.enable_touch_settings == true)
					{
						global.settings_sidebar_menu = "touch_settings";
					}
					else
					if (global.enable_profile_settings == true)
					{
						global.settings_sidebar_menu = "profile_settings";
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
			if (global.enable_multiplayer_settings == true)
			{
				if (global.settings_sidebar_menu == "multiplayer_settings")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						global.settings_sidebar_menu = "game_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						if (global.enable_keyboard_and_mouse_settings == true)
						{
							global.settings_sidebar_menu = "keyboard_and_mouse_settings";
						}
						else
						if (global.enable_controller_settings == true)
						{
							global.settings_sidebar_menu = "controller_settings";
						}
						else
						if (global.enable_touch_settings == true)
						{
							global.settings_sidebar_menu = "touch_settings";
						}
						else
						if (global.enable_profile_settings == true)
						{
							global.settings_sidebar_menu = "profile_settings";
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
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
				{
					if (global.enable_multiplayer_settings == true)
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
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
				{
					if (global.enable_controller_settings == true)
					{
						global.settings_sidebar_menu = "controller_settings";
					}
					else
					if (global.enable_touch_settings == true)
					{
						global.settings_sidebar_menu = "touch_settings";
					}
					else
					if (global.enable_profile_settings == true)
					{
						global.settings_sidebar_menu = "profile_settings";
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
			if (global.enable_controller_settings == true)
			{
				if (global.settings_sidebar_menu == "controller_settings")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						if (global.enable_keyboard_and_mouse_settings == true)
						{
							global.settings_sidebar_menu = "keyboard_and_mouse_settings";
						}
						else
						{
							if (global.enable_multiplayer_settings == true)
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
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						if (global.enable_touch_settings == true)
						{
							global.settings_sidebar_menu = "touch_settings";
						}
						else
						if (global.enable_profile_settings == true)
						{
							global.settings_sidebar_menu = "profile_settings";
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
			if (global.enable_touch_settings == true)
			{
				if (global.settings_sidebar_menu == "touch_settings")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						if (global.enable_touch_settings == true)
						{
							global.settings_sidebar_menu = "controller_settings";
						}
						else
						{
							global.settings_sidebar_menu = "keyboard_and_mouse_settings";
						}
						menu_delay = 3;
					}
					else
					if (key_down)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						if (global.enable_profile_settings == true)
						{
							global.settings_sidebar_menu = "profile_settings";
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
	
			#region /* Profile Settings */
			if (global.enable_profile_settings == true)
			{
				if (global.settings_sidebar_menu == "profile_settings")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						if (global.enable_touch_settings == true)
						{
							global.settings_sidebar_menu = "touch_settings";
						}
						else
						if (global.enable_touch_settings == true)
						{
							global.settings_sidebar_menu = "controller_settings";
						}
						else
						{
							global.settings_sidebar_menu = "keyboard_and_mouse_settings";
						}
						menu_delay = 3;
					}
					else
					if (key_down)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						global.settings_sidebar_menu = "video_settings";
						menu_delay = 3;
					}
				}
			}
			#endregion /* Profile Settings END */
	
			#region /* Video Settings */
			if (global.settings_sidebar_menu == "video_settings")
			{
				if (key_up)
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
				{
					if (global.enable_profile_settings == true)
					{
						global.settings_sidebar_menu = "profile_settings";
					}
					else
					if (global.enable_touch_settings == true)
					{
						global.settings_sidebar_menu = "touch_settings";
					}
					else
					if (global.enable_controller_settings == true)
					{
						global.settings_sidebar_menu = "controller_settings";
					}
					else
					{
						global.settings_sidebar_menu = "keyboard_and_mouse_settings";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
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
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
				{
					global.settings_sidebar_menu = "video_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
				{
					if (global.enable_global_resources_settings == true)
					{
						global.settings_sidebar_menu = "global_resources_settings";
					}
					else
					if (global.enable_storage_settings == true)
					{
						global.settings_sidebar_menu = "storage_settings";
					}
					else
					if (global.enable_language_settings == true)
					{
						global.settings_sidebar_menu = "language_settings";
					}
					else
					if (global.enable_broadcast_settings == true)
					{
						global.settings_sidebar_menu = "broadcast_settings";
					}
					else
					if (global.enable_how_to_play_settings == true)
					{
						global.settings_sidebar_menu = "how_to_play_settings";
					}
					else
					if (global.enable_add_ons_settings == true)
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
	
			#region /* Global Resources Settings */
			if (global.enable_global_resources_settings == true)
			{
				if (global.settings_sidebar_menu == "global_resources_settings")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						global.settings_sidebar_menu = "audio_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						if (global.enable_storage_settings == true)
						{
							global.settings_sidebar_menu = "storage_settings";
						}
						else
						if (global.enable_language_settings == true)
						{
							global.settings_sidebar_menu = "language_settings";
						}
						else
						if (global.enable_broadcast_settings == true)
						{
							global.settings_sidebar_menu = "broadcast_settings";
						}
						else
						if (global.enable_how_to_play_settings == true)
						{
							global.settings_sidebar_menu = "how_to_play_settings";
						}
						else
						if (global.enable_add_ons_settings == true)
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
			#endregion /* Global Resources Settings END */
	
			#region /* Storage Settings */
			if (global.enable_storage_settings == true)
			{
				if (global.settings_sidebar_menu == "storage_settings")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						if (global.enable_global_resources_settings == true)
						{
							global.settings_sidebar_menu = "global_resources_settings";
						}
						else
						{
							global.settings_sidebar_menu = "audio_settings";
						}
						menu_delay = 3;
					}
					else
					if (key_down)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						if (global.enable_language_settings == true)
						{
							global.settings_sidebar_menu = "language_settings";
						}
						else
						if (global.enable_broadcast_settings == true)
						{
							global.settings_sidebar_menu = "broadcast_settings";
						}
						else
						if (global.enable_how_to_play_settings == true)
						{
							global.settings_sidebar_menu = "how_to_play_settings";
						}
						else
						if (global.enable_add_ons_settings == true)
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
			if (global.enable_language_settings == true)
			{
				if (global.settings_sidebar_menu == "language_settings")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						global.settings_sidebar_menu = "storage_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						if (global.enable_broadcast_settings == true)
						{
							global.settings_sidebar_menu = "broadcast_settings";
						}
						else
						if (global.enable_add_ons_settings == true)
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
			if (global.enable_broadcast_settings == true)
			{
				if (global.settings_sidebar_menu == "broadcast_settings")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						global.settings_sidebar_menu = "language_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						global.settings_sidebar_menu = "how_to_play";
						menu_delay = 3;
					}
				}
			}
			#endregion /* Broadcast Settings END */
		
			#region /* Add-Ons Settings */
			if (global.enable_add_ons_settings == true)
			{
				if (global.settings_sidebar_menu == "resource_pack_settings")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						global.settings_sidebar_menu = "how_to_play";
						menu_delay = 3;
					}
					else
					if (key_down)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						global.settings_sidebar_menu = "behavior_packs_settings";
						menu_delay = 3;
					}
				}
		
				if (global.settings_sidebar_menu == "behavior_packs_settings")
				{
					if (key_up)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
					{
						global.settings_sidebar_menu = "resource_pack_settings";
						menu_delay = 3;
					}
					else
					if (key_down)
					and (can_navigate_settings_sidebar == true)
					and (menu_delay == 0)
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
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
				{
					if (global.enable_add_ons_settings == true)
					{
						global.settings_sidebar_menu = "behavior_packs_settings";
					}
					else
					if (global.enable_how_to_play_settings == true)
					{
						global.settings_sidebar_menu = "how_to_play";
					}
					else
					if (global.enable_broadcast_settings == true)
					{
						global.settings_sidebar_menu = "broadcast_settings";
					}
					else
					if (global.enable_language_settings == true)
					{
						global.settings_sidebar_menu = "language_settings";
					}
					else
					if (global.enable_storage_settings == true)
					{
						global.settings_sidebar_menu = "storage_settings";
					}
					else
					if (global.enable_global_resources_settings == true)
					{
						global.settings_sidebar_menu = "global_resources_settings";
					}
					else
					{
						global.settings_sidebar_menu = "audio_settings";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				and (can_navigate_settings_sidebar == true)
				and (menu_delay == 0)
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
			draw_menu_checkmark(450, 50, l10n_text("Enable Assist Mode"), "assist_enable", global.assist_enable);
			scr_draw_text_outlined(384, 100, l10n_text("The game is meant to be played without Assist Mode."), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(384, 132, l10n_text("Only if you are unable to enjoy the game without extra help should you enable this."), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		
			draw_menu_checkmark(450, 332, l10n_text("Invincible"), "assist_invincible", global.assist_invincible);
			draw_menu_checkmark(450, 382, l10n_text("Breathe Underwater"), "assist_breathe_underwater", global.assist_breathe_underwater);
			draw_menu_checkmark(450, 432, l10n_text("Show Assist Arrows"), "assist_guiding_arrows", global.assist_guiding_arrows);
			draw_menu_checkmark(450, 482, l10n_text("Show Normal Arrows"), "assist_normal_arrows", global.assist_normal_arrows);
			draw_menu_checkmark(450, 532, l10n_text("Enable Enemies"), "assist_enable_enemies", global.assist_enable_enemies);
			draw_menu_checkmark(450, 582, l10n_text("Enable Spikes"), "assist_enable_spikes", global.assist_enable_spikes);
			draw_menu_checkmark(450, 632, l10n_text("Show Assist Mode Text"), "assist_show_assist_mode_text", global.assist_show_assist_mode_text);
		
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
			"+9",
			"");
			#endregion /* Assist Extra HP END */
		
			#region /* Assist item appear */
			draw_menu_dropdown(450, 182 + menu_y_offset, l10n_text("Assist Item"), "assist_item_appear", global.assist_item_appear,
			l10n_text("Always Appear"),
			l10n_text("Appear after 1 death on a level"),
			l10n_text("Appear after 2 deaths on a level"),
			l10n_text("Appear after 3 deaths on a level"),
			l10n_text("Appear after 4 deaths on a level"),
			l10n_text("Appear after 5 deaths on a level"),
			l10n_text("Appear after 6 deaths on a level"),
			l10n_text("Appear after 7 deaths on a level"),
			l10n_text("Appear after 8 deaths on a level"),
			l10n_text("Appear after 9 deaths on a level"),
			l10n_text("Never Appear"));
			#endregion /* Assist item appear END */
		
			if (global.assist_enable = false)
			{
				if (menu == "assist_invincible")
				if (menu == "assist_breathe_underwater")
				or (menu == "assist_guiding_arrows")
				or (menu == "assist_normal_arrows")
				or (menu == "assist_extra_hp")
				or (menu == "assist_item_appear")
				or (menu == "assist_show_assist_mode_text")
				{
					menu = "assist_enable";
				}
				open_dropdown = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(left_sidebar_x + 370, 157, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
			}
		}
		#endregion /* Assist Settings END */
	
		#region /* My Game Settings */
	
		#region /* Game Settings */
		if (global.settings_sidebar_menu == "game_settings")
		{
			if (global.enable_difficulty_selection_settings == true)
			{
				difficulty_settings_y = 98;
				automatically_pause_when_window_is_unfocused_settings_y = 164;
			}
			else
			{
				difficulty_settings_y = -999;
				automatically_pause_when_window_is_unfocused_settings_y = 164;
			}
			automatically_pause_when_window_is_unfocused_settings_y = 164;
			enable_attract_demo_y = 164 + (48);
			enable_links_demo_y = 164 + (48 * 2);
			show_timer_settings_y = 164 + (48 * 3);
			show_deaths_counter_settings_y = 164 + (48 * 4);
			if (global.enable_ranks == true)
			{
				show_ranks_settings_y = 164 + (48 * 5);
				show_tutorial_signs_y = 164 + (48 * 6);
				hud_hide_time_y = 164 + (48 * 8) - 16;
			}
			else
			{
				show_ranks_settings_y = -9999;
				show_tutorial_signs_y = 164 + (48 * 5);
				hud_hide_time_y = 164 + (48 * 7) - 16;
			}
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
		
			draw_menu_checkmark(380, automatically_pause_when_window_is_unfocused_settings_y, l10n_text("Automatically pause when the game is unfocused"), "automatically_pause_when_window_is_unfocused_settings", global.automatically_pause_when_window_is_unfocused); /* Automatically Pause When Window Is Unfocused */
			draw_menu_checkmark(380, enable_attract_demo_y, l10n_text("Enable Attract Demo"), "enable_attract_demo", global.enable_attract_demo);
			draw_menu_checkmark(380, enable_links_demo_y, l10n_text("Enable Links at Title Screen"), "enable_links_at_title_screen", global.enable_links);
			draw_menu_checkmark(380, show_timer_settings_y, l10n_text("Show Timer"), "show_timer_settings", global.show_timer); /* Show Timer */
			draw_menu_checkmark(380, show_deaths_counter_settings_y, l10n_text("Show Deaths Counter"), "show_deaths_counter_settings", global.show_deaths_counter); /* Show Deaths Counter */
			if (global.enable_ranks == true)
			{
				draw_menu_checkmark(380, show_ranks_settings_y, l10n_text("Show Ranks"), "show_ranks_settings", global.show_ranks); /* Show Ranks */
			}
			draw_menu_checkmark(380, show_tutorial_signs_y, l10n_text("Show Tutorial Signs"), "show_tutorial_signs", global.show_tutorial_signs); /* Show Tutorial Signs */
		
			if (global.hud_hide_time > 10)
			{
				global.hud_hide_time = 3;
			}
		
			draw_menu_dropdown(380, hud_hide_time_y, l10n_text("HUD hide timer"), "hud_hide_time", global.hud_hide_time, l10n_text("Never Show"), l10n_text("After 1 Second"), l10n_text("After 2 Seconds"), l10n_text("After 3 Seconds"), l10n_text("After 4 Seconds"), l10n_text("After 5 Seconds"), l10n_text("After 6 Seconds"), l10n_text("After 7 Seconds"), l10n_text("After 8 Seconds"), l10n_text("After 9 Seconds"), l10n_text("Always Show"));
			if (global.enable_difficulty_selection_settings == true)
			{
				draw_menu_dropdown(380, difficulty_settings_y, l10n_text("Level Layout Difficulty"), "difficulty_settings", global.difficulty, l10n_text("Easy"), l10n_text("Normal"), l10n_text("Hard")); /* Difficulty Settings */
			}
		
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
	
		#region /* Controls Settings */
	
		scr_options_control_menu();
	
		#endregion /* Controls Settings END */
	
		#region /* General Settings */
	
		#region /* Gameplay Settings */
		if (menu == "players_can_collide")
		or (menu == "assist_settings")
		or (menu == "convention_mode")
		{
			if (menu == "show_tutorial_signs"){
			if (global.show_tutorial_signs == true)
			{scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 50, "> Show Tutorial Signs: True", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
			else{scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 50, "> Show Tutorial Signs: False", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}}else
			if (global.show_tutorial_signs == true)
			{scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 50, "Show Tutorial Signs: True", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
			else{scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 50, "Show Tutorial Signs: False", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		
			if (menu == "players_can_collide"){
			if (global.players_can_collide == true)
			{scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 110, "> Players can collide with each other: True", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
			else{scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 110, "> Players can collide with each other: False", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}}
			else
			if (global.players_can_collide == true)
			{scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 110, "Players can collide with each other: True", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
			else{scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 110, "Players can collide with each other: False", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		
			if (menu == "assist_settings")
			{scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 140, "> Assist Settings <", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
			else{scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 140, "Assist Settings", global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		
			if (menu == "convention_mode")
			{
				if (global.convention_mode == true)
				{
					scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 170, "> Convention Mode: True", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
					scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size * 0.5, c_menu_outline, c_menu_fill, 1);
				}
				else
				{
					scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 170, "> Convention Mode: False", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
					scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size * 0.5, c_menu_outline, c_menu_fill, 1);
				}
			}
			else
			if (global.convention_mode == true)
			{
				scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 170, "Convention Mode: True", global.default_text_size, c_menu_outline, c_menu_fill, 1);
				scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size * 0.5, c_menu_outline, c_menu_fill, 1);
			}
			else
			{
				scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 170, "Convention Mode: False", global.default_text_size, c_menu_outline, c_menu_fill, 1);
				scr_draw_text_outlined(get_window_width * 0.5, camera_get_view_height(view_camera[view_current]) * 0.5 + menu_y_offset + 190, "Puts the game in a special convention mode for event showcasing", global.default_text_size * 0.5, c_menu_outline, c_menu_fill, 1);
			}
		}
		#endregion /* Gameplay Settings END */
	
		#region /* Profile Settings */
		if (global.settings_sidebar_menu == "profile_settings")
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(410, 20 + (40 * 3), "Setup your profile here. \n Enter name here.", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Profile Settings END */
	
		#region /* Graphics Settings */
		scr_options_graphics();
		#endregion /* Graphics Settings END */
	
		#region /* Audio Settings */
		if (global.settings_sidebar_menu == "audio_settings")
		{
			var volume_main_y = 64;
			var volume_music_y = 96 + (64);
			var volume_jingle_y = 96 + (64 * 2);
			var volume_sound_y = 96 + (64 * 3);
			var volume_ambient_y = 96 + (64 * 4);
			var volume_footstep_y = 96 + (64 * 5);
			var volume_voice_y = 96 + (64 * 6);
			var number_of_audio_channels_y = 96 + 8 + (64 * 7);
			var narrator_y = 96 + 8 + (64 * 8);
			var default_audio_settings_y = 96 + (64 * 9);
			
			#region /* Make volumes stay between 0 and 1 */
			if (global.volume_main < 0){global.volume_main = 0;}else
			if (global.volume_main > 1){global.volume_main = 1;}
			if (global.volume_music < 0){global.volume_music = 0;}else
			if (global.volume_music > 1){global.volume_music = 1;}
			if (global.volume_jingle < 0){global.volume_jingle = 0;}else
			if (global.volume_jingle > 1){global.volume_jingle = 1;}
			if (global.volume_sound < 0){global.volume_sound = 0;}else
			if (global.volume_sound > 1){global.volume_sound = 1;}
			if (global.volume_ambient < 0){global.volume_ambient = 0;}else
			if (global.volume_ambient > 1){global.volume_ambient = 1;}
			if (global.volume_footstep < 0){global.volume_footstep = 0;}else
			if (global.volume_footstep > 1){global.volume_footstep = 1;}
			if (global.volume_voice < 0){global.volume_voice = 0;}else
			if (global.volume_voice > 1){global.volume_voice = 1;}
			if (global.verbosity_slider < 0){global.verbosity_slider = 0;}else
			if (global.verbosity_slider > 1){global.verbosity_slider = 1;}
			#endregion /* Make volumes stay between 0 and 1 END */
			
			#region /* Draw bars that represent how much volume each channel have */
			draw_menu_slider(410, volume_main_y, l10n_text("Main Volume"), "volume_main", global.volume_main, c_red);
			draw_line_width_color(410, volume_main_y + 32, 820, volume_main_y + 32, 3, c_white, c_white);
			draw_menu_slider(410, volume_music_y, l10n_text("Music Volume"), "volume_music", global.volume_music, c_red);
			draw_menu_slider(410, volume_jingle_y, l10n_text("Jingle Volume"), "volume_jingle", global.volume_jingle, c_red);
			draw_menu_slider(410, volume_sound_y, l10n_text("Sound Volume"), "volume_sound", global.volume_sound, c_lime);
			draw_menu_slider(410, volume_ambient_y, l10n_text("Ambient Volume"), "volume_ambient", global.volume_ambient, c_lime);
			draw_menu_slider(410, volume_footstep_y, l10n_text("Footstep Volume"), "volume_footstep", global.volume_footstep, c_lime);
			draw_menu_slider(410, volume_voice_y, l10n_text("Voices Volume"), "voices_volume", global.volume_voice, c_aqua);
			
			#region /* Verbosity Bar */
			if (global.enable_verbosity_slider == true)
			{
				draw_menu_slider(410, 96 + (64 * 7), l10n_text("Voices Volume"), "voices_volume", global.volume_voice, c_aqua);
			}
			#endregion /* Verbosity Bar END */
			
			#endregion /* Draw bars that represent how much volume each channel have END */
			
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			
			#region /* Select Narrator */
			if (global.enable_narrator == true)
			{
				var file_select_x = 450;
				var file_select_right_arrow_x = 400;
				
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
			
				if (global.narrator = -4)
				{
					global.narrator = -1;
				}
			
				if (menu == "select_narrator")
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, narrator_y, 1, 1, 0, c_white, 1);
				}
				if (global.narrator <= -1)
				{
					scr_draw_text_outlined(file_select_x, narrator_y, l10n_text("Narrator") + " : " + l10n_text("Nobody"), global.default_text_size * 1.05, c_menu_outline, c_menu_fill, 1);
				}
				else
				if (global.narrator >= 0)
				{
					scr_draw_text_outlined(file_select_x, narrator_y, l10n_text("Narrator") + " : " + string(narrator_name), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				}
			
				if (global.narrator >= 0)
				{
					draw_sprite_ext(spr_keyboard_keys, vk_left, file_select_x - 32, narrator_y, 0.5, 0.5, 0, c_white, 1);
					if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x - 32 - 16, narrator_y - 16, file_select_x - 32 + 16, narrator_y + 16))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (open_dropdown == false)
						{
							menu = "select_narrator";
						}
						draw_set_alpha(0.5);
						draw_rectangle_color(file_select_x - 32 - 16, narrator_y - 16, file_select_x - 32 + 16, narrator_y + 16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
			
				if (global.narrator < ds_list_size(global.all_loaded_characters) - 1)
				{
					draw_sprite_ext(spr_keyboard_keys, vk_right, file_select_x + file_select_right_arrow_x, narrator_y, 0.5, 0.5, 0, c_white, 1);
					if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x + file_select_right_arrow_x - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 16, narrator_y + 16))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (open_dropdown == false)
						{
							menu = "select_narrator";
						}
						draw_set_alpha(0.5);
						draw_rectangle_color(file_select_x + file_select_right_arrow_x - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 16, narrator_y + 16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
			
				#region /* Player 1 change portrait when clicking left or right */
			
				#region /* Player 1 Key Left (change portrait sprites) */
				if (keyboard_check_pressed(global.player1_key_left))
				and (!keyboard_check_pressed(global.player1_key_right))
				and (menu == "select_narrator")
				or (keyboard_check_pressed(global.player1_key2_left))
				and (!keyboard_check_pressed(global.player1_key2_right))
				and (menu == "select_narrator")
				or (gamepad_button_check_pressed(0, gp_padl))
				and (!gamepad_button_check_pressed(0, gp_padr))
				and (menu == "select_narrator")
				or (gamepad_axis_value(0, gp_axislh) < 0)
				and (menu_joystick_delay <= 0)
				and (menu == "select_narrator")
				or (mouse_check_button_pressed(mb_left))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x - 32 - 16, narrator_y - 16, file_select_x - 32 + 16, narrator_y + 16))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_narrator";
					if (menu_delay == 0)
					and (global.narrator > -1)
					and (open_dropdown == false)
					{
						menu_delay = 3;
						menu_joystick_delay = 30;
						if (global.narrator > -1)
						{
							global.narrator -= 1;
						}
						else
						{
							global.narrator = -1;
						}
					
						#region /* Character Name */
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
						or (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
						{
							if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
							{
								ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
							}
							else
							{
								ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
							}
						
							#region /* Character Name */
							var uppercase_narrator_name;
							uppercase_narrator_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 1));
							uppercase_narrator_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.narrator))) - 1);
							narrator_name = string(uppercase_narrator_name);
							#endregion /* Character Name END */
						
							ini_close();
						}
						else
						{
							narrator_name = string(global.narrator + 1);
						}
						#endregion /* Character Name END */
					
						#region /* Player 1 character select portrait sprite */
						global.sprite_select_player_1 = spr_noone;
						global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
						global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
						global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
						global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
						#endregion /* Player 1 character select portrait sprite END */
					
					}
					open_dropdown = false;
				}
				#endregion /* Player 1 Key Left (change portrait sprites) END */
			
				#region /* Player 1 Key Right (change portrait sprites) */
				if (keyboard_check_pressed(global.player1_key_right))
				and (!keyboard_check_pressed(global.player1_key_left))
				and (menu == "select_narrator")
				or (keyboard_check_pressed(global.player1_key2_right))
				and (!keyboard_check_pressed(global.player1_key2_left))
				and (menu == "select_narrator")
				or (gamepad_button_check_pressed(0, gp_padr))
				and (!gamepad_button_check_pressed(0, gp_padl))
				and (menu == "select_narrator")
				or (gamepad_axis_value(0, gp_axislh) > 0)
				and (menu_joystick_delay <= 0)
				and (menu == "select_narrator")
				or (mouse_check_button_pressed(mb_left))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x + file_select_right_arrow_x - 16, narrator_y - 16, file_select_x + file_select_right_arrow_x + 16, narrator_y + 16))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_narrator";
					if (menu_delay == 0)
					and (open_dropdown == false)
					{
						menu_delay = 3;
						menu_joystick_delay = 30;
						global.narrator = clamp(global.narrator + 1, -1, ds_list_size(global.all_loaded_characters) - 1);
					
						#region /* Character Name */
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
						or (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
						{
							if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
							{
								ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
							}
							else
							{
								ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
							}
						
							#region /* Character Name */
							var uppercase_narrator_name;
							uppercase_narrator_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 1));
							uppercase_narrator_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.narrator))) - 1);
							narrator_name = string(uppercase_narrator_name);
							#endregion /* Character Name END */
						
							ini_close();
						}
						else
						{
							narrator_name = string(global.narrator + 1);
						}
						#endregion /* Character Name END */
					
						#region /* Player 1 character select portrait sprite */
						global.sprite_select_player_1 = spr_noone;
						global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
						global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
						global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
						global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
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
				menu_cursor_y_position = default_audio_settings_y;
				if (key_a_pressed)
				and (menu_delay == 0)
				or (mouse_check_button_pressed(mb_left))
				and (mouse_get_x > 370)
				and (point_in_rectangle(mouse_get_x, mouse_get_y, 430, default_audio_settings_y + 1, 430 + 370, default_audio_settings_y + 41))
				and (global.controls_used_for_menu_navigation == "mouse")
				and (menu_delay == 0)
				{
					scr_set_default_audio_settings();
					menu_delay = 3;
				}
			}
			#endregion /* Reset to Default Audio Settings END */
		
			draw_menu_dropdown(390, number_of_audio_channels_y, l10n_text("Number of Audio Channels"), "number_of_audio_channels", global.number_of_audio_channels, "32", "64", "96", "128", "160", "192", "224", "256"); /* Dropdown menus should be drawn last so they are above everything else when you open them */
		}
		#endregion /* Audio Settings END */
	
		#region /* Language Options */
		if (global.settings_sidebar_menu == "language_settings")
		{
			scr_language_menu();
		}
		#endregion /* Language Options END */
	
		#region /* Global Resources Settings */
		scr_options_global_resources();
		#endregion /* Global Resources Settings END */
	
		#region /* Storage Settings */
		if (global.settings_sidebar_menu == "storage_settings")
		{
			var file_select_x = 450;
			var file_select_right_arrow_x = 400;
		
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(file_select_x, 20 + (40 * 4), l10n_text("File") + ": " + string(global.file), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(450, 20 + (40 * 8), string_replace_all(string(game_save_id) + "/save_files\\file" + string(global.file) + ".ini", "\\", "/"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		
			#region /* Display save file data */
			if (file_exists(working_directory + "/save_files/file" + string(global.file) + ".ini"))
			{
				ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
			
				if (ini_key_exists("Player", "current_month"))
				and (ini_key_exists("Player", "current_day"))
				and (ini_key_exists("Player", "current_year"))
				and (ini_key_exists("Player", "current_hour"))
				and (ini_key_exists("Player", "current_minute"))
				and (ini_key_exists("Player", "current_second"))
				{
					scr_draw_text_outlined(file_select_x, 20 + (40 * 9), l10n_text("Date modified") + ":", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
					scr_draw_text_outlined(file_select_x, 20 + (40 * 10),
					string(ini_read_real("Player", "current_month", 0)) + "/" +
					string(ini_read_real("Player", "current_day", 0)) + "/" +
					string(ini_read_real("Player", "current_year", 0)) + " " +
					string(string_replace_all(string_format(ini_read_real("Player", "current_hour", 0), 2, 0), " ", "0")) + ":" +
					string(string_replace_all(string_format(ini_read_real("Player", "current_minute", 0), 2, 0), " ", "0")) + "." +
					string(string_replace_all(string_format(ini_read_real("Player", "current_second", 0), 2, 0), " ", "0"))
					, global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				
					if (ini_read_real("Player", "current_month", 0) = current_month)
					and (ini_read_real("Player", "current_day", 0) = current_day)
					and (ini_read_real("Player", "current_year", 0) = current_year)
					{
						scr_draw_text_outlined(file_select_x, 20 + (40 * 11), l10n_text("Last played today!"), global.default_text_size * 1.05, c_menu_outline, c_menu_fill, 1);
					}
				
				}
			
				if (ini_key_exists("Player", "number_of_levels_cleared"))
				{
					scr_draw_text_outlined(file_select_x, 20 + (40 * 13), l10n_text("Number of levels passed") + ": " + string(ini_read_real("Player", "number_of_levels_cleared", false)), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				}
			
				ini_close();
			}
			#endregion /* Display save file data END */
		
			if (menu != "file_delete_yes")
			and (menu != "file_delete_no")
			{
				if (file_exists(working_directory + "/save_files/file" + string(global.file) + ".ini"))
				{
					draw_menu_button(450, 20 + (40 * 5), l10n_text("Delete File"), "file_delete", "file_delete_no");
				}
			
				if (global.enable_open_custom_folder == true)
				{
					draw_menu_button(450, 20 + (40 * 6), l10n_text("Open Save File Folder"), "open_save_file_folder", "open_save_file_folder");
				}
			
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 450, 20 + (40 * 6) + 2, 450 + 371, 20 + (40 * 6) + 41))
				and (global.controls_used_for_menu_navigation == "mouse")
				and (mouse_check_button_pressed(mb_left))
				and (menu_delay == 0)
				or (menu == "open_save_file_folder")
				and (key_a_pressed)
				and (menu_delay == 0)
				{
					scr_open_folder(game_save_id + "/save_files")
				}
			}
			else
			if (menu == "file_delete_yes")
			or (menu == "file_delete_no")
			{
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.9);
				draw_rectangle_color(0, 0, get_window_width * 3, get_window_height * 3, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(0.1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 100, l10n_text("Are you sure you want to delete file") + " " + string(global.file) + "?", global.default_text_size, c_black, c_red, 1);
				draw_menu_button(get_window_width * 0.5 - 370 - 32, get_window_height * 0.5, l10n_text("Yes"), "file_delete_yes", "file_delete_yes");
				draw_menu_button(get_window_width * 0.5 + 32, get_window_height * 0.5, l10n_text("No"), "file_delete_no", "file_delete");
			
				if (key_left)
				and (menu_joystick_delay == 0)
				or (key_right)
				and (menu_joystick_delay == 0)
				{
					menu_joystick_delay = 30;
					if (menu == "file_delete_no")
					{
						menu = "file_delete_yes";
					}
					else
					if (menu == "file_delete_yes")
					{
						menu = "file_delete_no";
					}
				}
			}
		
			if (global.file < 1)
			{
				global.file = 1; /* Don't let file go less than 1 */
			}
		
			if (global.file > 1)
			and (menu != "file_delete_no")
			and (menu != "file_delete_yes")
			{
				draw_sprite_ext(spr_keyboard_keys, vk_left, file_select_x - 32, 20 + (40 * 4), 0.5, 0.5, 0, c_white, 1);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x - 32 - 16, 20 + (40 * 4) - 16, file_select_x - 32 + 16, 20 + (40 * 4) + 16))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "file_delete";
					draw_set_alpha(0.5);
					draw_rectangle_color(file_select_x - 32 - 16, 20 + (40 * 4) - 16, file_select_x - 32 + 16, 20 + (40 * 4) + 16, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
			}
			if (menu != "file_delete_no")
			and (menu != "file_delete_yes")
			{
				draw_sprite_ext(spr_keyboard_keys, vk_right, file_select_x + file_select_right_arrow_x, 20 + (40 * 4), 0.5, 0.5, 0, c_white, 1);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x + file_select_right_arrow_x - 16, 20 + (40 * 4) - 16, file_select_x + file_select_right_arrow_x + 16, 20 + (40 * 4) + 16))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "file_delete";
					draw_set_alpha(0.5);
					draw_rectangle_color(file_select_x + file_select_right_arrow_x - 16, 20 + (40 * 4) - 16, file_select_x + file_select_right_arrow_x + 16, 20 + (40 * 4) + 16, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
			}
		
			if (menu == "file_delete")
			and (key_a_pressed)
			and (menu_delay == 0)
			{
				can_navigate_settings_sidebar = false;
				menu = "file_delete_no";
				menu_delay = 10;
			}
		
			if (menu == "file_delete_no")
			and (key_a_pressed)
			and (menu_delay == 0)
			or (menu == "file_delete_no")
			and (key_b_pressed)
			and (menu_delay == 0)
			or (menu == "file_delete_yes")
			and (key_b_pressed)
			and (menu_delay == 0)
			{
				can_navigate_settings_sidebar = false;
				menu = "file_delete";
				menu_delay = 10;
			
			}
		
			if (menu == "file_delete_yes")
			and (key_a_pressed)
			and (menu_delay == 0)
			or (menu == "file_delete_yes")
			and (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370 - 32, get_window_height * 0.5 - 21, get_window_width * 0.5 - 370 - 32 + 370, get_window_height * 0.5 + 42))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay == 0)
			{
				can_navigate_settings_sidebar = false;
				menu = "file_select";
				file_delete(working_directory + "/save_files/file" + string(global.file) + ".ini");
				menu_delay = 10;
			}
		
			if (key_up)
			and (menu != "file_delete_yes")
			and (menu != "file_delete_no")
			and (can_navigate_settings_sidebar = false)
			and (menu_joystick_delay == 0)
			{
				menu_joystick_delay = 10;
				if (menu == "file_select")
				{
					if (global.enable_open_custom_folder == true)
					{
						menu = "open_save_file_folder";
					}
					else
					{
						menu = "file_delete";
					}
				}
				else
				if (menu == "file_delete")
				{
					menu = "file_select";
				}
				else
				if (menu == "open_save_file_folder")
				{
					if (file_exists(working_directory + "/save_files/file" + string(global.file) + ".ini"))
					{
						menu = "file_delete";
					}
					else
					{
						menu = "file_select";
					}
				}
			}
			else
			if (key_down)
			and (menu != "file_delete_yes")
			and (menu != "file_delete_no")
			and (can_navigate_settings_sidebar = false)
			and (menu_joystick_delay == 0)
			{
				menu_joystick_delay = 10;
				if (menu == "file_select")
				{
					if (file_exists(working_directory + "/save_files/file" + string(global.file) + ".ini"))
					{
						menu = "file_delete";
					}
					else
					{
						if (global.enable_open_custom_folder == true)
						{
							menu = "open_save_file_folder";
						}
						else
						{
							menu = "file_select";
						}
					}
				}
				else
				if (menu == "file_delete")
				{
					if (global.enable_open_custom_folder == true)
					{
						menu = "open_save_file_folder";
					}
					else
					{
						menu = "file_select";
					}
				}
				else
				if (menu == "open_save_file_folder")
				{
					menu = "file_select";
				}
			}
		
			if (menu == "file_select")
			{
				draw_sprite(spr_menu_cursor, menu_cursor_index, file_select_x - 32 - 32, 20 + (40 * 4));
			}
		
			if (key_left)
			and (menu == "file_select")
			and (can_navigate_settings_sidebar = false)
			or (mouse_check_button_pressed(mb_left))
			and (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x - 32 - 16, 20 + (40 * 4) - 16, file_select_x - 32 + 16, 20 + (40 * 4) + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (menu != "file_delete_no")
			and (menu != "file_delete_yes")
			{
				can_navigate_settings_sidebar = false;
				menu = "file_select";
				if (menu_delay == 0)
				and (menu_joystick_delay == 0)
				and (global.file > 1)
				{
					global.file -= 1;
					menu_delay = 3;
					menu_joystick_delay = 30;
				}
			}
			else
			if (key_right)
			and (menu == "file_select")
			and (can_navigate_settings_sidebar = false)
			or (mouse_check_button_pressed(mb_left))
			and (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x + file_select_right_arrow_x - 16, 20 + (40 * 4) - 16, file_select_x + file_select_right_arrow_x + 16, 20 + (40 * 4) + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (menu != "file_delete_no")
			and (menu != "file_delete_yes")
			{
				can_navigate_settings_sidebar = false;
				menu = "file_select";
				if (menu_delay == 0)
				and (menu_joystick_delay == 0)
				{
					global.file += 1;
					menu_delay = 3;
					menu_joystick_delay = 30;
				}
			}
		}
		#endregion /* Storage Settings END */
	
		#region /* Broadcast Settings */
		if (global.settings_sidebar_menu == "broadcast_settings")
		{draw_set_halign(fa_left);draw_set_valign(fa_middle);scr_draw_text_outlined(410, 20 + (40 * 3), "Connect your Twitch account \n and earn in-game rewards \n as you stream the game :)", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
		#endregion /* Broadcast Settings END */
	
		#region /* How to Play */
		if (global.settings_sidebar_menu == "how_to_play")
		{draw_set_halign(fa_left);draw_set_valign(fa_middle);scr_draw_text_outlined(410, 20 + (40 * 3), "Control frog. \n Frog jump. \n Frog tongue. \n Frog happy.", global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);}
		#endregion /* How to Play END */
	
		#endregion /* General Settings END */
	
		draw_set_alpha(darken_settings_alpha);
		draw_rectangle_color(left_sidebar_x + 370, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	
		#region /* Menu Navigation */
		if (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
		
			#region /* Options Menu */
	
			#region /* Difficulty Settings Navigation */
			if (menu == "difficulty_settings")
			{
				if (key_up)
				and (open_dropdown == true)
				and (menu_delay == 0)
				and (global.difficulty > 0)
				{
					menu_delay = 3;
					global.difficulty -= 1;
				}
				else
				if (key_down)
				and (open_dropdown == true)
				and (menu_delay == 0)
				and (global.difficulty < 2)
				{
					menu_delay = 3;
					global.difficulty += 1;
				}
				else
				if (key_up)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "hud_hide_time";
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "automatically_pause_when_window_is_unfocused_settings";
				}
			}
			#endregion /* Difficulty Settings Navigation END */
	
			else
	
			#region /* Navigate Game Settings */
			if (menu == "automatically_pause_when_window_is_unfocused_settings")
			{
				if (key_up)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_difficulty_selection_settings == true)
					{
						menu = "difficulty_settings";
					}
					else
					{
						menu = "hud_hide_time";
					}
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "enable_attract_demo";
				}
			}
			else
			if (menu == "enable_attract_demo")
			{
				if (key_up)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "automatically_pause_when_window_is_unfocused_settings";
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "enable_links_at_title_screen";
				}
			}
			else
			if (menu == "enable_links_at_title_screen")
			{
				if (key_up)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "enable_attract_demo";
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "show_timer_settings";
				}
			}
			else
			if (menu == "show_timer_settings")
			{
				if (key_up)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "enable_attract_demo";
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "show_deaths_counter_settings";
				}
			}
			else
			if (menu == "show_deaths_counter_settings")
			{
				if (key_up)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "show_timer_settings";
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_ranks == true)
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
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "show_deaths_counter_settings";
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "show_tutorial_signs";
				}
			}
			else
			if (menu == "show_tutorial_signs")
			{
				if (key_up)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_ranks == true)
					{
						menu = "show_ranks_settings";
					}
					else
					{
						menu = "show_deaths_counter_settings";
					}
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "hud_hide_time";
				}
			}
			else
			if (menu == "hud_hide_time")
			{
				if (key_up)
				and (open_dropdown == true)
				and (menu_delay == 0)
				and (global.hud_hide_time > 0)
				{
					menu_delay = 3;
					global.hud_hide_time -= 1;
				}
				else
				if (key_down)
				and (open_dropdown == true)
				and (menu_delay == 0)
				and (global.hud_hide_time < 10)
				{
					menu_delay = 3;
					global.hud_hide_time += 1;
				}
				else
				if (key_up)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "show_tutorial_signs";
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_difficulty_selection_settings == true)
					{
						menu = "difficulty_settings";
					}
					else
					{
						menu = "automatically_pause_when_window_is_unfocused_settings";
					}
				}
			}
			#endregion /* Navigate Game Settings END */
	
			else
	
			#region /* Players can collide */
			if (menu == "players_can_collide")
			{
				if (key_up)
				{
					menu = "hud_hide_time";
				}
				else
				if (key_down)
				{
					menu = "assist_settings";
				}
			}
			#endregion /* Players can collide END */
	
			else
	
			#region /* Convention Mode */
			if (menu == "convention_mode")
			{
				if (key_up)
				{
					menu = "assist_settings";
				}
				else
				if (key_down)
				{
					menu = "show_tutorial_signs";
				}
			}
			#endregion /* Convention Mode END */
	
			else
	
			#region /* Assist Enable Navigation */
			if (menu == "assist_enable")
			and (global.assist_enable == true)
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_show_assist_mode_text";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_enable";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_extra_hp";
					menu_delay = 3;
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == true)
				and (global.assist_item_appear > 0)
				{
					global.assist_item_appear -= 1;
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == true)
				and (global.assist_item_appear < 10)
				{
					global.assist_item_appear += 1;
					menu_delay = 3;
				}
			}
			#endregion /* Assist Item Appear Navigation END */
			
			else
			
			#region /* Assist Extra HP Navigation */
			if (menu == "assist_extra_hp")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_item_appear";
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_invincible";
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == true)
				and (global.assist_extra_hp > 0)
				{
					global.assist_extra_hp -= 1;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == true)
				and (global.assist_extra_hp < 9)
				{
					global.assist_extra_hp += 1;
				}
			}
			#endregion /* Assist Extra HP Navigation END */
	
			else
	
			#region /* Assist Invincible Navigation */
			if (menu == "assist_invincible")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_extra_hp";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_breathe_underwater";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Invincible Navigation END */
	
			else
	
			#region /* Assist Breathe Underwater Navigation */
			if (menu == "assist_breathe_underwater")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_invincible";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_breathe_underwater";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_guiding_arrows";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "assist_normal_arrows";
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
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
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "assist_enable_enemies";
				}
				else
				if (key_down)
				and (open_dropdown == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "assist_show_assist_mode_text";
				}
			}
			#endregion /* Assist Enable Spikes Navigation END */
		
			else
		
			#region /* Assist Show Assist Mode Text Navigation */
			if (menu == "assist_show_assist_mode_text")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_enable_spikes";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "assist_enable";
					menu_delay = 3;
				}
			}
			#endregion /* Assist Show Assist Mode Text Navigation END */
			
			else
			
			#region /* Main Volume Navigation */
			if (menu == "volume_main")
			{
				if (key_left)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_main > 0)
					{
						global.volume_main -= 0.05;
					}
				}
				else
				if (key_right)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_main < + 1)
					{
						global.volume_main += 0.05;
					}
				}
				if (mouse_wheel_down())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_left)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_main > 0)
					{
						global.volume_main -= 0.0001;
					}
				}
				else
				if (mouse_wheel_up())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_right)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_main < + 1)
					{
						global.volume_main += 0.0001;
					}
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "default_audio_settings";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_music > 0)
					{
						global.volume_music -= 0.05;
					}
				}
				else
				if (key_right)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_music < + 1)
					{
						global.volume_music += 0.05;
					}
				}
				else
				if (mouse_wheel_down())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_left)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_music > 0)
					{
						global.volume_music -= 0.0001;
					}
				}
				else
				if (mouse_wheel_up())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_right)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_music < + 1)
					{
						global.volume_music += 0.0001;
					}
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "volume_main";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "volume_jingle";
					menu_delay = 3;
				}
			}
			#endregion /* Music Volume Navigation END */
			
			else
			
			#region /* Jingle Volume Navigation */
			if (menu == "volume_jingle")
			{
				if (key_left)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_jingle > 0)
					{
						global.volume_jingle -= 0.05;
					}
				}
				else
				if (key_right)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_jingle < + 1)
					{
						global.volume_jingle += 0.05;
					}
				}
				else
				if (mouse_wheel_down())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_left)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_jingle > 0)
					{
						global.volume_jingle -= 0.0001;
					}
				}
				else
				if (mouse_wheel_up())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_right)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_jingle < + 1)
					{
						global.volume_jingle += 0.0001;
					}
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "volume_music";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "volume_sound";
					menu_delay = 3;
				}
			}
			#endregion /* Jingle Volume Navigation END */
			
			else
			
			#region /* Sound Volume Navigation */
			if (menu == "volume_sound")
			{
				if (key_left)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_sound > 0)
					{
						global.volume_sound -= 0.05;
					}
				}
				else
				if (key_right)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_sound < + 1)
					{
						global.volume_sound += 0.05;
					}
				}
				else
				if (mouse_wheel_down())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_left)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_sound > 0)
					{
						global.volume_sound -= 0.0001;
					}
				}
				else
				if (mouse_wheel_up())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_right)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_sound < + 1)
					{
						global.volume_sound += 0.0001;
					}
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "volume_jingle";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_ambient > 0)
					{
						global.volume_ambient -= 0.05;
					}
				}
				else
				if (key_right)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_ambient < + 1)
					{
						global.volume_ambient += 0.05;
					}
				}
				if (mouse_wheel_down())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_left)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_ambient > 0)
					{
						global.volume_ambient -= 0.0001;
					}
				}
				else
				if (mouse_wheel_up())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_right)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_ambient < + 1)
					{
						global.volume_ambient += 0.0001;
					}
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "volume_sound";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_footstep > 0)
					{
						global.volume_footstep -= 0.05;
					}
				}
				else
				if (key_right)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_footstep < + 1)
					{
						global.volume_footstep += 0.05;
					}
				}
				if (mouse_wheel_down())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_left)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_footstep > 0)
					{
						global.volume_footstep -= 0.0001;
					}
				}
				else
				if (mouse_wheel_up())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_right)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_footstep < + 1)
					{
						global.volume_footstep += 0.0001;
					}
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "volume_ambient";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "voices_volume";
					menu_delay = 3;
				}
			}
			#endregion /* Footstep Volume Navigation END */
		
			else
		
			#region /* Voices Volume Navigation */
			if (menu == "voices_volume")
			{
				if (key_left)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_voice > 0)
					{
						global.volume_voice -= 0.05;
					}
				}
				else
				if (key_right)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_voice < + 1)
					{
						global.volume_voice += 0.05;
					}
				}
				else
				if (mouse_wheel_down())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_left)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_voice > 0)
					{
						global.volume_voice -= 0.0001;
					}
				}
				else
				if (mouse_wheel_up())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_right)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.volume_voice < + 1)
					{
						global.volume_voice += 0.0001;
					}
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "volume_footstep";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "voices_volume";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.enable_verbosity_slider == true)
					{
						menu = "verbosity_slider";
						menu_delay = 3;
					}
					else
					if (global.enable_narrator == true)
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
				and (menu_delay == 0)
				and (open_dropdown == true)
				and (global.number_of_audio_channels> 0)
				{
					global.number_of_audio_channels -= 1;
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == true)
				and (global.number_of_audio_channels< 7)
				{
					global.number_of_audio_channels+= 1;
					menu_delay = 3;
				}
			}
			#endregion /* Number of Audio Channels Navigation END */
	
			else
	
			#region /* Verbosity Slider Navigation */
			if (menu == "verbosity_slider")
			{
				if (key_left)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.verbosity_slider > 0)
					{
						global.verbosity_slider -= 0.05;
					}
				}
				else
				if (key_right)
				and (!keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.verbosity_slider < + 1)
					{
						global.verbosity_slider += 0.05;
					}
				}
				else
				if (mouse_wheel_down())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_left)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.verbosity_slider > 0)
					{
						global.verbosity_slider -= 0.0001;
					}
				}
				else
				if (mouse_wheel_up())
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (key_right)
				and (keyboard_check(vk_shift))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.verbosity_slider < + 1)
					{
						global.verbosity_slider += 0.0001;
					}
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "voices_volume";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.enable_narrator == true)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.enable_verbosity_slider == true)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.enable_narrator == true)
					{
						menu = "select_narrator";
						menu_delay = 3;
					}
					else
					if (global.enable_verbosity_slider == true)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "volume_main";
					menu_delay = 3;
				}
			}
			#endregion /* Default Audio Settings Navigation */
		
			#endregion /* Options Menu END */
		
		}
		#endregion /* Menu Navigation END */
	
		#region /* Accept */
		if (key_a_pressed)
		or (mouse_check_button_pressed(mb_left))
		and (mouse_get_x > 370)
		{
			if (menu == "assist_enable")
			and (menu_delay == 0)
			{
				if (global.assist_enable == true)
				{
					global.assist_enable = false;
				}
				else
				{
					global.assist_enable = true;
				}
				menu_delay = 3;
			}
			
			#region /* Drop down menu */
			if (menu == "assist_item_appear")
			or (menu == "assist_extra_hp")
			or (menu == "difficulty_settings")
			or (menu == "hud_hide_time")
			or (menu == "number_of_audio_channels")
			{
				if (menu_delay == 0)
				and (open_dropdown == false)
				{
					open_dropdown = true;
					menu_delay = 3;
				}
				else
				if (menu_delay == 0)
				and (open_dropdown == true)
				{
					open_dropdown = false;
					menu_delay = 3;
				}
			}
			#endregion /* Drop down menu END */
			
			if (menu == "assist_invincible") and (menu_delay == 0){if (global.assist_invincible == true){global.assist_invincible = false;}else{global.assist_invincible = true;}menu_delay = 3;}
			if (menu == "assist_breathe_underwater") and (menu_delay == 0){if (global.assist_breathe_underwater == true){global.assist_breathe_underwater = false;}else{global.assist_breathe_underwater = true;}menu_delay = 3;}
			if (menu == "assist_guiding_arrows") and (menu_delay == 0){if (global.assist_guiding_arrows == true){global.assist_guiding_arrows = false;}else{global.assist_guiding_arrows = true;}menu_delay = 3;}
			if (menu == "assist_normal_arrows") and (menu_delay == 0){if (global.assist_normal_arrows == true){global.assist_normal_arrows = false;}else{global.assist_normal_arrows = true;}menu_delay = 3;}
			if (menu == "assist_enable_enemies") and (menu_delay == 0) and (global.assist_enable == true){if (global.assist_enable_enemies == true){global.assist_enable_enemies = false;}else{global.assist_enable_enemies = true;}menu_delay = 3;}
			if (menu == "assist_enable_spikes") and (menu_delay == 0) and (global.assist_enable == true){if (global.assist_enable_spikes == true){global.assist_enable_spikes = false;}else{global.assist_enable_spikes = true;}menu_delay = 3;}
			if (menu == "assist_show_assist_mode_text") and (menu_delay == 0){if (global.assist_show_assist_mode_text == true){global.assist_show_assist_mode_text = false;}else{global.assist_show_assist_mode_text = true;}menu_delay = 3;}
			
			if (menu == "automatically_pause_when_window_is_unfocused_settings") and (menu_delay == 0){if (global.automatically_pause_when_window_is_unfocused == true){global.automatically_pause_when_window_is_unfocused = false;}else{global.automatically_pause_when_window_is_unfocused = true;}menu_delay = 3;}
			if (menu == "enable_attract_demo") and (menu_delay == 0){if (global.enable_attract_demo == true){global.enable_attract_demo = false;}else{global.enable_attract_demo = true;}menu_delay = 3;}
			if (menu == "enable_links_at_title_screen") and (menu_delay == 0){if (global.enable_links == true){global.enable_links = false;}else{global.enable_links = true;}menu_delay = 3;}
			if (menu == "show_timer_settings") and (menu_delay == 0){if (global.show_timer == true){global.show_timer = false;}else{global.show_timer = true;}menu_delay = 3;}
			if (menu == "show_deaths_counter_settings") and (menu_delay == 0){if (global.show_deaths_counter == true){global.show_deaths_counter = false;}else{global.show_deaths_counter = true;}menu_delay = 3;}
			if (menu == "show_ranks_settings") and (menu_delay == 0){if (global.show_ranks == true){global.show_ranks = false;}else{global.show_ranks = true;}menu_delay = 3;}
			if (menu == "show_tutorial_signs") and (menu_delay == 0){if (global.show_tutorial_signs == true){global.show_tutorial_signs = false;}else{global.show_tutorial_signs = true;}menu_delay = 3;}
			if (menu == "players_can_collide") and (menu_delay == 0){if (global.players_can_collide == true){global.players_can_collide = false;}else{global.players_can_collide = true;}menu_delay = 3;}
			if (menu == "convention_mode") and (menu_delay == 0){if (global.convention_mode == true){global.convention_mode = false;}else{global.convention_mode = true;}menu_delay = 3;}
		}
		#endregion /* Accept END */

		if (menu_delay > 0)
		{
			menu_delay -= 1;
		}
		if (menu_delay < 0)
		{
			menu_delay = 0;
		}
		
		scr_menu_navigation_with_joystick_delay();
		
		scr_draw_cursor_mouse();
		
	}
	else
	{
		left_sidebar_x = lerp(left_sidebar_x, -400, 0.1);
		background_brightness_menu_lerp = lerp(background_brightness_menu_lerp, 0, 0.1);
	}
	
	#region /* Darken sidebar when it's not the focus */
	if (can_navigate_settings_sidebar == true)
	and (in_settings == true)
	{
		darken_settings_alpha = lerp(darken_settings_alpha, 0.5, 0.1); /* Darken the settings */
		darken_settings_sidebar_alpha = lerp(darken_settings_sidebar_alpha, 0, 0.1); /* But not the settings sidebar */
	}
	else
	if (can_navigate_settings_sidebar = false)
	and (in_settings == true)
	{
		darken_settings_alpha = lerp(darken_settings_alpha, 0, 0.1); /* Don't darken the settings */
		darken_settings_sidebar_alpha = lerp(darken_settings_sidebar_alpha, 0.5, 0.1); /* But darken the settings sidebar */
	}
	else
	if (in_settings == false)
	{
		darken_settings_alpha = lerp(darken_settings_alpha, 0, 0.1); /* Don't darken the settings */
		darken_settings_sidebar_alpha = lerp(darken_settings_sidebar_alpha, 0, 0.1); /* And don't darken the settings sidebar */
	}
	#endregion /* Darken sidebar when it's not the focus END */
	
}