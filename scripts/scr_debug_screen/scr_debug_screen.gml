function scr_debug_screen()
{
	scr_crash_error_handling(); /* Crash Error Handling should run in every room of the game */
	
	#region /* FPS */
	if (global.show_fps || global.debug_screen)
	{
		var fps_y = 64;
		
		if (global.show_fps && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, fps_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		if (fps >= global.max_fps)
		{
			var fps_color = c_lime;
		}
		else
		{
			var fps_color = make_color_hsv(50 / global.max_fps * fps, 255, 255);
		}
		scr_draw_text_outlined(32, fps_y, "FPS: " + string(fps) + "/" + string(global.max_fps),,, fps_color);
		
		var fps_real_target = (os_type == os_switch) ? 60 : 600;
		if (fps_real >= fps_real_target)
		{
			var fps_real_color = c_lime;
		}
		else
		{
			var fps_real_color = make_color_hsv(50 / fps_real_target * fps_real, 255, 255);
		}
		scr_draw_text_outlined(200, fps_y, "FPS Real: " + string(fps_real),,, fps_real_color);
	}
	#endregion /* FPS END */
	
	#region /* Instance Count */
	if (global.show_instance_count || global.debug_screen)
	{
		var instance_count_y = 96;
		var all_instance_count_y = 128;
		if (global.show_instance_count && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, instance_count_y, 1, 1, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(32, instance_count_y, "Instance Count: " + string(instance_count), global.default_text_size, c_black, c_white, 1);
	}
	#endregion /* Instance Count END */
	
	#region /* All Instance Count */
	if (global.show_all_instance_count)
	{
		if (global.show_all_instance_count && global.debug_screen)
		{
			draw_sprite_ext(spr_lock_icon, 0, 16, all_instance_count_y, 1, 1, 0, c_white, 1);
		}
		
		#region /* Show what objects are currently in the room */
		for(var i = 0; i < 100; ++i;)
		{
			if (instance_number(i) >= 1)
			{
				var all_instance_count_color = make_color_hsv(instance_number(i), 255, 255)
				scr_draw_text_outlined(32, all_instance_count_y + (8 * i), string(object_get_name(i)) + ": " + string(instance_number(i)),,, all_instance_count_color);
			}
		}
		#endregion /* Show what objects are currently in the room END */
		
	}
	#endregion /* All Instance Count END */
	
	#region /* Controller ports */
	global.playergame = 0;
	for(var i = 1; i <= global.max_players; i += 1) /* playergame needs to match how many of the player_can_play are set to true */
	{
		if (global.player_can_play[i])
		{
			global.playergame += 1;
		}
	}
	
	if (os_type == os_switch)
	{
		/* If gamepad 0 is "Handheld", then gamepad 1 is also player 1, and gamepad 2 is player 2 and so on */
		if (gamepad_get_description(0) == "Handheld")
		{
			global.player_slot[0] = 1; /* Gamepad 0 is always player 1 */
			
			#region /* Check which gamepad is active and assign it to player 1 */
			if (global.player_slot[1] != 0)
			{
				if (gamepad_button_check(0, gp_face1)) /* If pressing gamepad buttons, then set "gamepad" as the navigation method. Assign gamepad 0 to player 1 */
				|| (gamepad_button_check(0, gp_face2))
				|| (gamepad_button_check(0, gp_face3))
				|| (gamepad_button_check(0, gp_face4))
				|| (gamepad_button_check(0, gp_padd))
				|| (gamepad_button_check(0, gp_padl))
				|| (gamepad_button_check(0, gp_padr))
				|| (gamepad_button_check(0, gp_padu))
				|| (gamepad_button_check(0, gp_select))
				|| (gamepad_button_check(0, gp_shoulderl))
				|| (gamepad_button_check(0, gp_shoulderlb))
				|| (gamepad_button_check(0, gp_shoulderr))
				|| (gamepad_button_check(0, gp_shoulderrb))
				|| (gamepad_button_check(0, gp_start))
				|| (gamepad_button_check(0, gp_stickl))
				|| (gamepad_button_check(0, gp_stickr))
				|| (gamepad_axis_value(0, gp_axislh) < -0.3)
				|| (gamepad_axis_value(0, gp_axislv) < -0.3)
				|| (gamepad_axis_value(0, gp_axisrh) < -0.3)
				|| (gamepad_axis_value(0, gp_axisrv) < -0.3)
				|| (gamepad_axis_value(0, gp_axislh) > +0.3)
				|| (gamepad_axis_value(0, gp_axislv) > +0.3)
				|| (gamepad_axis_value(0, gp_axisrh) > +0.3)
				|| (gamepad_axis_value(0, gp_axisrv) > +0.3)
				{
					global.player_slot[1] = 0; /* Assign gamepad 0 to player 1 */
				}
			}
			else
			if (global.player_slot[1] != 1)
			{
				if (gamepad_button_check(1, gp_face1)) /* If pressing gamepad buttons, then set "gamepad" as the navigation method. Assign gamepad 1 to player 1 */
				|| (gamepad_button_check(1, gp_face2))
				|| (gamepad_button_check(1, gp_face3))
				|| (gamepad_button_check(1, gp_face4))
				|| (gamepad_button_check(1, gp_padd))
				|| (gamepad_button_check(1, gp_padl))
				|| (gamepad_button_check(1, gp_padr))
				|| (gamepad_button_check(1, gp_padu))
				|| (gamepad_button_check(1, gp_select))
				|| (gamepad_button_check(1, gp_shoulderl))
				|| (gamepad_button_check(1, gp_shoulderlb))
				|| (gamepad_button_check(1, gp_shoulderr))
				|| (gamepad_button_check(1, gp_shoulderrb))
				|| (gamepad_button_check(1, gp_start))
				|| (gamepad_button_check(1, gp_stickl))
				|| (gamepad_button_check(1, gp_stickr))
				|| (gamepad_axis_value(1, gp_axislh) < -0.3)
				|| (gamepad_axis_value(1, gp_axislv) < -0.3)
				|| (gamepad_axis_value(1, gp_axisrh) < -0.3)
				|| (gamepad_axis_value(1, gp_axisrv) < -0.3)
				|| (gamepad_axis_value(1, gp_axislh) > +0.3)
				|| (gamepad_axis_value(1, gp_axislv) > +0.3)
				|| (gamepad_axis_value(1, gp_axisrh) > +0.3)
				|| (gamepad_axis_value(1, gp_axisrv) > +0.3)
				{
					global.player_slot[1] = 1; /* Assign gamepad 1 to player 1 */
				}
			}
			#endregion /* Check which gamepad is active and assign it to player 1 END */
			
		}
	}
	else
	
	#region /* Default Controller Ports */
	{
		for(var i = 1; i <= global.max_players; i += 1)
		{
			global.player_slot[i] = i - 1;
		}
	}
	#endregion /* Default Controller Ports END */
	
	#endregion /* Controller ports END */
	
	#region /* Detect when controllers are disconnected */
	for (var i = 0; i < gamepad_get_device_count(); i++)
	{
		var connected = gamepad_is_connected(i);
		
		if (!global.initial_gamepad_status[i] && connected)
		{
			show_debug_message("Gamepad " + string(i) + " connected!");
			global.initial_gamepad_status[i] = true; /* Update initial status */
			
			if (!gamepad_is_connected(0))
			|| (gamepad_get_description(0) == "Handheld") /* If gamepad 0 is "Handheld", then gamepad 1 is also player 1, and gamepad 2 is player 2 and so on */
			{
				for(var i = 1; i <= global.max_players; i += 1)
				{
					global.player_slot[i] = i;
				}
			}
			else
			{
				for(var i = 1; i <= global.max_players; i += 1)
				{
					global.player_slot[i] = i - 1;
				}
			}
		}
		else
		if (global.initial_gamepad_status[i] && !connected)
		{
			show_debug_message("Gamepad " + string(i) + " disconnected!");
			/* Handle the disconnection here, such as resetting controls or pausing the game */
			global.initial_gamepad_status[i] = false; /* Update initial status */
			if (os_type == os_switch)
			{
				switch_controller_support_show(); /* If controllers are disconnected, show the player the screen to connect controllers again */
			}
			var time_source = time_source_create(time_source_game, 2, time_source_units_frames, function()
			{
				set_controller_sprites_to_use();
			}
			, [], 1);
			time_source_start(time_source);
			
			if (!gamepad_is_connected(0))
			|| (gamepad_get_description(0) == "Handheld") /* If gamepad 0 is "Handheld", then gamepad 1 is also player 1, and gamepad 2 is player 2 and so on */
			{
				for(var i = 1; i <= global.max_players; i += 1)
				{
					global.player_slot[i] = i;
				}
			}
			else
			{
				for(var i = 1; i <= global.max_players; i += 1)
				{
					global.player_slot[i] = i - 1;
				}
			}
		}
	}
	#endregion /* Detect when controllers are disconnected END */
	
	if (global.debug_screen)
	{
		
		if (variable_instance_exists(self, "player_show_controls_alpha"))
		{
			for(var i = 1; i <= global.max_players; i += 1)
			{
				player_show_controls_alpha[i] = -10; /* Make the on-screen controls dissapear, as debug information is being displayed over these button graphics */
			}
		}
		
		if (keyboard_check_pressed(vk_f2))
		{
			scr_save_os_info_ini();
		}
		
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		var version_y = 32;
		var player_xy_y = 160;
		var display_y = 32
		var d3d11_y = 64;
		
		#region /* Click on FPS to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, fps_y - 15, 370, fps_y + 15) && global.controls_used_for_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_roundrect_color_ext(0, fps_y - 16, 370, fps_y + 16, 50, 50, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_fps = !global.show_fps;
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "show_fps", global.show_fps);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
		}
		#endregion /* Click on FPS to toggle if it should stay on screen even after you close debug screen END */
		
		#region /* Click on Instance Count to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, instance_count_y - 15, 370, instance_count_y + 15) && global.controls_used_for_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_roundrect_color_ext(0, instance_count_y - 16, 370, instance_count_y + 16, 50, 50, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_instance_count = !global.show_instance_count;
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "show_instance_count", global.show_instance_count);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
		}
		#endregion /* Click on Instance Count to toggle if it should stay on screen even after you close debug screen END */
		
		#region /* Click on All Instance Count to toggle if it should stay on screen even after you close debug screen */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, all_instance_count_y - 15, 370, all_instance_count_y + 15) && global.controls_used_for_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_roundrect_color_ext(0, all_instance_count_y - 16, 370, all_instance_count_y + 16, 50, 50, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_released(mb_left))
			{
				global.show_all_instance_count = !global.show_all_instance_count;
			}
		}
		#endregion /* Click on All Instance Count to toggle if it should stay on screen even after you close debug screen END */
		
		draw_set_valign(fa_middle);
		if (global.controls_used_for_navigation != "gamepad")
		{
			draw_set_halign(fa_center);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 8, "F3 to toggle debug screen", global.default_text_size * 0.6, c_black, c_white, 1);
		}
		draw_set_halign(fa_left);
		scr_draw_text_outlined(32, version_y, string(global.game_name) + " v" + scr_get_build_date(), global.default_text_size, c_black, c_white, 1); /* Display the game's name and build version */
		
		#region /* X, Y, and speed values of player */
		var get_player = noone;
		if (instance_exists(obj_camera))
		{
			for(var i = 1; i <= global.max_players; i += 1)
			{
				if (obj_camera.player[i] > 0)
				&& (instance_exists(obj_camera.player[i]))
				{
					var get_player = obj_camera.player[i];
					break;
				}
			}
		}
		else
		if (instance_exists(obj_player_map))
		{
			var get_player = obj_player_map;
		}
		if (get_player != noone)
		{
			/* Show x position */ scr_draw_text_outlined(32, player_xy_y, "X: " + string(get_player.x), global.default_text_size, c_black, c_white, 1);
			/* Show y position */ scr_draw_text_outlined(200, player_xy_y, "Y: " + string(get_player.y), global.default_text_size, c_black, c_white, 1);
			/* Show speed value */ scr_draw_text_outlined(400, player_xy_y, "Speed: " + string(get_player.speed), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* X, Y, and speed values of player END */
		
		#region /* Top-right corner info */
		draw_set_halign(fa_right);
		scr_draw_text_outlined(display_get_gui_width() - 32, display_y, "Display: " + string(window_get_width()) + "x" + string(window_get_height()), global.default_text_size, c_black, c_white, 1); /* Get the display dimensions */
		
		if (ds_exists(global.os_info, ds_type_map))
		{
			if (ds_map_exists(global.os_info, "video_adapter_description"))
			{
				if (global.os_info[? "video_adapter_description"] != undefined) /* Need to check that this isn't "undefined", otherwise it will display the word "undefined" on screen */
				{
					scr_draw_text_outlined(display_get_gui_width() - 32, d3d11_y, string(global.os_info[? "video_adapter_description"]), global.default_text_size, c_black, c_white, 1);
				}
			}
		}
		#endregion /* Top-right corner info END */
		
		/* Draw the name of the current room at the bottom middle of the screen */
		draw_set_halign(fa_center);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, "current room: " + "'" + string(global.level_name) + "'" + " " + string(global.select_level_index) + " " + string(room_get_name(room)) + " " + string(room_width) + "x" + string(room_height), global.default_text_size, c_black, c_white);
		
		
		
		
		
		
		
		
		
		
		#region /* More debug text */
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		var debug_text_y = 170;
		
		if (instance_exists(obj_camera))
		{
			
			for(var i = 1; i <= global.max_players; i += 1)
			{
				if (obj_camera.player[i] != noone)
				{
					scr_draw_text_outlined(32, debug_text_y, "player " + string(i) + ": " + string(obj_camera.player[i]), global.default_text_size, c_black, c_white);
					debug_text_y += 20;
				}
			}
		}
		scr_draw_text_outlined(32, debug_text_y, "player_can_play: " + string(global.player_can_play), global.default_text_size, c_black, c_white);
		debug_text_y += 20;
		scr_draw_text_outlined(32, debug_text_y, "player_slot: " + string(global.player_slot), global.default_text_size, c_black, c_white);
		debug_text_y += 20;
		
		/* Get Gamepad Description */
		if (gamepad_get_description(0) != "")
		{
			scr_draw_text_outlined(32, debug_text_y, "gamepad(0): " + string(gamepad_get_description(0)), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		if (gamepad_get_description(1) != "")
		{
			scr_draw_text_outlined(32, debug_text_y, "gamepad(1): " + string(gamepad_get_description(1)), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		if (gamepad_get_description(2) != "")
		{
			scr_draw_text_outlined(32, debug_text_y, "gamepad(2): " + string(gamepad_get_description(2)), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		if (gamepad_get_description(3) != "")
		{
			scr_draw_text_outlined(32, debug_text_y, "gamepad(3): " + string(gamepad_get_description(3)), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		if (gamepad_get_description(4) != "")
		{
			scr_draw_text_outlined(32, debug_text_y, "gamepad(4): " + string(gamepad_get_description(4)), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		
		debug_text_y += 20;
		
		if (variable_instance_exists(self, "menu"))
		{
			scr_draw_text_outlined(32, debug_text_y, "menu: " + string(menu), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		
		if (variable_instance_exists(self, "level_editor_menu"))
		{
			scr_draw_text_outlined(32, debug_text_y, "level_editor_menu: " + string(level_editor_menu), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		
		debug_text_y += 20;
		
		if (variable_instance_exists(self, "menu_y_offset"))
		{
			scr_draw_text_outlined(32, debug_text_y, "menu_y_offset: " + string(menu_y_offset), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		if (variable_instance_exists(self, "menu_y_offset_real"))
		{
			scr_draw_text_outlined(32, debug_text_y, "menu_y_offset_real: " + string(menu_y_offset_real), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		if (variable_instance_exists(self, "menu_cursor_y_position"))
		{
			scr_draw_text_outlined(32, debug_text_y, "menu_cursor_y_position: " + string(menu_cursor_y_position), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		
		debug_text_y += 20;
		
		if (variable_instance_exists(self, "player_menu"))
		{
			scr_draw_text_outlined(32, debug_text_y, "player_menu[1]: " + string(player_menu[1]), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		if (variable_instance_exists(self, "menu_delay"))
		{
			if (menu_delay == 0)
			{
				scr_draw_text_outlined(32, debug_text_y, "menu_delay: " + string(menu_delay), global.default_text_size, c_black, c_white);
			}
			else
			{
				scr_draw_text_outlined(32, debug_text_y, "menu_delay: " + string(menu_delay), global.default_text_size, c_black, c_red);
			}
			debug_text_y += 20;
		}
		if (variable_instance_exists(self, "menu_joystick_delay") && gamepad_is_connected(0))
		{
			if (menu_joystick_delay == 0)
			{
				scr_draw_text_outlined(32, debug_text_y, "menu_joystick_delay: " + string(menu_joystick_delay), global.default_text_size, c_black, c_white);
			}
			else
			{
				scr_draw_text_outlined(32, debug_text_y, "menu_joystick_delay: " + string(menu_joystick_delay), global.default_text_size, c_black, c_red);
			}
			debug_text_y += 20;
		}
		if (global.menu_navigation_speed == 0)
		{
			scr_draw_text_outlined(32, debug_text_y, "menu_navigation_speed: " + string(global.menu_navigation_speed), global.default_text_size, c_black, c_white);
		}
		else
		{
			scr_draw_text_outlined(32, debug_text_y, "menu_navigation_speed: " + string(global.menu_navigation_speed), global.default_text_size, c_black, c_red);
		}
		debug_text_y += 20;
		
		if (variable_instance_exists(self, "in_character_select_menu"))
		{
			scr_draw_text_outlined(32, debug_text_y, "in_character_select_menu: " + string(in_character_select_menu), global.default_text_size, c_black, c_white);
			debug_text_y += 20;
		}
		#endregion /* More debug text END */
		
	}
}