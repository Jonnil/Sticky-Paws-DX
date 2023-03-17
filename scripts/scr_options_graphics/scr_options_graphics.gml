function scr_options_graphics()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	
	if (global.settings_sidebar_menu == "video_settings")
	{
		if (global.enable_options_for_pc == true)
		{
			var fullscreen_mode_y = 48;
			var interpolate_y = fullscreen_mode_y + 48;
		}
		else
		{
			var fullscreen_mode_y = -999;
			var interpolate_y = 48;
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
		var enable_foreground_layer_above_static_objects_y = enable_foreground_layer1_y + 48;
		var enable_foreground_layer2_y = enable_foreground_layer_above_static_objects_y + 48;
		var enable_foreground_layer_secret_y = enable_foreground_layer2_y + 48;
		var background_brightness_gameplay_y = enable_foreground_layer_secret_y + 48 * 2;
		var background_brightness_menu_y = background_brightness_gameplay_y + 68;
		var reset_level_zoom_when_going_back_to_map_y = background_brightness_menu_y + 48;
		var reset_world_map_zoom_when_going_back_to_map_y = reset_level_zoom_when_going_back_to_map_y + 48;
		var gui_scale_modifier_y = reset_world_map_zoom_when_going_back_to_map_y + 48 + 10;
		
		#region /* Fullscreen toggle */
		if (os_type != os_ios)
		and (os_type != os_android)
		and (global.enable_options_for_pc == true)
		{
			if (window_get_fullscreen())
			{
				draw_menu_checkmark(386, fullscreen_mode_y + menu_y_offset, l10n_text("Windowed"), "fullscreen_mode", true);
				if (global.controls_used_for_menu_navigation != "controller")
				and (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.fullscreen_key, 386 + 57, fullscreen_mode_y + 16 + menu_y_offset, 0.5, 0.5, 0, c_white, 1);
				}
			}
			else
			{
				draw_menu_checkmark(386, fullscreen_mode_y + menu_y_offset, l10n_text("Fullscreen"), "fullscreen_mode", false);
				if (global.controls_used_for_menu_navigation != "controller")
				and (asset_get_type("spr_keyboard_keys") == asset_sprite)
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
		
		draw_menu_checkmark(386, enable_foreground_layer_above_static_objects_y + menu_y_offset, l10n_text("Enable Foreground Layer Above Static Objects"), "enable_foreground_layer_above_static_objects", global.enable_foreground_layer_above_static_objects);
		
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
		
		draw_menu_dropdown(420, gui_scale_modifier_y + menu_y_offset, l10n_text("GUI Scale Modifier"), "gui_scale_modifier", global.gui_scale_modifier, l10n_text("Automatic"), "1920 x 1080", "1600 x 900", "1366 x 768", "1280 x 720", "1024 x 576", "864 x 480");
		
		#region /* Navigate */
			
		#region /* Navigate Fullscreen Mode */
		if (menu == "fullscreen_mode")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = fullscreen_mode_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "gui_scale_modifier";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "interpolate";
				menu_delay = 3;
			}
		}
		#endregion /* Navigate Fullscreen Mode END */
		
		else
		
		#region /* Navigate Interpolate */
		if (menu == "interpolate")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = interpolate_y;
			if (key_up)
			and (menu_delay == 0)
			{
				if (os_type != os_ios)
				and (os_type != os_android)
				{
					if (global.enable_options_for_pc == true)
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
			and (menu_delay == 0)
			{
				menu = "show_fps";
				menu_delay = 3;
			}
		}
		#endregion /* Navigate Interpolate END */
			
		else
			
		#region /* Show fps */
		if (menu == "show_fps")
		and (open_dropdown == false)
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
		and (open_dropdown == false)
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
		and (open_dropdown == false)
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
		and (open_dropdown == false)
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
		and (open_dropdown == false)
		{
			menu_cursor_y_position = enable_transitions_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "show_collision_mask";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "enable_background_layer1";
				menu_delay = 3;
			}
		}
		#endregion /* Navigate Enable Transitions END */
			
		else
			
		#region /* Enable Backgrounds and Foregrounds */
		if (menu == "enable_background_layer1")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = enable_background_layer1_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "enable_transitions";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "enable_background_layer2";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_background_layer2")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = enable_background_layer2_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "enable_background_layer1";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "enable_background_layer3";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_background_layer3")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = enable_background_layer3_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "enable_background_layer2";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "enable_background_layer4";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_background_layer4")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = enable_background_layer4_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "enable_background_layer3";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "enable_foreground_layer1";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_foreground_layer1")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = enable_foreground_layer1_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "enable_background_layer4";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "enable_foreground_layer_above_static_objects";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_foreground_layer_above_static_objects")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = enable_foreground_layer_above_static_objects_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "enable_foreground_layer1";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "enable_foreground_layer2";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_foreground_layer2")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = enable_foreground_layer2_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "enable_foreground_layer_above_static_objects";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "enable_foreground_layer_secret";
				menu_delay = 3;
			}
		}
		else
		if (menu == "enable_foreground_layer_secret")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = enable_foreground_layer_secret_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "enable_foreground_layer2";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "background_brightness_gameplay";
				menu_delay = 3;
			}
		}
		#endregion /* Enable Backgrounds and Foregrounds END */
			
		else
			
		#region /* Navigate Background Brightness in Gameplay */
		if (menu == "background_brightness_gameplay")
		and (open_dropdown == false)
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
			and (menu_delay == 0)
			and (global.background_brightness_gameplay > - 1)
			{
				global.background_brightness_gameplay -= 0.1;
				menu_delay = 3;
			}
			else
			if (key_right)
			and (menu_delay == 0)
			and (global.background_brightness_gameplay < + 1)
			{
				global.background_brightness_gameplay += 0.1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "enable_foreground_layer_secret";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
					menu = "background_brightness_menu";
					menu_delay = 3;
			}
		}
		#endregion /* Navigate Background Brightness in Gameplay END */
			
		else
			
		#region /* Navigate Background Brightness in Menus */
		if (menu == "background_brightness_menu")
		and (open_dropdown == false)
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
			and (menu_delay == 0)
			and (global.background_brightness_menu >- 1)
			{
				global.background_brightness_menu-= 0.1;
				menu_delay = 3;
			}
			else
			if (key_right)
			and (menu_delay == 0)
			and (global.background_brightness_menu<+ 1)
			{
				global.background_brightness_menu+= 0.1;
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "background_brightness_gameplay";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "reset_level_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
		}
		#endregion /* Navigate Background Brightness in Menus END */
			
		else
			
		#region /* Reset level zoom when going back to map */
		if (menu == "reset_level_zoom_when_going_back_to_map")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = reset_level_zoom_when_going_back_to_map_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "background_brightness_menu";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			{
				menu = "reset_world_map_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
		}
		#endregion /* Reset level zoom when going back to map END */
			
		else
			
		#region /* Reset world map zoom when going back to map */
		if (menu == "reset_world_map_zoom_when_going_back_to_map")
		and (open_dropdown == false)
		{
			menu_cursor_y_position = reset_world_map_zoom_when_going_back_to_map_y;
			if (key_up)
			and (menu_delay == 0)
			{
				menu = "reset_level_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
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
			and (menu_delay == 0)
			and (open_dropdown == false)
			{
				menu = "reset_world_map_zoom_when_going_back_to_map";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			and (open_dropdown == false)
			{
				if (os_type != os_ios)
				and (os_type != os_android)
				and (global.enable_options_for_pc == true)
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
			if (key_up)
			and (menu_delay == 0)
			and (open_dropdown == true)
			and (global.gui_scale_modifier > 0)
			{
				global.gui_scale_modifier -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 0)
			and (open_dropdown == true)
			and (global.gui_scale_modifier < 10)
			{
				global.gui_scale_modifier += 1;
				menu_delay = 3;
			}
		}
		#endregion /* Reset world map zoom when going back to map END */
		
		#endregion /* Navigate END */
		
		#region /* Accept */
		if (key_a_pressed)
		or (mouse_check_button_released(mb_left))
		and (mouse_get_x > 370)
		{
			if (menu == "fullscreen_mode") and (menu_delay == 0){if (window_get_fullscreen()){window_set_fullscreen(false);}else{window_set_fullscreen(true);}menu_delay = 3;}
			if (menu == "interpolate") and (menu_delay == 0){if (global.interpolate == true){global.interpolate = false;gpu_set_texfilter(false);}else{global.interpolate = true;gpu_set_texfilter(true);}menu_delay = 3;}
			if (menu == "show_fps") and (menu_delay == 0){if (global.show_fps == true){global.show_fps = false;}else{global.show_fps = true;}menu_delay = 3;}
			if (menu == "show_fps_real") and (menu_delay == 0){if (global.show_fps_real == true){global.show_fps_real = false;}else{global.show_fps_real = true;}menu_delay = 3;}
			if (menu == "show_instance_count") and (menu_delay == 0){if (global.show_instance_count == true){global.show_instance_count = false;}else{global.show_instance_count = true;}menu_delay = 3;}
			if (menu == "show_collision_mask") and (menu_delay == 0){if (global.show_collision_mask == true){global.show_collision_mask = false;}else{global.show_collision_mask = true;}menu_delay = 3;}
			if (menu == "enable_transitions") and (menu_delay == 0){if (global.enable_transitions == true){global.enable_transitions = false;}else{global.enable_transitions = true;}menu_delay = 3;}
			if (menu == "enable_background_layer1") and (menu_delay == 0){if (global.enable_background_layer1 == true){global.enable_background_layer1 = false;}else{global.enable_background_layer1 = true;}menu_delay = 3;}
			if (menu == "enable_background_layer2") and (menu_delay == 0){if (global.enable_background_layer2 == true){global.enable_background_layer2 = false;}else{global.enable_background_layer2 = true;}menu_delay = 3;}
			if (menu == "enable_background_layer3") and (menu_delay == 0){if (global.enable_background_layer3 == true){global.enable_background_layer3 = false;}else{global.enable_background_layer3 = true;}menu_delay = 3;}
			if (menu == "enable_background_layer4") and (menu_delay == 0){if (global.enable_background_layer4 == true){global.enable_background_layer4 = false;}else{global.enable_background_layer4 = true;}menu_delay = 3;}
			if (menu == "enable_foreground_layer1") and (menu_delay == 0){if (global.enable_foreground_layer1 == true){global.enable_foreground_layer1 = false;}else{global.enable_foreground_layer1 = true;}menu_delay = 3;}
			if (menu == "enable_foreground_layer_above_static_objects") and (menu_delay == 0){if (global.enable_foreground_layer_above_static_objects == true){global.enable_foreground_layer_above_static_objects = false;}else{global.enable_foreground_layer_above_static_objects = true;}menu_delay = 3;}
			if (menu == "enable_foreground_layer2") and (menu_delay == 0){if (global.enable_foreground_layer2 == true){global.enable_foreground_layer2 = false;}else{global.enable_foreground_layer2 = true;}menu_delay = 3;}
			if (menu == "enable_foreground_layer_secret") and (menu_delay == 0){if (global.enable_foreground_layer_secret == true){global.enable_foreground_layer_secret = false;}else{global.enable_foreground_layer_secret = true;}menu_delay = 3;}
			if (menu == "reset_level_zoom_when_going_back_to_map") and (menu_delay == 0){if (global.reset_level_zoom_when_going_back_to_map == true){global.reset_level_zoom_when_going_back_to_map = false;}else{global.reset_level_zoom_when_going_back_to_map = true;}menu_delay = 3;}
			if (menu == "reset_world_map_zoom_when_going_back_to_map") and (menu_delay == 0){if (global.reset_world_map_zoom_when_going_back_to_map == true){global.reset_world_map_zoom_when_going_back_to_map = false;}else{global.reset_world_map_zoom_when_going_back_to_map = true;}menu_delay = 3;}
			if (menu == "gui_scale_modifier")
			and (menu_delay == 0)
			and (open_dropdown == false)
			{
				open_dropdown = true;
				menu_delay = 3;
			}
		}
		#endregion /* Accept END */
		
	}
}