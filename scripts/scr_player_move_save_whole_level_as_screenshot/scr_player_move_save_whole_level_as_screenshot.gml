function scr_player_move_save_whole_level_as_screenshot()
{
	
	#region /* Save whole level as screenshot png file */
	if (global.full_level_map_screenshot)
	{
		/* Check if the dimensions are valid (greater than 0 and less than 8192) In the case where dimensions are not valid, then don't resize the surface, otherwise game will crash */
		var new_width = round(clamp(room_width, 1, 8192)); /* Clamp to a reasonable width and height, and also round the number so it's not a floating point */
		var new_height = round(clamp(room_height, 1, 8192));
		
		if (full_level_map_screenshot_timer <= 0)
		{
			/* Disable the backgrounds when getting full level map */
			layer_background_visible(layer_background_get_id("Background"), false);
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
			
			camera_set_view_border(view_camera[view_current], new_width, new_height); /* View Border */
			camera_set_view_pos(view_camera[view_current], 0, 0); /* Set camera position in top left corner when taking full level map screenshots */
			camera_set_view_size(view_camera[view_current], new_width, new_height);
			display_set_gui_size(new_width, new_height);
			
			surface_resize(application_surface, new_width, new_height);
			full_level_map_screenshot_timer = 1;
		}
		if (full_level_map_screenshot_timer >= 1)
		{
			audio_stop_all(); /* Don't play the level music, as it will only play for a second when taking full level screenshot */
			full_level_map_screenshot_timer ++;
		}
		if (full_level_map_screenshot_timer == 15)
		{
			var custom_level_map_sprite;
			custom_level_map_sprite = sprite_create_from_surface(application_surface, 0, 0, new_width, new_height, false, false, 0, 0);
			if (global.select_level_index <= 0)
			|| (global.create_level_from_template >= 2)
			{
				sprite_save(custom_level_map_sprite, 0, working_directory + "custom_levels/" + global.level_name + "/full_level_map_" + global.level_name + ".png");
			}
			else
			{
				sprite_save(custom_level_map_sprite, 0, working_directory + "custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/full_level_map_" + global.level_name + ".png");
			}
			scr_delete_sprite_properly(custom_level_map_sprite);
		}
		if (full_level_map_screenshot_timer >= 20)
		{
			camera_set_view_border(view_camera[view_current], 1920, 1080); /* View Border */
			camera_set_view_pos(view_camera[view_current], x, y); /* Set camera position to object's x and y positions again */
			camera_set_view_size(view_camera[view_current], 1920, 1080);
			surface_resize(application_surface, 1920, 1080);
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