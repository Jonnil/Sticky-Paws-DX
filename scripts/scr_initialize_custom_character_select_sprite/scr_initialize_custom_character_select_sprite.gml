function scr_initialize_custom_character_select_sprite(sprite_name, sprite_variable, what_player = player, what_selected_skin = selected_skin, where_to_look_for_sprite = string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])))
{
	/* sprite_name. Sprite name. The name of the file */
	/* sprite_variable. Sprite variable. The name of the variable */
	/* what_player. Player variable, ususally type "player" */
	/* what_selected_skin. Selected skin variable, ususally type "select_skin" */
	var saved_file_exists = false;
	var unused_x_origin_point = noone;
	var unused_y_origin_point = noone;
	
	#region /* Add sprite */
	index = 0;
	repeat(50)
	{
		if (file_exists("characters/" + string(where_to_look_for_sprite) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add("characters/" + string(where_to_look_for_sprite) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
			var saved_file_exists = true;
		}
		else
		if (file_exists(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
			var saved_file_exists = true;
		}
		else
		if (file_exists("characters/" + string(where_to_look_for_sprite) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add("characters/" + string(where_to_look_for_sprite) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
			var saved_file_exists = true;
		}
		else
		if (file_exists(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, 0, 0);
			var saved_file_exists = true;
		}
		index ++;
	}
	if (file_exists("characters/" + string(where_to_look_for_sprite) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add("characters/" + string(where_to_look_for_sprite) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + ".png", 1, false, false, 0, 0);
		var saved_file_exists = true;
	}
	else
	if (file_exists(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + ".png", 1, false, false, 0, 0);
		var saved_file_exists = true;
	}
	else
	if (file_exists("characters/" + string(where_to_look_for_sprite) + "/sprites/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add("characters/" + string(where_to_look_for_sprite) + "/sprites/" + string(sprite_name) + ".png", 1, false, false, 0, 0);
		var saved_file_exists = true;
	}
	else
	if (file_exists(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/sprites/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/sprites/" + string(sprite_name) + ".png", 1, false, false, 0, 0);
		var saved_file_exists = true;
	}
	#endregion /* Add sprite END */
	
	#region /* Origin points */
	if (saved_file_exists)
	{
		if (file_exists("characters/" + string(where_to_look_for_sprite) + "/data/sprite_origin_point.ini"))
		{
			ini_open("characters/" + string(where_to_look_for_sprite) + "/data/sprite_origin_point.ini");
			can_save_to_character_config = false; /* You can't save values to included files */
		}
		else
		{
			ini_open(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/data/sprite_origin_point.ini");
			can_save_to_character_config = true; /* You can save values to local appdata */
		}
		
		#region /* x and y origin points */
		if (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		&& (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			sprite_set_offset(sprite_variable,
			ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) * 0.5),
			ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) * 0.5));
		}
		else
		if (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		&& (!ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			if (can_save_to_character_config)
			{
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) * 0.5);
			}
			sprite_set_offset(sprite_variable,
			ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) * 0.5),
			sprite_get_height(sprite_variable) * 0.5);
		}
		else
		if (!ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		&& (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			if (can_save_to_character_config)
			{
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) * 0.5);
			}
			sprite_set_offset(sprite_variable,
			sprite_get_width(sprite_variable) * 0.5,
			ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) * 0.5));
		}
		else
		{
			if (can_save_to_character_config)
			{
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) * 0.5);
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) * 0.5);
			}
			sprite_set_offset(sprite_variable, sprite_get_width(sprite_variable) * 0.5, sprite_get_height(sprite_variable) * 0.5);
		}
		#endregion /* x and y origin points END */
		
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	#endregion /* Origin points END */
	
	else
	
	#region /* If the sprite doesn't exist, but there are still origin points saved for that sprite, then delete those origin points from sprite_origin_point.ini, but save the unused origin points in unused_sprite_origin_point.ini */
	if (!saved_file_exists)
	&& (file_exists(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/data/sprite_origin_point.ini"))
	{
		ini_open(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/data/sprite_origin_point.ini");
		
		#region /* Delete x and y origin points if the sprite doesn't even exist */
		if (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		{
			var unused_x_origin_point = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", noone);
			ini_key_delete("sprite origin points", "sprite_" + string(sprite_name) + "_xorig");
		}
		if (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			var unused_y_origin_point = ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", noone);
			ini_key_delete("sprite origin points", "sprite_" + string(sprite_name) + "_yorig");
		}
		#endregion /* Delete x and y origin points if the sprite doesn't even exist END */
		
		ini_open(working_directory + "custom_characters/" + string(where_to_look_for_sprite) + "/data/unused_sprite_origin_point.ini");
		
		#region /* Save unused x and y origin points just in case it's still useful for something */
		if (unused_x_origin_point > noone)
		{
			ini_write_real("unused sprite origin points", "sprite_" + string(sprite_name) + "_xorig", unused_x_origin_point);
		}
		if (unused_y_origin_point > noone)
		{
			ini_write_real("unused sprite origin points", "sprite_" + string(sprite_name) + "_yorig", unused_y_origin_point);
		}
		#endregion /* Save unused x and y origin points just in case it's still useful for something END */
		
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	#endregion /* If the sprite doesn't exist, but there are still origin points saved for that sprite, then delete those origin points from sprite_origin_point.ini, but save the unused origin points in unused_sprite_origin_point.ini END */
	
	can_save_to_character_config = false;
	return (sprite_variable);
}