function scr_player_move_pause()
{
	
	#region /* Set correct controller ports */
	if (player == 1)
	{
		var player_gamepad_slot = global.player1_slot;
	}
	else
	if (player == 2)
	{
		var player_gamepad_slot = global.player2_slot;
	}
	else
	if (player == 3)
	{
		var player_gamepad_slot = global.player3_slot;
	}
	else
	if (player == 4)
	{
		var player_gamepad_slot = global.player4_slot;
	}
	#endregion /* Set correct controller ports END */
	
	#region /* Pause */	
	if (keyboard_check_pressed(vk_escape))
	or (keyboard_check(vk_tab))
	and (keyboard_check(vk_lshift))
	or (gamepad_button_check_pressed(player_gamepad_slot, gp_start))
	or (gamepad_button_check_pressed(player_gamepad_slot, gp_select))
	or (!gamepad_is_connected(player_gamepad_slot))
	and (controller_connected == true)
	or (global.actually_play_edited_level == true)
	and (!window_has_focus())
	and (global.automatically_pause_when_window_is_unfocused == true)
	{
		
		#region /* Show all HUD elements */
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_lives_timer = global.hud_hide_time * 60;
			}
		}
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_deaths_timer = global.hud_hide_time * 60;
			}
		}
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
			}
		}
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_big_collectibles_timer = global.hud_hide_time * 60;
			}
		}
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
		#endregion /* Show all HUD elements END */
		
		controller_connected = false;
		if (global.play_edited_level == true)
		and (global.actually_play_edited_level == false)
		and (global.character_select_in_this_menu == "level_editor")
		{
			global.play_edited_level = false;
			global.actually_play_edited_level = false;
			score = 0;
			
			#region /* Save Level Information when in level editor */
			if (global.select_level_index >= 1)
			and (global.create_level_from_template == false)
			and (global.character_select_in_this_menu == "level_editor")
			{
				ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
				ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
				ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
				ini_close();
			}
			else
			if (global.character_select_in_this_menu == "level_editor")
			and (global.level_name != "")
			{
				ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
				ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
				ini_close();
			}
			#endregion /* Save Level Information when in level editor END */
			
			room_restart();
		}
		else
		{
			
			#region /* What player should control the pause menu */
			if (gamepad_button_check_pressed(player_gamepad_slot, gp_start))
			or (gamepad_button_check_pressed(player_gamepad_slot, gp_select))
			{
				global.pause_player = player - 1;
			}
			else
			if (global.player1_can_play == true)
			{
				global.pause_player = 0;
			}
			else
			if (global.player2_can_play == true)
			{
				global.pause_player = 1;
			}
			else
			if (global.player3_can_play == true)
			{
				global.pause_player = 2;
			}
			else
			if (global.player4_can_play == true)
			{
				global.pause_player = 3;
			}
			#endregion /* What player should control the pause menu END */
			
			if (asset_get_type("room_pause") == asset_room)
			{
				global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0);
				room_persistent = true;
				global.pause_room = room;
				audio_pause_all();
				global.pause = true;
				room_goto(room_pause);
			}
			else
			{
				audio_pause_all();
				if (asset_get_type("obj_pause") == asset_object)
				and (!instance_exists(obj_pause))
				{
					global.pause = true;
					pause_hspeed = hspeed;
					pause_vspeed = vspeed;
					instance_create_depth(x, y, 0, obj_pause); /* This pause objects creates, that handles the pause screen */
				}
			}
		}
	}
	else
	{
		room_persistent = false;
	}
	#endregion /* Pause END */
	
}