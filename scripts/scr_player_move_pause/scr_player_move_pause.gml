function scr_player_move_pause()
{
	var pause_from_unfocus = global.automatically_pause_when_window_is_unfocused && !window_has_focus();
	var pause_condition =
		(controller_connected && (!gamepad_is_connected(global.player_slot[player]) || gamepad_button_check_pressed(global.player_slot[player], gp_start))) ||
		pause_from_unfocus ||
		(keyboard_check_pressed(vk_escape)) ||
		(keyboard_check(vk_tab) && keyboard_check(vk_lshift)) ||
		(global.controls_used_for_navigation == "mouse" && mouse_check_button_released(mb_left) && point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() - 185, 0, display_get_gui_width(), 42)); /* Pause button appears in top right corner of screen when using mouse */

	if (pause_condition)
	{

		/* Show HUD elements */
		obj_camera.hud_show_lives_timer = global.hud_hide_time * 60;
		obj_camera.hud_show_defeats_timer = global.hud_hide_time * 60;
		obj_camera.hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
		obj_camera.hud_show_big_collectibles_timer = global.hud_hide_time * 60;
		obj_camera.hud_show_key_fragment_timer = global.hud_hide_time * 60;
		obj_camera.hud_show_score_timer = global.hud_hide_time * 60;

		controller_connected = false;

		if (global.character_select_in_this_menu == "level_editor"
		&& !global.actually_play_edited_level
		&& global.play_edited_level)
		{
			/* Handle level editor pause logic */
			obj_camera.pause_playtest = true;
			obj_camera.black_screen_gui_alpha = 1;
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			global.level_score = 0;

			#region /* Save Level Information when in level editor */
			if (global.level_name != ""
			&& !global.actually_play_edited_level)
			{
				ini_open(game_save_id + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini");
				ini_write_real("info", "view_xview", camera_get_view_x(view_get_camera(view_current)));
				ini_write_real("info", "view_yview", camera_get_view_y(view_get_camera(view_current)));
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
			#endregion /* Save Level Information when in level editor END */

			room_restart();
		}
		else
		{
			/* Handle normal pause logic */
			global.pause = true;

			#region /* What player should control the pause menu */
			if (controller_connected)
			&& (gamepad_button_check_pressed(global.player_slot[player], gp_start))
			{
				global.pause_player = player - 1;
			}
			else
			{
				for(var i = 1; i <= global.max_players; i += 1)
				{
					if (global.player_can_play[i])
					{
						global.pause_player = i - 1;
						break; /* exit the loop if a player can play */
					}
				}
			}
			#endregion /* What player should control the pause menu END */

			scr_delete_sprite_properly(global.pause_screenshot);
			global.pause_screenshot = noone;

			if (!pause_from_unfocus && surface_exists(application_surface))
			{
				var pause_width = surface_get_width(application_surface);
				var pause_height = surface_get_height(application_surface);

				if (pause_width > 0 && pause_height > 0)
				{
					global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, pause_width, pause_height, 0, 0, 0, 0);
				}
			}

			room_persistent = true; /* Turn ON Room Persistency */
			global.pause_room = room;
			audio_pause_all();
			room_goto(rm_pause);
		}
	}
	else
	{
		room_persistent = false; /* Turn OFF Room Persistency */
	}
}
