function scr_automatic_screenshot()
{
	#region /* Limit so cursor and view can't go outside room */
	if (cam_width < 1920 || cam_height < 1080)
	{
		camera_set_view_size(view_camera[view_current], 1920, 1080);
	}
	scr_set_screen_size();
	
	/* Limit view inside room when saving screenshot */
	if (instance_exists(obj_level_width) && instance_exists(obj_level_height))
	{
		camera_set_view_pos(view_camera[view_current],
		max(0, min(cam_x, obj_level_width.x - cam_width)),
		max(0, min(cam_y, obj_level_height.y - cam_height)));
	}
	
	/* Limit controller x and y inside room */
	controller_x = clamp(controller_x, cam_x, cam_x + cam_width);
	controller_y = clamp(controller_y, cam_y, cam_y + cam_height);
	
	/* Limit x and y inside room */
	x = clamp(x, cam_x, cam_x + cam_width);
	y = clamp(y, cam_y, cam_y + cam_height);
	#endregion /* Limit so view and cursor can't go outside room END */
	
	/* Step 1: Capture the fullscreen screenshot */
	var screenshot = surface_create(display_get_gui_width(), display_get_gui_height());
	surface_set_target(screenshot);
	draw_surface(application_surface, 0, 0);
	surface_reset_target();
	
	/* Step 2: Create a new surface with smaller dimensions */
	var thumbnail_width = 320;
	var thumbnail_height = 240;
	var thumbnail_surface = surface_create(thumbnail_width, thumbnail_height);
	
	/* Step 3: Draw the fullscreen screenshot onto the smaller surface */
	surface_set_target(thumbnail_surface);
	draw_surface_stretched(screenshot, 0, 0, thumbnail_width, thumbnail_height);
	surface_reset_target();
	
	/* Step 4: Create a sprite from the smaller surface */
	var thumbnail_sprite = sprite_create_from_surface(thumbnail_surface, 0, 0, thumbnail_width, thumbnail_height, 0, 0, 0, 0);
	
	/* Step 5: Save the sprite to a file */
	sprite_save(thumbnail_sprite, 0, working_directory + "custom_levels/" + global.level_name + "/automatic_thumbnail.png");
	
	/* Cleanup */
	surface_free(screenshot);
	surface_free(thumbnail_surface);
	sprite_delete(thumbnail_sprite);
}