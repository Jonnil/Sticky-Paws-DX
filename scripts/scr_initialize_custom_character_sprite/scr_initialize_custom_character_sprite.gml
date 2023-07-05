function scr_initialize_custom_character_sprite(sprite_name, sprite_variable = noone, use_character_folder = character_folder)
{
	var saved_file_exists = false;
	
	#region /* Add sprite */
	var sprite_found = false;
	
	/* Define possible sprite names and folders to check */
	var sprite_names = [
		string(sprite_name) + "_strip",
		string(sprite_name)
	];
	var sprite_folders = string(use_character_folder) + "/sprites" + string(skin_folder);
	
	/* This loop goes through all possible combinations of sprite names and folders. */
	/* sprite_names and sprite_folders are arrays that contain the names of the sprites and folders to search through. */
	
	for (var i = 0; i < array_length_1d(sprite_names); i++) {
		
		/* If a sprite is already found, break out of the loop. */
		if (sprite_found) break;
		
		/* Concatenate the sprite folder and name to create a full sprite path. */
		var sprite_path = sprite_folders + sprite_names[i];
		
		/* Get the first sprite number in the specified path by using the "file_find_first" function */
		/* and extract all the digits from it using the "string_digits" function */
		var sprite_number = string_digits(file_find_first(sprite_path + "*.png", fa_none));
		/* Convert the extracted sprite number to a string using the "string" function and concatenate it with the sprite path and file extension to form the full filename */
		var sprite_filename = sprite_path + string(sprite_number) + ".png";
		
		/*If the file exists, add the sprite to the game and set sprite_found to true. */
		if (file_exists(sprite_filename)) 
		&& (sprite_number != "")
		{
			sprite_variable = sprite_add(sprite_filename, sprite_number, false, false, 0, 0);
			sprite_found = true;
			break;
		}
		
		/* If the sprite was not found with a number in the file name, try again without a number. */
		if (!sprite_found)
		&& (file_exists(sprite_path + ".png"))
		{
			sprite_variable = sprite_add(sprite_path + ".png", 1, false, false, 0, 0);
			sprite_found = true;
			break;
		}
	}
	
	/* sprite_found is a boolean variable that is true if a sprite was found, and false otherwise. */
	
	/* If sprite is found, set saved_file_exists to true */
	if (sprite_found) {
		var saved_file_exists = true;
	}
	#endregion /* Add sprite END */
	
	#region /* Origin points */
	if (sprite_variable != noone)
	&& (saved_file_exists)
	{
		ini_open(string(use_character_folder) + "/data/sprite_origin_point.ini");
		
		#region /* x and y origin points */
		/* Read the x and y origin points for the sprite from the config file */
		var spr_origin_x = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", -1);
		var spr_origin_y = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", -1);
		
		/* If the x origin is not found in the config file, set it to half the sprite width and save it to the config file */
		if (spr_origin_x == -1) {
			spr_origin_x = sprite_get_width(sprite_variable) * 0.5;
			if (can_save_to_character_config) ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", spr_origin_x);
		}
		
		/* If the y origin is not found in the config file, set it to half the sprite height and save it to the config file */
		if (spr_origin_y == -1) {
			spr_origin_y = sprite_get_height(sprite_variable) * 0.5;
			if (can_save_to_character_config) ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", spr_origin_y);
		}
		
		/* Set the sprite offset to the x and y origin points */
		sprite_set_offset(sprite_variable, spr_origin_x, spr_origin_y);
		#endregion /* x and y origin points END */
		
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	#endregion /* Origin points END */
	
	//else
	
	//#region /* If the sprite doesn't exist, but there are still origin points saved for that sprite, then delete those origin points from sprite_origin_point.ini, but save the unused origin points in unused_sprite_origin_point.ini */
	//{
	//	/* Construct the path to the character's data directory */
	//	var char_data_dir = "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/";
		
	//	/* If the sprite variable is undefined and there is no saved file, and the sprite origin point INI file exists */
	//	if (sprite_variable == noone && !saved_file_exists)
	//	{
		
	//		/* Open the sprite origin point INI file and delete the x and y origin point keys for this sprite */
	//		with (ini_open(char_data_dir + "sprite_origin_point.ini")) {
	//			ini_key_delete("sprite origin points", "sprite_" + string(sprite_name) + "_xorig");
	//			ini_key_delete("sprite origin points", "sprite_" + string(sprite_name) + "_yorig");
	//		}
			
	//		/* Open the unused sprite origin point INI file */
	//		with (ini_open(char_data_dir + "unused_sprite_origin_point.ini")) {
				
	//			/* Read the x and y origin point keys for this sprite, if they exist */
	//			var unused_x_origin_point = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", noone);
	//			var unused_y_origin_point = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", noone);
				
	//			/* If an x origin point was found, write it to the unused sprite origin point INI file */
	//			if (unused_x_origin_point > noone) ini_write_real("unused sprite origin points", "sprite_" + string(sprite_name) + "_xorig", unused_x_origin_point);
				
	//			/* If a y origin point was found, write it to the unused sprite origin point INI file */
	//			if (unused_y_origin_point > noone) ini_write_real("unused sprite origin points", "sprite_" + string(sprite_name) + "_yorig", unused_y_origin_point);
				
	//			/* Delete the x and y origin point keys for this sprite */
	//			ini_key_delete("sprite origin points", "sprite_" + string(sprite_name) + "_xorig");
	//			ini_key_delete("sprite origin points", "sprite_" + string(sprite_name) + "_yorig");
	//		}
	//	}
	//}
	//#endregion /* If the sprite doesn't exist, but there are still origin points saved for that sprite, then delete those origin points from sprite_origin_point.ini, but save the unused origin points in unused_sprite_origin_point.ini END */
	
	if (sprite_variable != noone)
	{
		return (sprite_variable);
	}
	else
	{
		return noone;
	}
}