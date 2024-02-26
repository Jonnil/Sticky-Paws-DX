function scr_unzip_all()
{
	
	#region /* Unzip any file in AppData */
	
	#region /* Unzip custom character files */
	var zip_file_find_first_character = string(file_find_first(game_save_id + "custom_characters/*.zip", fa_directory));
	if (file_exists(game_save_id + "custom_characters/" + zip_file_find_first_character))
	{
		zip_unzip(game_save_id + "custom_characters/" + zip_file_find_first_character, game_save_id + "custom_characters/");
		file_delete(game_save_id + "custom_characters/" + zip_file_find_first_character); /* Delete the zip file after it's been unzip */
	}
	#endregion /* Unzip custom character files END */
	
	#region /* Unzip custom level files */
	var zip_file_find_first_level = string(file_find_first(game_save_id + "custom_levels/*.zip", fa_directory));
	if (file_exists(game_save_id + "custom_levels/" + zip_file_find_first_level))
	{
		zip_unzip(game_save_id + "custom_levels/" + zip_file_find_first_level, game_save_id + "custom_levels/");
		file_delete(game_save_id + "custom_levels/" + zip_file_find_first_level); /* Delete the zip file after it's been unzip */
	}
	#endregion /* Unzip custom level files END */
	
	#region /* Unzip custom resource pack files */
	var zip_file_find_first_resource_pack = string(file_find_first(game_save_id + "custom_resource_pack/*.zip", fa_directory));
	if (file_exists(game_save_id + "custom_resource_pack/" + zip_file_find_first_resource_pack))
	{
		zip_unzip(game_save_id + "custom_resource_pack/" + zip_file_find_first_resource_pack, game_save_id + "custom_resource_pack/");
		file_delete(game_save_id + "custom_resource_pack/" + zip_file_find_first_resource_pack); /* Delete the zip file after it's been unzip */
	}
	#endregion /* Unzip custom resource pack files END */
	
	#region /* Unzip custom title logos files */
	var zip_file_find_first_title_logo = string(file_find_first(game_save_id + "custom_title_logo/*.zip", fa_directory));
	if (file_exists(game_save_id + "custom_title_logo/" + zip_file_find_first_title_logo))
	{
		zip_unzip(game_save_id + "custom_title_logo/" + zip_file_find_first_title_logo, game_save_id + "custom_title_logo/");
		file_delete(game_save_id + "custom_title_logo/" + zip_file_find_first_title_logo); /* Delete the zip file after it's been unzip */
	}
	#endregion /* Unzip custom title logos files END */
	
	#region /* Unzip custom save files files */
	var zip_file_find_first_save_files = string(file_find_first(game_save_id + "save_file/*.zip", fa_directory));
	if (file_exists(game_save_id + "save_file/" + zip_file_find_first_save_files))
	{
		zip_unzip(game_save_id + "save_file/" + zip_file_find_first_save_files, game_save_id + "save_file/");
		file_delete(game_save_id + "save_file/" + zip_file_find_first_save_files); /* Delete the zip file after it's been unzip */
	}
	#endregion /* Unzip custom save files files END */
	
	#endregion /* Unzip any file in AppData END */
	
}