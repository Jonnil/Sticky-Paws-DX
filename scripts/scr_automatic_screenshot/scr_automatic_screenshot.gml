function scr_automatic_screenshot()
{
	/* Step 1: Capture the fullscreen screenshot */
	var screenshot = surface_create(display_get_width(), display_get_height());
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