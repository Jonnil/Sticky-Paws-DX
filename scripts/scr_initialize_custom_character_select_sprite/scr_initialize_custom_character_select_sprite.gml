/// @desc initialize_custom_character_sprite(sprite_name,sprite_variable,sprite_xorig,sprite_yorig,player,selected_skin);
/// @arg sprite_name
/// @arg sprite_variable
/// @arg sprite_xorig
/// @arg sprite_yorig
/// @arg player
/// @arg selected_skin

function scr_initialize_custom_character_select_sprite(argument0, argument1, argument2, argument3, argument4, argument5)
{
	/*argument0. Sprite name. The name of the file*/
	/*argument1. Sprite variable. The name of the variable*/
	/*argument2. Sprite xorig. x origin point variable*/
	/*argument3. Sprite yorig. x origin point variable*/
	/*argument4. Player variable, ususally type "player-1"*/
	/*argument5. Selected skin variable, ususally type "selected_skin"*/
	
	#region /*Add sprite*/
	index = 0;
	repeat(50)
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/skin" + string(argument5) + "/" + string(argument0)+"_strip" + string(index)+".png"))
		{
			argument1 = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/skin" + string(argument5) + "/" + string(argument0)+"_strip" + string(index)+".png", index, false, false, argument2, argument3);
		}
		else
		if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/skin" + string(argument5) + "/" + string(argument0)+"_strip" + string(index)+".png"))
		{
			argument1 = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/skin" + string(argument5) + "/" + string(argument0)+"_strip" + string(index)+".png", index, false, false, argument2, argument3);
		}
		else
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/" + string(argument0)+"_strip" + string(index)+".png"))
		{
			argument1 = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/" + string(argument0)+"_strip" + string(index)+".png", index, false, false, argument2, argument3);
		}
		else
		if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/" + string(argument0)+"_strip" + string(index)+".png"))
		{
			argument1 = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/" + string(argument0)+"_strip" + string(index)+".png", index, false, false, argument2, argument3);
		}
		index += 1;
	}
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/skin" + string(argument5) + "/" + string(argument0)+".png"))
	{
		argument1 = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/skin" + string(argument5) + "/" + string(argument0)+".png", 1, false, false, argument2, argument3);
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/skin" + string(argument5) + "/" + string(argument0)+".png"))
	{
		argument1 = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/skin" + string(argument5) + "/" + string(argument0)+".png", 1, false, false, argument2, argument3);
	}
	else
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/" + string(argument0)+".png"))
	{
		argument1 = sprite_add("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/" + string(argument0)+".png", 1, false, false, argument2, argument3);
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/" + string(argument0)+".png"))
	{
		argument1 = sprite_add(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument4]))+"/sprites/" + string(argument0)+".png", 1, false, false, argument2, argument3);
	}
	return (argument1)
	#endregion /*Add sprite END*/
	
}