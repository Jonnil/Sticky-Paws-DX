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

	#region /* Menu navigation tabs y positions */
	var accessibility_settings_y = 40;
	var challenge_mode_settings_y = accessibility_settings_y;
	
	if (global.enable_challenge_mode_settings)
	{
		challenge_mode_settings_y = accessibility_settings_y + 40;
	}
	
	var how_to_play_y = -999;
	var game_text_y = challenge_mode_settings_y + 40;
	
	if (global.enable_how_to_play_settings)
	{
		how_to_play_y = challenge_mode_settings_y + 40;
		game_text_y = how_to_play_y + 40;
	}
	
	var game_settings_y = game_text_y + 40;
	var multiplayer_settings_y = -999;
	var controls_text_y = game_settings_y + 40;
	
	if (global.enable_multiplayer_settings)
	{
		multiplayer_settings_y = game_settings_y + 40;
		controls_text_y = multiplayer_settings_y + 40;
	}
	
	var keyboard_and_mouse_settings_y = -999;
	var controller_settings_y = controls_text_y + 40;
	
	if (global.enable_keyboard_and_mouse_settings)
	{
		keyboard_and_mouse_settings_y = controls_text_y + 40;
		controller_settings_y = keyboard_and_mouse_settings_y + 40;
	}
	
	var touch_settings_y = -999;
	var general_text_y = controller_settings_y + 40;
	
	if (global.enable_touch_settings)
	{
		touch_settings_y = controller_settings_y + 40;
		general_text_y = touch_settings_y + 40;
	}
	
	var account_settings_y = -999;
	var video_settings_y = general_text_y + 40;
	
	if (global.enable_account_settings)
	{
		account_settings_y = general_text_y + 40;
		video_settings_y = account_settings_y + 40;
	}
	
	var audio_settings_y = video_settings_y + 40;
	var custom_resources_settings_y = audio_settings_y + 40;
	var storage_settings_y = custom_resources_settings_y + 40;
	var language_settings_y = storage_settings_y + 40;
	var broadcast_settings_y = -999;
	
	if (global.enable_broadcast_settings)
	{
		broadcast_settings_y = language_settings_y + 40;
	}

	var debug_settings_visible = scr_debug_is_hidden_debug_tab_visible();
	var debug_settings_y = -999;

	if (debug_settings_visible)
	{
		if (global.enable_add_ons_settings)
		{
			debug_settings_y = 40 * 21;
		}
		else
		if (global.enable_broadcast_settings)
		{
			debug_settings_y = broadcast_settings_y + 40;
		}
		else
		{
			debug_settings_y = language_settings_y + 40;
		}
	}

	if (!debug_settings_visible)
	&& (global.settings_sidebar_menu == "debug_settings")
	{
		global.settings_sidebar_menu = "settings_back";
	}
	#endregion /* Menu navigation tabs y positions END */

	#region /* Tabs Graphics */
	if (left_sidebar_x > -400)
	{

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

		#region /* Challenge Settings */
		if (global.enable_challenge_mode_settings)
		{
			if (global.settings_sidebar_menu == "challenge_mode_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, challenge_mode_settings_y, 370, challenge_mode_settings_y + 39))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + challenge_mode_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + challenge_mode_settings_y, 1, 1, 0, c_gray, 1);
				}
				/* Button Hightlighted */

				draw_sprite_ext(spr_icon_challenge_mode, 1, left_sidebar_x + 20 + icon_x_offset, 20 + challenge_mode_settings_y, 1, 1, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + challenge_mode_settings_y, l10n_text("Challenge Mode"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, challenge_mode_settings_y, 370,(challenge_mode_settings_y + 40) - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + challenge_mode_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + challenge_mode_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_icon_challenge_mode, 1, left_sidebar_x + 20 + icon_x_offset, 20 + challenge_mode_settings_y, 0.9, 0.9, 0, c_white, 1); /* Settings Icon */
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + challenge_mode_settings_y, l10n_text("Challenge Mode"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Challenge Settings END */

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
			draw_sprite_ext(spr_icon_cogwheel, 0, left_sidebar_x + 20 + icon_x_offset, 20 + game_settings_y, 1, 1, 0, c_white, 1) /* Settings Icon */
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
			draw_sprite_ext(spr_icon_cogwheel, 0, left_sidebar_x + 20 + icon_x_offset, 20 + game_settings_y, 0.9, 0.9, 0, c_white, 1)
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

		#region /* Debug Settings */
		if (debug_settings_visible)
		{
			if (global.settings_sidebar_menu == "debug_settings")
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, debug_settings_y, 370, debug_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + debug_settings_y, 1, 1, 0, c_green, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + debug_settings_y, 1, 1, 0, c_gray, 1);
				}
				draw_sprite_ext(spr_icon_bug, 2, left_sidebar_x + 20 + icon_x_offset, 20 + debug_settings_y, 1, 1, 0, c_white, 1);
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + debug_settings_y, l10n_text("Debug"), global.default_text_size * 1.05, c_black, c_white, 1);
			}
			else
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, debug_settings_y, 370, debug_settings_y + 40 - 1))
				&& (global.controls_used_for_navigation == "mouse")
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + debug_settings_y, 1, 1, 0, c_lime, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, left_sidebar_x, 20 + debug_settings_y, 1, 1, 0, c_white, 1);
				}
				draw_sprite_ext(spr_icon_bug, 2, left_sidebar_x + 20 + icon_x_offset, 20 + debug_settings_y, 0.9, 0.9, 0, c_white, 1);
				scr_draw_text_outlined(left_sidebar_x + 40 + text_x_offset, 20 + debug_settings_y, l10n_text("Debug"), global.default_text_size, c_white, c_black, 1);
			}
		}
		#endregion /* Debug Settings END */

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
		if (key_accept_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (global.settings_sidebar_menu == "settings_back")
		&& (can_navigate_settings_sidebar)
		&& (!input_key)
		&& (!input_gamepad_button)
		|| (key_back_pressed)
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

		var debug_text_submenu_active = (global.settings_sidebar_menu == "debug_settings")
			&& (string_pos("debug_screen_text_", string(menu)) == 1)
			&& (menu != "debug_screen_text_menu");
		var level_load_diagnostics_submenu_active = (global.settings_sidebar_menu == "debug_settings")
			&& (string_pos("level_load_diagnostics_", string(menu)) == 1)
			&& (menu != "level_load_diagnostics_menu");
		var capture_mode_submenu_active = (global.settings_sidebar_menu == "debug_settings")
			&& (string_pos("capture_mode_", string(menu)) == 1)
			&& (menu != "capture_mode_menu");
		var capture_mode_confirmation_active = string_pos("capture_mode_confirm_", string(menu)) == 1;
		var capture_mode_tutorial_details_active = string_pos("capture_mode_tutorial_details_", string(menu)) == 1;
		var debug_submenu_active = debug_text_submenu_active
			|| level_load_diagnostics_submenu_active
			|| capture_mode_submenu_active;

		if (key_back_pressed)
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
			if (debug_submenu_active)
			{
				if (debug_text_submenu_active)
				{
					menu = "debug_screen_text_menu";
				}
				else
				if (level_load_diagnostics_submenu_active)
				{
					menu = "level_load_diagnostics_menu";
				}
				else
				{
					menu = capture_mode_confirmation_active
						? "capture_mode_back"
						: (capture_mode_tutorial_details_active ? "capture_mode_tutorial_signs" : "capture_mode_menu");
				}
				menu_y_offset = 0;
				menu_y_offset_real = 0;
				menu_delay = 3;
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
		|| (key_accept_pressed)
		&& (global.settings_sidebar_menu != "settings_back")
		&& (can_navigate_settings_sidebar)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			can_navigate_settings_sidebar = false;
			if (global.settings_sidebar_menu == "accessibility_settings")
			{
				menu = "assist_enable";
			}
			else
			if (global.settings_sidebar_menu == "challenge_mode_settings")
			&& (global.enable_challenge_mode_settings)
			{
				menu = "challenge_mode_enable";
			}
			else
			if (global.settings_sidebar_menu == "game_settings")
			{
				menu = "difficulty_settings";
			}
			else
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
			else
			if (global.settings_sidebar_menu == "account_settings")
			{
				menu = "change_username";
			}
			else
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
			else
			if (global.settings_sidebar_menu == "audio_settings")
			{
				menu = "volume_main";
			}
			else
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
			else
			if (global.settings_sidebar_menu == "storage_settings")
			{
				menu = "file_select";
			}
			else
			if (global.settings_sidebar_menu == "language_settings")
			{
				menu = "Language" + string(global.current_language_menu_position);
				menu_cursor_y_position = global.current_language_menu_position * 50;
			}
			else
			if (global.settings_sidebar_menu == "debug_settings")
			{
				menu = "debug_screen";
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

		#region /* Click Challenge Mode */
		if (global.enable_challenge_mode_settings)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, challenge_mode_settings_y, 370,(challenge_mode_settings_y + 40) - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (global.settings_sidebar_menu == "challenge_mode_settings")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "challenge_mode_settings";
			menu_delay = 3;
			input_key = false;
			can_navigate_settings_sidebar = false;
			menu = "challenge_mode_enable";
		}
		#endregion /* Click Challenge Mode END */

		else

		#region /* Challenge Mode */
		if (global.enable_challenge_mode_settings)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, challenge_mode_settings_y, 370,(challenge_mode_settings_y + 40) - 1))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.settings_sidebar_menu = "challenge_mode_settings";
			input_key = false;
			can_navigate_settings_sidebar = true;
		}
		#endregion /* Challenge Mode END */

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

		if (debug_settings_visible)
		{

			#region /* Click Debug */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, debug_settings_y, 370, debug_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.settings_sidebar_menu == "debug_settings")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "debug_settings";
				menu_delay = 3;
				input_key = false;
				can_navigate_settings_sidebar = false;
				menu = "debug_screen";
			}
			#endregion /* Click Debug END */

			#region /* Debug */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, debug_settings_y, 370, debug_settings_y + 40 - 1))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.settings_sidebar_menu = "debug_settings";
				input_key = false;
				can_navigate_settings_sidebar = true;
			}
			#endregion /* Debug END */

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
					if (global.enable_challenge_mode_settings)
					{
						global.settings_sidebar_menu = "challenge_mode_settings";
					}
					else
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

			#region /* Chellenge Mode Settings */
			if (global.settings_sidebar_menu == "challenge_mode_settings")
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
			#endregion /* Challenge Mode Settings END */

			#region /* How to play Settings */
			if (global.enable_how_to_play_settings)
			{
				if (global.settings_sidebar_menu == "how_to_play")
				{
					if (key_up)
					&& (can_navigate_settings_sidebar)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.enable_challenge_mode_settings)
						{
							global.settings_sidebar_menu = "challenge_mode_settings";
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
						if (global.enable_challenge_mode_settings)
						{
							global.settings_sidebar_menu = "game_settings";
						}
						else
						{
							global.settings_sidebar_menu = "accessibility_settings";
						}
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
					if (global.enable_challenge_mode_settings)
					{
						global.settings_sidebar_menu = "challenge_mode_settings";
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
					{
						global.settings_sidebar_menu = "language_settings";
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
						{
							global.settings_sidebar_menu = "language_settings";
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
						global.settings_sidebar_menu = "language_settings";
						menu_delay = 3;
					}
				}
			}
			#endregion /* Storage Settings END */

			#region /* Language Settings */
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
					if (debug_settings_visible)
					{
						global.settings_sidebar_menu = "debug_settings";
					}
					else
					{
						global.settings_sidebar_menu = "settings_back";
					}
					menu_delay = 3;
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
						if (global.enable_add_ons_settings)
						{
							global.settings_sidebar_menu = "resource_pack_settings";
						}
						else
						if (debug_settings_visible)
						{
							global.settings_sidebar_menu = "debug_settings";
						}
						else
						{
							global.settings_sidebar_menu = "settings_back";
						}
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
						if (global.enable_broadcast_settings)
						{
							global.settings_sidebar_menu = "broadcast_settings";
						}
						else
						{
							global.settings_sidebar_menu = "language_settings";
						}
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
						if (debug_settings_visible)
						{
							global.settings_sidebar_menu = "debug_settings";
						}
						else
						{
							global.settings_sidebar_menu = "settings_back";
						}
						menu_delay = 3;
					}
				}
			}
			#endregion /* Add-Ons Settings END */

			#region /* Debug Settings */
			if (debug_settings_visible)
			{
				if (global.settings_sidebar_menu == "debug_settings")
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
						if (global.enable_broadcast_settings)
						{
							global.settings_sidebar_menu = "broadcast_settings";
						}
						else
						{
							global.settings_sidebar_menu = "language_settings";
						}
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
			#endregion /* Debug Settings END */

			#region /* The "Back" button should always appear at the top of the screen */
			if (global.settings_sidebar_menu == "settings_back")
			{
				if (key_up)
				&& (can_navigate_settings_sidebar)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (debug_settings_visible)
					{
						global.settings_sidebar_menu = "debug_settings";
					}
					else
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
					{
						global.settings_sidebar_menu = "language_settings";
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

		scr_option_assist_settings();

		if (global.enable_challenge_mode_settings)
		{
			scr_option_challenge_mode_settings();
		}

		#region /* My Game Settings */
		var can_select_font = true;
		
		#region /* Game Settings */
		if (global.settings_sidebar_menu == "game_settings")
		{
			var difficulty_settings_y = 48;
			var automatically_pause_when_window_is_unfocused_settings_y = 48 * 2;
			var show_timer_settings_y = 48 * 3;
			var show_defeats_counter_settings_y = 48 * 4;
			var show_ranks_settings_y = -9999;
			var show_tutorial_signs_y = 48 * 5;
			var players_can_collide_y = 48 * 6;
			var show_new_items_notification_y = 48 * 7;
			var hud_hide_time_y = 48 * 8 + 16;
			var selected_font_y = 48 * 9 + 32;
			var font_antialias_y = 48 * 10 + 32;
			var debug_screen_y = 48 * 11 + 32;

			if (global.enable_ranks)
			{
				show_ranks_settings_y = 48 * 5;
				show_tutorial_signs_y = 48 * 6;
				players_can_collide_y = 48 * 7;
				show_new_items_notification_y = 48 * 8;
				hud_hide_time_y = 48 * 9 + 16;
				selected_font_y = 48 * 10 + 32;
				font_antialias_y = 48 * 11 + 32;
				debug_screen_y = 48 * 12 + 32;
			}
			
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);

			if (global.enable_option_for_pc)
			{
				global.automatically_pause_when_window_is_unfocused = draw_menu_checkmark(380, automatically_pause_when_window_is_unfocused_settings_y, l10n_text("Automatically pause when the game is unfocused"), "automatically_pause_when_window_is_unfocused_settings", global.automatically_pause_when_window_is_unfocused, true,
					l10n_text("Pauses the game when the window loses focus"));
			}

			global.show_timer = draw_menu_checkmark(380, show_timer_settings_y, l10n_text("Show Timer"), "show_timer_settings", global.show_timer, false,
				l10n_text("Displays a timer while playing"));

			global.show_defeats_counter = draw_menu_checkmark(380, show_defeats_counter_settings_y, l10n_text("Show Defeats Counter"), "show_defeats_counter_settings", global.show_defeats_counter, true,
				l10n_text("Keeps track of how many times you've been defeated"));

			if (global.enable_ranks)
			{
				global.show_ranks = draw_menu_checkmark(380, show_ranks_settings_y, l10n_text("Show Ranks"), "show_ranks_settings", global.show_ranks, false,
					l10n_text("Displays rank information based on performance"));
			}

			var capture_mode_controls_tutorial_signs = scr_capture_mode_is_active();
			var tutorial_signs_option_label = capture_mode_controls_tutorial_signs
				? l10n_text("Show Tutorial Signs (Capture Mode)")
				: l10n_text("Show Tutorial Signs");
			var tutorial_signs_option_description = capture_mode_controls_tutorial_signs
				? l10n_text("Controlled by Capture Mode. Change this under Debug > Capture Mode.")
				: l10n_text("Shows tutorial signs with helpful gameplay tips");
			global.show_tutorial_signs = draw_menu_checkmark(380, show_tutorial_signs_y, tutorial_signs_option_label, "show_tutorial_signs", global.show_tutorial_signs, capture_mode_controls_tutorial_signs ? -1 : true,
				tutorial_signs_option_description, true, capture_mode_controls_tutorial_signs);

			global.players_can_collide = draw_menu_checkmark(380, players_can_collide_y, l10n_text("Players Can Collide"), "players_can_collide", global.players_can_collide, false,
				l10n_text("Allows players to collide with each other in multiplayer mode"));

			global.show_new_items_notification = draw_menu_checkmark(380, show_new_items_notification_y, l10n_text("Show New Items Notification"), "show_new_items_notification", global.show_new_items_notification, true,
				l10n_text("Notifies you when new items become available in the level editor"));

			if (global.hud_hide_time > 10)
			{
				global.hud_hide_time = 3;
			}

			/* Safely get the language string from the grid: */
			var lang = "";

			if (variable_global_exists("language_local_data")
			&& global.language_local_data != undefined
			&& global.language_local_data != 0
			&& ds_grid_width(global.language_local_data) > global.selected_language_id)
			{
				lang = global.language_local_data[# global.selected_language_id, 0];
			}
			else
			{
				lang = "";
			}
			
			if (lang == "日本語 (Japanese)")
			{
				/* Only include Game Font and Normal Font for Japanese language; Open Dyslexic isn't supported */
				can_select_font = false;
			}
			var font_antialias_draw_y = selected_font_y;
			var debug_screen_draw_y = font_antialias_y;

			if (can_select_font)
			{
				draw_menu_dropdown(380, selected_font_y, l10n_text("Selected Font"), "select_font", global.selected_font,
					l10n_text("Game Font"), l10n_text("Normal Font"), l10n_text("Open Dyslexic")); /* Includes Open Dyslexic */
				scr_set_default_dropdown_description("select_font", "Game Font");
				font_antialias_draw_y = font_antialias_y;
				debug_screen_draw_y = debug_screen_y;
			}

			var previous_font_antialiasing = global.font_antialiasing;
			global.font_antialiasing = draw_menu_checkmark(380, font_antialias_draw_y, l10n_text("Font Anti-Aliasing"), "font_add_enable_aa", global.font_antialiasing, false,
				l10n_text("Smooths dynamically loaded font edges. OFF by default to keep the menu text crisp and avoid blur at small sizes"));

			if (previous_font_antialiasing != global.font_antialiasing)
			{
				font_add_enable_aa(global.font_antialiasing);
				scr_set_font();
			}

			if (scr_debug_should_show_public_debug_controls())
			{
				global.debug_screen = draw_menu_checkmark(380, debug_screen_draw_y, l10n_text("Debug Screen"), "debug_screen", global.debug_screen, false,
					l10n_text("Displays debug information for development and troubleshooting"));
			}

			draw_menu_dropdown(380, hud_hide_time_y, l10n_text("HUD hide timer"), "hud_hide_time", global.hud_hide_time, l10n_text("Never Show"), l10n_text("After 1 Second"), l10n_text("After 2 Seconds"), l10n_text("After 3 Seconds"), l10n_text("After 4 Seconds"), l10n_text("After 5 Seconds"), l10n_text("After 6 Seconds"), l10n_text("After 7 Seconds"), l10n_text("After 8 Seconds"), l10n_text("After 9 Seconds"), l10n_text("Always Show"));
			scr_set_default_dropdown_description("hud_hide_time", "After 3 Seconds");

			draw_menu_dropdown(380, difficulty_settings_y, l10n_text("Level Layout Difficulty"), "difficulty_settings", global.difficulty, l10n_text("Easy"), l10n_text("Normal"), l10n_text("Hard")); /* Difficulty Settings */
			scr_set_default_dropdown_description("difficulty_settings", "Normal");
		}
		#endregion /* Game Settings END */

		#region /* Debug Settings */
		if (global.settings_sidebar_menu == "debug_settings")
		{
			scr_debug_initialize_visibility_registry();

			if (!variable_instance_exists(self, "debug_screen_text_search_query"))
			{
				debug_screen_text_search_query = "";
			}

			if (!variable_instance_exists(self, "remember_keyboard_string"))
			{
				remember_keyboard_string = "";
			}

			var debug_text_menu_active = (string_pos("debug_screen_text_", string(menu)) == 1)
				&& (menu != "debug_screen_text_menu");
			var level_load_diagnostics_menu_active = (string_pos("level_load_diagnostics_", string(menu)) == 1)
				&& (menu != "level_load_diagnostics_menu");
			var capture_mode_menu_active = (string_pos("capture_mode_", string(menu)) == 1)
				&& (menu != "capture_mode_menu");
			var capture_mode_confirmation_menu_active = string_pos("capture_mode_confirm_", string(menu)) == 1;
			var capture_mode_tutorial_details_menu_active = string_pos("capture_mode_tutorial_details_", string(menu)) == 1;
			var debug_settings_submenu_active = debug_text_menu_active
				|| level_load_diagnostics_menu_active
				|| capture_mode_menu_active;

			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);

			if (!debug_settings_submenu_active)
			{
				var level_loading_debug = scr_get_level_loading_debug_data();
				var latest_level_load_error_log = scr_debug_get_latest_level_load_error_log();
				var latest_level_load_error_visible = !is_undefined(latest_level_load_error_log)
					&& is_struct(latest_level_load_error_log)
					&& string(latest_level_load_error_log.path) != "";
				var latest_load_check_summary = scr_debug_format_validation_summary(level_loading_debug.validation_result);
				var latest_error_log_summary = latest_level_load_error_visible
					? scr_debug_format_latest_level_load_error_summary(latest_level_load_error_log)
					: "";
				var open_debug_dump_folder_visible = global.enable_open_custom_folder;
				var debug_screen_y = 64;
				var debug_screen_text_menu_y = 64 + 48;
				var capture_mode_menu_y = 64 + (48 * 2);
				var level_load_diagnostics_menu_y = 64 + (48 * 3);
				var latest_load_check_y = 64 + (48 * 4);
				var latest_error_log_y = 64 + (48 * 5);
				var save_debug_dump_y = latest_level_load_error_visible
					? 64 + (48 * 6)
					: latest_error_log_y;
				var open_debug_dump_folder_y = save_debug_dump_y + 48;
				var debug_detailed_mode_y = open_debug_dump_folder_visible
					? open_debug_dump_folder_y + 48
					: save_debug_dump_y + 48;
				var debug_unlock_level_editor_objects_y = debug_detailed_mode_y + 48;
				var debug_auto_unlock_runner_y = debug_unlock_level_editor_objects_y + 48;
				var level_editor_unlock_before = global.debug_unlock_all_level_editor_objects;

				global.debug_screen = draw_menu_checkmark(380, debug_screen_y, l10n_text("Debug Screen"), "debug_screen", global.debug_screen, false,
					l10n_text("Displays debug information for development and troubleshooting"));

				var open_debug_screen_text_menu = draw_menu_button(420, debug_screen_text_menu_y, l10n_text("Debug Screen Text"), "debug_screen_text_menu", "");

				if (menu == "debug_screen_text_menu")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Opens the Debug Screen Text menu to customize which debug text groups are visible");
					menu_cursor_y_position = debug_screen_text_menu_y;
				}

				if (open_debug_screen_text_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "debug_screen_text_back";
					menu_y_offset = 0;
					menu_y_offset_real = 0;
					menu_delay = 3;
				}

				var capture_mode_label = l10n_text("Capture Mode") + ": " + scr_capture_mode_get_name();
				var open_capture_mode_menu = draw_menu_button(420, capture_mode_menu_y, capture_mode_label, "capture_mode_menu", "");

				if (menu == "capture_mode_menu")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Temporarily prepares the game for clean trailer footage and restores your settings when turned off");
					menu_cursor_y_position = capture_mode_menu_y;
				}

				if (open_capture_mode_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "capture_mode_back";
					menu_y_offset = 0;
					menu_y_offset_real = 0;
					menu_delay = 3;
				}

				var open_level_load_diagnostics_menu = draw_menu_button(420, level_load_diagnostics_menu_y, l10n_text("Level Load Diagnostics"), "level_load_diagnostics_menu", "");

				if (menu == "level_load_diagnostics_menu")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Shows current level-load status, recent level-load sessions, and saved level-load error logs");
					menu_cursor_y_position = level_load_diagnostics_menu_y;
				}

				if (open_level_load_diagnostics_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_get_latest_level_load_error_log(true);
					menu = "level_load_diagnostics_back";
					menu_y_offset = 0;
					menu_y_offset_real = 0;
					menu_delay = 3;
				}

				draw_menu_info_row(410, latest_load_check_y, l10n_text("Latest Load Check"), latest_load_check_summary, "level_load_latest_check",
					l10n_text("Shows the latest automatic level-load validation result"));

				if (latest_level_load_error_visible)
				{
					draw_menu_info_row(410, latest_error_log_y, l10n_text("Latest Error Log"), latest_error_log_summary, "level_load_latest_error_log",
						l10n_text("Shows the newest saved automatic level-load error log"));
				}

				var save_debug_dump_now = draw_menu_button(420, save_debug_dump_y, l10n_text("Save Debug Dump Now"), "level_load_save_debug_dump", "");

				if (menu == "level_load_save_debug_dump")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Writes a full debug information file immediately without waiting for an automatic error");
					menu_cursor_y_position = save_debug_dump_y;
				}

				if (save_debug_dump_now)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_save_manual_debug_info_dump();
					scr_debug_show_toast("Debug dump saved");
					menu_delay = 3;
				}

				if (open_debug_dump_folder_visible)
				{
					var open_debug_dump_folder = draw_menu_button(420, open_debug_dump_folder_y, l10n_text("Open Debug Dump Folder"), "level_load_open_debug_dump_folder", "");

					if (menu == "level_load_open_debug_dump_folder")
					{
						global.option_default = -1;
						global.option_description = l10n_text("Opens the folder where manual debug dumps are saved");
						menu_cursor_y_position = open_debug_dump_folder_y;
					}

					if (open_debug_dump_folder)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						scr_debug_open_manual_debug_info_folder();
					}
				}

				global.debug_detailed_mode = draw_menu_checkmark(380, debug_detailed_mode_y, l10n_text("Debug Detailed Mode"), "debug_detailed_mode", global.debug_detailed_mode, false,
					l10n_text("Uses developer-facing variable names in the debug overlay"));

				var level_editor_unlock_after = draw_menu_checkmark(380, debug_unlock_level_editor_objects_y, l10n_text("Unlock All Level Editor Objects"), "debug_unlock_all_level_editor_objects", level_editor_unlock_before, false,
					l10n_text("Makes every placeable level editor object available for the current session"));

				if (level_editor_unlock_before != level_editor_unlock_after)
				{
					scr_debug_set_level_editor_objects_unlocked(level_editor_unlock_after);
				}

				if (GM_build_type == "run")
				{
					global.debug_menu_auto_unlock_runner = draw_menu_checkmark(380, debug_auto_unlock_runner_y, l10n_text("Auto-unlock Debug tab in GameMaker Runner"), "debug_menu_auto_unlock_runner", global.debug_menu_auto_unlock_runner, false,
						l10n_text("Development convenience for IDE test runs only. Ignored in shipped builds."));
				}

				menu_cursor_y_position_end = (GM_build_type == "run")
					? debug_auto_unlock_runner_y + 64
					: debug_unlock_level_editor_objects_y + 64;
			}
			else
			if (capture_mode_menu_active)
			{
				var capture_title_x = 370 + ((get_window_width - 370) * 0.5);
				var capture_button_x = capture_title_x - 185;
				var capture_main_compact = get_window_height < 680;
				var capture_back_y = capture_main_compact ? 68 : 84;
				var capture_pc_y = capture_main_compact ? 272 : 344;
				var capture_button_spacing = capture_main_compact ? 48 : 56;
				var capture_pc_available = global.enable_option_for_pc;
				var capture_switch_y = capture_pc_available ? capture_pc_y + capture_button_spacing : capture_pc_y;
				var capture_tutorial_signs_y = capture_switch_y + capture_button_spacing;
				var capture_restore_y = capture_tutorial_signs_y + capture_button_spacing;

				if (capture_mode_tutorial_details_menu_active)
				{
					var capture_details_title_y = capture_main_compact ? 34 : 42;
					var capture_details_text_top = capture_main_compact ? 116 : 142;
					var capture_details_toggle_y = min(get_window_height - (capture_main_compact ? 68 : 88), capture_main_compact ? 508 : 600);
					var capture_details_text_x = 402;
					var capture_details_text_right = max(capture_details_text_x + 1, get_window_width - 32);
					var capture_details_wrap_width = max(1, capture_details_text_right - capture_details_text_x);
					var capture_details_text_scale = global.default_text_size * clamp((get_window_width - 430) / 850, 0.38, capture_main_compact ? 0.62 : 0.76);
					var capture_details_min_text_scale = global.default_text_size * 0.3;
					var capture_details_body_text = l10n_text("By default, Capture Mode hides tutorial signs so the characters, scenery, and action are easier to see in trailer footage.")
						+ "\n\n"
						+ l10n_text("Some scenery overlaps the signs. In a few places, hiding a sign can make the scene look incomplete.")
						+ "\n\n"
						+ l10n_text("This is only visual and does not affect gameplay. Review those moments and leave them out when choosing clips.")
						+ "\n\n"
						+ l10n_text("If a shot looks better with its tutorial sign, choose Shown below. This choice is temporary.");
					var capture_details_body_metrics = undefined;
					var capture_details_available_height = max(1, capture_details_toggle_y - 34 - capture_details_text_top);

					for (var capture_details_fit_attempt = 0; capture_details_fit_attempt < 20; capture_details_fit_attempt++)
					{
						capture_details_body_metrics = scr_get_wrapped_text_metrics(capture_details_body_text, capture_details_wrap_width, 0, capture_details_text_scale);
						if (capture_details_body_metrics.text_height <= capture_details_available_height
						|| capture_details_text_scale <= capture_details_min_text_scale)
						{
							break;
						}

						capture_details_text_scale = max(capture_details_min_text_scale, capture_details_text_scale * 0.9);
					}

					capture_details_body_metrics = scr_get_wrapped_text_metrics(capture_details_body_text, capture_details_wrap_width, 0, capture_details_text_scale);
					scr_draw_settings_overlay_title(capture_title_x, capture_details_title_y, l10n_text("Tutorial Signs in Capture Mode"), min(get_window_width - 430, 760));

					var close_capture_tutorial_details = draw_menu_button(capture_button_x, capture_back_y, l10n_text("Back to Capture Mode"), "capture_mode_tutorial_details_back", "");
					if (close_capture_tutorial_details)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu = "capture_mode_tutorial_signs";
						menu_y_offset = 0;
						menu_y_offset_real = 0;
						menu_delay = 3;
					}

					draw_set_halign(fa_left);
					draw_set_valign(fa_middle);
					for (var capture_details_line_index = 0; capture_details_line_index < capture_details_body_metrics.line_count; capture_details_line_index++)
					{
						var capture_details_line_y = capture_details_text_top
							+ (capture_details_body_metrics.line_box_height * 0.5)
							+ (capture_details_line_index * (capture_details_body_metrics.line_box_height + capture_details_body_metrics.line_gap));
						scr_draw_text_outlined(capture_details_text_x, capture_details_line_y, capture_details_body_metrics.lines[capture_details_line_index], capture_details_text_scale, c_black, c_white, 1);
					}

					var capture_tutorial_signs_visible = scr_capture_mode_get_tutorial_signs_visible();
					var capture_tutorial_toggle_label = capture_tutorial_signs_visible
						? l10n_text("Tutorial Signs: Shown")
						: l10n_text("Tutorial Signs: Hidden (Recommended)");
					var toggle_capture_tutorial_signs = draw_menu_button(capture_button_x, capture_details_toggle_y, capture_tutorial_toggle_label, "capture_mode_tutorial_details_toggle", "", capture_tutorial_signs_visible ? c_yellow : c_lime);

					if (toggle_capture_tutorial_signs)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						scr_capture_mode_set_tutorial_signs_visible(!capture_tutorial_signs_visible);
						menu = "capture_mode_tutorial_details_toggle";
						menu_delay = 3;
					}

					if (menu == "capture_mode_tutorial_details_back")
					{
						global.option_description = l10n_text("Returns to the Capture Mode menu");
						menu_cursor_y_position = capture_back_y;
					}
					else
					{
						global.option_description = l10n_text("Changes whether tutorial signs are hidden or shown during Capture Mode");
						menu_cursor_y_position = capture_details_toggle_y;
					}

					menu_cursor_y_position_end = capture_details_toggle_y + 64;
				}
				else
				if (!capture_mode_confirmation_menu_active)
				{
					scr_draw_settings_overlay_title(capture_title_x, 42, l10n_text("Capture Mode"), min(get_window_width - 430, 620));

					var close_capture_mode_menu = draw_menu_button(capture_button_x, capture_back_y, l10n_text("Back"), "capture_mode_back", "");
					if (close_capture_mode_menu)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu = "capture_mode_menu";
						menu_y_offset = 0;
						menu_y_offset_real = 0;
						menu_delay = 3;
					}

					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					var capture_status_color = scr_capture_mode_is_active() ? c_lime : c_ltgray;
					var capture_status_y = capture_main_compact ? 126 : 154;
					var capture_transition_active = variable_global_exists("capture_mode_window_transition")
						&& is_struct(global.capture_mode_window_transition);
					var capture_status_suffix = capture_transition_active
						? (scr_capture_mode_is_active() ? l10n_text("Applying...") : l10n_text("Restoring..."))
						: (scr_capture_mode_is_active() ? l10n_text("Ready") : "");
					var capture_status_text = l10n_text("Current Mode") + ": " + scr_capture_mode_get_name();
					if (capture_status_suffix != "")
					{
						capture_status_text += " (" + capture_status_suffix + ")";
					}
					var capture_status_scale = global.default_text_size * clamp((get_window_width - 430) / 680, 0.5, 1);
					scr_draw_text_outlined(capture_title_x, capture_status_y, capture_status_text, capture_status_scale, c_black, capture_status_color, 1);
					var capture_intro_scale = global.default_text_size * clamp((get_window_width - 430) / 750, 0.45, 0.78);
					var capture_intro_y = capture_main_compact ? 176 : 212;
					var capture_intro_spacing = capture_main_compact ? 22 : 28;
					scr_draw_text_outlined(capture_title_x, capture_intro_y, l10n_text("Temporarily prepares the game for clean screenshots and trailer footage."), capture_intro_scale, c_black, c_white, 1);
					scr_draw_text_outlined(capture_title_x, capture_intro_y + capture_intro_spacing, l10n_text("Select a preset to review the main changes before it is applied."), capture_intro_scale, c_black, c_white, 1);
					scr_draw_text_outlined(capture_title_x, capture_intro_y + (capture_intro_spacing * 2), l10n_text("Your original settings return when Capture Mode is turned off."), capture_intro_scale, c_black, c_white, 1);
					scr_draw_text_outlined(capture_title_x, capture_intro_y + (capture_intro_spacing * 3), l10n_text("Capture Mode turns off when the game closes. Enable it again after restarting."), capture_intro_scale, c_black, c_white, 1);

					var review_pc_capture_mode = false;
					if (capture_pc_available)
					{
						review_pc_capture_mode = draw_menu_button(capture_button_x, capture_pc_y, l10n_text("PC Capture (1080p)"), "capture_mode_pc", "", c_aqua);
					}
					var review_switch_capture_mode = draw_menu_button(capture_button_x, capture_switch_y, l10n_text("Switch Handheld Capture (720p)"), "capture_mode_switch", "", c_red);
					var capture_tutorial_signs_visible = scr_capture_mode_get_tutorial_signs_visible();
					var capture_tutorial_signs_label = capture_tutorial_signs_visible
						? l10n_text("Tutorial Signs: Shown")
						: l10n_text("Tutorial Signs: Hidden for cleaner footage");
					var review_capture_tutorial_signs = draw_menu_button(capture_button_x, capture_tutorial_signs_y, capture_tutorial_signs_label, "capture_mode_tutorial_signs", "", capture_tutorial_signs_visible ? c_yellow : c_lime);

					if (review_pc_capture_mode)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu = "capture_mode_confirm_pc_cancel";
						menu_delay = 3;
					}

					if (review_switch_capture_mode)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu = "capture_mode_confirm_switch_cancel";
						menu_delay = 3;
					}

					if (review_capture_tutorial_signs)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu = "capture_mode_tutorial_details_back";
						menu_delay = 3;
					}

					if (scr_capture_mode_is_active())
					{
						var review_capture_restore = draw_menu_button(capture_button_x, capture_restore_y, l10n_text("Turn Off and Restore Settings"), "capture_mode_restore", "", c_yellow);

						if (review_capture_restore)
						&& (menu_delay == 0 && menu_joystick_delay == 0)
						{
							menu = "capture_mode_confirm_restore_cancel";
							menu_delay = 3;
						}
					}

					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					if (global.enable_option_for_pc && get_window_height >= 560)
					{
						scr_draw_text_outlined(capture_title_x, scr_capture_mode_is_active() ? capture_restore_y + 78 : capture_tutorial_signs_y + 82, l10n_text("F2 saves a clean screenshot without menus."), global.default_text_size * 0.72, c_black, c_ltgray, 1);
						scr_draw_text_outlined(capture_title_x, scr_capture_mode_is_active() ? capture_restore_y + 106 : capture_tutorial_signs_y + 110, l10n_text("Shift + F2 saves the complete window, including menus."), global.default_text_size * 0.72, c_black, c_ltgray, 1);
					}

					if (menu == "capture_mode_back")
					{
						global.option_description = l10n_text("Returns to the main Debug tab");
						menu_cursor_y_position = capture_back_y;
					}
					else
					if (menu == "capture_mode_pc")
					{
						global.option_description = l10n_text("Reviews the clean 1920 x 1080 PC trailer preset before applying it");
						menu_cursor_y_position = capture_pc_y;
					}
					else
					if (menu == "capture_mode_switch")
					{
						global.option_description = global.enable_option_for_pc
							? l10n_text("Reviews the 1280 x 720 handheld Switch trailer preset before applying it")
							: l10n_text("Reviews the handheld Switch trailer preset before applying it");
						menu_cursor_y_position = capture_switch_y;
					}
					else
					if (menu == "capture_mode_tutorial_signs")
					{
						global.option_description = l10n_text("Opens an explanation of tutorial signs and their Capture Mode setting");
						menu_cursor_y_position = capture_tutorial_signs_y;
					}
					else
					if (menu == "capture_mode_restore")
					{
						global.option_description = l10n_text("Reviews the original settings that will be restored");
						menu_cursor_y_position = capture_restore_y;
					}

					menu_cursor_y_position_end = scr_capture_mode_is_active()
						? capture_restore_y + 64
						: capture_tutorial_signs_y + 64;
				}
				else
				{
					var confirm_pc_capture = string_pos("capture_mode_confirm_pc_", string(menu)) == 1;
					var confirm_switch_capture = string_pos("capture_mode_confirm_switch_", string(menu)) == 1;
					var confirm_restore_capture = string_pos("capture_mode_confirm_restore_", string(menu)) == 1;
					var capture_confirm_apply_id = confirm_pc_capture
						? "capture_mode_confirm_pc_apply"
						: (confirm_switch_capture ? "capture_mode_confirm_switch_apply" : "capture_mode_confirm_restore_apply");
					var capture_confirm_cancel_id = confirm_pc_capture
						? "capture_mode_confirm_pc_cancel"
						: (confirm_switch_capture ? "capture_mode_confirm_switch_cancel" : "capture_mode_confirm_restore_cancel");
					var capture_confirm_title = confirm_pc_capture
						? l10n_text("Enable PC Capture Mode?")
						: (confirm_switch_capture ? l10n_text("Enable Switch Handheld Capture Mode?") : l10n_text("Turn Off Capture Mode?"));
					var capture_confirm_color = confirm_pc_capture ? c_aqua : (confirm_switch_capture ? c_red : c_yellow);
					var capture_tutorial_confirmation_line = scr_capture_mode_get_tutorial_signs_visible()
						? l10n_text("Tutorial signs and their button instructions remain visible.")
						: l10n_text("Tutorial signs and their button instructions are hidden for cleaner footage.");
					var capture_confirm_lines = [];

					if (confirm_pc_capture)
					{
						capture_confirm_lines = [
							l10n_text("The game changes to a 1920 x 1080 window for recording PC footage."),
							l10n_text("Menus and on-screen text are automatically sized for this resolution."),
							l10n_text("Timers, counters, player labels, new item messages, and other gameplay displays are hidden."),
							capture_tutorial_confirmation_line,
							l10n_text("Arrows showing routes, objectives, exits, or off-screen players are hidden."),
							l10n_text("The Debug Screen, collision outlines, and other visuals used for testing are hidden."),
							l10n_text("Music and short musical jingles are muted. Every other sound keeps its current volume."),
							l10n_text("Button icons automatically match the controls each player uses."),
							l10n_text("On PC, the game keeps running and the screen does not darken when another window is selected.")
						];
					}
					else
					if (confirm_switch_capture)
					{
						capture_confirm_lines = [
							global.enable_option_for_pc
								? l10n_text("The game changes to a 1280 x 720 window to match Nintendo Switch handheld mode.")
								: l10n_text("The game follows the Nintendo Switch display mode. Handheld mode uses 1280 x 720."),
							l10n_text("Menus and on-screen text are automatically sized for this resolution."),
							l10n_text("Timers, counters, player labels, new item messages, and other gameplay displays are hidden."),
							capture_tutorial_confirmation_line,
							l10n_text("Arrows showing routes, objectives, exits, or off-screen players are hidden."),
							l10n_text("The Debug Screen, collision outlines, and other visuals used for testing are hidden."),
							l10n_text("Music and short musical jingles are muted. Every other sound keeps its current volume."),
							l10n_text("Nintendo Switch button icons are shown for every player, no matter which controls they use.")
						];

						if (global.enable_option_for_pc)
						{
							array_push(capture_confirm_lines, l10n_text("On PC, the game keeps running and the screen does not darken when another window is selected."));
						}
					}
					else
					{
						capture_confirm_lines = [
							l10n_text("Your settings return to the values they had before Capture Mode was enabled."),
							l10n_text("This includes the window, gameplay displays, tutorial signs, arrows, button instructions, button icons, and audio."),
							l10n_text("Settings for the Debug Screen, collision outlines, and window focus also return.")
						];
					}

					/* The more detailed enable explanations need the compact layout at lower resolutions. */
					var capture_confirm_compact = get_window_height < 640
						|| (!confirm_restore_capture && get_window_height < 720);
					var capture_confirm_title_y = capture_confirm_compact ? 42 : 68;
					var capture_confirm_text_top = capture_confirm_compact ? 78 : 132;
					var capture_confirm_apply_y = get_window_height - (capture_confirm_compact ? 100 : 158);
					var capture_confirm_cancel_y = get_window_height - (capture_confirm_compact ? 52 : 104);
					var capture_confirm_text_x = 402;
					var capture_confirm_text_right = max(capture_confirm_text_x + 1, get_window_width - 32);
					var capture_confirm_wrap_width = max(1, capture_confirm_text_right - capture_confirm_text_x);
					var capture_confirm_text_scale = global.default_text_size * clamp((get_window_width - 430) / 850, 0.35, capture_confirm_compact ? 0.58 : 0.72);
					var capture_confirm_min_text_scale = global.default_text_size * 0.28;
					var show_capture_snapshot_note = !confirm_restore_capture
						&& (!capture_confirm_compact || get_window_height >= 520);
					var capture_confirm_body_text = "";

					for (var capture_paragraph_index = 0; capture_paragraph_index < array_length(capture_confirm_lines); capture_paragraph_index++)
					{
						if (capture_paragraph_index > 0)
						{
							capture_confirm_body_text += "\n";
						}

						capture_confirm_body_text += string(capture_confirm_lines[capture_paragraph_index]);
					}

					var capture_snapshot_text = l10n_text("Before Capture Mode turns on, your current settings are remembered.")
						+ "\n"
						+ l10n_text("These changes are temporary. Turning Capture Mode off restores your settings.");
					var capture_confirm_body_metrics = undefined;
					var capture_snapshot_metrics = undefined;
					var capture_snapshot_gap = capture_confirm_compact ? 10 : 22;
					var capture_confirm_content_bottom = capture_confirm_apply_y - (capture_confirm_compact ? 16 : 24);
					var capture_confirm_available_height = max(1, capture_confirm_content_bottom - capture_confirm_text_top);

					/* Wrap first, then reduce the shared scale only when the complete text block needs it. */
					for (var capture_fit_attempt = 0; capture_fit_attempt < 20; capture_fit_attempt++)
					{
						capture_confirm_body_metrics = scr_get_wrapped_text_metrics(capture_confirm_body_text, capture_confirm_wrap_width, 0, capture_confirm_text_scale);
						capture_snapshot_metrics = scr_get_wrapped_text_metrics(capture_snapshot_text, capture_confirm_wrap_width, 0, capture_confirm_text_scale);

						var capture_confirm_total_height = capture_confirm_body_metrics.text_height;
						if (show_capture_snapshot_note)
						{
							capture_confirm_total_height += capture_snapshot_gap + capture_snapshot_metrics.text_height;
						}

						var capture_confirm_widest_line = 1;
						for (var capture_width_index = 0; capture_width_index < capture_confirm_body_metrics.line_count; capture_width_index++)
						{
							capture_confirm_widest_line = max(capture_confirm_widest_line, string_width(string(capture_confirm_body_metrics.lines[capture_width_index])) * capture_confirm_text_scale);
						}
						if (show_capture_snapshot_note)
						{
							for (var capture_note_width_index = 0; capture_note_width_index < capture_snapshot_metrics.line_count; capture_note_width_index++)
							{
								capture_confirm_widest_line = max(capture_confirm_widest_line, string_width(string(capture_snapshot_metrics.lines[capture_note_width_index])) * capture_confirm_text_scale);
							}
						}

						var capture_confirm_fits_width = capture_confirm_widest_line <= capture_confirm_wrap_width;
						var capture_confirm_fits_height = capture_confirm_total_height <= capture_confirm_available_height;
						if (capture_confirm_fits_width && capture_confirm_fits_height)
						{
							break;
						}
						if (capture_confirm_text_scale <= capture_confirm_min_text_scale)
						{
							/* Keep the main explanation readable on unusually short windows. */
							if (!capture_confirm_fits_height && show_capture_snapshot_note)
							{
								show_capture_snapshot_note = false;
								continue;
							}

							break;
						}

						var capture_confirm_next_scale = capture_confirm_text_scale * 0.9;
						if (!capture_confirm_fits_width)
						{
							capture_confirm_next_scale = min(capture_confirm_next_scale, capture_confirm_text_scale * capture_confirm_wrap_width / capture_confirm_widest_line * 0.98);
						}
						capture_confirm_text_scale = max(capture_confirm_min_text_scale, capture_confirm_next_scale);
					}

					/* Keep the measurements synchronized with the final scale selected above. */
					capture_confirm_body_metrics = scr_get_wrapped_text_metrics(capture_confirm_body_text, capture_confirm_wrap_width, 0, capture_confirm_text_scale);
					capture_snapshot_metrics = scr_get_wrapped_text_metrics(capture_snapshot_text, capture_confirm_wrap_width, 0, capture_confirm_text_scale);

					draw_set_alpha(0.88);
					draw_rectangle_color(370, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
					draw_set_alpha(1);
					scr_draw_settings_overlay_title(capture_title_x, capture_confirm_title_y, capture_confirm_title, min(get_window_width - 430, 760));

					draw_set_halign(fa_left);
					draw_set_valign(fa_middle);
					for (var capture_line_index = 0; capture_line_index < capture_confirm_body_metrics.line_count; capture_line_index++)
					{
						var capture_line_center_y = capture_confirm_text_top
							+ (capture_confirm_body_metrics.line_box_height * 0.5)
							+ (capture_line_index * (capture_confirm_body_metrics.line_box_height + capture_confirm_body_metrics.line_gap));
						scr_draw_text_outlined(capture_confirm_text_x, capture_line_center_y, capture_confirm_body_metrics.lines[capture_line_index], capture_confirm_text_scale, c_black, c_white, 1);
					}

					if (show_capture_snapshot_note)
					{
						var capture_snapshot_text_top = capture_confirm_text_top + capture_confirm_body_metrics.text_height + capture_snapshot_gap;
						for (var capture_note_line_index = 0; capture_note_line_index < capture_snapshot_metrics.line_count; capture_note_line_index++)
						{
							var capture_note_line_center_y = capture_snapshot_text_top
								+ (capture_snapshot_metrics.line_box_height * 0.5)
								+ (capture_note_line_index * (capture_snapshot_metrics.line_box_height + capture_snapshot_metrics.line_gap));
							scr_draw_text_outlined(capture_confirm_text_x, capture_note_line_center_y, capture_snapshot_metrics.lines[capture_note_line_index], capture_confirm_text_scale, c_black, c_lime, 1);
						}
					}

					var capture_apply_label = confirm_restore_capture ? l10n_text("Restore Settings") : l10n_text("Enable Capture Mode");
					var apply_capture_confirmation = draw_menu_button(capture_button_x, capture_confirm_apply_y, capture_apply_label, capture_confirm_apply_id, "", capture_confirm_color);
					var cancel_capture_confirmation = draw_menu_button(capture_button_x, capture_confirm_cancel_y, l10n_text("Cancel"), capture_confirm_cancel_id, "");

					if (apply_capture_confirmation)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						var capture_mode_change_succeeded = false;
						if (confirm_pc_capture)
						{
							capture_mode_change_succeeded = scr_capture_mode_apply(CAPTURE_MODE_PRESET.PC);
						}
						else
						if (confirm_switch_capture)
						{
							capture_mode_change_succeeded = scr_capture_mode_apply(CAPTURE_MODE_PRESET.SWITCH_HANDHELD);
						}
						else
						{
							capture_mode_change_succeeded = scr_capture_mode_restore();
						}

						if (capture_mode_change_succeeded)
						{
							menu = "capture_mode_back";
							menu_y_offset = 0;
							menu_y_offset_real = 0;
						}
						else
						{
							scr_debug_show_toast("Please wait for the current window change to finish");
						}
						menu_delay = 3;
					}

					if (cancel_capture_confirmation)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu = confirm_pc_capture
							? "capture_mode_pc"
							: (confirm_switch_capture ? "capture_mode_switch" : "capture_mode_restore");
						menu_delay = 3;
					}

					global.option_description = confirm_restore_capture
						? l10n_text("Confirm whether to restore the original pre-capture settings")
						: l10n_text("Choose whether to enable the selected Capture Mode");
					menu_cursor_y_position = (menu == capture_confirm_apply_id)
						? capture_confirm_apply_y
						: capture_confirm_cancel_y;
					menu_cursor_y_position_end = capture_confirm_cancel_y + 64;
				}
			}
			else
			if (debug_text_menu_active)
			{
				var debug_text_search_modal_active = (menu == "debug_screen_text_search_ok")
					|| (menu == "debug_screen_text_search_cancel");
				var debug_screen_text_title_y = 42;
				var debug_screen_text_back_y = 84;
				var debug_screen_text_search_y = debug_screen_text_back_y + 78;
				var debug_screen_text_search_label_y = debug_screen_text_search_y - 10;
				var debug_screen_text_warning_y = debug_screen_text_search_y + 66;
				var debug_screen_text_row_y = debug_screen_text_warning_y + 96;
				var debug_screen_text_row_spacing = 72;
				var debug_text_title_x = 370 + ((get_window_width - 370) * 0.5);
				var debug_text_warning_x = 410;
				var filtered_debug_visibility_ids = scr_debug_get_filtered_visibility_ids(debug_screen_text_search_query);
				var filtered_debug_visibility_count = array_length(filtered_debug_visibility_ids);
				var search_field_x = 420;
				var search_field_y = debug_screen_text_search_y + menu_y_offset;
				var search_field_width = 370;
				var search_field_height = 41;
				var search_field_left = search_field_x;
				var search_field_top = search_field_y;
				var search_field_right = search_field_left + search_field_width;
				var search_field_bottom = search_field_top + search_field_height;
				var search_field_selected = (menu == "debug_screen_text_search");
				var search_field_hovered = false;
				var search_field_display_text = string(debug_screen_text_search_query);
				var search_field_box_color = make_color_rgb(30, 170, 175);
				var search_field_outline_color = search_field_selected ? c_white : c_ltgray;
				var search_field_text_color = c_white;
				var search_field_padding = 14;

				var debug_text_previous_open_dropdown = open_dropdown;
				if (debug_text_search_modal_active)
				{
					open_dropdown = true;
				}

				var close_debug_screen_text_menu = draw_menu_button(420, debug_screen_text_back_y + menu_y_offset, l10n_text("Back"), "debug_screen_text_back", "");

				if (!debug_text_search_modal_active
				&& close_debug_screen_text_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "debug_screen_text_menu";
					menu_y_offset = 0;
					menu_y_offset_real = 0;
					menu_delay = 3;
				}

				if (menu == "debug_screen_text_back")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Returns to the main Debug tab");
					menu_cursor_y_position = debug_screen_text_back_y;
				}

				draw_set_halign(fa_left);
				draw_set_valign(fa_bottom);
				scr_draw_text_outlined(search_field_left, debug_screen_text_search_label_y + menu_y_offset, l10n_text("Search Filter"), global.default_text_size * 0.85, c_menu_outline, c_menu_fill, 1);

				if (!debug_text_search_modal_active)
				{
					search_field_hovered = point_in_rectangle(mouse_get_x, mouse_get_y, search_field_left, search_field_top, search_field_right, search_field_bottom)
						&& (global.controls_used_for_navigation == "mouse")
						&& !open_dropdown
						&& !input_key;

					if (search_field_hovered)
					{
						menu = "debug_screen_text_search";

						if (variable_instance_exists(self, "can_navigate_settings_sidebar"))
						{
							can_navigate_settings_sidebar = false;
						}
					}
				}

				if (search_field_selected
				|| search_field_hovered
				|| debug_text_search_modal_active)
				{
					search_field_outline_color = c_white;
				}

				if (string_width(search_field_display_text + "...") > search_field_width - (search_field_padding * 2))
				{
					while (string_length(search_field_display_text) > 0)
					&& (string_width(search_field_display_text + "...") > search_field_width - (search_field_padding * 2))
					{
						search_field_display_text = string_delete(search_field_display_text, string_length(search_field_display_text), 1);
					}

					search_field_display_text += "...";
				}

				if ((search_field_selected || debug_text_search_modal_active)
				&& (scr_wave(0, 1, 1, 0) > 0.5))
				{
					search_field_display_text += "|";
				}

				draw_rectangle_color(search_field_left, search_field_top, search_field_right, search_field_bottom, search_field_box_color, search_field_box_color, search_field_box_color, search_field_box_color, false);
				draw_set_alpha(0.6);
				draw_rectangle_color(search_field_left, search_field_top, search_field_right, search_field_bottom, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				draw_rectangle_color(search_field_left, search_field_top, search_field_right, search_field_bottom, search_field_outline_color, search_field_outline_color, search_field_outline_color, search_field_outline_color, true);

				if (search_field_selected
				|| debug_text_search_modal_active)
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, search_field_left - 24, search_field_top + (search_field_height * 0.5), 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, search_field_right + 24, search_field_top + (search_field_height * 0.5), 1, 1, 180, c_white, 1);
				}

				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(search_field_left + search_field_padding, search_field_top + (search_field_height * 0.5), search_field_display_text, global.default_text_size * 0.9, c_black, search_field_text_color, 1);

				if (!debug_text_search_modal_active)
				&& ((search_field_hovered
				&& mouse_check_button_released(mb_left))
				|| (search_field_selected
				&& key_accept_pressed
				&& menu_delay == 0
				&& menu_joystick_delay == 0))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					input_key = true;
					keyboard_string = string(debug_screen_text_search_query);
					remember_keyboard_string = string(debug_screen_text_search_query);
					menu = "debug_screen_text_search_ok";
					menu_delay = 3;
				}

				if (menu == "debug_screen_text_search")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Filters debug screen text by user-facing label or internal item key");
					menu_cursor_y_position = debug_screen_text_search_y;
				}

				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
				scr_draw_text_outlined(debug_text_warning_x, debug_screen_text_warning_y + menu_y_offset,
					l10n_text("These options are for testing purposes only."),
					global.default_text_size * 0.9, c_black, c_red, 1);
				scr_draw_text_outlined(debug_text_warning_x, debug_screen_text_warning_y + 28 + menu_y_offset,
					l10n_text("They may slow down the game, or cause instability."),
					global.default_text_size * 0.9, c_black, c_red, 1);

				var debug_text_row_draw_y = debug_screen_text_row_y;
				var debug_text_content_end_y = debug_screen_text_row_y;
				var debug_text_view_top = -96;
				var debug_text_view_bottom = get_window_height + 96;

				for (var debug_text_item_index = 0; debug_text_item_index < filtered_debug_visibility_count; debug_text_item_index++)
				{
					var debug_text_item_id = filtered_debug_visibility_ids[debug_text_item_index];
					var debug_text_definition = scr_debug_get_visibility_definition(debug_text_item_id);
					var debug_text_label = global.debug_detailed_mode
						? string(debug_text_definition.item_key)
						: l10n_text(debug_text_definition.label);
					var debug_text_row_menu_id = "debug_screen_text_" + debug_text_item_id;
					var debug_text_row_screen_y = debug_text_row_draw_y + menu_y_offset;
					var debug_text_row_visible = (debug_text_row_screen_y + debug_screen_text_row_spacing >= debug_text_view_top)
						&& (debug_text_row_screen_y - 48 <= debug_text_view_bottom);

					if (debug_text_row_visible
					|| menu == debug_text_row_menu_id)
					{
						draw_menu_debug_visibility_row(400, debug_text_row_screen_y, debug_text_label,
							debug_text_row_menu_id, debug_text_item_id,
							l10n_text(debug_text_definition.description));
					}

					debug_text_row_draw_y += debug_screen_text_row_spacing;
					debug_text_content_end_y = debug_text_row_draw_y;
				}

				if (filtered_debug_visibility_count <= 0)
				{
					draw_set_halign(fa_left);
					draw_set_valign(fa_middle);
					scr_draw_text_outlined(410, debug_screen_text_row_y + menu_y_offset, l10n_text("No debug screen text matched this search."), global.default_text_size * 0.9, c_menu_outline, c_ltgray, 1);
					debug_text_content_end_y = debug_screen_text_row_y + 48;
				}

				var debug_screen_text_default_profile_y = debug_text_content_end_y + 24;
				var debug_screen_text_performance_profile_y = debug_screen_text_default_profile_y + 56;
				var debug_screen_text_level_loading_profile_y = debug_screen_text_performance_profile_y + 56;
				var apply_default_profile = draw_menu_button(420, debug_screen_text_default_profile_y + menu_y_offset, l10n_text("Default Profile"), "debug_screen_text_default_profile", "");
				var apply_performance_profile = draw_menu_button(420, debug_screen_text_performance_profile_y + menu_y_offset, l10n_text("Performance Profile"), "debug_screen_text_performance_profile", "");
				var apply_level_loading_profile = draw_menu_button(420, debug_screen_text_level_loading_profile_y + menu_y_offset, l10n_text("Level Loading Profile"), "debug_screen_text_level_loading_profile", "");

				if (menu == "debug_screen_text_default_profile")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Resets every debug screen text item to the default curated profile");
					menu_cursor_y_position = debug_screen_text_default_profile_y;
				}
				else
				if (menu == "debug_screen_text_performance_profile")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Applies the performance-focused debug screen text profile");
					menu_cursor_y_position = debug_screen_text_performance_profile_y;
				}
				else
				if (menu == "debug_screen_text_level_loading_profile")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Applies a certification-friendly profile for catching level loading bugs and load validation errors");
					menu_cursor_y_position = debug_screen_text_level_loading_profile_y;
				}

				if (!debug_text_search_modal_active
				&& apply_default_profile)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_apply_profile("default");
					menu_delay = 3;
				}

				if (!debug_text_search_modal_active
				&& apply_performance_profile)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_apply_profile("performance");
					menu_delay = 3;
				}

				if (!debug_text_search_modal_active
				&& apply_level_loading_profile)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_apply_profile("level_loading");
					menu_delay = 3;
				}

				scr_draw_settings_overlay_title(debug_text_title_x, debug_screen_text_title_y, l10n_text("Debug Screen Text"), min(get_window_width - 430, 560));

				open_dropdown = debug_text_previous_open_dropdown;

				if (debug_text_search_modal_active)
				{
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					scr_draw_text_outlined(get_window_width * 0.5, (get_window_height * 0.5) - 96, l10n_text("Search Debug Screen Text"), global.default_text_size * 1.4, c_black, c_white, 1);

					debug_screen_text_search_query = scr_draw_name_input_screen(debug_screen_text_search_query, 48, c_black, 1, true,
						get_window_width * 0.5, get_window_height * 0.5, "debug_screen_text_search_ok", "debug_screen_text_search_cancel", false, true, false);

					if (global.clicking_ok_input_screen
					|| global.clicking_cancel_input_screen)
					&& (menu_delay == 0
					&& menu_joystick_delay == 0)
					{
						input_key = false;
						menu = "debug_screen_text_search";
						menu_y_offset = 0;
						menu_y_offset_real = 0;
						menu_delay = 3;
					}
				}

				menu_cursor_y_position_end = debug_screen_text_level_loading_profile_y + 64;
			}
			else
			if (level_load_diagnostics_menu_active)
			{
				var level_loading_debug = scr_get_level_loading_debug_data();
				var latest_level_load_error_log = scr_debug_get_latest_level_load_error_log();
				var latest_level_load_error_visible = !is_undefined(latest_level_load_error_log)
					&& is_struct(latest_level_load_error_log)
					&& string(latest_level_load_error_log.path) != "";
				var recent_level_load_history = scr_debug_get_recent_level_load_history();
				var diagnostics_title_y = 42;
				var diagnostics_back_y = 84;
				var diagnostics_save_dump_y = diagnostics_back_y + 78;
				var diagnostics_row_y = diagnostics_save_dump_y + 78;
				var diagnostics_row_spacing = 48;
				var diagnostics_title_x = 370 + ((display_get_gui_width() - 370) * 0.5);
				var diagnostics_row_width = max(520, display_get_gui_width() - 490);
				var diagnostics_open_dump_folder_visible = global.enable_open_custom_folder;
				var diagnostics_open_dump_folder_y = diagnostics_save_dump_y + 56;
				var diagnostics_row_draw_y = diagnostics_row_y;
				var current_level_identifier = scr_debug_get_level_identifier(level_loading_debug);
				var load_mode_text = string(level_loading_debug.load_mode);
				var selected_official_level_id_text = string(level_loading_debug.selected_official_level_id) != "" ? string(level_loading_debug.selected_official_level_id) : "n/a";
				var active_official_level_id_text = string(level_loading_debug.active_official_level_id) != "" ? string(level_loading_debug.active_official_level_id) : "n/a";
				var after_goal_level_text = string(level_loading_debug.after_goal_go_to_this_level);
				var load_snapshot_summary = scr_debug_format_snapshot_summary(level_loading_debug.load_snapshot_status, level_loading_debug.load_snapshot_reason);
				var level_info_summary = scr_debug_format_resolved_path_summary(level_loading_debug.level_information_path, level_loading_debug.level_information_exists);
				var object_json_summary = scr_debug_format_resolved_path_summary(level_loading_debug.object_placement_path, level_loading_debug.object_placement_exists);
				var background_summary = scr_debug_format_resolved_path_summary(level_loading_debug.background_path, level_loading_debug.background_path_exists);
				var automatic_load_check_summary = scr_debug_format_validation_summary(level_loading_debug.validation_result);
				var placed_object_placeholder_summary = scr_debug_format_loaded_live_summary(level_loading_debug.loaded_placed_object_count, level_loading_debug.current_live_placed_object_count);
				var spawn_pass_summary = scr_debug_format_runtime_spawn_pass_summary(level_loading_debug.runtime_spawn_calls);
				var instances_created_summary = scr_debug_format_runtime_instances_created_summary(level_loading_debug.runtime_instances_created_total);
				var auto_log_saved_text = level_loading_debug.auto_log_saved ? l10n_text("Yes") : l10n_text("No");
				var latest_error_validation_summary = latest_level_load_error_visible
					? scr_debug_format_validation_summary(latest_level_load_error_log.validation_result)
					: "";

				var close_level_load_diagnostics_menu = draw_menu_button(420, diagnostics_back_y + menu_y_offset, l10n_text("Back"), "level_load_diagnostics_back", "");

				if (close_level_load_diagnostics_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "level_load_diagnostics_menu";
					menu_y_offset = 0;
					menu_y_offset_real = 0;
					menu_delay = 3;
				}

				if (menu == "level_load_diagnostics_back")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Returns to the main Debug tab");
					menu_cursor_y_position = diagnostics_back_y;
				}

				var save_level_load_debug_dump = draw_menu_button(420, diagnostics_save_dump_y + menu_y_offset, l10n_text("Save Debug Dump Now"), "level_load_diagnostics_save_debug_dump", "");

				if (menu == "level_load_diagnostics_save_debug_dump")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Writes a full debug information file immediately without waiting for an automatic error");
					menu_cursor_y_position = diagnostics_save_dump_y;
				}

				if (save_level_load_debug_dump)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_save_manual_debug_info_dump();
					scr_debug_show_toast("Debug dump saved");
					menu_delay = 3;
				}

				if (diagnostics_open_dump_folder_visible)
				{
					var open_level_load_debug_dump_folder = draw_menu_button(420, diagnostics_open_dump_folder_y + menu_y_offset, l10n_text("Open Debug Dump Folder"), "level_load_diagnostics_open_debug_dump_folder", "");

					if (menu == "level_load_diagnostics_open_debug_dump_folder")
					{
						global.option_default = -1;
						global.option_description = l10n_text("Opens the folder where manual debug dumps are saved");
						menu_cursor_y_position = diagnostics_open_dump_folder_y;
					}

					if (open_level_load_debug_dump_folder)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						scr_debug_open_manual_debug_info_folder();
					}
				}

				if (diagnostics_open_dump_folder_visible)
				{
					diagnostics_row_draw_y = diagnostics_open_dump_folder_y + 78;
				}

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Automatic Load Check"), automatic_load_check_summary, "level_load_diagnostics_automatic_load_check",
					l10n_text("Shows the current automatic level-load validation result"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Load Snapshot"), load_snapshot_summary, "level_load_diagnostics_load_snapshot",
					l10n_text("Shows the current snapshot of load-time file resolution and object capture"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Current Level"), current_level_identifier, "level_load_diagnostics_current_level",
					l10n_text("Shows which level identifier the monitor is currently tracking"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Load Mode"), load_mode_text, "level_load_diagnostics_load_mode",
					l10n_text("Shows whether the current load is official, template_official, or custom"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Selected Official ID"), selected_official_level_id_text, "level_load_diagnostics_selected_official_id",
					l10n_text("Shows the currently selected official level ID"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Active Official ID"), active_official_level_id_text, "level_load_diagnostics_active_official_id",
					l10n_text("Shows the official level ID that actually finished loading"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("After Goal Level"), after_goal_level_text, "level_load_diagnostics_after_goal_level",
					l10n_text("Shows where the game plans to send the player after clearing the level"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Level Info"), level_info_summary, "level_load_diagnostics_level_info",
					l10n_text("Shows whether level_information.ini was found at the resolved path"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Object JSON"), object_json_summary, "level_load_diagnostics_object_json",
					l10n_text("Shows whether object_placement_all.json was found at the resolved path"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Background"), background_summary, "level_load_diagnostics_background",
					l10n_text("Shows whether the resolved background directory exists"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("JSON Entries"), string(level_loading_debug.load_snapshot_json_entry_count), "level_load_diagnostics_json_entries",
					l10n_text("Shows how many entries were read from object_placement_all.json during the load snapshot"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Placed-Object Placeholder"), placed_object_placeholder_summary, "level_load_diagnostics_placeholder_summary",
					l10n_text("Compares the load-time placed-object placeholder count with the live count now"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Placed-Object Spawn Passes"), spawn_pass_summary, "level_load_diagnostics_spawn_passes",
					l10n_text("Shows how many placed-object placeholder spawn passes finished"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Gameplay Instances Created"), instances_created_summary, "level_load_diagnostics_instances_created",
					l10n_text("Shows how many gameplay instances were created from placed-object placeholders"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Auto-Log Saved This Load"), auto_log_saved_text, "level_load_diagnostics_auto_log_saved",
					l10n_text("Shows whether the current validation session already saved an automatic error log"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Monitor Session ID"), string(level_loading_debug.monitor_session_id), "level_load_diagnostics_monitor_session_id",
					l10n_text("Shows the current level-load monitor session ID"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				if (latest_level_load_error_visible)
				{
					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Latest Error Log"), string(latest_level_load_error_log.display_path), "level_load_diagnostics_latest_error_log",
						l10n_text("Shows the newest saved automatic level-load error log path"), diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;

					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Latest Error Reason"), string(latest_level_load_error_log.failure_reason), "level_load_diagnostics_latest_error_reason",
						l10n_text("Shows why the newest saved automatic level-load error log was written"), diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;

					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Latest Error Validation"), latest_error_validation_summary, "level_load_diagnostics_latest_error_validation",
						l10n_text("Shows the saved validation result for the newest automatic level-load error log"), diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;

					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Latest Error Saved At"), string(latest_level_load_error_log.saved_at), "level_load_diagnostics_latest_error_saved_at",
						l10n_text("Shows when the newest automatic level-load error log was saved"), diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;

					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Latest Error Session ID"), string(latest_level_load_error_log.session_id), "level_load_diagnostics_latest_error_session_id",
						l10n_text("Shows which monitor session created the newest automatic level-load error log"), diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;
				}

				for (var recent_load_index = 0; recent_load_index < min(5, array_length(recent_level_load_history)); recent_load_index++)
				{
					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Recent Load") + " " + string(recent_load_index + 1),
						scr_debug_format_recent_level_load_history_entry(recent_level_load_history[recent_load_index]),
						"level_load_diagnostics_recent_load_" + string(recent_load_index + 1),
						l10n_text("Shows a recently completed automatic level-load validation result"),
						diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;
				}

				var export_reminder_text_scale = global.default_text_size * 0.78;
				var export_reminder_lines = [];
				var export_reminder_single_line = l10n_text("If a level-loading bug happens, export all save data with Includes CacheStorage enabled.");

				if ((string_width(export_reminder_single_line) * export_reminder_text_scale) <= diagnostics_row_width)
				{
					export_reminder_lines[0] = export_reminder_single_line;
				}
				else
				{
					var export_reminder_multiline_text = l10n_text("If a level-loading bug happens, export all save data{br}with Includes CacheStorage enabled.");
					var export_reminder_newline_index = string_pos("\n", export_reminder_multiline_text);

					if (export_reminder_newline_index > 0)
					{
						export_reminder_lines[0] = string_copy(export_reminder_multiline_text, 1, export_reminder_newline_index - 1);
						export_reminder_lines[1] = string_delete(export_reminder_multiline_text, 1, export_reminder_newline_index);
					}
					else
					{
						export_reminder_lines[0] = export_reminder_multiline_text;
					}
				}

				var export_reminder_outline_offset = max(1, round(export_reminder_text_scale));
				var export_reminder_line_spacing = max(24, round(string_height("A") * export_reminder_text_scale) + 10);

				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
				for (var export_reminder_index = 0; export_reminder_index < array_length(export_reminder_lines); export_reminder_index++)
				{
					var export_reminder_line_text = string(export_reminder_lines[export_reminder_index]);
					var export_reminder_line_y = diagnostics_row_draw_y + 18 + menu_y_offset + (export_reminder_index * export_reminder_line_spacing);

					draw_text_transformed_color(410 - export_reminder_outline_offset, export_reminder_line_y, export_reminder_line_text, export_reminder_text_scale, export_reminder_text_scale, 0,
						c_menu_outline, c_menu_outline, c_menu_outline, c_menu_outline, 1);
					draw_text_transformed_color(410 + export_reminder_outline_offset, export_reminder_line_y, export_reminder_line_text, export_reminder_text_scale, export_reminder_text_scale, 0,
						c_menu_outline, c_menu_outline, c_menu_outline, c_menu_outline, 1);
					draw_text_transformed_color(410, export_reminder_line_y - export_reminder_outline_offset, export_reminder_line_text, export_reminder_text_scale, export_reminder_text_scale, 0,
						c_menu_outline, c_menu_outline, c_menu_outline, c_menu_outline, 1);
					draw_text_transformed_color(410, export_reminder_line_y + export_reminder_outline_offset, export_reminder_line_text, export_reminder_text_scale, export_reminder_text_scale, 0,
						c_menu_outline, c_menu_outline, c_menu_outline, c_menu_outline, 1);
					draw_text_transformed_color(410, export_reminder_line_y, export_reminder_line_text, export_reminder_text_scale, export_reminder_text_scale, 0,
						c_ltgray, c_ltgray, c_ltgray, c_ltgray, 1);
				}

				scr_draw_settings_overlay_title(diagnostics_title_x, diagnostics_title_y, l10n_text("Level Load Diagnostics"), min(get_window_width - 430, 620));

				menu_cursor_y_position_end = diagnostics_row_draw_y + 112 + (max(0, array_length(export_reminder_lines) - 1) * export_reminder_line_spacing);
			}
		}
		#endregion /* Debug Settings END */

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
			var volume_main_y = 64;
			var volume_music_y = 96 + (64);
			var volume_melody_y = 96 + (64 * 2);
			var volume_sound_y = 96 + (64 * 3);
			var volume_ambient_y = 96 + (64 * 4);
			var volume_footstep_y = 96 + (64 * 5);
			var volume_voice_y = 96 + (64 * 6);
			var number_of_audio_channels_y = 96 + 8 + (64 * 7) - 20;
			var narrator_y = 96 + 8 + (64 * 8) - 10;
			var default_audio_settings_y = 96 + (64 * 8) + 20;

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
							global.narrator_selection--;
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
				if (key_accept_pressed)
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
					global.difficulty--;
				}
				else
				if (key_down)
				&& (open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (global.difficulty < 2)
				{
					menu_delay = 3;
					global.difficulty++;
				}
				else
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					
					if (scr_debug_should_show_public_debug_controls())
					{
						menu = "debug_screen";
					}
					else
					{
						menu = "font_add_enable_aa";
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
					global.hud_hide_time--;
				}
				else
				if (key_down)
				&& (open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (global.hud_hide_time < 10)
				{
					menu_delay = 3;
					global.hud_hide_time++;
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
					{
						menu = "font_add_enable_aa";
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
					global.selected_font--;
					scr_set_font();
				}
				else
				if (key_down)
				&& (open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (can_select_font)
				{
					// Safely get the language string from the grid:
					var lang = "";

					if (variable_global_exists("language_local_data")
					&& global.language_local_data != undefined
					&& global.language_local_data != 0
					&& ds_grid_width(global.language_local_data) > global.selected_language_id)
					{
						lang = global.language_local_data[# global.selected_language_id, 0];
					}
					else
					{
						lang = ""; /* fallback if grid is missing or not large enough */
					}

					/* If you have selected Japanese language, you can't use Open Dyslexic
					If "Global Selected Font" checks for less than 1 here, then you can only select Game Font and Normal Font */
					if ((lang == "日本語 (Japanese)" && global.selected_font < 1)
					|| (lang != "日本語 (Japanese)" && global.selected_font < 2))
					{
						menu_delay = 3;
						global.selected_font++;
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
					menu = "font_add_enable_aa";
				}
			}
			else
			if (menu == "font_add_enable_aa")
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

					if (scr_debug_should_show_public_debug_controls())
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
				if (global.settings_sidebar_menu == "game_settings")
				{
					if (key_up)
					&& (!open_dropdown)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "font_add_enable_aa";
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
				else
				if (global.settings_sidebar_menu == "debug_settings")
				{
					if (key_down)
					&& (!open_dropdown)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "debug_screen_text_menu";
					}
				}
			}
			else
			if (menu == "debug_screen_text_menu")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "capture_mode_menu";
				}
			}
			else
			if (menu == "capture_mode_menu")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen_text_menu";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "level_load_diagnostics_menu";
				}
			}
			else
			if (menu == "level_load_diagnostics_menu")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "capture_mode_menu";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "level_load_latest_check";
				}
			}
			else
			if (menu == "level_load_latest_check")
			{
				var latest_level_load_error_log = scr_debug_get_latest_level_load_error_log();
				var latest_level_load_error_visible = !is_undefined(latest_level_load_error_log)
					&& is_struct(latest_level_load_error_log)
					&& string(latest_level_load_error_log.path) != "";

				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "level_load_diagnostics_menu";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = latest_level_load_error_visible
						? "level_load_latest_error_log"
						: "level_load_save_debug_dump";
				}
			}
			else
			if (menu == "level_load_latest_error_log")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "level_load_latest_check";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "level_load_save_debug_dump";
				}
			}
			else
			if (menu == "level_load_save_debug_dump")
			{
				var latest_level_load_error_log = scr_debug_get_latest_level_load_error_log();
				var latest_level_load_error_visible = !is_undefined(latest_level_load_error_log)
					&& is_struct(latest_level_load_error_log)
					&& string(latest_level_load_error_log.path) != "";
				var open_debug_dump_folder_visible = global.enable_open_custom_folder;

				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = latest_level_load_error_visible
						? "level_load_latest_error_log"
						: "level_load_latest_check";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = open_debug_dump_folder_visible
						? "level_load_open_debug_dump_folder"
						: "debug_detailed_mode";
				}
			}
			else
			if (menu == "level_load_open_debug_dump_folder")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "level_load_save_debug_dump";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_detailed_mode";
				}
			}
			else
			if (menu == "debug_detailed_mode")
			{
				var open_debug_dump_folder_visible = global.enable_open_custom_folder;

				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = open_debug_dump_folder_visible
						? "level_load_open_debug_dump_folder"
						: "level_load_save_debug_dump";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_unlock_all_level_editor_objects";
				}
			}
			else
			if (string_pos("level_load_diagnostics_", string(menu)) == 1)
			&& (menu != "level_load_diagnostics_menu")
			{
				var latest_level_load_error_log = scr_debug_get_latest_level_load_error_log();
				var latest_level_load_error_visible = !is_undefined(latest_level_load_error_log)
					&& is_struct(latest_level_load_error_log)
					&& string(latest_level_load_error_log.path) != "";
				var recent_level_load_history = scr_debug_get_recent_level_load_history();
				var level_load_diagnostics_nav = [
					"level_load_diagnostics_back",
					"level_load_diagnostics_save_debug_dump"
				];

				if (global.enable_open_custom_folder)
				{
					level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_open_debug_dump_folder";
				}

				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_automatic_load_check";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_load_snapshot";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_current_level";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_load_mode";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_selected_official_id";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_active_official_id";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_after_goal_level";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_level_info";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_object_json";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_background";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_json_entries";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_placeholder_summary";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_spawn_passes";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_instances_created";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_auto_log_saved";
				level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_monitor_session_id";

				if (latest_level_load_error_visible)
				{
					level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_latest_error_log";
					level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_latest_error_reason";
					level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_latest_error_validation";
					level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_latest_error_saved_at";
					level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_latest_error_session_id";
				}

				for (var recent_load_nav_index = 0; recent_load_nav_index < min(5, array_length(recent_level_load_history)); recent_load_nav_index++)
				{
					level_load_diagnostics_nav[array_length(level_load_diagnostics_nav)] = "level_load_diagnostics_recent_load_" + string(recent_load_nav_index + 1);
				}

				var current_level_load_nav_index = -1;

				for (var level_load_nav_index = 0; level_load_nav_index < array_length(level_load_diagnostics_nav); level_load_nav_index++)
				{
					if (menu == level_load_diagnostics_nav[level_load_nav_index])
					{
						current_level_load_nav_index = level_load_nav_index;
						break;
					}
				}

				if (current_level_load_nav_index >= 0)
				{
					if (key_up)
					&& (!open_dropdown)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;

						if (current_level_load_nav_index <= 0)
						{
							menu = level_load_diagnostics_nav[array_length(level_load_diagnostics_nav) - 1];
						}
						else
						{
							menu = level_load_diagnostics_nav[current_level_load_nav_index - 1];
						}
					}
					else
					if (key_down)
					&& (!open_dropdown)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;

						if (current_level_load_nav_index >= array_length(level_load_diagnostics_nav) - 1)
						{
							menu = level_load_diagnostics_nav[0];
						}
						else
						{
							menu = level_load_diagnostics_nav[current_level_load_nav_index + 1];
						}
					}
				}
			}
			else
			if (menu == "debug_screen_text_back")
			{
				scr_debug_initialize_visibility_registry();
				var filtered_debug_visibility_ids = scr_debug_get_filtered_visibility_ids(debug_screen_text_search_query);

				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen_text_search";
				}
				else
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen_text_level_loading_profile";
				}
			}
			else
			if (menu == "debug_screen_text_search")
			{
				var filtered_debug_visibility_ids = scr_debug_get_filtered_visibility_ids(debug_screen_text_search_query);

				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen_text_back";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;

					if (array_length(filtered_debug_visibility_ids) > 0)
					{
						menu = "debug_screen_text_" + string(filtered_debug_visibility_ids[0]);
					}
					else
					{
						menu = "debug_screen_text_default_profile";
					}
				}
			}
			else
			if (menu == "debug_screen_text_default_profile")
			{
				scr_debug_initialize_visibility_registry();
				var filtered_debug_visibility_ids = scr_debug_get_filtered_visibility_ids(debug_screen_text_search_query);

				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;

					if (array_length(filtered_debug_visibility_ids) > 0)
					{
						menu = "debug_screen_text_" + string(filtered_debug_visibility_ids[array_length(filtered_debug_visibility_ids) - 1]);
					}
					else
					{
						menu = "debug_screen_text_search";
					}
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen_text_performance_profile";
				}
			}
			else
			if (menu == "debug_screen_text_performance_profile")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen_text_default_profile";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen_text_level_loading_profile";
				}
			}
			else
			if (menu == "debug_screen_text_level_loading_profile")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen_text_performance_profile";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen_text_back";
				}
			}
			else
			if (string_pos("capture_mode_confirm_", string(menu)) == 1)
			{
				if ((key_up || key_down || key_left || key_right)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0))
				{
					menu_delay = 3;

					if (string_pos("_apply", string(menu)) > 0)
					{
						menu = string_replace(string(menu), "_apply", "_cancel");
					}
					else
					{
						menu = string_replace(string(menu), "_cancel", "_apply");
					}
				}
			}
			else
			if (string_pos("capture_mode_tutorial_details_", string(menu)) == 1)
			{
				if ((key_up || key_down || key_left || key_right)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0))
				{
					menu_delay = 3;
					menu = (menu == "capture_mode_tutorial_details_back")
						? "capture_mode_tutorial_details_toggle"
						: "capture_mode_tutorial_details_back";
				}
			}
			else
			if (string_pos("capture_mode_", string(menu)) == 1)
			&& (menu != "capture_mode_menu")
			{
				var capture_mode_navigation = ["capture_mode_back"];

				if (global.enable_option_for_pc)
				{
					array_push(capture_mode_navigation, "capture_mode_pc");
				}

				array_push(capture_mode_navigation, "capture_mode_switch");
				array_push(capture_mode_navigation, "capture_mode_tutorial_signs");

				if (scr_capture_mode_is_active())
				{
					array_push(capture_mode_navigation, "capture_mode_restore");
				}

				var capture_mode_navigation_index = -1;
				for (var capture_nav_index = 0; capture_nav_index < array_length(capture_mode_navigation); capture_nav_index++)
				{
					if (menu == capture_mode_navigation[capture_nav_index])
					{
						capture_mode_navigation_index = capture_nav_index;
						break;
					}
				}

				if (capture_mode_navigation_index >= 0
				&& (key_up || key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0))
				{
					var capture_navigation_direction = key_up ? -1 : 1;
					var capture_next_navigation_index = (capture_mode_navigation_index + capture_navigation_direction + array_length(capture_mode_navigation)) mod array_length(capture_mode_navigation);
					menu = capture_mode_navigation[capture_next_navigation_index];
					menu_delay = 3;
				}
			}
			else
			if (string_pos("debug_screen_text_", string(menu)) == 1)
			&& (menu != "debug_screen_text_menu")
			&& (menu != "debug_screen_text_back")
			&& (menu != "debug_screen_text_search")
			&& (menu != "debug_screen_text_search_ok")
			&& (menu != "debug_screen_text_search_cancel")
			&& (menu != "debug_screen_text_default_profile")
			&& (menu != "debug_screen_text_performance_profile")
			&& (menu != "debug_screen_text_level_loading_profile")
			{
				scr_debug_initialize_visibility_registry();
				var filtered_debug_visibility_ids = scr_debug_get_filtered_visibility_ids(debug_screen_text_search_query);

				var current_debug_text_item_id = string_delete(string(menu), 1, 18);
				var current_debug_text_index = -1;

				for (var debug_text_nav_index = 0; debug_text_nav_index < array_length(filtered_debug_visibility_ids); debug_text_nav_index++)
				{
					if (string(filtered_debug_visibility_ids[debug_text_nav_index]) == current_debug_text_item_id)
					{
						current_debug_text_index = debug_text_nav_index;
						break;
					}
				}

				if (current_debug_text_index >= 0)
				{
					if (key_up)
					&& (!open_dropdown)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;

						if (current_debug_text_index == 0)
						{
							menu = "debug_screen_text_search";
						}
						else
						{
							menu = "debug_screen_text_" + string(filtered_debug_visibility_ids[current_debug_text_index - 1]);
						}
					}
					else
					if (key_down)
					&& (!open_dropdown)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;

						if (current_debug_text_index < array_length(filtered_debug_visibility_ids) - 1)
						{
							menu = "debug_screen_text_" + string(filtered_debug_visibility_ids[current_debug_text_index + 1]);
						}
						else
						{
							menu = "debug_screen_text_default_profile";
						}
					}
				}
			}
			else
			if (menu == "debug_unlock_all_level_editor_objects")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_detailed_mode";
				}
				else
				if (GM_build_type == "run"
				&& key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_menu_auto_unlock_runner";
				}
			}
			else
			if (menu == "debug_menu_auto_unlock_runner")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_unlock_all_level_editor_objects";
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
					global.number_of_audio_channels--;
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
	var capture_mode_custom_page_active = (global.settings_sidebar_menu == "debug_settings")
		&& (string_pos("capture_mode_", string(menu)) == 1)
		&& (menu != "capture_mode_menu");
	if (!capture_mode_custom_page_active)
	{
		scr_draw_option_description();
	}
}
