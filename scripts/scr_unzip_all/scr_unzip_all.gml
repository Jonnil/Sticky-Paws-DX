function scr_unzip_all()
{
	
	#region /* Unzip any file in AppData */
	
	#region /* Unzip custom character files */
	var zip_file_find_first_character = string(file_find_first(working_directory + "custom_characters/*.zip", fa_directory));
	if (file_exists(working_directory + "custom_characters/" + zip_file_find_first_character))
	{
		zip_unzip(working_directory + "custom_characters/" + zip_file_find_first_character, working_directory + "custom_characters/");
		file_delete(working_directory + "custom_characters/" + zip_file_find_first_character); /* Delete the zip file after it's been unzip */
	}
	#endregion /* Unzip custom character files END */
	
	#region /* Unzip custom level files */
	var zip_file_find_first_level = string(file_find_first(working_directory + "custom_levels/*.zip", fa_directory));
	if (file_exists(working_directory + "custom_levels/" + zip_file_find_first_level))
	{
		zip_unzip(working_directory + "custom_levels/" + zip_file_find_first_level, working_directory + "custom_levels/");
		file_delete(working_directory + "custom_levels/" + zip_file_find_first_level); /* Delete the zip file after it's been unzip */
	}
	#endregion /* Unzip custom level files END */
	
	#region /* Unzip custom resource pack files */
	var zip_file_find_first_resource_pack = string(file_find_first(working_directory + "custom_resource_pack/*.zip", fa_directory));
	if (file_exists(working_directory + "custom_resource_pack/" + zip_file_find_first_resource_pack))
	{
		zip_unzip(working_directory + "custom_resource_pack/" + zip_file_find_first_resource_pack, working_directory + "custom_resource_pack/");
		file_delete(working_directory + "custom_resource_pack/" + zip_file_find_first_resource_pack); /* Delete the zip file after it's been unzip */
	}
	#endregion /* Unzip custom resource pack files END */
	
	#region /* Unzip custom title logos files */
	var zip_file_find_first_title_logo = string(file_find_first(working_directory + "custom_title_logo/*.zip", fa_directory));
	if (file_exists(working_directory + "custom_title_logo/" + zip_file_find_first_title_logo))
	{
		zip_unzip(working_directory + "custom_title_logo/" + zip_file_find_first_title_logo, working_directory + "custom_title_logo/");
		file_delete(working_directory + "custom_title_logo/" + zip_file_find_first_title_logo); /* Delete the zip file after it's been unzip */
	}
	#endregion /* Unzip custom title logos files END */
	
	#region /* Unzip custom save files files */
	var zip_file_find_first_save_files = string(file_find_first(working_directory + "save_file/*.zip", fa_directory));
	if (file_exists(working_directory + "save_file/" + zip_file_find_first_save_files))
	{
		zip_unzip(working_directory + "save_file/" + zip_file_find_first_save_files, working_directory + "save_file/");
		file_delete(working_directory + "save_file/" + zip_file_find_first_save_files); /* Delete the zip file after it's been unzip */
	}
	#endregion /* Unzip custom save files files END */
	
	#endregion /* Unzip any file in AppData END */
	
}