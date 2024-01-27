function scr_initialize_character_sprite(sprite_name, sprite_variable = noone, use_character_folder = character_folder)
{
	
	#region /* Add sprite */
	var sprite_found = false; /* sprite_found is a boolean variable that is true if a sprite was found, and false otherwise */
	
	/* Define possible sprite names and folders to check */
	var sprite_names = [
		string(sprite_name) + "_strip",
		string(sprite_name)
	];
	var sprite_folders = string(use_character_folder) + "/sprites" + string(skin_folder);
	
	/* This loop goes through all possible combinations of sprite names and folders */
	/* sprite_names and sprite_folders are arrays that contain the names of the sprites and folders to search through */
	
	for(var i = 0; i < array_length_1d(sprite_names); i++) {
		if (sprite_found) {break;} /* If a sprite is already found, break out of the loop */
		var sprite_path = sprite_folders + sprite_names[i]; /* Concatenate the sprite folder and name to create a full sprite path */
		var sprite_number = string_digits(file_find_first(sprite_path + "*.png", fa_none)); /* Get the first sprite number in the specified path by using the "file find first" function and extract all the digits from it using the "string_digits" function */
		var sprite_filename = sprite_path + string(sprite_number) + ".png"; /* Convert the extracted sprite number to a string using the "string" function and concatenate it with the sprite path and file extension to form the full filename */
		if (file_exists(sprite_filename) && sprite_number != "") { /* If the file exists, add the sprite to the game and set sprite_found to true */
			sprite_variable = sprite_add(sprite_filename, sprite_number, false, false, 0, 0);
			sprite_found = true;
			break;
		}
		
		if (!sprite_found && file_exists(sprite_path + ".png")) { /* If the sprite was not found with a number in the file name, try again without a number */
			sprite_variable = sprite_add(sprite_path + ".png", 1, false, false, 0, 0);
			sprite_found = true;
			break;
		}
	}
	#endregion /* Add sprite END */
	
	#region /* Origin points */
	if (sprite_variable != noone && sprite_found) {
		ini_open(string(use_character_folder) + "/data/sprite_origin_point.ini");
		
		#region /* x and y origin points */
		var spr_origin_x = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", -1); /* Read the x and y origin points for the sprite from the config file */
		var spr_origin_y = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", -1);
		if (spr_origin_x == -1) { /* If the x origin is not found in the config file, set it to half the sprite width and save it to the config file */
			spr_origin_x = sprite_get_width(sprite_variable) * 0.5;
			if (can_save_to_character_config) {ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", spr_origin_x);}
		}
		if (spr_origin_y == -1) { /* If the y origin is not found in the config file, set it to half the sprite height and save it to the config file */
			spr_origin_y = sprite_get_height(sprite_variable) * 0.5;
			if (can_save_to_character_config) {ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", spr_origin_y);}
		}
		sprite_set_offset(sprite_variable, spr_origin_x, spr_origin_y); /* Set the sprite offset to the x and y origin points */
		#endregion /* x and y origin points END */
		
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	#endregion /* Origin points END */
	
	return (sprite_variable);
}