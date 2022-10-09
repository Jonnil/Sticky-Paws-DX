/// @desc initialize_custom_character_select_sprite(sprite_name, sprite_variable, what_player, what_selected_skin);
/// @description initialize_custom_character_select_sprite(sprite_name, sprite_variable, what_player, what_selected_skin);
/// @arg sprite_name
/// @arg sprite_variable
/// @arg what_player
/// @arg what_selected_skin

function scr_initialize_custom_character_select_sprite(sprite_name, sprite_variable, what_player = player, what_selected_skin = selected_skin)
{
	/* sprite_name. Sprite name. The name of the file */
	/* sprite_variable. Sprite variable. The name of the variable */
	/* what_player. Player variable, ususally type "player" */
	/* what_selected_skin. Selected skin variable, ususally type "selected_skin" */
	
	#region /* Add sprite */
	index = 0;
	repeat(50)
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, what_player, what_selected_skin);
			saved_file_exists = true;
		}
		else
		if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, what_player, what_selected_skin);
			saved_file_exists = true;
		}
		else
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, what_player, what_selected_skin);
			saved_file_exists = true;
		}
		else
		if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png"))
		{
			sprite_variable = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/" + string(sprite_name) + "_strip" + string(index) + ".png", index, false, false, what_player, what_selected_skin);
			saved_file_exists = true;
		}
		index += 1;
	}
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + ".png", 1, false, false, what_player, what_selected_skin);
		saved_file_exists = true;
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/skin" + string(what_selected_skin) + "/" + string(sprite_name) + ".png", 1, false, false, what_player, what_selected_skin);
		saved_file_exists = true;
	}
	else
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/" + string(sprite_name) + ".png", 1, false, false, what_player, what_selected_skin);
		saved_file_exists = true;
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/" + string(sprite_name) + ".png"))
	{
		sprite_variable = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/sprites/" + string(sprite_name) + ".png", 1, false, false, what_player, what_selected_skin);
		saved_file_exists = true;
	}
	#endregion /* Add sprite END */
	
	#region /* Origin points */
	if (saved_file_exists == true)
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/sprite_origin_point.ini"))
		{
			ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/sprite_origin_point.ini");
			can_save_to_character_config = false; /* You can't save values to included files */
		}
		else
		{
			ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/sprite_origin_point.ini");
			can_save_to_character_config = true; /* You can save values to local appdata */
		}
		
		#region /* x and y origin points */
		if (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		and (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			sprite_set_offset(sprite_variable,
			ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) / 2),
			ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) / 2));
		}
		else
		if (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		and (!ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			if (can_save_to_character_config == true)
			{
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) / 2);
			}
			sprite_set_offset(sprite_variable,
			ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) / 2),
			sprite_get_height(sprite_variable) / 2);
		}
		else
		if (!ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_xorig"))
		and (ini_key_exists("sprite origin points", "sprite_" + string(sprite_name) + "_yorig"))
		{
			if (can_save_to_character_config == true)
			{
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) / 2);
			}
			sprite_set_offset(sprite_variable,
			sprite_get_width(sprite_variable) / 2,
			ini_read_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) / 2));
		}
		else
		{
			if (can_save_to_character_config == true)
			{
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_xorig", sprite_get_width(sprite_variable) / 2);
				ini_write_real("sprite origin points", "sprite_" + string(sprite_name) + "_yorig", sprite_get_height(sprite_variable) / 2);
			}
			sprite_set_offset(sprite_variable, sprite_get_width(sprite_variable) / 2, sprite_get_height(sprite_variable) / 2);
		}
		#endregion /* x and y origin points END */
		
		ini_close();
		saved_file_exists = false;
	}
	#endregion /* Origin points END */
	
	else
	
	#region /* If the sprite doesn't exist, but there are still origin points saved for that sprite, then delete those origin points from sprite_origin_point.ini, but save the unused origin points in unused_sprite_origin_point.ini */
	if (saved_file_exists == false)
	and (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/sprite_origin_point.ini"))
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/sprite_origin_point.ini");
		
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
		
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/unused_sprite_origin_point.ini");
		
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
	can_save_to_character_config = false;
	unused_x_origin_point = noone;
	unused_y_origin_point = noone;
	return (sprite_variable);
}