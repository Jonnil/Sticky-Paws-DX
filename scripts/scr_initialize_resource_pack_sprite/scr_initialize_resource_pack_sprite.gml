/// @desc scr_initialize_resource_pack_sprite(file_name, sprite_variable);
/// @description scr_initialize_resource_pack_sprite(file_name, sprite_variable);
/// @arg file_name
/// @arg sprite_variable
function scr_initialize_resource_pack_sprite(argument0, argument1)
{
	file_name = argument0;
	
	#region /*x origin point*/
	if (ini_key_exists("sprite origin points", file_name + "_xorig"))
	{
		xorig_variable = ini_read_real("sprite origin points", file_name + "_xorig", 0);
	}
	else
	{
		xorig_variable = 0;
	}
	#endregion /*x origin point END*/
	
	#region /*y origin point*/
	if (ini_key_exists("sprite origin points", file_name + "_yorig"))
	{
		yorig_variable = ini_read_real("sprite origin points", file_name + "_yorig", 0);
	}
	else
	{
		yorig_variable = 0;
	}
	#endregion /*y origin point END*/
	
	#region /*Sprite Add*/
	index = 0;
	repeat(100) /*Must repeat enough times, if sprite_strip is too high for the repeat, then the sprite can't load at all*/
	{
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + "_strip" + string(index) + ".png"))
		{
			argument1 = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + "_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + "_strip" + string(index) + ".png"))
		{
			argument1 = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + "_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
		}
		index += 1;
	}
	if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + ".png"))
	{
		argument1 = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + ".png", 1, false, false, xorig_variable, yorig_variable);
	}
	else
	if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + ".png"))
	{
		argument1 = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + ".png", 1, false, false, xorig_variable, yorig_variable);
	}
	#endregion /*Sprite Add END*/
	
	return (argument1);
}