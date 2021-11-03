/// @desc initialize_custom_character_sprite(sprite_name,sprite_variable,sprite_xorig,sprite_yorig);
/// @arg argument0
/// @arg argument1
/// @arg argument2
/// @arg argument3

function scr_initialize_custom_character_sprite(argument0, argument1, argument2, argument3)
{
	/*argument0. Sprite name. The name of the file*/
	/*argument1. Sprite variable. The name of the variable*/
	/*argument2. Sprite xorig. x origin point variable*/
	/*argument3. Sprite yorig. x origin point variable*/
	
	#region /*Add sprite*/
	index = 0;
	repeat(50)
	{
		if (file_exists("characters/character" + string(custom_character)+"/sprites/"+string(argument0)+"_strip"+string(index)+".png"))
		{
			sprite_stand = sprite_add("characters/character" + string(custom_character)+"/sprites/"+string(argument0)+"_strip"+string(index)+".png", index, false, false, argument2, argument3);
		}
		else
		if (file_exists(working_directory + "/custom_characters/character" + string(custom_character-global.max_number_of_official_characters)+"/sprites/"+string(argument0)+"_strip"+string(index)+".png"))
		{
			sprite_stand = sprite_add(working_directory + "/custom_characters/character" + string(custom_character-global.max_number_of_official_characters)+"/sprites/"+string(argument0)+"_strip"+string(index)+".png", index, false, false, argument2, argument3);
		}
		index += 1;
	}
	if (file_exists("characters/character" + string(custom_character)+"/sprites/"+string(argument0)+".png"))
	{
		sprite_stand = sprite_add("characters/character" + string(custom_character)+"/sprites/"+string(argument0)+".png", 1, false, false, argument2, argument3);
	}
	else
	if (file_exists(working_directory + "/custom_characters/character" + string(custom_character-global.max_number_of_official_characters)+"/sprites/"+string(argument0)+".png"))
	{
		sprite_stand = sprite_add(working_directory + "/custom_characters/character" + string(custom_character-global.max_number_of_official_characters)+"/sprites/"+string(argument0)+".png", 1, false, false, argument2, argument3);
	}
	#endregion /*Add sprite END*/
	
}