function scr_update_all_backgrounds(delete_existing_bg = true)
{
	/* Delete existing sprites to free memory */
	if (delete_existing_bg)
	{
		scr_delete_sprite_properly(global.custom_background1);
		scr_delete_sprite_properly(global.custom_background2);
		scr_delete_sprite_properly(global.custom_background3);
		scr_delete_sprite_properly(global.custom_background4);
		scr_delete_sprite_properly(global.custom_foreground1);
		scr_delete_sprite_properly(global.custom_foreground1_5);
		scr_delete_sprite_properly(global.custom_foreground2);
		scr_delete_sprite_properly(global.custom_foreground_secret);
		scr_delete_sprite_properly(global.custom_tileset);
	}
	
	/* Set the file path based on the current game mode */
	if (global.character_select_in_this_menu == "main_game")
	{
		global.path_to_use = "levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/";
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
	}
	else
	{
		global.path_to_use = global.use_temp_or_working + "custom_levels/" + string(global.level_name) + "/background/";
		ini_open(global.use_temp_or_working + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
	}
	
	/* Read default backgrounds/foregrounds from ini */
	global.default_background1 = ini_read_string("info", "default_background1", "level1");
	global.default_background2 = ini_read_string("info", "default_background2", "level1");
	global.default_background3 = ini_read_string("info", "default_background3", "level1");
	global.default_background4 = ini_read_string("info", "default_background4", "level1");
	global.default_foreground1 = ini_read_string("info", "default_foreground1", "");
	global.default_foreground1_5 = ini_read_string("info", "default_foreground1_5", "");
	global.default_foreground2 = ini_read_string("info", "default_foreground2", "");
	global.default_foreground_secret = ini_read_string("info", "default_foreground_secret", "");
	
	/* Check if photographic images can be loaded */
	if (!global.can_load_photographic_images)
	{
		var use_photographic_images = [
			ini_read_real("Custom Backgrounds", "background1_uses_photographic_image", false),
			ini_read_real("Custom Backgrounds", "background2_uses_photographic_image", false),
			ini_read_real("Custom Backgrounds", "background3_uses_photographic_image", false),
			ini_read_real("Custom Backgrounds", "background4_uses_photographic_image", false),
			ini_read_real("Custom Backgrounds", "foreground1_uses_photographic_image", false),
			ini_read_real("Custom Backgrounds", "foreground1_5_uses_photographic_image", false),
			ini_read_real("Custom Backgrounds", "foreground2_uses_photographic_image", false),
			ini_read_real("Custom Backgrounds", "foreground_secret_uses_photographic_image", false)
		];
	}
	else
	{
		var use_photographic_images = [false, false, false, false, false, false, false, false];
	}
	ini_close();
	
	/* Loading sprites using the optimized method */
	global.custom_background1 = load_sprite_with_fallback("background1", global.default_background1, 0, use_photographic_images[0]);
	global.custom_background2 = load_sprite_with_fallback("background2", global.default_background2, 1, use_photographic_images[1]);
	global.custom_background3 = load_sprite_with_fallback("background3", global.default_background3, 2, use_photographic_images[2]);
	global.custom_background4 = load_sprite_with_fallback("background4", global.default_background4, 3, use_photographic_images[3]);
	global.custom_foreground1 = load_sprite_with_fallback("foreground1", global.default_foreground1, 4, use_photographic_images[4]);
	global.custom_foreground1_5 = load_sprite_with_fallback("foreground1_5", global.default_foreground1_5, 5, use_photographic_images[5]);
	global.custom_foreground2 = load_sprite_with_fallback("foreground2", global.default_foreground2, 6, use_photographic_images[6]);
	global.custom_foreground_secret = load_sprite_with_fallback("foreground_secret", global.default_foreground_secret, 7, use_photographic_images[7]);
	
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_1")), global.custom_background1);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
	
	show_debug_message("All backgrounds updated for " + string(global.level_name));
}

/* Function to load a sprite with staggered timing */
function load_sprite_with_fallback(filename_prefix, default_filename, index, use_photographic_images)
{
	var file_formats = ["png", "bmp", "gif", "jpg", "jpeg"];
	var loaded = false;
	
	if (use_photographic_images == false && global.can_load_custom_level_assets)
	{
		for (var i = 0; i < array_length(file_formats); i++)
		{
			var file_path = string(global.path_to_use) + filename_prefix + "." + file_formats[i];
			if (file_exists(file_path))
			{
				show_debug_message(string(filename_prefix) + " updated from custom");
				return sprite_add(file_path, 0, false, false, 0, 0);
				loaded = true;
				break;
			}
		}
			
		/* If no custom sprite, use default */
		if (!loaded && default_filename != "" && file_exists("levels/" + string(default_filename) + "/background/" + filename_prefix + ".png"))
		{
			show_debug_message(string(filename_prefix) + " updated to default");
			return sprite_add("levels/" + string(default_filename) + "/background/" + filename_prefix + ".png", 0, false, false, 0, 0);
		}
			
		/* If still not loaded, assign 'noone' */
		if (!loaded)
		{
			show_debug_message(string(filename_prefix) + " set to noone");
			return noone;
		}
	}
	else
	if (default_filename != "" && file_exists("levels/" + string(default_filename) + "/background/" + filename_prefix + ".png"))
	{
		show_debug_message(string(filename_prefix) + " updated to default");
		return sprite_add("levels/" + string(default_filename) + "/background/" + filename_prefix + ".png", 0, false, false, 0, 0);
	}
	else
	{
		show_debug_message(string(filename_prefix) + " set to noone");
		return noone;
	}
}