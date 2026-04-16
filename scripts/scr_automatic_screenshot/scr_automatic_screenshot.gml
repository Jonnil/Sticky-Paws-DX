function scr_automatic_screenshot()
{
	if (!surface_exists(application_surface))
	{
		show_debug_message("[scr_automatic_screenshot] Skipped because application_surface is unavailable.");
		return;
	}

	if (instance_exists(obj_background_brightness_gameplay))
	{
		obj_background_brightness_gameplay.background_brightness_lerp = 0;
	}

	/* Step 1: Capture the fullscreen screenshot */
	/* Try and prevent the screenshot to capture outside the level */
	var source_width = round(clamp(surface_get_width(application_surface), 1, 1920));
	var source_height = round(clamp(surface_get_height(application_surface), 1, 1080));
	var screenshot = surface_create(source_width, source_height);

	if (!surface_exists(screenshot))
	{
		show_debug_message("[scr_automatic_screenshot] Failed to create intermediate screenshot surface.");
		return;
	}

	surface_set_target(screenshot);
	draw_clear_alpha(c_black, 1);
	gpu_set_colorwriteenable(true, true, true, false);
	draw_surface_stretched(application_surface, 0, 0, source_width, source_height);
	gpu_set_colorwriteenable(true, true, true, true);
	surface_reset_target();

	/* Step 2: Create a new surface with smaller dimensions */
	var thumbnail_width = 320;
	var thumbnail_height = 240; /* 240p */
	var thumbnail_surface = surface_create(thumbnail_width, thumbnail_height);

	if (!surface_exists(thumbnail_surface))
	{
		surface_free(screenshot);
		show_debug_message("[scr_automatic_screenshot] Failed to create thumbnail surface.");
		return;
	}

	/* Step 3: Draw the fullscreen screenshot onto the smaller surface */
	surface_set_target(thumbnail_surface);
	draw_clear_alpha(c_black, 1);
	gpu_set_colorwriteenable(true, true, true, false);
	draw_surface_stretched(screenshot, 0, 0, thumbnail_width, thumbnail_height);
	gpu_set_colorwriteenable(true, true, true, true);
	surface_reset_target();

	/* Step 4: Create a sprite from the smaller surface */
	var thumbnail_sprite = sprite_create_from_surface(thumbnail_surface, 0, 0, thumbnail_width, thumbnail_height, 0, 0, 0, 0);

	/* Step 5: Save the sprite to a file */
	if (sprite_exists(thumbnail_sprite))
	{
		sprite_save(thumbnail_sprite, 0, game_save_id + "custom_levels/" + scr_get_custom_level_folder_name() + "/automatic_thumbnail.png");
	}

	/* Cleanup */
	surface_free(screenshot);
	surface_free(thumbnail_surface);
	scr_delete_sprite_properly(thumbnail_sprite);
}
