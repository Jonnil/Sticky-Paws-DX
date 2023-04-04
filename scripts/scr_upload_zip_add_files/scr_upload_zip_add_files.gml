function scr_upload_zip_add_files(what_kind_of_file = "level")
{
	
	#region /* Level */
	if (what_kind_of_file == "level")
	{
		var z = zip_create();
		var level_name = ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index);
		var file_name = ""; /* In case there is no file found, set the "file name" to nothing here */
		
		#region /* Add all the level files to a new zip file */
		
		#region /* Background */
		var files = [];
		var folder_name = "backgrounds";
		var file_type = "png";
		var file_name = file_find_first(string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
		
			file_name = file_find_next();
		
			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Background END */
		
		#region /* Data INI */
		var files = [];
		var folder_name = "data";
		var file_type = "ini";
		var file_name = file_find_first(string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
		
			file_name = file_find_next();
		
			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Data INI END */
		
		#region /* Data TXT */
		var files = [];
		var folder_name = "data";
		var file_type = "txt";
		var file_name = file_find_first(string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
		
			file_name = file_find_next();
		
			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Data TXT END */
		
		#region /* Sound */
		var files = [];
		var folder_name = "sound";
		var file_type = "ogg";
		var file_name = file_find_first(string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
		
			file_name = file_find_next();
		
			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Sound END */
		
		#region /* Tilesets */
		var files = [];
		var folder_name = "tilesets";
		var file_type = "png";
		var file_name = file_find_first(string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
		
			file_name = file_find_next();
		
			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(folder_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Tilesets END */
		
		#region /* Other png files */
		var files = [];
		var file_type = "png";
		var file_name = file_find_first(string(working_directory) + "custom_levels/" + string(level_name) + "/*." + string(file_type), 0);
		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
		
			file_name = file_find_next();
		
			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(file_name), string(working_directory) + "custom_levels/" + string(level_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Other png END */
		
		#endregion /* Add all the level files to a new zip file END */
		
		#region /* Finally save the zip file */
		
		if (level_id != undefined) /* Don't save zip file if it's undefined */
		{
			file = string(level_id) + ".zip"; /* Before closing the zip file creation, save the file to this variable. Save it as string(level_id) + ".zip" */
			zip_save(z, string(file)); /* Save it as string(file) so it's consistent */
		}
		
		zip_destroy(z); /* Last thing you do is close the zip file creation */
		
		return file;
		
		/* When trying to open the created zip file manually, it says that the files are corrupted, but when doing a simple zip_unzip() of that zip file within GameMaker, it opens these files flawlessly */
		#endregion /* Finally save the zip file END */
		
	}
	#endregion /* Level END */
	
	else
	
	#region /* Character */
	if (what_kind_of_file == "character")
	{
		var z = zip_create();
		var character_name = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
		var file_name = ""; /* In case there is no file found, set the "file name" to nothing here */
		
		#region /* Add all the character files to a new zip file */
		
		#region /* Data */
		var files = [];
		var folder_name = "data";
		var file_type = "ini";
		var file_name = file_find_first(string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
			
			file_name = file_find_next();
			
			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Data END */
		
		#region /* Ogg files in sound folder */
		var files = [];
		var folder_name = "sound";
		var file_type = "ogg";
		var file_name = file_find_first(string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
			
			file_name = file_find_next();
			
			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Ogg files in sound folder END */
		
		#region /* Voicepack folders in sound folder */
		var files = [];
		var folder_name = "sound";
		var file_name = file_find_first(string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/*", fa_directory);
		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
			
			file_name = file_find_next();
			
			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Voicepack folders in sound folder END */
		
		#region /* Png files in sprites folder */
		var files = [];
		var folder_name = "sprites";
		var file_type = "png";
		var file_name = file_find_first(string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/*." + string(file_type), 0);
		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
			
			file_name = file_find_next();
			
			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Png files in sprites folder END */
		
		#region /* Skin folders in sprites folder */
		var files = [];
		var folder_name = "sprites";
		var file_name = file_find_first(string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/*", fa_directory);
		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/" + string(file_name));
		}
		while (file_name != "")
		{
			array_push(files, file_name);
			
			file_name = file_find_next();
			
			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(folder_name) + "/" + string(file_name), string(working_directory) + "custom_characters/" + string(character_name) + "/" + string(folder_name) + "/" + string(file_name));
			}
		}
		file_find_close();
		#endregion /* Skin folders in sprites folder END */
		
		#endregion /* Add all the character files to a new zip file END */
		
		#region /* Finally save the zip file */
		
		if (character_id != undefined) /* Don't save zip file if it's undefined */
		{
			file = string(character_id) + ".zip"; /* Before closing the zip file creation, save the file to this variable. Save it as string(character_id) + ".zip" */
			zip_save(z, string(file)); /* Save it as string(file) so it's consistent */
		}
		
		zip_destroy(z); /* Last thing you do is close the zip file creation */
		
		return file;
		
		/* When trying to open the created zip file manually, it says that the files are corrupted, but when doing a simple zip_unzip() of that zip file within GameMaker, it opens these files flawlessly */
		#endregion /* Finally save the zip file END */
		
	}
	#endregion /* Character END */
	
}