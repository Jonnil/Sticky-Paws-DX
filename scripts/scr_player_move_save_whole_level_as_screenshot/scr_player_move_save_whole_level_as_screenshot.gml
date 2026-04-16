function scr_player_move_save_whole_level_as_screenshot()
{

	#region /* Save whole level as screenshot png file */
	if (global.full_level_map_screenshot)
	{
		/* Capture the whole room, but cap the exported surface size so we don't allocate huge GPU targets. */
		var capture_view_width = round(max(1, room_width));
		var capture_view_height = round(max(1, room_height));
		var max_export_dimension = 4096;
		var max_export_pixels = max_export_dimension * max_export_dimension;
		var export_scale = min(
			1,
			min(
				max_export_dimension / capture_view_width,
				min(
					max_export_dimension / capture_view_height,
					sqrt(max_export_pixels / (capture_view_width * capture_view_height))
				)
			)
		);
		var export_width = max(1, round(capture_view_width * export_scale));
		var export_height = max(1, round(capture_view_height * export_scale));

		if (full_level_map_screenshot_timer <= 0)
		{
			if (!surface_exists(application_surface))
			{
				show_debug_message("[scr_player_move_save_whole_level_as_screenshot] Cancelled because application_surface is unavailable.");
				global.full_level_map_screenshot = false;
				full_level_map_screenshot_timer = 0;
				can_move = true;
				return;
			}

			/* Disable the backgrounds when getting full level map */
			layer_background_visible(layer_background_get_id("Background_1"), false);
			layer_background_visible(layer_background_get_id("Background_2"), false);
			layer_background_visible(layer_background_get_id("Background_3"), false);
			layer_background_visible(layer_background_get_id("Background_4"), false);

			can_move = false; /* Make it so you can't move while game is generating a full level map screenshot, so you can't mess with the screenshot */
			instance_activate_all();

			#region /* Delete some objects so it doesn't show up in the screenshot */
			if (instance_exists(obj_camera))
			{
				instance_destroy(obj_camera);
			}
			if (instance_exists(obj_camera_map))
			{
				instance_destroy(obj_camera_map);
			}
			#endregion /* Delete some objects so it doesn't show up in the screenshot END */

			camera_set_view_border(view_get_camera(view_current), capture_view_width, capture_view_height); /* View Border */
			camera_set_view_pos(view_get_camera(view_current), 0, 0); /* Set camera position in top left corner when taking full level map screenshots */
			camera_set_view_size(view_get_camera(view_current), capture_view_width, capture_view_height);
			display_set_gui_size(export_width, export_height);

			surface_resize(application_surface, export_width, export_height);
			full_level_map_screenshot_timer = 1;
		}
		if (full_level_map_screenshot_timer >= 1)
		{
			if (instance_exists(obj_background_brightness_gameplay))
			{
				obj_background_brightness_gameplay.background_brightness_lerp = 0;
			}
			audio_stop_all(); /* Don't play the level music, as it will only play for a second when taking full level screenshot */
			full_level_map_screenshot_timer++;
		}
		if (full_level_map_screenshot_timer == 15)
		{
			if (!surface_exists(application_surface))
			{
				full_level_map_screenshot_timer = 14;
				return;
			}

			var flattened_surface = surface_create(export_width, export_height);

			if (!surface_exists(flattened_surface))
			{
				show_debug_message("[scr_player_move_save_whole_level_as_screenshot] Failed to create flattened export surface.");
				global.full_level_map_screenshot = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				full_level_map_screenshot_timer = 0;
				can_move = true;
				room_restart();
				return;
			}

			surface_set_target(flattened_surface);
			draw_clear_alpha(c_black, 1);
			gpu_set_colorwriteenable(true, true, true, false);
			draw_surface(application_surface, 0, 0);
			gpu_set_colorwriteenable(true, true, true, true);
			surface_reset_target();
			var custom_level_map_sprite;
			custom_level_map_sprite = sprite_create_from_surface(flattened_surface, 0, 0, export_width, export_height, false, false, 0, 0);
			if (global.select_level_index <= 0)
			|| (global.create_level_from_template >= 2)
			{
				if (sprite_exists(custom_level_map_sprite))
				{
					sprite_save(custom_level_map_sprite, 0, game_save_id + "custom_levels/" + scr_get_custom_level_folder_name() + "/full_level_map_" + string(global.level_name) + ".png");
				}
			}
			else
			{
				if (sprite_exists(custom_level_map_sprite))
				{
					sprite_save(custom_level_map_sprite, 0, game_save_id + "custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/full_level_map_" + string(global.level_name) + ".png");
				}
			}
			scr_delete_sprite_properly(custom_level_map_sprite);
			surface_free(flattened_surface);
		}
		if (full_level_map_screenshot_timer >= 20)
		{
			camera_set_view_border(view_get_camera(view_current), 1920, 1080); /* View Border */
			camera_set_view_pos(view_get_camera(view_current), x, y); /* Set camera position to object's x and y positions again */
			camera_set_view_size(view_get_camera(view_current), 1920, 1080);
			if (surface_exists(application_surface))
			{
				surface_resize(application_surface, 1920, 1080);
			}
			scr_set_screen_size();
			global.full_level_map_screenshot = false;
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			full_level_map_screenshot_timer = 0;
			can_move = true;
			room_restart();
		}
	}
	#endregion /* Save whole level as screenshot png file END */

}
