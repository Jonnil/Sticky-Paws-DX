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
		var capture_mode_submenu_active = scr_option_capture_mode_is_page();
		var bool_globals_submenu_active = (global.settings_sidebar_menu == "debug_settings")
			&& (string_pos("bool_globals_", string(menu)) == 1)
			&& (menu != "bool_globals_menu");
		var debug_submenu_active = debug_text_submenu_active
			|| level_load_diagnostics_submenu_active
			|| capture_mode_submenu_active
			|| bool_globals_submenu_active;

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
				if (bool_globals_submenu_active)
				{
					menu = "bool_globals_menu";
				}
				else
				{
					menu = scr_option_capture_mode_get_back_target();
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

			scr_option_capture_mode_tutorial_signs_setting(380, show_tutorial_signs_y);

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

		scr_option_debug(get_window_width, get_window_height, mouse_get_x, mouse_get_y);

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

		scr_options_audio();

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
					if (key_up)
					&& (!open_dropdown)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = (os_type != os_switch)
							? "debug_network_error_preview"
							: ((GM_build_type == "run") ? "debug_menu_auto_unlock_runner" : "debug_unlock_all_level_editor_objects");
					}
					else
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
			if (string_pos("capture_mode_", string(menu)) == 1)
			&& (menu != "capture_mode_menu")
			{
				scr_option_capture_mode_navigate();
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
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = (GM_build_type == "run")
						? "debug_menu_auto_unlock_runner"
						: ((os_type != os_switch) ? "bool_globals_menu" : "debug_screen");
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
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = (os_type != os_switch) ? "bool_globals_menu" : "debug_screen";
				}
				}
				else
				if (menu == "bool_globals_menu")
				{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = (GM_build_type == "run")
						? "debug_menu_auto_unlock_runner"
						: "debug_unlock_all_level_editor_objects";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_force_network_error";
				}
			}
			else
			if (menu == "debug_force_network_error")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "bool_globals_menu";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_crash_message_preview";
				}
			}
			else
			if (menu == "debug_network_error_preview")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_crash_message_preview";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_screen";
				}
			}
			else
			if (menu == "debug_crash_message_preview")
			{
				if (key_up)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_force_network_error";
				}
				else
				if (key_down)
				&& (!open_dropdown)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "debug_network_error_preview";
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
	var capture_mode_custom_page_active = scr_option_capture_mode_is_page();
	if (!capture_mode_custom_page_active || scr_option_capture_mode_uses_option_description())
	{
		scr_draw_option_description();
	}
}
