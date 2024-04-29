function scr_initialize_character_sprite(sprite_name, character_sprite_variable = noone, use_character_folder = character_folder)
{
	
	#region /* Add sprite */
	var sprite_found = false; /* "sprite found" is a boolean variable that is true if a sprite was found, and false otherwise */
	var sprite_path = string(use_character_folder) + "/sprites" + string(skin_folder) + sprite_name; /* Concatenate the sprite folder and name to create a full sprite path */
	var sprite_number = string_digits(file_find_first(sprite_path + "*.png", fa_none)); /* Get the first sprite number in the specified path by using the "file find first" function and extract all the digits from it using the "string_digits" function */
	var sprite_filename = sprite_path + string(sprite_number) + ".png"; /* Convert the extracted sprite number to a string using the "string" function and concatenate it with the sprite path and file extension to form the full filename */
	if (sprite_number == "")
	{
		sprite_number = 1; /* Set sprite number to 1 if there is nothing returned, after setting the sprite filename */
	}
	
	if (file_exists(sprite_filename)) /* If the file exists, add the sprite to the game and set "sprite found" to true */
	{
		character_sprite_variable = sprite_add(sprite_filename, sprite_number, false, false, 0, 0);
		sprite_found = true;
	}
	#endregion /* Add sprite END */
	
	#region /* Origin points */
	if (character_sprite_variable != noone && sprite_found)
	{
		
		#region /* x and y origin points */
		var spr_origin_x = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", -1); /* Read the x and y origin points for the sprite from the config file */
		var spr_origin_y = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", -1);
		if (spr_origin_x == -1) /* If the x origin is not found in the config file, set it to half the sprite width and save it to the config file */
		{
			spr_origin_x = sprite_get_width(character_sprite_variable) * 0.5;
			if (can_save_to_character_config)
			{
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", spr_origin_x);
			}
		}
		if (spr_origin_y == -1) /* If the y origin is not found in the config file, set it to half the sprite height and save it to the config file */
		{
			spr_origin_y = sprite_get_height(character_sprite_variable) * 0.5;
			if (can_save_to_character_config)
			{
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", spr_origin_y);
			}
		}
		sprite_set_offset(character_sprite_variable, spr_origin_x, spr_origin_y); /* Set the sprite offset to the x and y origin points */
		#endregion /* x and y origin points END */
		
	}
	#endregion /* Origin points END */
	
	return (character_sprite_variable);
}