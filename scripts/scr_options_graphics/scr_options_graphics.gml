function scr_options_graphics()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	
	if (global.settings_sidebar_menu == "video_settings")
	&& (menu != "customize_button_design_color_back")
	&& (menu != "customize_button_design_color")
	&& (menu != "customize_button_design_shape")
	&& (menu != "customize_button_design_transparency")
	{
		if (global.enable_options_for_pc)
		{
			var fullscreen_mode_y = 48;
			var resolution_setting_y = fullscreen_mode_y + 48;
			var interpolate_y = resolution_setting_y + 48;
		}
		else
		{
			var fullscreen_mode_y = -999;
			var resolution_setting_y = 48;
			var interpolate_y = resolution_setting_y + 48;
		}
		var show_fps_y = interpolate_y + 48;
		var show_fps_real_y = show_fps_y + 48;
		var show_instance_count_y = show_fps_real_y + 48;
		var show_collision_mask_y = show_instance_count_y + 48;
		var enable_transitions_y = show_collision_mask_y + 48;
		var enable_background_layer1_y = enable_transitions_y + 48;
		var enable_background_layer2_y = enable_background_layer1_y + 48;
		var enable_background_layer3_y = enable_background_layer2_y + 48;
		var enable_background_layer4_y = enable_background_layer3_y + 48;
		var enable_foreground_layer1_y = enable_background_layer4_y + 48;
		var enable_foreground_layer_1_5_y = enable_foreground_layer1_y + 48;
		var enable_foreground_layer2_y = enable_foreground_layer_1_5_y + 48;
		var enable_foreground_layer_secret_y = enable_foreground_layer2_y + 48;
		var background_brightness_gameplay_y = enable_foreground_layer_secret_y + 48 * 2;
		var background_brightness_menu_y = background_brightness_gameplay_y + 68;
		var reset_level_zoom_when_going_back_to_map_y = background_brightness_menu_y + 48;
		var reset_world_map_zoom_when_going_back_to_map_y = reset_level_zoom_when_going_back_to_map_y + 48;
		var gui_scale_modifier_y = reset_world_map_zoom_when_going_back_to_map_y + 48 + 10;
		var customize_button_design_y = gui_scale_modifier_y + 48 + 10;
		
		#region /* Fullscreen toggle */
		if (os_type != os_ios)
		&& (os_type != os_android)
		&& (global.enable_options_for_pc)
		{
			if (window_get_fullscreen())
			{
				draw_menu_checkmark(386, fullscreen_mode_y + menu_y_offset, l10n_text("Windowed"), "fullscreen_mode", true);
				if (global.controls_used_for_menu_navigation != "controller")
				{
					draw_sprite_ext(spr_keyboard_keys, global.fullscreen_key, 386 + 57, fullscreen_mode_y + 16 + menu_y_offset, 0.5, 0.5, 0, c_white, 1);
				}
			}
			else
			{
				draw_menu_checkmark(386, fullscreen_mode_y + menu_y_offset, l10n_text("Fullscreen"), "fullscreen_mode", false);
				if (global.controls_used_for_menu_navigation != "controller")
				{
					draw_sprite_ext(spr_keyboard_keys, global.fullscreen_key, 386 + 57, 48 + 16 + menu_y_offset, 0.5, 0.5, 0, c_white, 1);
				}
			}
		}
		#endregion /* Fullscreen toggle END */
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		draw_menu_checkmark(386, interpolate_y + menu_y_offset, l10n_text("Interpolation"), "interpolate", global.interpolate);
		
		draw_menu_checkmark(386, show_fps_y + menu_y_offset, l10n_text("Show FPS"), "show_fps", global.show_fps);
		
		draw_menu_checkmark(386, show_fps_real_y + menu_y_offset, l10n_text("Show FPS Real"), "show_fps_real", global.show_fps_real);
		
		draw_menu_checkmark(386, show_instance_count_y + menu_y_offset, l10n_text("Show Instance Count"), "show_instance_count", global.show_instance_count);
		
		draw_menu_checkmark(386, show_collision_mask_y + menu_y_offset, l10n_text("Show Collision Mask"), "show_collision_mask", global.show_collision_mask);
		
		draw_menu_checkmark(386, enable_transitions_y + menu_y_offset, l10n_text("Enable Transitions"), "enable_transitions", global.enable_transitions);
		
		draw_menu_checkmark(386, enable_background_layer1_y + menu_y_offset, l10n_text("Enable Background Layer 1"), "enable_background_layer1", global.enable_background_layer1);
		
		draw_menu_checkmark(386, enable_background_layer2_y + menu_y_offset, l10n_text("Enable Background Layer 2"), "enable_background_layer2", global.enable_background_layer2);
		
		draw_menu_checkmark(386, enable_background_layer3_y + menu_y_offset, l10n_text("Enable Background Layer 3"), "enable_background_layer3", global.enable_background_layer3);
		
		draw_menu_checkmark(386, enable_background_layer4_y + menu_y_offset, l10n_text("Enable Background Layer 4"), "enable_background_layer4", global.enable_background_layer4);
		
		draw_menu_checkmark(386, enable_foreground_layer1_y + menu_y_offset, l10n_text("Enable Foreground Layer 1"), "enable_foreground_layer1", global.enable_foreground_layer1);
		
		draw_menu_checkmark(386, enable_foreground_layer_1_5_y + menu_y_offset, l10n_text("Enable Foreground Layer 1.5"), "enable_foreground_layer_1_5", global.enable_foreground_layer_1_5);
		
		draw_menu_checkmark(386, enable_foreground_layer2_y + menu_y_offset, l10n_text("Enable Foreground Layer 2"), "enable_foreground_layer2", global.enable_foreground_layer2);
		
		draw_menu_checkmark(386, enable_foreground_layer_secret_y + menu_y_offset, l10n_text("Enable Foreground Layer Secret"), "enable_foreground_layer_secret", global.enable_foreground_layer_secret);
		
		#region /* Background Brightness Bars */
		draw_menu_slider(420, background_brightness_gameplay_y + menu_y_offset, l10n_text("Background Brightness in Gameplay"), "background_brightness_gameplay", global.background_brightness_gameplay, c_gray);
		draw_menu_slider(420, background_brightness_menu_y + menu_y_offset, l10n_text("Background Brightness in Menus"), "background_brightness_menu", global.background_brightness_menu, c_gray);
		
		#region /* Draw a little arrow indicating what the default value is */
		draw_set_color(c_menu_fill);
		draw_arrow(420 + 160, background_brightness_gameplay_y + menu_y_offset - 20, 420 + 160, background_brightness_gameplay_y + menu_y_offset - 10, 25);
		draw_arrow(420 + 160, background_brightness_menu_y + menu_y_offset - 20, 420 + 160, background_brightness_menu_y + menu_y_offset - 10, 25);
		#endregion /* Draw a little arrow indicating what the default value is END */
		
		#endregion /* Background Brightness Bars END */
		
		draw_menu_checkmark(386, reset_level_zoom_when_going_back_to_map_y + menu_y_offset, l10n_text("Reset Level Zoom When Going Back To Map"), "reset_level_zoom_when_going_back_to_map", global.reset_level_zoom_when_going_back_to_map);
		draw_menu_checkmark(386, reset_world_map_zoom_when_going_back_to_map_y + menu_y_offset, l10n_text("Reset World Map Zoom When Going Back To Map"), "reset_world_map_zoom_when_going_back_to_map", global.reset_world_map_zoom_when_going_back_to_map);
		
		draw_menu_dropdown(420, gui_scale_modifier_y + menu_y_offset, l10n_text("GUI Scale Modifier"), "gui_scale_modifier", global.gui_scale_modifier, "*0.7", "*0.8", "*0.9", "*1", "*1.1", "*1.2", "*1.3");
		var resolution_setting_var = 0;
		draw_menu_dropdown(420, resolution_setting_y + menu_y_offset, l10n_text("Resolution"), "resolution_setting", resolution_setting_var, "480 x 270", "960 x 540", "1024 x 576", "1280 x 720", "1600 x 900", "1920 x 1080");
		
		draw_menu_button(420, customize_button_design_y + menu_y_offset, l10n_text("Customize Button Design"), "customize_button_design", "customize_button_design_color");
		
		#region /* Navigate */
			
		#region /* Navigate Fullscreen Mode */
		if (menu == "fullscreen_mode")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = fullscreen_mode_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "customize_button_design";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "interpolate";
				menu_delay = 3;
			}
		}
		#endregion /* Navigate Fullscreen Mode END */
		
		else
		
		#region /* Navigate Interpolate */
		if (menu == "interpolate")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = interpolate_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (os_type != os_ios)
				&& (os_type != os_android)
				{
					if (global.enable_options_for_pc)
					{
						menu = "fullscreen_mode";
					}
					else
					{
						menu = "reset_world_map_zoom_when_going_back_to_map";
					}
					menu_delay = 3;
				}
				else
				{
					menu = "background_brightness_gameplay";
					menu_delay = 3;
				}
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "show_fps";
				menu_delay = 3;
			}
		}
		#endregion /* Navigate Interpolate END */
			
		else
			
		#region /* Show fps */
		if (menu == "show_fps")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = show_fps_y;
			if (key_up)
			{
				menu = "interpolate";
			}
			else
			if (key_down)
			{
				menu = "show_fps_real";
			}
		}
		#endregion /* Show fps END */
			
		else
			
		#region /* Show fps real */
		if (menu == "show_fps_real")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = show_fps_real_y;
			if (key_up)
			{
				menu = "show_fps";
			}
			else
			if (key_down)
			{
				menu = "show_instance_count";
			}
		}
		#endregion /* Show fps real END */
			
		else
			
		#region /* Show instance count */
		if (menu == "show_instance_count")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = show_instance_count_y;
			if (key_up)
			{
				menu = "show_fps_real";
			}
			else
			if (key_down)
			{
				menu = "show_collision_mask";
			}
		}
		#endregion /* Show instance count END */
			
		else
			
		#region /* Show collision mask */
		if (menu == "show_collision_mask")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = show_collision_mask_y;
			if (key_up)
			{
				menu = "show_instance_count";
			}
			else
			if (key_down)
			{
				menu = "enable_transitions";
			}
		}
		#endregion /* Show collision mask END */
			
		else
			
		#region /* Navigate Enable Transitions */
		if (menu == "enable_transitions")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = enable_transitions_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "show_collision_mask";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_background_layer1";
				menu_delay = 3;
			}
		}
		#endregion /* Navigate Enable Transitions END */
			
		else
			
		#region /* Enable Backgrounds and Foregrounds */
		if (menu == "enable_background_layer1")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = enable_background_layer1_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_transitions";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_background_layer2";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_background_layer2")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = enable_background_layer2_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_background_layer1";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_background_layer3";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_background_layer3")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = enable_background_layer3_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_background_layer2";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_background_layer4";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_background_layer4")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = enable_background_layer4_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_background_layer3";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_foreground_layer1";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_foreground_layer1")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = enable_foreground_layer1_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_background_layer4";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_foreground_layer_1_5";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_foreground_layer_1_5")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = enable_foreground_layer_1_5_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_foreground_layer1";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_foreground_layer2";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_foreground_layer2")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = enable_foreground_layer2_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_foreground_layer_1_5";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_foreground_layer_secret";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_foreground_layer_secret")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = enable_foreground_layer_secret_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_foreground_layer2";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "background_brightness_gameplay";
				menu_delay = 3;
			}
		}
		#endregion /* Enable Backgrounds and Foregrounds END */
			
		else
			
		#region /* Navigate Background Brightness in Gameplay */
		if (menu == "background_brightness_gameplay")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = background_brightness_gameplay_y;
			if (global.background_brightness_gameplay < - 1)
			{
				global.background_brightness_gameplay = -1;
			}
			if (global.background_brightness_gameplay > +1)
			{
				global.background_brightness_gameplay = +1;
			}
			if (key_left)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (global.background_brightness_gameplay > - 1)
			{
				global.background_brightness_gameplay -= 0.1;
				menu_delay = 3;
			}
			else
			if (key_right)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (global.background_brightness_gameplay < + 1)
			{
				global.background_brightness_gameplay += 0.1;
				menu_delay = 3;
			}
			else
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "enable_foreground_layer_secret";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
					menu = "background_brightness_menu";
					menu_delay = 3;
			}
		}
		#endregion /* Navigate Background Brightness in Gameplay END */
			
		else
			
		#region /* Navigate Background Brightness in Menus */
		if (menu == "background_brightness_menu")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = background_brightness_menu_y;
			if (global.background_brightness_menu < - 1)
			{
				global.background_brightness_menu = -1;
			}
			if (global.background_brightness_menu > +1)
			{
				global.background_brightness_menu = +1;
			}
			if (key_left)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (global.background_brightness_menu >- 1)
			{
				global.background_brightness_menu-= 0.1;
				menu_delay = 3;
			}
			else
			if (key_right)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (global.background_brightness_menu<+ 1)
			{
				global.background_brightness_menu+= 0.1;
				menu_delay = 3;
			}
			else
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "background_brightness_gameplay";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "reset_level_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
		}
		#endregion /* Navigate Background Brightness in Menus END */
			
		else
			
		#region /* Reset level zoom when going back to map */
		if (menu == "reset_level_zoom_when_going_back_to_map")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = reset_level_zoom_when_going_back_to_map_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "background_brightness_menu";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "reset_world_map_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
		}
		#endregion /* Reset level zoom when going back to map END */
			
		else
			
		#region /* Reset world map zoom when going back to map */
		if (menu == "reset_world_map_zoom_when_going_back_to_map")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = reset_world_map_zoom_when_going_back_to_map_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "reset_level_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "gui_scale_modifier";
				menu_delay = 3;
			}
		}
		#endregion /* Reset world map zoom when going back to map END */
			
		else
			
		#region /* GUI Scale Modifier */
		if (menu == "gui_scale_modifier")
		{
			menu_cursor_y_position = gui_scale_modifier_y + 100;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown == false)
			{
				menu = "reset_world_map_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown == false)
			{
				menu = "customize_button_design";
				menu_delay = 3;
			}
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.gui_scale_modifier > 0)
			{
				global.gui_scale_modifier --;
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.gui_scale_modifier < 6)
			{
				global.gui_scale_modifier ++;
				menu_delay = 3;
			}
		}
		#endregion /* GUI Scale Modifyer END */
		
		if (menu == "customize_button_design")
		&& (open_dropdown == false)
		{
			menu_cursor_y_position = customize_button_design_y;
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "gui_scale_modifier";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (os_type != os_ios)
				&& (os_type != os_android)
				&& (global.enable_options_for_pc)
				{
					menu = "fullscreen_mode";
					menu_delay = 3;
				}
				else
				{
					menu = "interpolate";
					menu_delay = 3;
				}
			}
		}
		
		#endregion /* Navigate END */
		
		#region /* Accept */
		if (key_a_pressed)
		|| (mouse_check_button_released(mb_left))
		&& (mouse_get_x > 370)
		{
			if (menu == "fullscreen_mode") && (menu_delay == 0 && menu_joystick_delay == 0){if (window_get_fullscreen()){window_set_fullscreen(false);}else{window_set_fullscreen(true);}
			menu_delay = 3;
			}
			if (menu == "interpolate") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.interpolate){global.interpolate = false;gpu_set_texfilter(false);}else{global.interpolate = true;gpu_set_texfilter(true);}
			menu_delay = 3;
			}
			if (menu == "show_fps") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.show_fps){global.show_fps = false;}else{global.show_fps = true;}
			menu_delay = 3;
			}
			if (menu == "show_fps_real") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.show_fps_real){global.show_fps_real = false;}else{global.show_fps_real = true;}
			menu_delay = 3;
			}
			if (menu == "show_instance_count") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.show_instance_count){global.show_instance_count = false;}else{global.show_instance_count = true;}
			menu_delay = 3;
			}
			if (menu == "show_collision_mask") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.show_collision_mask){global.show_collision_mask = false;}else{global.show_collision_mask = true;}
			menu_delay = 3;
			}
			if (menu == "enable_transitions") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.enable_transitions){global.enable_transitions = false;}else{global.enable_transitions = true;}
			menu_delay = 3;
			}
			if (menu == "enable_background_layer1") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.enable_background_layer1){global.enable_background_layer1 = false;}else{global.enable_background_layer1 = true;}
			menu_delay = 3;
			}
			if (menu == "enable_background_layer2") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.enable_background_layer2){global.enable_background_layer2 = false;}else{global.enable_background_layer2 = true;}
			menu_delay = 3;
			}
			if (menu == "enable_background_layer3") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.enable_background_layer3){global.enable_background_layer3 = false;}else{global.enable_background_layer3 = true;}
			menu_delay = 3;
			}
			if (menu == "enable_background_layer4") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.enable_background_layer4){global.enable_background_layer4 = false;}else{global.enable_background_layer4 = true;}
			menu_delay = 3;
			}
			if (menu == "enable_foreground_layer1") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.enable_foreground_layer1){global.enable_foreground_layer1 = false;}else{global.enable_foreground_layer1 = true;}
			menu_delay = 3;
			}
			if (menu == "enable_foreground_layer_1_5") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.enable_foreground_layer_1_5){global.enable_foreground_layer_1_5 = false;}else{global.enable_foreground_layer_1_5 = true;}
			menu_delay = 3;
			}
			if (menu == "enable_foreground_layer2") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.enable_foreground_layer2){global.enable_foreground_layer2 = false;}else{global.enable_foreground_layer2 = true;}
			menu_delay = 3;
			}
			if (menu == "enable_foreground_layer_secret") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.enable_foreground_layer_secret){global.enable_foreground_layer_secret = false;}else{global.enable_foreground_layer_secret = true;}
			menu_delay = 3;
			}
			if (menu == "reset_level_zoom_when_going_back_to_map") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.reset_level_zoom_when_going_back_to_map){global.reset_level_zoom_when_going_back_to_map = false;}else{global.reset_level_zoom_when_going_back_to_map = true;}
			menu_delay = 3;
			}
			if (menu == "reset_world_map_zoom_when_going_back_to_map") && (menu_delay == 0 && menu_joystick_delay == 0){if (global.reset_world_map_zoom_when_going_back_to_map){global.reset_world_map_zoom_when_going_back_to_map = false;}else{global.reset_world_map_zoom_when_going_back_to_map = true;}
			menu_delay = 3;
			}
			if (menu == "gui_scale_modifier")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown == false)
			{
				open_dropdown = true;
				menu_delay = 3;
			}
			if (menu == "customize_button_design")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown == false)
			{
				menu = "customize_button_design_color";
				menu_delay = 3;
			}
		}
		#endregion /* Accept END */
		
	}
	else
	if (global.settings_sidebar_menu == "video_settings")
	{
		draw_menu_button(450, 48, l10n_text("Back"), "customize_button_design_color_back", "customize_button_design");
		draw_menu_dropdown(420, 68 * 4, l10n_text("Transparency"), "customize_button_design_transparency", global.button_design_transparency, l10n_text("Opaque"), l10n_text("See Through"), l10n_text("Outlines Only"), l10n_text("Invisible"));
		draw_menu_dropdown(420, 68 * 3, l10n_text("Shape"), "customize_button_design_shape", global.button_design_shape, l10n_text("Rectangle"), l10n_text("Round"));
		draw_menu_dropdown(420, 68 * 2, l10n_text("Color"), "customize_button_design_color", global.button_design_color, l10n_text("Gray"), l10n_text("Black"), l10n_text("Pink"), l10n_text("Blue"));
		
		if (menu == "customize_button_design_color_back")
		&& (key_b_pressed)
		&& (open_dropdown == false)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = "customize_button_design";
		}
		
		if (menu == "customize_button_design_color_back")
		&& (open_dropdown == false)
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "customize_button_design_transparency";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "customize_button_design_color";
				menu_delay = 3;
			}
		}
		else
		if (menu == "customize_button_design_color")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown == false)
			{
				menu = "customize_button_design_color_back";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown == false)
			{
				menu = "customize_button_design_shape";
				menu_delay = 3;
			}
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.button_design_color > 0)
			{
				global.button_design_color --;
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.button_design_color < 3)
			{
				global.button_design_color ++;
				menu_delay = 3;
			}
		}
		else
		if (menu == "customize_button_design_shape")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown == false)
			{
				menu = "customize_button_design_color";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown == false)
			{
				menu = "customize_button_design_transparency";
				menu_delay = 3;
			}
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.button_design_shape > 0)
			{
				global.button_design_shape --;
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.button_design_shape < 1)
			{
				global.button_design_shape ++;
				menu_delay = 3;
			}
		}
		else
		if (menu == "customize_button_design_transparency")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown == false)
			{
				menu = "customize_button_design_shape";
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown == false)
			{
				menu = "customize_button_design_color_back";
				menu_delay = 3;
			}
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.button_design_transparency > 0)
			{
				global.button_design_transparency --;
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (global.button_design_transparency < 3)
			{
				global.button_design_transparency ++;
				menu_delay = 3;
			}
		}
		
		/* button_design_color, 0 = gray, 1 = black, 2 = pink, 3 = blue */
		/* button_design_shape, 0 = rectangle, 1 = round, */
		/* button_design_transparency, 0 = Opaque, 1 = See Through, 2 = Outlines Only, 3 = Invisible */
		var color_gray = 0;
		var color_black = 1;
		var color_pink = 2;
		var color_blue = 3;
		
		var shape_rectangle = 0;
		var shape_round = 1;
		
		var transp_opaque = 0;
		var transp_see_trough = 1;
		var transp_outlines_only = 2;
		var transp_invisible = 3;
		
		if (global.button_design_color == color_gray) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_opaque){global.menu_button_subimg = 0;}else
		if (global.button_design_color == color_gray) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_see_trough){global.menu_button_subimg = 1;}else
		if (global.button_design_color == color_gray) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_outlines_only){global.menu_button_subimg = 2;}else
		
		if (global.button_design_color == color_black) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_opaque){global.menu_button_subimg = 3;}else
		if (global.button_design_color == color_black) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_see_trough){global.menu_button_subimg = 4;}else
		if (global.button_design_color == color_black) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_outlines_only){global.menu_button_subimg = 5;}else
		
		if (global.button_design_color == color_gray) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_opaque){global.menu_button_subimg = 6;}else
		if (global.button_design_color == color_gray) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_see_trough){global.menu_button_subimg = 7;}else
		if (global.button_design_color == color_gray) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_outlines_only){global.menu_button_subimg = 8;}else
		
		if (global.button_design_color == color_black) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_opaque){global.menu_button_subimg = 9;}else
		if (global.button_design_color == color_black) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_see_trough){global.menu_button_subimg = 10;}else
		if (global.button_design_color == color_black) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_outlines_only){global.menu_button_subimg = 11;}else
		
		
		
		
		if (global.button_design_color == color_pink) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_opaque){global.menu_button_subimg = 12;}else
		if (global.button_design_color == color_pink) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_see_trough){global.menu_button_subimg = 13;}else
		if (global.button_design_color == color_pink) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_outlines_only){global.menu_button_subimg = 2;}else
		
		if (global.button_design_color == color_blue) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_opaque){global.menu_button_subimg = 14;}else
		if (global.button_design_color == color_blue) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_see_trough){global.menu_button_subimg = 15;}else
		if (global.button_design_color == color_blue) && (global.button_design_shape == shape_rectangle) && (global.button_design_transparency == transp_outlines_only){global.menu_button_subimg = 5;}else
		
		if (global.button_design_color == color_pink) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_opaque){global.menu_button_subimg = 16;}else
		if (global.button_design_color == color_pink) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_see_trough){global.menu_button_subimg = 17;}else
		if (global.button_design_color == color_pink) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_outlines_only){global.menu_button_subimg = 8;}else
		
		if (global.button_design_color == color_blue) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_opaque){global.menu_button_subimg = 18;}else
		if (global.button_design_color == color_blue) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_see_trough){global.menu_button_subimg = 19;}else
		if (global.button_design_color == color_blue) && (global.button_design_shape == shape_round) && (global.button_design_transparency == transp_outlines_only){global.menu_button_subimg = 11;}else
		
		/* If button design transparency is set to invisible, then always set menu button subimg to this value */ if (global.button_design_transparency == transp_invisible){global.menu_button_subimg = 20;}
		
	}
}