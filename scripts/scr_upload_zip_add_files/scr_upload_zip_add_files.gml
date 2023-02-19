function scr_upload_zip_add_files()
{
	
	var z = zip_create();
	var level_name = ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index);
	
	
	#region /* Add all the level files to a new zip file */
	
	#region /* Background */
	var files = [];
	var folder_name = "backgrounds";
	var file_type = "png";
	var file_name = file_find_first(string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
	if (file_name != "")
	{
		zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
	}
	while (file_name != "")
	{
		array_push(files, file_name);
		
		file_name = file_find_next();
		
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
	}
	file_find_close();
	#endregion /* Background END */
	
	#region /* Data INI */
	var files = [];
	var folder_name = "data";
	var file_type = "ini";
	var file_name = file_find_first(string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
	if (file_name != "")
	{
		zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
	}
	while (file_name != "")
	{
		array_push(files, file_name);
		
		file_name = file_find_next();
		
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
	}
	file_find_close();
	#endregion /* Data INI END */
	
	#region /* Data TXT */
	var files = [];
	var folder_name = "data";
	var file_type = "txt";
	var file_name = file_find_first(string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
	if (file_name != "")
	{
		zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
	}
	while (file_name != "")
	{
		array_push(files, file_name);
		
		file_name = file_find_next();
		
		if (file_name != "")
		{
			/* CRASHES THE GAME */ zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
	}
	file_find_close();
	#endregion /* Data TXT END */
	
	#region /* Sound */
	var files = [];
	var folder_name = "sound";
	var file_type = "ogg";
	var file_name = file_find_first(string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
	if (file_name != "")
	{
		zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
	}
	while (file_name != "")
	{
		array_push(files, file_name);
		
		file_name = file_find_next();
		
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
	}
	file_find_close();
	#endregion /* Sound END */
	
	#region /* Tilesets */
	var files = [];
	var folder_name = "tilesets";
	var file_type = "png";
	var file_name = file_find_first(string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
	if (file_name != "")
	{
		zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
	}
	while (file_name != "")
	{
		array_push(files, file_name);
		
		file_name = file_find_next();
		
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
	}
	file_find_close();
	#endregion /* Tilesets END */
	
	#region /* Tilesets */
	var files = [];
	var folder_name = "tilesets";
	var file_type = "png";
	var file_name = file_find_first(string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
	if (file_name != "")
	{
		zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
	}
	while (file_name != "")
	{
		array_push(files, file_name);
		
		file_name = file_find_next();
		
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
	}
	file_find_close();
	#endregion /* Tilesets END */
	
	#region /* Other png files */
	var files = [];
	var file_type = "png";
	var file_name = file_find_first(string(game_save_id) + "/custom_levels/" + string(level_name) + "/*." + string(file_type), 0);
	if (file_name != "")
	{
		zip_add_file(z, string(level_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(file_name));
	}
	while (file_name != "")
	{
		array_push(files, file_name);
		
		file_name = file_find_next();
		
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(file_name), string(game_save_id) + "/custom_levels/" + string(level_name) + "/" + string(file_name));
		}
	}
	file_find_close();
	#endregion /* Tilesets END */
	
	#endregion /* Add all the level files to a new zip file END */
	
	#region /* Finally save the zip file */
	
	file = string(level_name) + ".zip"; /* Before closing the zip file creation, save the file to this variable. Save it as string(level_name) + ".zip" */
	zip_save(z, string(file)); /* Save it as string(file) so it's consistent */
	
	zip_destroy(z); /* Last thing you do is close the zip file creation */
	
	/* When trying to open the created zip file manually, it says that the files are corrupted, but when doing a simple zip_unzip() of that zip file within GameMaker, it opens these files flawlessly */
	#endregion /* Finally save the zip file END*/
	
}