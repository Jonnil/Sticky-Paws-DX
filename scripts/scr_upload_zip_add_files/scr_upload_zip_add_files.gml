function scr_upload_zip_add_files(what_kind_of_file = "level")
{
	/* Set an initial description for the operation */
	global.creating_zip_file_description = "Starting ZIP creation for " + what_kind_of_file;
	show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

	#region /* Level */
	if (what_kind_of_file == "level")
	{
		var z = zip_create();
		var level_name = global.level_name;
		
		show_debug_message("[scr_upload_zip_add_files] Level name found: " + string(level_name));
		
		global.creating_zip_file_description = "Creating ZIP for level: " + string(level_name);

		var file_name = ""; /* In case there is no file found, set the "file name" to nothing here */

		#region /* Add all the level files to a new zip file */
		/* Process Background files */
		global.creating_zip_file_description = "Adding background files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Background */
		var files = [];
		var upload_folder_name = "background";
		var file_type = "png";
		file_name = file_find_first(game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Background] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Background] Added file: " + file_name);
			}
		}

		file_find_close();
		#endregion /* Background END */

		/* Process Data INI files */
		global.creating_zip_file_description = "Adding Data INI files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Data INI */
		files = [];
		upload_folder_name = "data";
		file_type = "ini";
		file_name = file_find_first(game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Data INI] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Data INI] Added file: " + file_name);
			}
		}
		file_find_close();
		#endregion /* Data INI END */

		/* Process Data TXT files */
		global.creating_zip_file_description = "Adding Data TXT files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Data TXT */
		files = [];
		upload_folder_name = "data";
		file_type = "txt";
		file_name = file_find_first(game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Data TXT] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Data TXT] Added file: " + file_name);
			}
		}

		file_find_close();
		#endregion /* Data TXT END */

		/* Process Data JSON files */
		global.creating_zip_file_description = "Adding Data JSON files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Data JSON */
		files = [];
		upload_folder_name = "data";
		file_type = "json";
		file_name = file_find_first(game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Data JSON] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Data JSON] Added file: " + file_name);
			}
		}

		file_find_close();
		#endregion /* Data JSON END */

		/* Process Sound files */
		global.creating_zip_file_description = "Adding Sound files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Sound */
		files = [];
		upload_folder_name = "sound";
		file_type = "ogg";
		file_name = file_find_first(game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Sound] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Sound] Added file: " + file_name);
			}
		}

		file_find_close();
		#endregion /* Sound END */

		/* Process Tileset files */
		global.creating_zip_file_description = "Adding Tileset files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Tilesets */
		files = [];
		upload_folder_name = "tilesets";
		file_type = "png";
		file_name = file_find_first(game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Tilesets] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_levels/" + string(level_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Tilesets] Added file: " + file_name);
			}
		}

		file_find_close();
		#endregion /* Tilesets END */

		/* Process Other png files */
		global.creating_zip_file_description = "Adding other PNG files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Other png files */
		files = [];
		file_type = "png";
		file_name = file_find_first(game_save_id + "custom_levels/" + string(level_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(level_name) + "/" + file_name,
				game_save_id + "custom_levels/" + string(level_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Other png] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(level_name) + "/" + file_name,
					game_save_id + "custom_levels/" + string(level_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Other png] Added file: " + file_name);
			}
		}

		file_find_close();
		#endregion /* Other png END */

		#endregion /* Add all the level files to a new zip file END */

		#region /* Finally save the zip file */
		global.creating_zip_file_description = "Saving ZIP file";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		if (level_id != undefined) /* Don't save zip file if it's undefined */
		{
			file = string(level_id) + ".zip";
			show_debug_message("[scr_upload_zip_add_files] Setting ZIP file name to: " + file);
			zip_save(z, game_save_id + file); /* Save it */
			show_debug_message("[scr_upload_zip_add_files] ZIP file saved to: " + (game_save_id + file));
		}

		return file;
		#endregion /* Finally save the zip file END */

	}
	#endregion /* Level END */

	else

	#region /* Character */
	if (what_kind_of_file == "character")
	{
		var z = zip_create();
		var character_name = string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]));
		show_debug_message("[scr_upload_zip_add_files] Character name found: " + string(character_name));
		
		global.creating_zip_file_description = "Creating ZIP for character: " + string(character_name);

		var file_name = ""; /* In case there is no file found */

		#region /* Add all the character files to a new zip file */
		/* Process Data folder */
		global.creating_zip_file_description = "Adding character data files (INI) to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Data */
		var files = [];
		var upload_folder_name = "data";
		var file_type = "ini";
		file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Character Data] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Character Data] Added file: " + file_name);
			}
		}
		file_find_close();
		#endregion /* Data END */

		/* Process Sound (Ogg) files */
		global.creating_zip_file_description = "Adding character sound files (OGG) to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Ogg files in sound folder */
		files = [];
		upload_folder_name = "sound";
		file_type = "ogg";
		file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Character Sound] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Character Sound] Added file: " + file_name);
			}
		}
		file_find_close();
		#endregion /* Ogg files in sound folder END */

		/* Process Sprite (Png) files */
		global.creating_zip_file_description = "Adding character sprite files (PNG) to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Png files in sprites folder */
		files = [];
		upload_folder_name = "sprites";
		file_type = "png";
		file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Character Sprites] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();
			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Character Sprites] Added file: " + file_name);
			}
		}
		file_find_close();
		#endregion /* Png files in sprites folder END */

		/* Process Voicepack folders */
		global.creating_zip_file_description = "Adding character voicepack files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Voicepack folders in sound folder */
		files = [];
		upload_folder_name = "sound";
		var voicepack_folder_number = 0;
		var voicepack_folder_path = "";
		file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/voicepack" + string(voicepack_folder_number) + "/*", 0);

		while (file_name != "")
		{
			voicepack_folder_path = game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/voicepack" + string(voicepack_folder_number) + "/";
			zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/voicepack" + string(voicepack_folder_number) + "/" + file_name, voicepack_folder_path + file_name);
			array_push(files, file_name);
			show_debug_message("[scr_upload_zip_add_files - Voicepack] Added file: " + file_name + " from voicepack" + string(voicepack_folder_number));

			file_name = file_find_next();

			if (file_name == "")
			{
				voicepack_folder_number++;
				file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/voicepack" + string(voicepack_folder_number) + "/*", 0);
			}
		}
		file_find_close();
		#endregion /* Voicepack folders in sound folder END */

		/* Process Skin folders */
		global.creating_zip_file_description = "Adding character skin files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Skin folders in sprites folder */
		files = [];
		upload_folder_name = "sprites";
		var skin_folder_number = 0;
		var skin_folder_path = "";
		file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/skin" + string(skin_folder_number) + "/*", 0);

		while (file_name != "")
		{
			skin_folder_path = game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/skin" + string(skin_folder_number) + "/";
			zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/skin" + string(skin_folder_number) + "/" + file_name, skin_folder_path + file_name);
			array_push(files, file_name);
			show_debug_message("[scr_upload_zip_add_files - Skin] Added file: " + file_name + " from skin" + string(skin_folder_number));

			file_name = file_find_next();

			if (file_name == "")
			{
				skin_folder_number++;
				file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/skin" + string(skin_folder_number) + "/*", 0);
			}
		}
		file_find_close();
		#endregion /* Skin folders in sprites folder END */

		#endregion /* Add all the character files to a new zip file END */

		#region /* Finally save the zip file */
		global.creating_zip_file_description = "Saving ZIP file for character";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		if (character_id != undefined)
		{
			file = string(character_id) + ".zip";
			show_debug_message("[scr_upload_zip_add_files] ZIP file name set to: " + file);
			zip_save(z, file);
			show_debug_message("[scr_upload_zip_add_files] ZIP file saved to: " + file);
		}

		return file;
		#endregion /* Finally save the zip file END */

	}
	#endregion /* Character END */

}