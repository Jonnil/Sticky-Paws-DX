/// @desc initialize_custom_character_select_sprite(sprite_name,sprite_variable, player,selected_skin);
/// @description initialize_custom_character_select_sprite(sprite_name,sprite_variable, player,selected_skin);
/// @arg sprite_name
/// @arg sprite_variable
/// @arg player
/// @arg selected_skin

function scr_initialize_custom_character_select_sprite(argument0, argument1, argument2, argument3)
{
	/*argument0. Sprite name. The name of the file*/
	/*argument1. Sprite variable. The name of the variable*/
	/*argument2. Player variable, ususally type "player - 1"*/
	/*argument3. Selected skin variable, ususally type "selected_skin"*/
	
	#region /*Add sprite*/
	index = 0;
	repeat(50)
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/skin" + string(argument3) + "/" + string(argument0) + "_strip" + string(index) + ".png"))
		{
			argument1 = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/skin" + string(argument3) + "/" + string(argument0) + "_strip" + string(index) + ".png", index, false, false, argument2, argument3);
		}
		else
		if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/skin" + string(argument3) + "/" + string(argument0) + "_strip" + string(index) + ".png"))
		{
			argument1 = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/skin" + string(argument3) + "/" + string(argument0) + "_strip" + string(index) + ".png", index, false, false, argument2, argument3);
		}
		else
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/" + string(argument0) + "_strip" + string(index) + ".png"))
		{
			argument1 = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/" + string(argument0) + "_strip" + string(index) + ".png", index, false, false, argument2, argument3);
		}
		else
		if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/" + string(argument0) + "_strip" + string(index) + ".png"))
		{
			argument1 = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/" + string(argument0) + "_strip" + string(index) + ".png", index, false, false, argument2, argument3);
		}
		index += 1;
	}
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/skin" + string(argument3) + "/" + string(argument0) + ".png"))
	{
		argument1 = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/skin" + string(argument3) + "/" + string(argument0) + ".png", 1, false, false, argument2, argument3);
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/skin" + string(argument3) + "/" + string(argument0) + ".png"))
	{
		argument1 = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/skin" + string(argument3) + "/" + string(argument0) + ".png", 1, false, false, argument2, argument3);
	}
	else
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/" + string(argument0) + ".png"))
	{
		argument1 = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/" + string(argument0) + ".png", 1, false, false, argument2, argument3);
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/" + string(argument0) + ".png"))
	{
		argument1 = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/sprites/" + string(argument0) + ".png", 1, false, false, argument2, argument3);
	}
	#endregion /*Add sprite END*/
	
	#region /*Origin points*/
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/data/sprite_origin_point.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/data/sprite_origin_point.ini");
		can_save_to_character_config = false; /*You can't save values to included files*/
	}
	else
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument2])) + "/data/sprite_origin_point.ini");
		can_save_to_character_config = true; /*You can save values to local appdata*/
	}
		
	#region /*x and y origin points*/
	if (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_xorig"))
	and (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_yorig"))
	{
		sprite_set_offset(argument1,
		ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_xorig", sprite_get_width(argument1) / 2),
		ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_yorig", sprite_get_height(argument1) / 2));
	}
	else
	if (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_xorig"))
	and (!ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_yorig"))
	{
		if (can_save_to_character_config = true)
		{
			ini_write_real("sprite origin points", "sprite_" + string(argument0) + "_yorig", sprite_get_height(argument1) / 2);
		}
		sprite_set_offset(argument1,
		ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_xorig", sprite_get_width(argument1) / 2),
		sprite_get_height(argument1) / 2);
	}
	else
	if (!ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_xorig"))
	and (ini_key_exists("sprite origin points", "sprite_" + string(argument0) + "_yorig"))
	{
		if (can_save_to_character_config = true)
		{
			ini_write_real("sprite origin points", "sprite_" + string(argument0) + "_xorig", sprite_get_width(argument1) / 2);
		}
		sprite_set_offset(argument1,
		sprite_get_width(argument1) / 2,
		ini_read_real("sprite origin points", "sprite_" + string(argument0) + "_yorig", sprite_get_height(argument1) / 2));
	}
	else
	{
		if (can_save_to_character_config = true)
		{
			ini_write_real("sprite origin points", "sprite_" + string(argument0) + "_xorig", sprite_get_width(argument1) / 2);
			ini_write_real("sprite origin points", "sprite_" + string(argument0) + "_yorig", sprite_get_height(argument1) / 2);
		}
		sprite_set_offset(argument1, sprite_get_width(argument1) / 2, sprite_get_height(argument1) / 2);
	}
	#endregion /*x and y origin points END*/
		
	ini_close();
	#endregion /*Origin points END*/
	
	return (argument1);
}