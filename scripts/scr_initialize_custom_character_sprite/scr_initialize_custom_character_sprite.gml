/// @desc initialize_custom_character_sprite(sprite_name, sprite_variable);
/// @description initialize_custom_character_sprite(sprite_name, sprite_variable);
/// @arg sprite_name

function scr_initialize_custom_character_sprite(sprite_name, sprite_variable = noone)
{
	/* sprite_name. Sprite name. The name of the file */
	
	#region /* Add sprite */
	index = 0;
	repeat(50)
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/skin" + string(selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/skin" + string(selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
			saved_file_exists = true;
			break;
		}
		else
		if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/skin" + string(selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/skin" + string(selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
			saved_file_exists = true;
			break;
		}
		else
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
			saved_file_exists = true;
			break;
		}
		else
		if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
			saved_file_exists = true;
			break;
		}
		index += 1;
	}
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/skin" + string(selected_skin) + "/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/skin" + string(selected_skin) + "/" + string(sprite_name) + ".png", 1, false, false, 0, 0);
		saved_file_exists = true;
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/skin" + string(selected_skin) + "/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/skin" + string(selected_skin) + "/" + string(sprite_name) + ".png", 1, false, false, 0, 0);
		saved_file_exists = true;
	}
	else
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/" + string(sprite_name) + ".png", 1, false, false, 0, 0);
		saved_file_exists = true;
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/sprites/" + string(sprite_name) + ".png", 1, false, false, 0, 0);
		saved_file_exists = true;
	}
	#endregion /* Add sprite END */
	
	#region /* Origin points */
	if (sprite_variable != noone)
	and (saved_file_exists == true)
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/sprite_origin_point.ini"))
		{
			ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/sprite_origin_point.ini");
			var can_save_to_character_config = false; /* You can't save values to included files */
		}
		else
		{
			ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/sprite_origin_point.ini");
			var can_save_to_character_config = true; /* You can save values to local appdata */
		}
		
		#region /* x and y origin points */
		if (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		and (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			/* If both xorig and yorig exists, then use that for the sprite origin point */
			sprite_set_offset(sprite_variable, ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) * 0.5), ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) * 0.5));
		}
		else
		if (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		and (!ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			if (can_save_to_character_config == true)
			{
				/* If xorig exists but yorig doesn't exists, then use xorig, and then take sprite height by half and make that the yorig */
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) * 0.5);
			}
			sprite_set_offset(sprite_variable, ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) * 0.5), sprite_get_height(sprite_variable) * 0.5);
		}
		else
		if (!ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		and (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			if (can_save_to_character_config == true)
			{
				/* If xorig doesn't exists but yorig exists, then use yorig, and then take sprite width by half and make that the xorig */
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) * 0.5);
			}
			sprite_set_offset(sprite_variable, sprite_get_width(sprite_variable) * 0.5, ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) * 0.5));
		}
		else
		{
			if (can_save_to_character_config == true)
			{
				/* If xorig and yorig doesn't exist, then take sprite width and sprite height by hald and make that the xorig and yorig */
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) * 0.5);
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) * 0.5);
			}
			sprite_set_offset(sprite_variable, sprite_get_width(sprite_variable) * 0.5, sprite_get_height(sprite_variable) * 0.5);
		}
		#endregion /* x and y origin points END */
		
		ini_close();
		saved_file_exists = false;
	}
	#endregion /* Origin points END */
	
	else
	
	#region /* If the sprite doesn't exist, but there are still origin points saved for that sprite, then delete those origin points from sprite_origin_point.ini, but save the unused origin points in unused_sprite_origin_point.ini */
	if (sprite_variable == noone)
	and (saved_file_exists == false)
	and (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/sprite_origin_point.ini"))
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/sprite_origin_point.ini");
		
		#region /* Delete x and y origin points if the sprite doesn't even exist */
		if (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		{
			unused_x_origin_point = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", noone);
			ini_key_delete("sprite origin points", "sprite_" + string(sprite_name) + "_xorig");
		}
		if (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			unused_y_origin_point = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", noone);
			ini_key_delete("sprite origin points", "sprite_" + string(sprite_name) + "_yorig");
		}
		#endregion /* Delete x and y origin points if the sprite doesn't even exist END */
		
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/unused_sprite_origin_point.ini");
		
		#region /* Save unused x and y origin points just in case it's still useful for something */
		if (unused_x_origin_point > noone)
		{
			ini_write_real("unused sprite origin points", "sprite_" + string(sprite_name) + "_xorig", unused_x_origin_point);
			unused_x_origin_point = noone;
		}
		if (unused_y_origin_point > noone)
		{
			ini_write_real("unused sprite origin points", "sprite_" + string(sprite_name) + "_yorig", unused_y_origin_point);
			unused_y_origin_point = noone;
		}
		#endregion /* Save unused x and y origin points just in case it's still useful for something END */
		
		ini_close();
	}
	#endregion /* If the sprite doesn't exist, but there are still origin points saved for that sprite, then delete those origin points from sprite_origin_point.ini, but save the unused origin points in unused_sprite_origin_point.ini END */
	
	saved_file_exists = false;
	unused_x_origin_point = noone;
	unused_y_origin_point = noone;
	if (sprite_variable != noone)
	{
		return (sprite_variable);
	}
}