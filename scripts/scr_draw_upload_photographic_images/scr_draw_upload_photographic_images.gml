function scr_draw_upload_photographic_images()
{
	
	#region /* Ask if level uses photographic images if custom assets are detected */
	/* Switch have guidelines to not share photographic images in UGC */
	if (menu == "level_uses_photographic_images_checkbox")
	|| (menu == "background1_uses_photographic_image")
	|| (menu == "background2_uses_photographic_image")
	|| (menu == "background3_uses_photographic_image")
	|| (menu == "background4_uses_photographic_image")
	|| (menu == "foreground1_uses_photographic_image")
	|| (menu == "foreground1_5_uses_photographic_image")
	|| (menu == "foreground2_uses_photographic_image")
	|| (menu == "foreground_secret_uses_photographic_image")
	|| (menu == "thumbnail_uses_photographic_image")
	|| (menu == "level_uses_photographic_images_confirm")
	|| (menu == "level_uses_photographic_images_back")
	{
		var get_window_height = display_get_gui_height();
		var get_window_width = display_get_gui_width();
		
		var background1_exists = false;
		var background2_exists = false;
		var background3_exists = false;
		var background4_exists = false;
		var foreground1_exists = false;
		var foreground1_5_exists = false;
		var foreground2_exists = false;
		var foreground_secret_exists = false;
		
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background1.png"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background1.bmp"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background1.gif"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background1.jpg"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background1.jpeg"))
		{
			var background1_exists = true;
		}
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background2.png"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background2.bmp"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background2.gif"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background2.jpg"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background2.jpeg"))
		{
			var background2_exists = true;
		}
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background3.png"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background3.bmp"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background3.gif"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background3.jpg"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background3.jpeg"))
		{
			var background3_exists = true;
		}
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background4.png"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background4.bmp"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background4.gif"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background4.jpg"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background4.jpeg"))
		{
			var background4_exists = true;
		}
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1.png"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1.bmp"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1.gif"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1.jpg"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1.jpeg"))
		{
			var foreground1_exists = true;
		}
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1_5.png"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1_5.bmp"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1_5.gif"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1_5.jpg"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1_5.jpeg"))
		{
			var foreground1_5_exists = true;
		}
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground2.png"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground2.bmp"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground2.gif"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground2.jpg"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground2.jpeg"))
		{
			var foreground2_exists = true;
		}
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground_secret.png"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground_secret.bmp"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground_secret.gif"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground_secret.jpg"))
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground_secret.jpeg"))
		{
			var foreground_secret_exists = true;
		}
		
		scr_draw_text_outlined(get_window_width * 0.5, 32 + 32, l10n_text("Does your level use photographic images for the custom background assets?"), global.default_text_size, c_black, c_white, 1);
		level_uses_photographic_images = draw_menu_checkmark(get_window_width * 0.5 - 300, 64 + 32, l10n_text("Level uses photographic images"), "level_uses_photographic_images_checkbox", level_uses_photographic_images, false);
		if (level_uses_photographic_images)
		{
			draw_set_halign(fa_center);
			scr_draw_text_outlined(get_window_width * 0.5, 96 + 32 + 32, l10n_text("What background layer uses a photographic image?"), global.default_text_size, c_black, c_white, 1);
			
			var checkmark_offset = 96 + 32;
			
			if (background1_exists)
			{
				background1_uses_photographic_image = draw_menu_checkmark(get_window_width * 0.5 - 300, 64 + checkmark_offset, l10n_text("Background 1"), "background1_uses_photographic_image", background1_uses_photographic_image, false);
				checkmark_offset += 52;
			}
			if (background2_exists)
			{
				background2_uses_photographic_image = draw_menu_checkmark(get_window_width * 0.5 - 300, 64 + checkmark_offset, l10n_text("Background 2"), "background2_uses_photographic_image", background2_uses_photographic_image, false);
				checkmark_offset += 52;
			}
			if (background3_exists)
			{
				background3_uses_photographic_image = draw_menu_checkmark(get_window_width * 0.5 - 300, 64 + checkmark_offset, l10n_text("Background 3"), "background3_uses_photographic_image", background3_uses_photographic_image, false);
				checkmark_offset += 52;
			}
			if (background4_exists)
			{
				background3_uses_photographic_image = draw_menu_checkmark(get_window_width * 0.5 - 300, 64 + checkmark_offset, l10n_text("Background 4"), "background4_uses_photographic_image", background4_uses_photographic_image, false);
				checkmark_offset += 52;
			}
			if (foreground1_exists)
			{
				foreground1_uses_photographic_image = draw_menu_checkmark(get_window_width * 0.5 - 300, 64 + checkmark_offset, l10n_text("Foreground 1"), "foreground1_uses_photographic_image", foreground1_uses_photographic_image, false);
				checkmark_offset += 52;
			}
			if (foreground1_5_exists)
			{
				foreground1_5_uses_photographic_image = draw_menu_checkmark(get_window_width * 0.5 - 300, 64 + checkmark_offset, l10n_text("Foreground 1.5"), "foreground1_5_uses_photographic_image", foreground1_5_uses_photographic_image, false);
				checkmark_offset += 52;
			}
			if (foreground2_exists)
			{
				foreground2_uses_photographic_image = draw_menu_checkmark(get_window_width * 0.5 - 300, 64 + checkmark_offset, l10n_text("Foreground 2"), "foreground2_uses_photographic_image", foreground2_uses_photographic_image, false);
				checkmark_offset += 52;
			}
			if (foreground_secret_exists)
			{
				foreground_secret_uses_photographic_image = draw_menu_checkmark(get_window_width * 0.5 - 300, 64 + checkmark_offset, l10n_text("Foreground Secret"), "foreground_secret_uses_photographic_image", foreground_secret_uses_photographic_image, false);
				checkmark_offset += 52;
			}
			thumbnail_uses_photographic_image = draw_menu_checkmark(get_window_width * 0.5 - 300, 64 + checkmark_offset, l10n_text("Thumbnail"), "thumbnail_uses_photographic_image", thumbnail_uses_photographic_image, false);
		}
		var confirm_x = get_window_width * 0.5 - 185;
		var confirm_y = get_window_height - 64;
		draw_menu_button(confirm_x, confirm_y, l10n_text("Confirm"), "level_uses_photographic_images_confirm", "level_uses_photographic_images_confirm");
		
		#region /* Navigation */
		
		#region /* Navigation Up */
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "level_uses_photographic_images_back")
			{
				menu = "level_uses_photographic_images_confirm";
			}
			else
			if (menu == "level_uses_photographic_images_checkbox")
			{
				menu = "level_uses_photographic_images_back";
			}
			else
			if (menu == "background1_uses_photographic_image")
			{
				menu = "level_uses_photographic_images_checkbox";
			}
			else
			if (menu == "background2_uses_photographic_image")
			{
				if (background1_exists && level_uses_photographic_images)
				{
					menu = "background1_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_checkbox";
				}
			}
			else
			if (menu == "background3_uses_photographic_image")
			{
				if (background2_exists && level_uses_photographic_images)
				{
					menu = "background2_uses_photographic_image";
				}
				else
				if (background1_exists && level_uses_photographic_images)
				{
					menu = "background1_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_checkbox";
				}
			}
			else
			if (menu == "background4_uses_photographic_image")
			{
				if (background3_exists && level_uses_photographic_images)
				{
					menu = "background3_uses_photographic_image";
				}
				else
				if (background2_exists && level_uses_photographic_images)
				{
					menu = "background2_uses_photographic_image";
				}
				else
				if (background1_exists && level_uses_photographic_images)
				{
					menu = "background1_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_checkbox";
				}
			}
			else
			if (menu == "foreground1_uses_photographic_image")
			{
				if (background4_exists && level_uses_photographic_images)
				{
					menu = "background4_uses_photographic_image";
				}
				else
				if (background3_exists && level_uses_photographic_images)
				{
					menu = "background3_uses_photographic_image";
				}
				else
				if (background2_exists && level_uses_photographic_images)
				{
					menu = "background2_uses_photographic_image";
				}
				else
				if (background1_exists && level_uses_photographic_images)
				{
					menu = "background1_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_checkbox";
				}
			}
			else
			if (menu == "foreground1_5_uses_photographic_image")
			{
				if (foreground1_exists && level_uses_photographic_images)
				{
					menu = "foreground1_uses_photographic_image";
				}
				else
				if (background4_exists && level_uses_photographic_images)
				{
					menu = "background4_uses_photographic_image";
				}
				else
				if (background3_exists && level_uses_photographic_images)
				{
					menu = "background3_uses_photographic_image";
				}
				else
				if (background2_exists && level_uses_photographic_images)
				{
					menu = "background2_uses_photographic_image";
				}
				else
				if (background1_exists && level_uses_photographic_images)
				{
					menu = "background1_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_checkbox";
				}
			}
			else
			if (menu == "foreground2_uses_photographic_image")
			{
				if (foreground1_5_exists && level_uses_photographic_images)
				{
					menu = "foreground1_5_uses_photographic_image";
				}
				else
				if (foreground1_exists && level_uses_photographic_images)
				{
					menu = "foreground1_uses_photographic_image";
				}
				else
				if (background4_exists && level_uses_photographic_images)
				{
					menu = "background4_uses_photographic_image";
				}
				else
				if (background3_exists && level_uses_photographic_images)
				{
					menu = "background3_uses_photographic_image";
				}
				else
				if (background2_exists && level_uses_photographic_images)
				{
					menu = "background2_uses_photographic_image";
				}
				else
				if (background1_exists && level_uses_photographic_images)
				{
					menu = "background1_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_checkbox";
				}
			}
			else
			if (menu == "foreground_secret_uses_photographic_image")
			{
				if (foreground2_exists && level_uses_photographic_images)
				{
					menu = "foreground2_uses_photographic_image";
				}
				else
				if (foreground1_5_exists && level_uses_photographic_images)
				{
					menu = "foreground1_5_uses_photographic_image";
				}
				else
				if (foreground1_exists && level_uses_photographic_images)
				{
					menu = "foreground1_uses_photographic_image";
				}
				else
				if (background4_exists && level_uses_photographic_images)
				{
					menu = "background4_uses_photographic_image";
				}
				else
				if (background3_exists && level_uses_photographic_images)
				{
					menu = "background3_uses_photographic_image";
				}
				else
				if (background2_exists && level_uses_photographic_images)
				{
					menu = "background2_uses_photographic_image";
				}
				else
				if (background1_exists && level_uses_photographic_images)
				{
					menu = "background1_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_checkbox";
				}
			}
			else
			if (menu == "thumbnail_uses_photographic_image")
			{
				if (foreground_secret_exists && level_uses_photographic_images)
				{
					menu = "foreground_secret_uses_photographic_image";
				}
				else
				if (foreground2_exists && level_uses_photographic_images)
				{
					menu = "foreground2_uses_photographic_image";
				}
				else
				if (foreground1_5_exists && level_uses_photographic_images)
				{
					menu = "foreground1_5_uses_photographic_image";
				}
				else
				if (foreground1_exists && level_uses_photographic_images)
				{
					menu = "foreground1_uses_photographic_image";
				}
				else
				if (background4_exists && level_uses_photographic_images)
				{
					menu = "background4_uses_photographic_image";
				}
				else
				if (background3_exists && level_uses_photographic_images)
				{
					menu = "background3_uses_photographic_image";
				}
				else
				if (background2_exists && level_uses_photographic_images)
				{
					menu = "background2_uses_photographic_image";
				}
				else
				if (background1_exists && level_uses_photographic_images)
				{
					menu = "background1_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_checkbox";
				}
			}
			else
			if (menu == "level_uses_photographic_images_confirm")
			{
				if (level_uses_photographic_images)
				{
					menu = "thumbnail_uses_photographic_image";
				}
			}
		}
		#endregion /* Navigation Up END */
		
		else
		
		#region /* Navigation Down */
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "level_uses_photographic_images_back")
			{
				menu = "level_uses_photographic_images_checkbox";
			}
			else
			if (menu == "level_uses_photographic_images_checkbox")
			{
				if (background1_exists && level_uses_photographic_images)
				{
					menu = "background1_uses_photographic_image";
				}
				else
				if (background2_exists && level_uses_photographic_images)
				{
					menu = "background2_uses_photographic_image";
				}
				else
				if (background4_exists && level_uses_photographic_images)
				{
					menu = "background4_uses_photographic_image";
				}
				else
				if (foreground1_exists && level_uses_photographic_images)
				{
					menu = "foreground1_uses_photographic_image";
				}
				else
				if (foreground1_5_exists && level_uses_photographic_images)
				{
					menu = "foreground1_5_uses_photographic_image";
				}
				else
				if (foreground2_exists && level_uses_photographic_images)
				{
					menu = "foreground2_uses_photographic_image";
				}
				else
				if (foreground_secret_exists && level_uses_photographic_images)
				{
					menu = "foreground_secret_uses_photographic_image";
				}
				else
				if (level_uses_photographic_images)
				{
					menu = "thumbnail_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_confirm";
				}
			}
			else
			if (menu == "background1_uses_photographic_image")
			{
				if (background2_exists && level_uses_photographic_images)
				{
					menu = "background2_uses_photographic_image";
				}
				else
				if (background4_exists && level_uses_photographic_images)
				{
					menu = "background4_uses_photographic_image";
				}
				else
				if (foreground1_exists && level_uses_photographic_images)
				{
					menu = "foreground1_uses_photographic_image";
				}
				else
				if (foreground1_5_exists && level_uses_photographic_images)
				{
					menu = "foreground1_5_uses_photographic_image";
				}
				else
				if (foreground2_exists && level_uses_photographic_images)
				{
					menu = "foreground2_uses_photographic_image";
				}
				else
				if (foreground_secret_exists && level_uses_photographic_images)
				{
					menu = "foreground_secret_uses_photographic_image";
				}
				else
				if (level_uses_photographic_images)
				{
					menu = "thumbnail_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_confirm";
				}
			}
			else
			if (menu == "background2_uses_photographic_image")
			{
				if (background3_exists && level_uses_photographic_images)
				{
					menu = "background3_uses_photographic_image";
				}
				else
				if (background4_exists && level_uses_photographic_images)
				{
					menu = "background4_uses_photographic_image";
				}
				else
				if (foreground1_exists && level_uses_photographic_images)
				{
					menu = "foreground1_uses_photographic_image";
				}
				else
				if (foreground1_5_exists && level_uses_photographic_images)
				{
					menu = "foreground1_5_uses_photographic_image";
				}
				else
				if (foreground2_exists && level_uses_photographic_images)
				{
					menu = "foreground2_uses_photographic_image";
				}
				else
				if (foreground_secret_exists && level_uses_photographic_images)
				{
					menu = "foreground_secret_uses_photographic_image";
				}
				else
				if (level_uses_photographic_images)
				{
					menu = "thumbnail_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_confirm";
				}
			}
			else
			if (menu == "background3_uses_photographic_image")
			{
				if (background4_exists && level_uses_photographic_images)
				{
					menu = "background4_uses_photographic_image";
				}
				else
				if (foreground1_exists && level_uses_photographic_images)
				{
					menu = "foreground1_uses_photographic_image";
				}
				else
				if (foreground1_5_exists && level_uses_photographic_images)
				{
					menu = "foreground1_5_uses_photographic_image";
				}
				else
				if (foreground2_exists && level_uses_photographic_images)
				{
					menu = "foreground2_uses_photographic_image";
				}
				else
				if (foreground_secret_exists && level_uses_photographic_images)
				{
					menu = "foreground_secret_uses_photographic_image";
				}
				else
				if (level_uses_photographic_images)
				{
					menu = "thumbnail_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_confirm";
				}
			}
			else
			if (menu == "background4_uses_photographic_image")
			{
				if (foreground1_exists && level_uses_photographic_images)
				{
					menu = "foreground1_uses_photographic_image";
				}
				else
				if (foreground1_5_exists && level_uses_photographic_images)
				{
					menu = "foreground1_5_uses_photographic_image";
				}
				else
				if (foreground2_exists && level_uses_photographic_images)
				{
					menu = "foreground2_uses_photographic_image";
				}
				else
				if (foreground_secret_exists && level_uses_photographic_images)
				{
					menu = "foreground_secret_uses_photographic_image";
				}
				else
				if (level_uses_photographic_images)
				{
					menu = "thumbnail_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_confirm";
				}
			}
			else
			if (menu == "foreground1_uses_photographic_image")
			{
				if (foreground1_5_exists && level_uses_photographic_images)
				{
					menu = "foreground1_5_uses_photographic_image";
				}
				else
				if (foreground2_exists && level_uses_photographic_images)
				{
					menu = "foreground2_uses_photographic_image";
				}
				else
				if (foreground_secret_exists && level_uses_photographic_images)
				{
					menu = "foreground_secret_uses_photographic_image";
				}
				else
				if (level_uses_photographic_images)
				{
					menu = "thumbnail_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_confirm";
				}
			}
			else
			if (menu == "foreground1_5_uses_photographic_image")
			{
				if (foreground2_exists && level_uses_photographic_images)
				{
					menu = "foreground2_uses_photographic_image";
				}
				else
				if (foreground_secret_exists && level_uses_photographic_images)
				{
					menu = "foreground_secret_uses_photographic_image";
				}
				else
				if (level_uses_photographic_images)
				{
					menu = "thumbnail_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_confirm";
				}
			}
			else
			if (menu == "foreground2_uses_photographic_image")
			{
				if (foreground_secret_exists && level_uses_photographic_images)
				{
					menu = "foreground_secret_uses_photographic_image";
				}
				else
				if (level_uses_photographic_images)
				{
					menu = "thumbnail_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_confirm";
				}
			}
			else
			if (menu == "foreground_secret_uses_photographic_image")
			{
				if (level_uses_photographic_images)
				{
					menu = "thumbnail_uses_photographic_image";
				}
				else
				{
					menu = "level_uses_photographic_images_confirm";
				}
			}
			else
			if (menu == "thumbnail_uses_photographic_image")
			{
				menu = "level_uses_photographic_images_confirm";
			}
			else
			if (menu == "level_uses_photographic_images_confirm")
			{
				menu = "level_uses_photographic_images_back";
			}
		}
		#endregion /* Navigation Down END */
		
		else
		
		#region /* Click Confirm */
		if (key_a_pressed
		|| global.controls_used_for_navigation == "mouse"
		&& mouse_check_button_released(mb_left)
		&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), confirm_x, confirm_y, confirm_x + 370, confirm_y + 42))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu == "level_uses_photographic_images_confirm")
		{
			menu_delay = 3;
			
			if (!level_uses_photographic_images)
			{
				background1_uses_photographic_image = false;
				background2_uses_photographic_image = false;
				background3_uses_photographic_image = false;
				background4_uses_photographic_image = false;
				foreground1_uses_photographic_image = false;
				foreground1_5_uses_photographic_image = false;
				foreground2_uses_photographic_image = false;
				foreground_secret_uses_photographic_image = false;
				thumbnail_uses_photographic_image = false;
			}
			
			#region /* Save to the level all the custom backgrounds that use photographic images */
			ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			ini_write_real("Custom Backgrounds", "background1_uses_photographic_image", background1_uses_photographic_image);
			ini_write_real("Custom Backgrounds", "background2_uses_photographic_image", background2_uses_photographic_image);
			ini_write_real("Custom Backgrounds", "background3_uses_photographic_image", background3_uses_photographic_image);
			ini_write_real("Custom Backgrounds", "background4_uses_photographic_image", background4_uses_photographic_image);
			ini_write_real("Custom Backgrounds", "foreground1_uses_photographic_image", foreground1_uses_photographic_image);
			ini_write_real("Custom Backgrounds", "foreground1_5_uses_photographic_image", foreground1_5_uses_photographic_image);
			ini_write_real("Custom Backgrounds", "foreground2_uses_photographic_image", foreground2_uses_photographic_image);
			ini_write_real("Custom Backgrounds", "foreground_secret_uses_photographic_image", foreground_secret_uses_photographic_image);
			ini_write_real("Custom Backgrounds", "thumbnail_uses_photographic_image", thumbnail_uses_photographic_image);
			ini_close();
			#endregion /* Save to the level all the custom backgrounds that use photographic images END */
			
			menu = "upload_yes";
		}
		#endregion /* Click Confirm END */
		
		draw_menu_button(0, 0, l10n_text("Back"), "level_uses_photographic_images_back", "edit_ok");
		draw_sprite_ext(spr_icon_back, 0, 16, 21, 1, 1, 0, c_white, 1);
		
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 185, 0, display_get_gui_width() * 0.5 - 185 + 370, 41))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "level_uses_photographic_images_back")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = "edit_ok";
			menu_delay = 3;
		}
		
		#endregion /* Navigation END */
		
	}
	#endregion /* Ask if level uses photographic images if custom assets are detected END */
	
}