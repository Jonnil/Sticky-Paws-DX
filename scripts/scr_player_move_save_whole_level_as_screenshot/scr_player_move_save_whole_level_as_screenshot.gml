function scr_player_move_save_whole_level_as_screenshot()
{
	
	#region /* Save whole level as screenshot png file */
	if (global.full_level_map_screenshot)
	&& (full_level_map_screenshot_timer <= 0)
	{
		can_move = false; /* Make it so you can't move while game is generating a full level map screenshot, so you can't mess with the screenshot */
		instance_activate_all();
	
		#region /* Delete some objects so it doesn't show up in the screenshot */
		if (instance_exists(obj_camera))
		{
			instance_destroy(obj_camera);
		}
		#endregion /* Delete some objects so it doesn't show up in the screenshot END */
	
		camera_set_view_border(view_camera[view_current], room_width, room_height); /* View Border */
		camera_set_view_pos(view_camera[view_current], 0, 0); /* Set camera position in top left corner when taking full level map screenshots */
		camera_set_view_size(view_camera[view_current], room_width, room_height);
		display_set_gui_size(room_width, room_height);
		surface_resize(application_surface, room_width, room_height);
		window_set_rectangle(0, 0, room_width, room_height);
		full_level_map_screenshot_timer = 1;
	}
	if (full_level_map_screenshot_timer >= 1)
	{
		full_level_map_screenshot_timer ++;
	}
	if (full_level_map_screenshot_timer == 15)
	{
		var custom_level_map_sprite;
		custom_level_map_sprite = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0);
		if (global.character_select_in_this_menu == "level_editor")
		&& (global.select_level_index <= 0)
		|| (global.character_select_in_this_menu == "level_editor")
		&& (global.create_level_from_template >= 2)
		{
			sprite_save(custom_level_map_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/full_level_map.png");
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			sprite_save(custom_level_map_sprite, 0, working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/full_level_map.png");
		}
		scr_delete_sprite_properly(custom_level_map_sprite);
	}
	if (full_level_map_screenshot_timer == 20)
	{
		camera_set_view_border(view_camera[view_current], 1920, 1080); /* View Border */
		camera_set_view_pos(view_camera[view_current], x, y); /* Set camera position to object's x and y positions again */
		camera_set_view_size(view_camera[view_current], 1920, 1080);
		surface_resize(application_surface, 1920, 1080);
		window_set_rectangle(0, 0, 1920, 1080);
		scr_set_screen_size();
		global.full_level_map_screenshot = false;
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
		full_level_map_screenshot_timer = 0;
		can_move = true;
		room_restart();
	}
	#endregion /* Save whole level as screenshot png file END */
	
}